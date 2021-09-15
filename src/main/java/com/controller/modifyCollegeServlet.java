package com.controller;

import com.dao.SchoolDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "modifyCollegeServlet", value = "/modifyCollegeServlet")
public class modifyCollegeServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        SchoolDao dao = new SchoolDao();
        String cno = request.getParameter("cno");

        String cnoold = request.getParameter("cnoold");

        String cname = request.getParameter("cname");

        boolean isSuccess = dao.modCollege(cno,cname,cnoold);
        RequestDispatcher rd = request.getRequestDispatcher("QueryCollegeServlet");
        rd.forward(request,response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
