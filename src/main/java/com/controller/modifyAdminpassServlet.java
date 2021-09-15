package com.controller;

import com.dao.SchoolDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet({"/modifyAdminpassServlet"})
public class modifyAdminpassServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ano = request.getParameter("ano");
        String apassold = request.getParameter("apassold");
        String apass = request.getParameter("apass");
        SchoolDao dao = new SchoolDao();
        boolean isSuccess = dao.modAdminPass(apass,ano);
        RequestDispatcher rd = request.getRequestDispatcher("/JSP/allAdministrators2.jsp");
        rd.forward(request,response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
