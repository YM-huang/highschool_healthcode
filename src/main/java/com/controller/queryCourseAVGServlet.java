package com.controller;

import com.dao.SchoolDao;
import com.model.AVG;
import com.model.Admin;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet({"/queryCourseAVG"})
public class queryCourseAVGServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        SchoolDao dao = new SchoolDao();
        String cno = request.getParameter("cno");
        String tno = request.getParameter("tno");

        ArrayList<AVG> avg = dao.queryCourseAVG(cno);
        request.setAttribute("avg",avg);
        request.setAttribute("tno",tno);
        RequestDispatcher rd = request.getRequestDispatcher("/JSP/TeacherCourseAvg.jsp");
        rd.forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
