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

@WebServlet({"/majordataStatisticServlet"})
public class majordataStatisticServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        HealthCodeDao dao = new HealthCodeDao();
        String college= request.getParameter("college");
        //学院信息
        request.setAttribute("college",college);
        //饼图数据
        ArrayList<Integer> stuTea = dao.majorstatistics(college);
        request.setAttribute("fs",stuTea.get(0));
        request.setAttribute("ufs",stuTea.get(1));
        request.setAttribute("ft",stuTea.get(2));
        request.setAttribute("uft",stuTea.get(3));
        //学生教师打卡率
        Double unfinishedTeacher = dao.majorteacherDailyAttendence(college);
        unfinishedTeacher = unfinishedTeacher*100;
        String uft100= String.valueOf(unfinishedTeacher);
        uft100=uft100+"%";
        Double unfinishedStudent = dao.majorstudenttDailyAttendence(college);
        unfinishedStudent=unfinishedStudent*100;
        String ufs100= String.valueOf(unfinishedStudent);
        ufs100=ufs100+"%";
//        System.out.println(uft100);
//        System.out.println(ufs100);
        request.setAttribute("teacherAttendence",uft100);
        request.setAttribute("studentAttendence",ufs100);

        //未打卡学生教师
        ArrayList<Teacher> teacher = dao.majorfindUnfinishedTeacher(college);
        ArrayList<Student> student = dao.majorfindUnfinishedStudent(college);
        request.setAttribute("teacher",teacher);
        request.setAttribute("student",student);
        RequestDispatcher rd = request.getRequestDispatcher("/majorAdministrators2.jsp");
        rd.forward(request,response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}