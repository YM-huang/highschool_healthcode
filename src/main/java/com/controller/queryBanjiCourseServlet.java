package com.controller;

import com.dao.SchoolDao;
import com.model.BanjiCourse;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet({"/queryBanjiCourseServlet"})
public class queryBanjiCourseServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        SchoolDao dao = new SchoolDao();
        String bno = request.getParameter("school_id");
        ArrayList<BanjiCourse> banjiCourse = new ArrayList<BanjiCourse>();

        banjiCourse = dao.queryBanjiCourse(bno);
        request.setAttribute("banjiCourse",banjiCourse);
        RequestDispatcher rd = request.getRequestDispatcher("/JSP/BanjiCourseInfoCheck.jsp");
        rd.forward(request,response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
