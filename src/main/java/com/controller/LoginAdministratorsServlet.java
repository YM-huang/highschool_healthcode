package com.controller;

import com.dao.HealthCodeDao;
import com.model.Teacher;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.PageContext;
import java.io.IOException;

@WebServlet({"/LoginAdministratorsServlet"})
public class LoginAdministratorsServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getContextPath();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        HealthCodeDao dao = new HealthCodeDao();
        Teacher teacher = new Teacher();
        String school_id = request.getParameter("school_id");

        String password = request.getParameter("password");
        teacher = dao.findTeacherInfo(school_id);

        if(teacher==null){
            RequestDispatcher rd = request.getRequestDispatcher("/error2.jsp");
            rd.forward(request,response);
        }
        else if(!password.equals(teacher.getPassword())){
            RequestDispatcher rd = request.getRequestDispatcher("/error2.jsp");
            rd.forward(request,response);
        }
        else if(password.equals((teacher.getPassword())) && teacher.getRole().equals("校级管理员")){
            response.sendRedirect(path+"/SchoolAdministrators.jsp");
        }
        else if(password.equals((teacher.getPassword())) && teacher.getRole().equals("院级管理员")){
            request.setAttribute("college",teacher.getCollege());
            RequestDispatcher rd = request.getRequestDispatcher("/majorAdministrators2.jsp");
            rd.forward(request,response);
        }
        else if(password.equals((teacher.getPassword())) && teacher.getRole().equals("系统管理员")){
            RequestDispatcher rd = request.getRequestDispatcher("/allAdministrators.jsp");
            rd.forward(request,response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
