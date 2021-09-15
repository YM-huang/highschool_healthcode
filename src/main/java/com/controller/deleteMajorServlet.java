package com.controller;

import com.dao.SchoolDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "deleteMajorServlet", value = "/deleteMajorServlet")
public class deleteMajorServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SchoolDao dao = new SchoolDao();
        String cno = request.getParameter("mno");
        boolean isSuccess = dao.delMajor(cno);
        RequestDispatcher rd = request.getRequestDispatcher("QueryMajorCountServlet");
        rd.forward(request,response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
