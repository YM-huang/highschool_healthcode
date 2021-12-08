<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%String path = request.getContextPath();%>
<%
    Date d1 = new Date();
    SimpleDateFormat dfd = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");
    String date = dfd.format(d1);
    Double studenta = (Double) request.getAttribute("studentAttendence");
    Double teachera = (Double) request.getAttribute("teacherAttendence");
    studenta *=100;
    teachera*=100;
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>师生信息总览</title>
</head>
<body>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="referer" content="never" />
    <meta name="renderer" content="webkit">
    <title>学生管理界面</title>
    <link rel="shortcut icon" href="<%=path%>/static/image/favicon.ico" type="image/x-icon" />
    <link href="<%=path%>/static/bootstrap-3.3.5/css/bootstrap.min.css" rel="stylesheet" />
    <link href="<%=path%>/static/css/site.css" rel="stylesheet" />
    <link href="<%=path%>/static/codemirror/lib/codemirror.css" rel="stylesheet" />
    <script src="https://cdn.bootcss.com/echarts/4.2.1-rc1/echarts.min.js"></script>

    <style>
        .top-tips {
            height: 50px;
            width: 100%;
            color: red;
            position: fixed;
            top: 0;
            z-index: 999;
            background-color: white;
            text-align: center;
            line-height: 50px;
            font-size: 20px;
            border-bottom: 1px solid #f0f0f0;
            font-weight: bold;
            display: none;
        }
        .contextmenu {
            position: absolute;
            width: 120px;
            background: #FFFFFF;
            border-radius: 5px;
            overflow: hidden;
            z-index: 99999999;
        }
        .contextmenu li {
            border-left: 3px solid transparent;
            transition: ease 0.3s;
        }
        .contextmenu li:hover {
            background: #707070;
            border-left: 3px solid #333;
        }
        .contextmenu li a {
            display: block;
            padding: 5px 10px;
            color: #000000;
            text-decoration: none;
            transition: ease 0.3s;
            cursor:default;
        }
        .contextmenu li:hover a {
            color: #fff;
        }
    </style>
</head>
<%@page import="com.dao.HealthCodeDao" %>
<%@page import="com.model.Student" %>
<%@page import="com.model.Teacher" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%

    HealthCodeDao dao = new HealthCodeDao();

    Double unfinishedTeacher = dao.teacherDailyAttendence();
    Double unfinishedStudent = dao.studentDailyAttendence();
    request.setAttribute("teacherAttendence",unfinishedTeacher);
    request.setAttribute("studentAttendence",unfinishedStudent);
//    ArrayList<Teacher> teacher = dao.findUnfinishedTeacher();
//    ArrayList<Student> student = dao.findUnfinishedStudent();

//    request.setAttribute("teacher",teacher);
//    request.setAttribute("student",student);
    int stunum = dao.studentnumber();
    int teanum = dao.teachernumber();
%>


<%
    //饼图数据
    ArrayList<Integer> stuTea = dao.allstatistics();
    Integer fs=stuTea.get(0);
    Integer ufs=stuTea.get(1);
    Integer ft=stuTea.get(2);
    Integer uft=stuTea.get(3);
%>
<script language="JavaScript">
    var fs1="<%=fs%>"
    var ufs1="<%=ufs%>"
    var ft1="<%=ft%>"
    var uft1="<%=uft%>"
</script>
<body>
<div class="bt-warp bge6">
    <div id="container" class="container-fluid">
        <div class="sidebar-scroll">
            <div class="sidebar-auto">
                <h3 class="mypcip"><span class="f14 cw">系统管理员</span></h3>
                <ul class="menu">

                    <li id="memuA"> <a class="menu_home" href="<%=path%>/allAdministrators2.jsp">首页</a></li>



                    <li id="memuAsite"> <a class="menu_web" href="<%=path%>/StudentInfoManage2.jsp">学生信息管理</a></li>


                    <li id="memuBsite"> <a class="menu_web" href="<%=path%>/TeacherInfoManage2.jsp">老师信息管理</a></li>


                    <li id="memuCsite"> <a class="menu_web" href="<%=path%>/dataStatisticsServlet">师生信息总览</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="main-content">
        <div class="container-fluid" style="padding-bottom: 66px;">
            <div class="pos-box bgw mtb15">
                <div class="position f14 c9 pull-left">
                    <a class="plr10 c4" href="<%=path%>/allAdministrators2.jsp">首页</a>>>师生信息总览</span>
                </div>
            </div>
            <div class="pos-box bgw mtb15">
                <div class="title c6 f16 plr15" style="height: 300px;">

                    <h6>截至<%=date%> 学生打卡率：<%=studenta%>% &nbsp;&nbsp;&nbsp;教师打卡率：<%=teachera%>%</h6>

                </div>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-12 pull-left pd0">
                <div class="p17">
                    <div class="bgw" style="height:491px">
                        <h3>教师未打卡情况</h3>
                        <table class="table table-bordered table-condensed" contenteditable="false">
                            <thead>
                            <tr>
                                <th>姓名</th>
                                <th>身份证号</th>
                                <th>学号</th>
                                <th>学院</th>
                                <th>职务</th>
                                <th>打卡情况</th>
                                <th>健康码</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="school_info" items="${requestScope.teacher}"
                                       varStatus="status">
                                <c:if test="${status.count%2==0}">
                                    <tr style="background: #eeeeff">
                                </c:if>
                                <c:if test="${status.count%2!=0}">
                                    <tr style="background: #dedeff">
                                </c:if>
                                <td>${school_info.name}</td>
                                <td>${school_info.id}</td>
                                <td>${school_info.school_id}</td>
                                <td>${school_info.college}</td>
                                <td>${school_info.role}</td>
                                <td>${school_info.attendenceRecord}</td>
                                <td>${school_info.healthcode}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <h3>学生未打卡情况</h3>
                        <table class="table">
                            <thead>
                            <tr>
                                <th>姓名</th>
                                <th>身份证号</th>
                                <th>学号</th>
                                <th>学院</th>
                                <th>专业</th>
                                <th>班级</th>
                                <th>打卡情况</th>
                                <th>健康码</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="school_info" items="${requestScope.student}"
                                       varStatus="status">
                                <c:if test="${status.count%2==0}">
                                    <tr style="background: #eeeeff">
                                </c:if>
                                <c:if test="${status.count%2!=0}">
                                    <tr style="background: #dedeff">
                                </c:if>
                                <td>${school_info.name}</td>
                                <td>${school_info.id}</td>
                                <td>${school_info.school_id}</td>
                                <td>${school_info.college}</td>
                                <td>${school_info.major}</td>
                                <td>${school_info.class1}</td>
                                <td>${school_info.attendenceRecord}</td>
                                <td>${school_info.healthcode}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="footer bgw">版权所有 © 浙江工业大学 | 信息化办公室维护 | 网络管理 www@zjut.edu.cn</div>
</div>

</body>
</body>
</html>
