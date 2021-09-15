package com.model;

public class TeacherCourse {
    private String cno;
    private String tno;
    private String cname;
    private String tname;

    public TeacherCourse() {
    }

    public String getCno() {
        return cno;
    }

    public void setCourseno(String cno) {
        this.cno = cno;
    }

    public String getTno() {
        return tno;
    }

    public void setTno(String tno) {
        this.tno = tno;
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
