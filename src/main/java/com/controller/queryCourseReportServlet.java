package com.controller;

import com.dao.SchoolDao;
import com.model.CourseReport;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet({"/queryCourseReportServlet"})
public class queryCourseReportServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        SchoolDao dao = new SchoolDao();
        String cno = request.getParameter("cno");
        ArrayList<CourseReport> courseReport = dao.queryCourseReport(cno);
        String tno = request.getParameter("tno");
        System.out.println(tno);
        request.setAttribute("tno",tno);
        request.setAttribute("courseReport",courseReport);

        RequestDispatcher rd = request.getRequestDispatcher("/JSP/queryCourseReport.jsp?tno=001");
        rd.forward(request,response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        this.doPost(request,response);
    }
}
