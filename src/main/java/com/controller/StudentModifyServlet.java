package com.controller;

import com.dao.HealthCodeDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet({"/StudentModifyServlet"})
public class StudentModifyServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        HealthCodeDao dao = new HealthCodeDao();
        String name = request.getParameter("name");
        String id = request.getParameter("id");
        String school_id = request.getParameter("school_id");
        String college = request.getParameter("college");
        String major = request.getParameter("major");
        String class1 = request.getParameter("class1");
        String healthcode = request.getParameter("healthcode");
//        System.out.println(healthcode);
        Boolean success = dao.ModifyStudentInfo(name,id,school_id,college,major,class1,healthcode);
        RequestDispatcher rd = request.getRequestDispatcher("/StudentQueryServlet?college="+college+"&major="+major+"&class1="+class1+"");
        rd.forward(request,response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
