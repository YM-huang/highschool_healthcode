
<%String path = request.getContextPath();%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>校级管理员管理界面</title>
    <link rel="stylesheet" href="<%=path%>/CSS/HealthCodeLoginCSS.css">
</head>
<body style="background: #444444">
<div class="login2">
    <div class="account">
        <div class="logo">校级管理员管理界面</div>
        <form action="dataStatisticsServlet" method="post">
            <div class="login_btn">
                <input id="data_statistics" value="师生打卡数据统计" type="submit">
            </div>
        </form>
        <form action="StudentInfoCheckServlet" method="post">
            <div class="login_btn">
                <input id="manageStudent" value="全校学生信息查看" type="submit">
            </div>
        </form>
        <form action="TeacherInfoCheckServlet" method="post">
            <div class="login_btn">
                <input id="manageTeacher" value="全校老师信息管理" type="submit">
            </div>
        </form>
    </div>
</div>
</body>
</html>
