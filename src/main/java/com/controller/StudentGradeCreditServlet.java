package com.controller;

import com.dao.SchoolDao;
import com.model.Course;
import com.model.Student;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "StudentGradeCreditServlet", value = "/StudentGradeCreditServlet")
public class StudentGradeCreditServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SchoolDao dao = new SchoolDao();
        String sno = request.getParameter("sno");
        ArrayList<Student> student= dao.QueryStudentGpa(sno);
        request.setAttribute("student",student);
        RequestDispatcher rd = request.getRequestDispatcher("/JSP/StudentGradeCredit.jsp");
        rd.forward(request,response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
