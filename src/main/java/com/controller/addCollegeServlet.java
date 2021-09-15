package com.controller;

import com.dao.SchoolDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "addCollegeServlet", value = "/addCollegeServlet")
public class addCollegeServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SchoolDao dao = new SchoolDao();
        String collegename = request.getParameter("collegename");
        String collegeno = request.getParameter("collegeno");
        boolean isSuccess = dao.addCollege(collegeno,collegename);
        RequestDispatcher rd = request.getRequestDispatcher("QueryCollegeServlet");
        rd.forward(request,response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
