package com.controller;

import com.dao.SchoolDao;
import com.model.StuClass;
import com.model.StuCollege;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "QueryClassServlet", value = "/QueryClassServlet")
public class QueryClassServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SchoolDao dao = new SchoolDao();
        ArrayList<StuClass> stuclass = dao.QueryAllClass();
        request.setAttribute("stuclass",stuclass);
        RequestDispatcher rd = request.getRequestDispatcher("/JSP/ClassInfoManage2.jsp");
        rd.forward(request,response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
