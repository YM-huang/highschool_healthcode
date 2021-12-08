package com.controller;

import com.dao.HealthCodeDao;
import com.model.Student;
import com.model.Teacher;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet({"/addTeacherServlet"})
public class addTeacherServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HealthCodeDao dao = new HealthCodeDao();
        Teacher teacher = new Teacher();
        String message = null;
        try{
            String college = request.getParameter("college");
            teacher.setName(request.getParameter("name"));
            teacher.setId(request.getParameter("id"));
            teacher.setSchool_id(request.getParameter("school_id"));
            teacher.setCollege(request.getParameter("college"));
            teacher.setRole(request.getParameter("role"));
            teacher.setPassword(request.getParameter("password"));
            boolean success = dao.addTeacher(teacher);
            RequestDispatcher rd = request.getRequestDispatcher("/TeacherQueryServlet?college="+college+"");
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
