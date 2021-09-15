<%String path = request.getContextPath();%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录界面</title>
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
        }
    </script>
    <link rel="stylesheet" type="text/css" href="<%=path%>/CSS/HealthCodeLoginCSS.css">
</head>
<body style="background: #444444">
    <div class="login">
        <div class="account">
            <form action="<%=path%>/LoginUsersServlet" method="post" onsubmit="return check_form();">
                <div class="logo">登录界面</div>
                <div class="line">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="radio" name="type" id="teacher" value="teacher">教师&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="radio" name="type" id="student" value="student">学生
                </div>
                <div class="line">
                    <input class="inputtxt" name="school_id" id="school_id" type="text" placeholder="学号/工号"
                           nullmsg="请输入学号" datatype="*">
                </div>
                <div class="line">
                    <input class="inputtxt" name="password" id="password" type="password" placeholder="密码"
                           nullmsg="密码" datatype="*">
                </div>
                <div class="login_btn">
                    <input id="login-button" value="登录" type="submit">
                </div>
            </form>
        </div>
    </div>
</body>
</html>
