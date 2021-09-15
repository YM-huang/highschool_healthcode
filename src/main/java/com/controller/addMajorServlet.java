package com.controller;

import com.dao.SchoolDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "addMajorServlet", value = "/addMajorServlet")
public class addMajorServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SchoolDao dao = new SchoolDao();
        String mno = request.getParameter("mno");
        String collegeno = request.getParameter("collegeno");
        String mname = request.getParameter("mname");
        boolean isSuccess = dao.addMajor(mno,mname,collegeno);
        RequestDispatcher rd = request.getRequestDispatcher("QueryMajorCountServlet");
        rd.forward(request,response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
