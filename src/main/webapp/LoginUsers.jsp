
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生教师登录界面</title>
    <script type="text/javascript">
        function check_form() {
            var name = document.getElementById("name");
            var school_id = document.getElementById("school_id");
            var id = document.getElementById("id");
            if(name.value==""){
                alert("姓名为空");
                return false;
            }
            else if(school_id.value==""){
                alert("学号为空");
                return false;
            }
            else if(id.value==""){
                alert("身份证号后八位为空");
                return false;
            }
        }
    </script>
    <link rel="stylesheet" type="text/css" href="CSS/HealthCodeLoginCSS.css">
</head>
<body style="background: #444444">
    <div class="login">
        <div class="account">
            <form action="../LoginUsersServlet" method="post" onsubmit="return check_form();">
                <div class="logo">师生登录界面</div>
                <div class="line">
                    <input class="inputtxt" value name="name" id="name" datatype="*"
                           nullmsg="请填写账号" placeholder="姓名" type="text">
                </div>
                <div class="line">
                    <input class="inputtxt" name="school_id" id="school_id" type="text" placeholder="学号/工号"
                           nullmsg="请输入学号" datatype="*">
                </div>
                <div class="line">
                    <input class="inputtxt" name="id" id="id" type="password" placeholder="身份证后八位"
                           nullmsg="请输入身份证" datatype="*">
                </div>
                <div class="login_btn">
                    <input id="login-button" value="登录" type="submit">
                </div>
            </form>
        </div>
    </div>
</body>
</html>
