package com.model;

public class Teacher {
    private String tno;
    private String tname;
    private String tsex;
    private int tage;
    private int role; // 1是教师，大于1是管理员
    private String tprofess;
    private String tphone;
    private String tpass;
    private String collegeno;

    public String getCollegeno() {
        return collegeno;
    }

    public void setCollegeno(String collegeno) {
        this.collegeno = collegeno;
    }

    public String getTprofess() {
        return tprofess;
    }

    public void setTprofess(String tprofess) {
        this.tprofess = tprofess;
    }

    public String getTphone() {
        return tphone;
    }

    public void setTphone(String tphone) {
        this.tphone = tphone;
    }

    public Teacher() {
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public String getTno() {
        return tno;
    }

    public void setTno(String tno) {
        this.tno = tno;
    }

    public String getTname() {
        return tname;
    }

    public void setTname(String tname) {
        this.tname = tname;
    }

    public String getTsex() {
        return tsex;
    }

    public void setTsex(String tsex) {
        this.tsex = tsex;
    }

    public int getTage() {
        return tage;
    }

    public void setTage(int tage) {
        this.tage = tage;
    }

    public String getTpass() {
        return tpass;
    }

    public void setTpass(String tpass) {
        this.tpass = tpass;
    }
}
