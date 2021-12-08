package com.controller;

import com.dao.HealthCodeDao;
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

@WebServlet({"/TeacherInfoCheckServlet"})
public class TeacherInfoCheckServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        HealthCodeDao dao = new HealthCodeDao();



        Double unfinishedTeacher = dao.teacherDailyAttendence();

        request.setAttribute("teacherAttendence",unfinishedTeacher);

        ArrayList<Teacher> teacher = dao.allTeacherInfo();

        request.setAttribute("teacher",teacher);

        RequestDispatcher rd = request.getRequestDispatcher("/TeacherInfoCheck2.jsp");
        rd.forward(request,response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
