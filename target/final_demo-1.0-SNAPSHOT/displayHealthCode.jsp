<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%String path1 = request.getContextPath();%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>展示二维码</title>
    <link rel="stylesheet" href="<%=path1%>/CSS/HealthCodeLoginCSS.css">
    <script type="text/javascript" src="<%=path1%>/JS/time.js"></script>
    <style>
        body {
            /* 文字/行高 */
            font: 16px/28px 'Microsoft YaHei';
            background-color: #444444;
            background-repeat:no-repeat;
            background-size: cover;
            /*背景自适应调节*/
        }


        a {
            text-decoration: none;
            /* 去除下划线 */

        }

        p{
            font-size: 13px;
            text-align: center;
        }

        tr{
            text-align: center;
        }

    </style>
</head>
<body>


    <table style="margin: auto; top: 40%; width: 350px; border-radius: 6px;">
        <%
            request.setCharacterEncoding("UTF-8");
            Date d = new Date();
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            SimpleDateFormat df2 = new SimpleDateFormat(" HH:mm:ss");
            String time = df.format(d);
            String time2 = df2.format(d);
            String path = request.getServletContext().getRealPath("/images/");
            String pathh = session.getServletContext().getRealPath("/images/")+"test.jpg";
//            System.out.println(path);
            String basepath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
            String name = request.getParameter("name");
        %>
        <tr>
            <td><div id="displaydate"></div></td>
        </tr>
        <tr>
            <td><div id="displaytime"></div></td>
        </tr>
        <tr>
            <td><hr width=330 color=#F6F6F6></td>
        </tr>
        <tr>
            <td><span style="font-weight: 800; font-size: 20px;"><%=name%></span>&nbsp&nbsp&nbsp&nbsp
                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                <a href="HealthCode.jsp" style="font-weight: 200; font-size: 13px;">修改</a></td>
        </tr>
        <tr>
            <td>
                <input style="width:300px;height:300px"type="image"src="images/test.jpg"/>
            </td>
        </tr>
        <tr>
            <td>
                <p>请在接受检查时主动出示工大健康码，<br>
                    配合管理员的工作，做好自身防护工作，<br>
                    你的健康码状态将根据你的申报动态刷新
                </p>
            </td>
        </tr>
    </table>

</body>
</html>
