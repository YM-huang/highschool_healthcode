
<%String path = request.getContextPath();%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        <div class="logo">学生信息修改界面</div>
        <form action="../StudentModifyServlet" method="post">
            <div class="line">
                <input class="inputtxt" value="<%=request.getParameter("name")%>" name="name" id="name" datatype="*"
                        placeholder="姓名" type="text">
            </div>
            <div class="line">
                <input class="inputtxt" value="<%=request.getParameter("id")%>" name="id" id="id" datatype="*"
                        placeholder="身份证号" type="text">
            </div>
            <div class="line">
                <input class="inputtxt" value="<%=request.getParameter("school_id")%>" name="school_id" id="school_id" datatype="*"
                        placeholder="学号" type="text">
            </div>
            <div class="line">
                <input class="inputtxt" value="<%=request.getParameter("college")%>" name="college" id="college" datatype="*"
                        placeholder="学院" type="text">
            </div>
            <div class="line">
                <input class="inputtxt" value="<%=request.getParameter("major")%>" name="major" id="major" datatype="*"
                        placeholder="专业" type="text">
            </div>
            <div class="line">
                <input class="inputtxt" value="<%=request.getParameter("class1")%>" name="class1" id="class1" datatype="*"
                        placeholder="班级" type="text">
            </div>
            <div class="line">
                <input class="inputtxt" value="<%=request.getParameter("healthcode")%>" name="healthcode" id="healthcode" datatype="*"
                        placeholder="健康码颜色(红码、黄码、绿码)" type="text">
            </div>
            <div class="login_btn">
                <input id="" value="学生信息修改" type="submit">
            </div>
        </form>
    </div>
</div>
</body>
</html>
