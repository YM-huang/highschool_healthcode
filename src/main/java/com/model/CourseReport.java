package com.model;

public class CourseReport {
    private String sno;
    private String sname;
    private String cno;
    private String cname;
    private int grade;

    public CourseReport() {
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

    public String getCno() {
        return cno;
    }

    public void setCourseno(String cno) {
        this.cno = cno;
    }

    public String getCname() {
        return cname;
    }

    public void setCoursename(String cname) {
        this.cname = cname;
    }

    public int getGrade() {
        return grade;
    }

    public void setGrade(int grade) {
        this.grade = grade;
    }
}
