
<%String path = request.getContextPath();%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>教师信息管理界面</title>
    <link rel="stylesheet" href="<%=path%>/CSS/HealthCodeLoginCSS.css">
</head>
<body style="background: #444444">
<div class="login2">
    <div class="account">
        <form action="../TeacherQueryServlet" method="post" >
            <div class="logo">教师信息查询管理界面</div><br><br>
            <div class="line">
                <input class="inputtxt" value name="college" id="college" datatype="*"
                       nullmsg="请填写学院" placeholder="学院" type="text">
            </div>
            <br>
            <div class="login_btn">
                <input id="manage" value="信息管理" type="submit">
            </div>
        </form>
    </div>
</div>
</body>
</html>
