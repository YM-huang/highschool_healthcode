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

@WebServlet({"/LoginUsersServlet"})
public class LoginUsersServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String name = request.getParameter("name");
//        System.out.println(name);
        String school_id = request.getParameter("school_id");
//        System.out.println(school_id);
        String id = request.getParameter("id");
//        System.out.println(id);
        HealthCodeDao dao = new HealthCodeDao();
        Student student = dao.findStudentInfo(school_id);
        Teacher teacher = dao.findTeacherInfo(school_id);
//        System.out.println("studentinfo"+student.getName());
//        System.out.println(student.getId());
//        System.out.println(student.getSchool_id());
//        System.out.println("teacherinfo"+teacher.getName());
//        System.out.println(teacher.getId());
//        System.out.println(teacher.getSchool_id());
        request.setAttribute("student",student);
        request.setAttribute("teacher",teacher);
        if(student==null && teacher==null){
//            System.out.println("s1");
            RequestDispatcher rd = request.getRequestDispatcher("/error.jsp");
            rd.forward(request,response);
        }
        else if(student!=null && school_id.equals(student.getSchool_id()) && id.equals(student.getId())){
//            System.out.println("s2");
            RequestDispatcher rd = request.getRequestDispatcher("/HealthCode.jsp");
            rd.forward(request,response);
        }
        else if(teacher!=null && name.equals(teacher.getName()) && id.equals(teacher.getId())){
//            System.out.println("s3");
            RequestDispatcher rd = request.getRequestDispatcher("/HealthCode.jsp");
            rd.forward(request,response);
        }
        else{
//            System.out.println("s4");
            RequestDispatcher rd = request.getRequestDispatcher("/error.jsp");
            rd.forward(request,response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
