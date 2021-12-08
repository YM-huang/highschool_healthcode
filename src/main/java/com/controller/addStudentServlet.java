package com.controller;

import com.dao.HealthCodeDao;
import com.model.Student;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet({"/addStudentServlet"})
public class addStudentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HealthCodeDao dao = new HealthCodeDao();
        Student student = new Student();
        String message = null;
        try{
            String college = request.getParameter("college");
            String major = request.getParameter("major");
            String class1 = request.getParameter("class1");
            student.setName(request.getParameter("name"));
            student.setId(request.getParameter("id"));
            student.setSchool_id(request.getParameter("school_id"));
            student.setCollege(request.getParameter("college"));
            student.setMajor(request.getParameter("major"));
            student.setClass1(request.getParameter("class1"));
            boolean success = dao.addStudent(student);
            RequestDispatcher rd = request.getRequestDispatcher("/StudentQueryServlet?college="+college+"&major="+major+"&class1="+class1+"");
            rd.forward(request,response);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
