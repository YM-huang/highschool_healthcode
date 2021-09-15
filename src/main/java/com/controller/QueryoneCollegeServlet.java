package com.controller;

import com.dao.SchoolDao;
import com.model.StuCollege;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "QueryoneCollegeServlet", value = "/QueryoneCollegeServlet")
public class QueryoneCollegeServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        SchoolDao dao = new SchoolDao();
        String collegeno = request.getParameter("collegeno");
        ArrayList<StuCollege> college = dao.QueryCollege(collegeno);
        request.setAttribute("college",college);
        RequestDispatcher rd = request.getRequestDispatcher("/JSP/CollegeInfoManage2.jsp");
        rd.forward(request,response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
