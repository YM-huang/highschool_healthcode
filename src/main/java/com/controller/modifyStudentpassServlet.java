package com.controller;

import com.dao.SchoolDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet({"/modifyStudentpassServlet"})
public class modifyStudentpassServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String sno = request.getParameter("sno");
        String pass = request.getParameter("spwd");
        SchoolDao dao = new SchoolDao();
        boolean is = dao.modStudentPass(pass,sno);
        request.setAttribute("sno",sno);
        RequestDispatcher rd = request.getRequestDispatcher("/JSP/Student.jsp");
        rd.forward(request,response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
