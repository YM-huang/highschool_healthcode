<%String path = request.getContextPath();%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生密码修改</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=path%>/CSS/HealthCodeLoginCSS.css">
    <script src="bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    <script src="jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
</head>
<body style="background: #444444">
<div class="login">
    <div class="account">
        <div class="logo">学生信息修改界面</div>
        <form action="<%=path%>/modifyStudentpassServlet" method="post">
            <div class="line" style="display: none">
                <input class="inputtxt" value="<%=request.getParameter("sno").trim()%>" name="sno" id="sno" placeholder="学号" type="text">
            </div>
            <div class="line" style="display: none">
                <input class="inputtxt" value="<%=request.getParameter("sno").trim()%>" name="snoold" id="snoold" placeholder="学号" type="text">
            </div>
            <div class="line" >
                <input class="inputtxt" name="spwd" id="spwd" placeholder="密码" type="text">
            </div>
            <div class="login_btn">
                <input id="" value="学生信息修改" type="submit">
            </div>
        </form>
    </div>
</div>
</body>
</html>
