 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%String path = request.getContextPath();%>
<%
    Date d1 = new Date();
    SimpleDateFormat dfd = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");
    String date = dfd.format(d1);
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>师生打卡情况统计</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
</head>
<body>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="span12">

            <h6>截至<%=date%></h6><br>
            <h3>
                教师未打卡情况
            </h3>
            <h4>教师打卡率：<%=request.getAttribute("teacherAttendence")%></h4>
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th>姓名</th>
                    <th>身份证号</th>
                    <th>学号</th>
                    <th>学院</th>
                    <th>职务</th>
                    <th>打卡情况</th>
                    <th>健康码</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="school_info" items="${requestScope.teacher}"
                           varStatus="status">
                    <c:if test="${status.count%2==0}">
                        <tr style="background: #eeeeff">
                    </c:if>
                    <c:if test="${status.count%2!=0}">
                        <tr style="background: #dedeff">
                    </c:if>
                    <td>${school_info.name}</td>
                    <td>${school_info.id}</td>
                    <td>${school_info.school_id}</td>
                    <td>${school_info.college}</td>
                    <td>${school_info.role}</td>
                    <td>${school_info.attendenceRecord}</td>
                    <td>${school_info.healthcode}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <h3>
                学生未打卡情况
            </h3>
            <h4>学生打卡率：<%=request.getAttribute("studentAttendence")%></h4>
            <table class="table">
                <thead>
                <tr>
                    <th>姓名</th>
                    <th>身份证号</th>
                    <th>学号</th>
                    <th>学院</th>
                    <th>专业</th>
                    <th>班级</th>
                    <th>打卡情况</th>
                    <th>健康码</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="school_info" items="${requestScope.student}"
                           varStatus="status">
                    <c:if test="${status.count%2==0}">
                        <tr style="background: #eeeeff">
                    </c:if>
                    <c:if test="${status.count%2!=0}">
                        <tr style="background: #dedeff">
                    </c:if>
                    <td>${school_info.name}</td>
                    <td>${school_info.id}</td>
                    <td>${school_info.school_id}</td>
                    <td>${school_info.college}</td>
                    <td>${school_info.major}</td>
                    <td>${school_info.class1}</td>
                    <td>${school_info.attendenceRecord}</td>
                    <td>${school_info.healthcode}</td>
                    </tr>
                </c:forEach>
                </tbody>
                <tr>
                    <td>
                        <a href="<%=path%>/allAdministrators2.jsp">返回主界面</a>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>
</body>
</html>
