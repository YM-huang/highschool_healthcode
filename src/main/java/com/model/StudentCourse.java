package com.model;

public class StudentCourse {
    private String sno;
    private String sname;
    private String cterm;
    private String cname;
    private String tname;
    private int grade;

    public int getGrade() {
        return grade;
    }

    public void setGrade(int grade) {
        this.grade = grade;
    }

    public StudentCourse() {
    }

    public String getSno() {
        return sno;
    }

    public void setSno(String sno) {
        this.sno = sno;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    public String getCterm() {
        return cterm;
    }

    public void setCterm(String cterm) {
        this.cterm = cterm;
    }

    public String getCname() {
        return cname;
    }

    public void setCoursename(String cname) {
        this.cname = cname;
    }

    public String getTname() {
        return tname;
    }

    public void setTname(String tname) {
        this.tname = tname;
    }
}
