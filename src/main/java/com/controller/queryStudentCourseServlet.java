package com.controller;

import com.dao.SchoolDao;
import com.model.StudentCourse;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet({"/queryStudentCourseServlet"})
public class queryStudentCourseServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        SchoolDao dao = new SchoolDao();
        String sno = request.getParameter("sno");
        System.out.println(sno);
        String cterm = request.getParameter("cterm");
        System.out.println(cterm);
        ArrayList<StudentCourse>studentCourse = dao.queryStudentCourse(sno,cterm);

        request.setAttribute("studentCourse",studentCourse);
        RequestDispatcher rd = request.getRequestDispatcher("/JSP/StudentCoursebyTerm.jsp");
        rd.forward(request,response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
