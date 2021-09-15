package com.controller;

import com.dao.SchoolDao;
import com.model.Admin;
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
        String type = request.getParameter("type");
        String school_id = request.getParameter("school_id");
        String password = request.getParameter("password");
        request.setAttribute("school_id",school_id);
        request.setAttribute("pass",password);
        if(type.equals("teacher")){
            SchoolDao dao = new SchoolDao();
            Teacher teacher = dao.loginTeacher(school_id);
            if(password.equals(teacher.getTpass().trim())&& teacher.getRole()==1){
                //进入普通教师界面
                request.setAttribute("tno",school_id);
                RequestDispatcher rd = request.getRequestDispatcher("/JSP/Teacher.jsp");
                rd.forward(request,response);
            }
            else if(password.equals(teacher.getTpass().trim())&& teacher.getRole()>1){
                //进入管理员界面
                System.out.println("admin");
                RequestDispatcher rd = request.getRequestDispatcher("/JSP/allAdministrators2.jsp");
                rd.forward(request,response);
            }
        }
        else if(type.equals("student")){
            SchoolDao dao = new SchoolDao();
            Student student= dao.loginStudent(school_id);
            if(password.equals(student.getSpwd().trim())){
                //进入学生界面
                request.setAttribute("sno",school_id);
                RequestDispatcher rd = request.getRequestDispatcher("/JSP/Student.jsp");
                rd.forward(request,response);
            }
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
