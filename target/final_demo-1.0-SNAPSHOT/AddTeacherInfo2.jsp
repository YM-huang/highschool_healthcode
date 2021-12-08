<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%String path = request.getContextPath();%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生信息管理</title>
</head>
<body>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="referer" content="never" />
    <meta name="renderer" content="webkit">
    <title>教师管理界面</title>
    <link rel="shortcut icon" href="<%=path%>/static/image/favicon.ico" type="image/x-icon" />
    <link href="<%=path%>/static/bootstrap-3.3.5/css/bootstrap.min.css" rel="stylesheet" />
    <link href="<%=path%>/static/css/site.css" rel="stylesheet" />
    <link href="<%=path%>/static/codemirror/lib/codemirror.css" rel="stylesheet" />
    <script src="https://cdn.bootcss.com/echarts/4.2.1-rc1/echarts.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

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
                    <a class="plr10 c4" href="<%=path%>/allAdministrators2.jsp">首页</a>>>教师信息管理</span>
                </div>
            </div>
            <div class="pos-box bgw mtb15">
                <div class="position f14 c9 pull-left">
                    <form target="hid" style="position:fixed; left: 1200px" action="<%=path%>/TeacherQueryServlet">
                        <input type="text" name="college" class="ser-text pull-left" placeholder="学院" />
                        <input type="submit" class="ser-sub pull-left" value="">
                    </form>

                </div>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-12 pull-left pd0">
                <div class="p17">
                    <div class="bgw" style="height:491px">
                        <div class="title c6 f16 plr15">教师信息</div><br>
                        <div class="container-fluid">
                            <div class="row-fluid">
                                <div class="span12">
                                    <h3 class="text-center">
                                        教师信息新增
                                    </h3>
                                    <div class="accordion" id="accordion-794631">
                                        <div class="accordion-group">
                                            <div class="accordion-heading" style="border: 1px #444444 solid">
                                                <a class="accordion-toggle collapsed" data-parent="#accordion-794631" data-toggle="collapse" href="#accordion-element-66275" style="text-decoration: none">单条导入&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
                                            </div>
                                            <div class="accordion-body collapse" id="accordion-element-66275">
                                                <div class="accordion-inner">
                                                    <form action="../addTeacherServlet">
                                                        <table>
                                                            <tr>
                                                                <td>姓名：</td><td><input type="text" name="name"></td>
                                                            </tr>
                                                            <tr>
                                                                <td>身份证号：</td><td><input type="text" name="id"></td>
                                                            </tr>
                                                            <tr>
                                                                <td>学号：</td><td><input type="text" name="school_id"></td>
                                                            </tr>
                                                            <tr>
                                                                <td>学院：</td><td><input type="text" name="college"></td>
                                                            </tr>
                                                            <tr>
                                                                <td>职务：</td><td><input type="text" name="role"></td>
                                                            </tr>
                                                            <tr>
                                                                <td>密码：</td><td><input type="password" name="password"></td>
                                                            </tr>
                                                            <tr>
                                                                <td><input type="submit" value="提交"></td>
                                                                <td><input type="reset" value="重置"></td>
                                                            </tr>
                                                        </table>
                                                    </form>
                                                </div>
                                            </div>
                                        </div><br>
                                        <div class="accordion-group">
                                            <div class="accordion-heading" style="border: 1px #444444 solid">
                                                <a class="accordion-toggle collapsed" data-parent="#accordion-794631" data-toggle="collapse" href="#accordion-element-534405" style="text-decoration: none">多条导入&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
                                            </div>
                                            <div class="accordion-body collapse" id="accordion-element-534405">
                                                <div class="accordion-inner">
                                                    <form action="../addMoreTeacherServlet">
                                                        <p>请按name,id,school_id,college,role,password;格式依次输入，<br>逗号为间隔，分号为一条记录的结尾</p>
                                                        <textarea rows="6" style="width: 435px;height: 120px;text-align: left;" name="added"></textarea><br>
                                                        <input type="submit" value="批量导入">
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <a href="<%=path%>/allAdministrators2.jsp">返回主界面</a>
                            </div>
                        </div>
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
