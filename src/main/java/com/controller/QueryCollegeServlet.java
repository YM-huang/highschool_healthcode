package com.controller;

import com.dao.SchoolDao;
import com.model.Course;
import com.model.StuCollege;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "QueryCollegeServlet", value = "/QueryCollegeServlet")
public class QueryCollegeServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SchoolDao dao = new SchoolDao();
        ArrayList<StuCollege> college = dao.QueryAllCollege();
        request.setAttribute("college",college);
        RequestDispatcher rd = request.getRequestDispatcher("/JSP/CollegeInfoManage2.jsp");
        rd.forward(request,response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
