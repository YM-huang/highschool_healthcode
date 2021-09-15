package com.controller;

import com.dao.SchoolDao;
import com.model.StuClass;
import com.model.StuCollege;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "QueryoneClassServlet", value = "/QueryoneClassServlet")
public class QueryoneClassServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        SchoolDao dao = new SchoolDao();
        String classno = request.getParameter("classno");
        ArrayList<StuClass> stuclass = dao.QueryClass(classno);
        request.setAttribute("stuclass",stuclass);
        RequestDispatcher rd = request.getRequestDispatcher("/JSP/ClassInfoManage2.jsp");
        rd.forward(request,response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
