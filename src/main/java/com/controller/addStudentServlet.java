package com.controller;

import com.dao.SchoolDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet({"/addStudentServlet"})
public class addStudentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SchoolDao dao = new SchoolDao();
        String sno = request.getParameter("sno");
        String bno = request.getParameter("bno");
        String mno = request.getParameter("mno");
        String sname = request.getParameter("sname");
        String sex = request.getParameter("sex");
        String sage = request.getParameter("sage");
        String shome = request.getParameter("shome");
        String sphone = request.getParameter("sphone");
        String spoint = request.getParameter("spoint");
        String spwd = request.getParameter("spwd");
        int age2 = Integer.parseInt(sage);
        boolean isSuccess = dao.addStudent(sno,mno,sname,sex,age2,0,spoint,sphone,shome,spwd,bno);
        RequestDispatcher rd = request.getRequestDispatcher("queryAllStudentServlet");
        rd.forward(request,response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
