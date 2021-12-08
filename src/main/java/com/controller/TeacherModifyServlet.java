package com.controller;

import com.dao.HealthCodeDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet({"/TeacherModifyServlet"})
public class TeacherModifyServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        HealthCodeDao dao = new HealthCodeDao();
        String name = request.getParameter("name");
        String id = request.getParameter("id");
        String school_id = request.getParameter("school_id");
        String college = request.getParameter("college");
        String healthcode = request.getParameter("healthcode");
        String password = request.getParameter("password");
        String role = request.getParameter("role");
        Boolean success = dao.ModifyTeacherInfo(name,id,school_id,college,healthcode,password,role);
        RequestDispatcher rd = request.getRequestDispatcher("/TeacherQueryServlet?college="+college+"");
        rd.forward(request,response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
