
<%String path = request.getContextPath();%>
<%String college= (String) request.getAttribute("college");%>
<%--<%System.out.println(college);%>--%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>院级管理员管理界面</title>
    <link rel="stylesheet" href="<%=path%>/CSS/HealthCodeLoginCSS.css">
</head>
<body style="background: #444444">
<div class="login2">
    <div class="account">
        <div class="logo">院级管理员管理界面</div>
        <form action="<%=path%>/majordataStatisticServlet" method="post">
            <div class="login_btn">
                <input id="college" name="college" value="<%=request.getAttribute("college")%>" style="display: none" readonly>
                <input id="专业打卡情况统计" value="本专业打卡情况统计" type="submit" >
            </div>
        </form>
        <form action="<%=path%>searchMajorUsers.jsp" method="post">
            <div class="login_btn">
                <input id="本专业数据查询" value="本专业师生打卡情况查询" type="submit">
            </div>
        </form>
    </div>
</div>
</body>
</html>