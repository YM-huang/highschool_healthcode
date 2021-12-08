<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%String path = request.getContextPath();%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生查询结果</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
</head>
<body>
<table class="table table-bordered" contenteditable="false">
    <thead>
    <tr>
        <td>姓名</td>
        <td>身份证号</td>
        <td>学号</td>
        <td>学院</td>
        <td>专业</td>
        <td>班级</td>
        <td>打卡</td>
        <td>健康码</td>
        <td>操作</td>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="student" items="${requestScope.student}"
               varStatus="status">
        <c:if test="${status.count%2==0}">
            <tr style="background: #eeeeff">
        </c:if>
        <c:if test="${status.count%2!=0}">
            <tr style="background: #dedeff">
        </c:if>
        <td>${student.name}</td>
        <td>${student.id}</td>
        <td>${student.school_id}</td>
        <td>${student.college}</td>
        <td>${student.major}</td>
        <td>${student.class1}</td>
        <td>${student.attendenceRecord}</td>
        <td>${student.healthcode}</td>
        <td>
            <a href="ModifyStudentInfo.jsp?name=${student.name}&id=${student.id}&school_id=${student.school_id}&college=${student.college}&major=${student.major}&class1=${student.class1}&healthcode=${student.healthcode}">修改</a>
            <a href="StudentDeleteServlet?name=${student.name}&id=${student.id}&school_id=${student.school_id}&college=${student.college}&major=${student.major}&class1=${student.class1}&healthcode=${student.healthcode}">删除</a>
        </td>
        </tr>
    </c:forEach>
    <tr>
        <td rowspan="9"><a href="AddStudentInfo.jsp">添加</a></td>
    </tr>
    </tbody>
</table>

<p>
    <audio controls="controls" style="display: none;">&nbsp;</audio>
</p>

</body>
</html>
