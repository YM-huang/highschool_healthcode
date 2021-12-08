
<%String path = request.getContextPath();%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员登录</title>
    <link rel="stylesheet" href="<%=path%>/CSS/HealthCodeLoginCSS.css">
</head>
<body>
<body style="background: #444444">
<div class="login2">
    <div class="account">
        <form action="<%=path%>/LoginAdministratorsServlet" method="post" onsubmit="return check_form();">
            <div class="logo">管理员登录界面</div>
            <div class="line">
                <input class="inputtxt" name="school_id" id="school_id" datatype="*"
                       nullmsg="请填写工号" placeholder="工号" type="text">
            </div>
            <div class="line">
                <input class="inputtxt" name="password" id="password" type="password" placeholder="密码"
                       nullmsg="请输入密码" datatype="*">
            </div>
            <div class="login_btn">
                <input id="login-button" value="登录" type="submit">
            </div>
        </form>
    </div>
</div>
</body>
</body>
</html>
