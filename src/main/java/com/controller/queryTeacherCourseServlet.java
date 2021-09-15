package com.controller;

import com.dao.SchoolDao;
import com.model.TeacherCourse;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet({"/queryTeacherCourseServlet"})
public class queryTeacherCourseServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        SchoolDao dao = new SchoolDao();
        String tno = request.getParameter("tno");
        request.setAttribute("tno",tno);
        ArrayList<TeacherCourse> teacherCourse = dao.queryTeacherCourse(tno);
        request.setAttribute("teacherCourse",teacherCourse);
        RequestDispatcher rd = request.getRequestDispatcher("/JSP/TeacherCourse.jsp");
        rd.forward(request,response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
