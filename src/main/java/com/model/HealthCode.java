package com.model;

public class HealthCode {
    private String name;
    private String id;
    private String school_id;
    private String tel;
    private int choice;

    public HealthCode(){}
    public HealthCode(String name, String id, String school_id, String tel, int choice){
        this.id = id;
        this.name = name;
        this.school_id = school_id;
        this.tel = tel;
        this.choice = choice;
    }

    public int getChoice(){
        return choice;
    }

    public String getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getSchool_id() {
        return school_id;
    }

    public String getTel() {
        return tel;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setSchool_id(String school_id) {
        this.school_id = school_id;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public void setChoice(int choice) {
        this.choice = choice;
    }
}
