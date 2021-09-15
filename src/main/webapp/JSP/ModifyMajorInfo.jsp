<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%String path = request.getContextPath();%>
<html>
<head>
    <title>学生信息修改</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=path%>/CSS/HealthCodeLoginCSS.css">
    <script src="bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    <script src="jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
</head>
<body style="background: #444444">
<div class="modifystu">
    <div class="account">
        <div class="logo">课程信息修改界面</div>
        <form action="<%=path%>/modifyMajorServlet" method="post">
            <div class="line">
                <input class="inputtxt" value="<%=request.getParameter("mno").trim()%>" name="cno" id="cno" placeholder="专业编号" type="text">
            </div>
            <div class="line" style="display: none">
                <input class="inputtxt" value="<%=request.getParameter("mno").trim()%>" name="cnoold" id="cnoold" placeholder="专业编号" type="text">
            </div>

            <div class="line">
                <input class="inputtxt" value="<%=request.getParameter("mname").trim()%>" name="cname" id="cname" placeholder="专业名称" type="text">
            </div>
            <div class="line">
                <input class="inputtxt" value="<%=request.getParameter("collegeno").trim()%>" name="collegeno" id="collegeno" placeholder="学院编号" type="text">
            </div>
            <div class="login_btn">
                <input id="" value="专业信息修改" type="submit">
            </div>
        </form>
    </div>
</div>
</body>
</html>