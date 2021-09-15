package com.controller;

import com.dao.SchoolDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet({"/addTeacherServlet"})
public class addTeacherServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SchoolDao dao = new SchoolDao();
        String tno = request.getParameter("tno");
        String tname = request.getParameter("tname");
        String tsex = request.getParameter("tsex");
        String tage = request.getParameter("tage");
        String tprofess = request.getParameter("tprofess");
        String tphone = request.getParameter("tphone");
        String tpass = request.getParameter("tpass");
        String collegeno = request.getParameter("collegeno");
        String role = request.getParameter("role");
        boolean isSuccess = dao.addTeacher(tno,tname,tsex,Integer.parseInt(tage),tprofess,tphone,tpass,Integer.parseInt(role),collegeno);
        RequestDispatcher rd = request.getRequestDispatcher("queryAllTeacherServlet");
        rd.forward(request,response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
