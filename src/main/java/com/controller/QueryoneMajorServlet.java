package com.controller;

import com.dao.SchoolDao;
import com.model.StuCollege;
import com.model.StuMajor;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "QueryoneMajorServlet", value = "/QueryoneMajorServlet")
public class QueryoneMajorServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        SchoolDao dao = new SchoolDao();
        String mno = request.getParameter("mno");
        ArrayList<StuMajor> major = dao.QueryMajor(mno);
        request.setAttribute("major",major);
        RequestDispatcher rd = request.getRequestDispatcher("/JSP/MajorInfoManage2.jsp");
        rd.forward(request,response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
