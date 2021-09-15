package com.controller;

import com.dao.SchoolDao;
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

@WebServlet({"/queryTeacherServlet"})
public class queryTeacherServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SchoolDao dao = new SchoolDao();
        String tno = request.getParameter("tno");
        ArrayList<Teacher> teacher = dao.QueryTeacher(tno);
        request.setAttribute("teacher",teacher);
        RequestDispatcher rd = request.getRequestDispatcher("/JSP/TeacherInfoManage2.jsp");
        rd.forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
