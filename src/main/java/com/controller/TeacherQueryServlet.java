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
import java.util.ArrayList;

@WebServlet({"/TeacherQueryServlet"})
public class TeacherQueryServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        HealthCodeDao dao = new HealthCodeDao();
        ArrayList<Teacher> teacher = new ArrayList<Teacher>();
        String college = request.getParameter("college");
        String major = request.getParameter("major");
        String class1 = request.getParameter("class1");
//        System.out.println(college+major+class1);
        teacher = dao.teacherInfoQuery(college);
//        System.out.println(student.get(1).getName());
        request.setAttribute("teacher",teacher);
        RequestDispatcher rd = request.getRequestDispatcher("/TeacherInfoManage2.jsp");
        rd.forward(request,response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
