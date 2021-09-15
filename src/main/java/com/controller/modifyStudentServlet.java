package com.controller;

import com.dao.SchoolDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet({"/modifyStudentServlet"})
public class modifyStudentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        SchoolDao dao = new SchoolDao();
        String sno = request.getParameter("sno").trim();
        String bno = request.getParameter("bno").trim();
        String sname = request.getParameter("sname").trim();
        String sex = request.getParameter("sex").trim();
        String sage = request.getParameter("sage").trim();
        String shome = request.getParameter("shome").trim();
        String spoint = request.getParameter("spoint").trim();
        String spwd = request.getParameter("spwd").trim();
        int age2 = Integer.parseInt(sage);
        String snoold = request.getParameter("snoold").trim();
        boolean isSuccess = dao.modStudent1(sno,bno,sname,sex,age2,shome,spoint,spwd,snoold);
        RequestDispatcher rd = request.getRequestDispatcher("queryAllStudentServlet");
        rd.forward(request,response);

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
