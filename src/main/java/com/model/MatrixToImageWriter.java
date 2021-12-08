package com.model;

import com.google.zxing.common.BitMatrix;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;


public final class MatrixToImageWriter {

    private static final int BLACK = 0xFF000000;
    private static final int WHITE = 0xFFFFFFFF;
    private static final int GREEN =  0x008000;
    private static final int RED =  0xFF0000;
    private static final int YELLOW =  0xFFFF00;

    private MatrixToImageWriter() {}


    public static BufferedImage toBufferedImage(BitMatrix matrix,int choice) {
        int width = matrix.getWidth();
        int height = matrix.getHeight();
        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        if(choice == 0){
            for (int x = 0; x < width; x++) {
                for (int y = 0; y < height; y++) {
                    image.setRGB(x, y, matrix.get(x, y) ? GREEN : WHITE);
                }
            }
        }
        else if(choice == 1){
            for (int x = 0; x < width; x++) {
                for (int y = 0; y < height; y++) {
                    image.setRGB(x, y, matrix.get(x, y) ?  YELLOW: WHITE);
                }
            }
        }
        else if(choice ==2){
            for (int x = 0; x < width; x++) {
                for (int y = 0; y < height; y++) {
                    image.setRGB(x, y, matrix.get(x, y) ?  RED: WHITE);
                }
            }
        }
        return image;
    }


    public static void writeToFile(BitMatrix matrix, String format, File file,int c)
            throws IOException {
        BufferedImage image = toBufferedImage(matrix,c);
        if (!ImageIO.write(image, format, file)) {
            throw new IOException("Could not write an image of format " + format + " to " + file);
        }
    }


    public static void writeToStream(BitMatrix matrix, String format, OutputStream stream,int c)
            throws IOException {
        BufferedImage image = toBufferedImage(matrix,c);
        if (!ImageIO.write(image, format, stream)) {
            throw new IOException("Could not write an image of format " + format);
        }
    }

}