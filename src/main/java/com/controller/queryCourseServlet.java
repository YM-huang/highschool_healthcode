package com.controller;

import com.dao.SchoolDao;
import com.model.Course;
import com.model.Teacher;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet({"/queryCourseServlet"})
public class queryCourseServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SchoolDao dao = new SchoolDao();
        String cno = request.getParameter("cno");
        ArrayList<Course> course= dao.QueryCourse(cno);
        request.setAttribute("course",course);
        RequestDispatcher rd = request.getRequestDispatcher("/JSP/CourseInfoManage2.jsp");
        rd.forward(request,response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
