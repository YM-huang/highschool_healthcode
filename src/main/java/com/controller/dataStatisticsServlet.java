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
import java.util.stream.StreamSupport;

@WebServlet({"/dataStatisticsServlet"})
public class dataStatisticsServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        HealthCodeDao dao = new HealthCodeDao();

        Double unfinishedTeacher = dao.teacherDailyAttendence();
        Double unfinishedStudent = dao.studentDailyAttendence();
        request.setAttribute("teacherAttendence",unfinishedTeacher);
        request.setAttribute("studentAttendence",unfinishedStudent);
        ArrayList<Teacher> teacher = dao.findUnfinishedTeacher();
        ArrayList<Student> student = dao.findUnfinishedStudent();

        request.setAttribute("teacher",teacher);
        request.setAttribute("student",student);

        RequestDispatcher rd = request.getRequestDispatcher("/data_statistics2.jsp");
        rd.forward(request,response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
