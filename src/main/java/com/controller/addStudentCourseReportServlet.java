package com.controller;

import com.dao.SchoolDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet({"/addStudentCourseReportServlet"})
public class addStudentCourseReportServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String sno = request.getParameter("sno");
        String cno = request.getParameter("cno");
        String grade = request.getParameter("grade");
        String tno = request.getParameter("tno");
        SchoolDao dao = new SchoolDao();
        boolean isSuccess = dao.addStudentCourseReport(sno,cno,grade,tno);
        RequestDispatcher rd = request.getRequestDispatcher("/JSP/queryCourseReport.jsp");
        rd.forward(request,response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
