package com.model;

public class school_info {
    private String college;
    private String major;
    private String class1;
    public school_info(){}

    public void setCollege(String college) {
        this.college = college;
    }

    public void setClass1(String class1) {
        this.class1 = class1;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public String getCollege() {
        return college;
    }

    public String getMajor() {
        return major;
    }

    public String getClass1() {
        return class1;
    }
}
