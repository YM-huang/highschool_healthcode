package com.model;

import java.util.function.IntSupplier;

public class Course {
    private String courseno;
    private String coursename;
    private String cterm;
    private int chour;
    private String cassessment;
    private String ccredit;
    private String tno;
    private String collegeno;


    public Course() {
    }

    public int getChour() {
        return chour;
    }

    public void setChour(int chour) {
        this.chour = chour;
    }

    public String getCassessment() {
        return cassessment;
    }

    public void setCassessment(String cassessment) {
        this.cassessment = cassessment;
    }

    public String getCourseno() {
        return courseno;
    }

    public void setCourseno(String courseno) {
        this.courseno = courseno;
    }

    public String getCoursename() {
        return coursename;
    }

    public void setCoursename(String coursename) {
        this.coursename = coursename;
    }

    public String getCterm() {
        return cterm;
    }

    public void setCterm(String cterm) {
        this.cterm = cterm;
    }

    public String getCcredit() {
        return ccredit;
    }

    public void setCcredit(String ccredit) {
        this.ccredit = ccredit;
    }
}
