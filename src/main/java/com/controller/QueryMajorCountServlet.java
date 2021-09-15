package com.controller;

import com.dao.SchoolDao;
import com.model.Course;
import com.model.StuCollege;
import com.model.StuMajor;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "QueryMajorCountServlet", value = "/QueryMajorCountServlet")
public class QueryMajorCountServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SchoolDao dao = new SchoolDao();
        ArrayList<StuMajor> major = dao.QueryAllMajor();
        request.setAttribute("major",major);
        RequestDispatcher rd = request.getRequestDispatcher("/JSP/MajorInfoManage2.jsp");
        rd.forward(request,response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
