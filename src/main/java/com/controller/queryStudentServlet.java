package com.controller;

import com.dao.SchoolDao;
import com.model.Student;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet({"/queryStudentServlet"})
public class queryStudentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SchoolDao dao = new SchoolDao();
        String school_id = request.getParameter("school_id");
        ArrayList<Student> student = dao.QueryStudent(school_id);
        request.setAttribute("student",student);
        RequestDispatcher rd = request.getRequestDispatcher("/JSP/StudentInfoManage2.jsp");
        rd.forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
