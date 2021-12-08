package com.controller;

import com.dao.HealthCodeDao;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.common.BitMatrix;
import com.model.HealthCode;
import com.model.MatrixToImageWriter;
import com.model.Student;
import com.model.Teacher;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@WebServlet({"/CheckHealthCodeServlet"})
public class CheckHealthCodeServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HealthCodeDao dao = new HealthCodeDao();

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String name = request.getParameter("name");
        String id = request.getParameter("id");
        request.setAttribute("id",id);
        String school_id = request.getParameter("school_id");
        String tel = request.getParameter("tel");
        String q1 = request.getParameter("q1");
        String q2 = request.getParameter("q2");
        String q3 = request.getParameter("q3");
        String q4 = request.getParameter("q4");
        String[] multi1 = request.getParameterValues("situation");
        String[] multi2 = request.getParameterValues("promise");
        String a = "";
        int choice = 0;//默认绿码
        int cnt = 0;
        for(int i = 1;i<multi1.length;i++){
            if(multi1[i]!=null){
                cnt++;
            }
        }
        if(q3.equals("yes")||q4.equals("yes")||cnt>=2){
            choice = 2;//红
        }
        else if(q1.equals("no")&&q2.equals("no")&&q3.equals("no")&&q4.equals("no")&&multi1[0].equals("nothing_wrong")){
            choice = 0;
        }
        else{
            choice = 1;
        }


        HealthCode healthCode = new HealthCode(name,id,school_id,tel,choice);
        boolean check_teacher = dao.isTeacher(school_id);
        System.out.println("servlettea"+check_teacher);
        boolean check_stuednt = dao.isStudent(school_id);
        System.out.println("servletstu"+check_stuednt);
        try{
            request.setAttribute("choice",choice);
            Date d = new Date();
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            SimpleDateFormat df2 = new SimpleDateFormat(" HH:mm:ss");
            String time = df.format(d);
            String time2 = df2.format(d);
            String aa = "姓名"+name+"\n"+"学号(工号)"+school_id+"\n"+"生成时间"+time+time2;
            String path = request.getServletContext().getRealPath("/images");
            System.out.println(path);

            MultiFormatWriter multiFormatWriter = new MultiFormatWriter();
            Map hint = new HashMap();
            hint.put(EncodeHintType.CHARACTER_SET,"UTF-8");
            BitMatrix bitMatrix = multiFormatWriter.encode(aa, BarcodeFormat.QR_CODE,220,220,hint);
            File file1 = new File(path,"test.jpg");
            request.setAttribute("file",file1);
//            int choice2 = dao.studentHealthCodeColor(choice,school_id);
            int choice2 = -1;
            if(check_stuednt){
                choice2 = dao.studentHealthCodeColor(choice,school_id);
            }
            else{
                choice2 = dao.teacherHealthCodeColor(choice,school_id);
            }
            MatrixToImageWriter.writeToFile(bitMatrix,"jpg",file1,choice2);
        }catch(Exception e){}
        request.setAttribute("choice",choice);
        HttpSession session = request.getSession();
        synchronized (session){
            session.setAttribute("healthCode",healthCode);
        }



        if(check_stuednt==true){
            Student student = dao.findStudentInfo(school_id);
            boolean issuccess = dao.updateStudent(name,id,school_id,tel,student.getAttendenceRecord(),choice,student.getHealthday(),student.getHealthcode());
            System.out.println(issuccess);
        }
        else if(check_teacher==true){
            Teacher teacher = dao.findTeacherInfo(school_id);
            boolean issuccess = dao.updateTeacher(name,id,school_id,tel,teacher.getAttendenceRecord(),choice,teacher.getHealthday(),teacher.getHealthcode());
//            System.out.println(issuccess);
        }
        RequestDispatcher rd = request.getRequestDispatcher("/displayHealthCode.jsp");
        rd.forward(request,response);

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
