
<%String path = request.getContextPath();%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登陆失败</title>
    <link rel="stylesheet" href="<%=path%>/CSS/HealthCodeLoginCSS.css">
</head>
<body style="background: #444444">
<div class="login_faild">
    <div class="account">
        <div class="logo">账号或密码错误</div>
        <div class="logo"><a href="<%=path%>/LoginUsers.jsp">点击返回</a></div>
    </div>
</div>
</body>
</html>
