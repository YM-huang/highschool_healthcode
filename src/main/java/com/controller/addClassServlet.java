package com.controller;

import com.dao.SchoolDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "addClassServlet", value = "/addClassServlet")
public class addClassServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SchoolDao dao = new SchoolDao();
        String classname = request.getParameter("classname");
        String classno = request.getParameter("classno");
        boolean isSuccess = dao.addClass(classno,classname);
        RequestDispatcher rd = request.getRequestDispatcher("QueryClassServlet");
        rd.forward(request,response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
