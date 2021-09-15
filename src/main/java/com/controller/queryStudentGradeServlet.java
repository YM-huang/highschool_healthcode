package com.controller;

import com.dao.SchoolDao;
import com.model.Shome;
import com.model.Studentgrade;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "queryStudentGradeServlet", value = "/queryStudentGradeServlet")
public class queryStudentGradeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        SchoolDao dao = new SchoolDao();
        ArrayList<Studentgrade> grade = dao.queryStugrade();
        request.setAttribute("grade",grade);
        RequestDispatcher rd = request.getRequestDispatcher("/JSP/StudentGrade.jsp");
        rd.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
