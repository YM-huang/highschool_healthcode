<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%String path = request.getContextPath();%>
<html>
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
<%@page import="com.dao.SchoolDao" %>
<%@page import="com.model.Student" %>
<%@page import="com.model.Teacher" %>
<%@ page import="java.util.ArrayList" %>



<body>
<div class="bt-warp bge6">
    <div id="container" class="container-fluid">
        <div class="sidebar-scroll">
            <div class="sidebar-auto">
                <h3 class="mypcip"><span class="f14 cw">系统管理员</span></h3>
                <ul class="menu">

                    <li id="memuA"> <a class="menu_home" href="<%=path%>/JSP/allAdministrators2.jsp">首页</a></li>

                    <li id="memuAsite"> <a class="menu_web" href="<%=path%>/queryAllStudentServlet">学生信息管理</a></li>

                    <li id="memuBsite"> <a class="menu_web" href="<%=path%>/queryAllTeacherServlet">老师信息管理</a></li>

                    <li id="memuEsite"> <a class="menu_web" href="<%=path%>/queryAllCourseServlet">课程管理</a></li>

                    <li id="memuFsite"> <a class="menu_web" href="<%=path%>/JSP/BanjiCourseInfoCheck.jsp">班级课表查询</a></li>

                    <li id="memuDsite"> <a class="menu_web" href="<%=path%>/StudentShomeCountServlet">学生地区管理</a></li>

                    <li id="memuJsite"> <a class="menu_web" href="<%=path%>/queryStudentGradeServlet">学生成绩管理</a></li>

                    <li id="memuGsite"> <a class="menu_web" href="<%=path%>/QueryCollegeServlet">学院信息管理</a></li>

                    <li id="memuHsite"> <a class="menu_web" href="<%=path%>/QueryMajorCountServlet">专业信息管理</a></li>

                    <li id="memuIsite"> <a class="menu_web" href="<%=path%>/QueryClassServlet">班级信息管理</a></li>

                    <li id="memuCsite"> <a class="menu_web" href="<%=path%>/JSP/ModifyAdminpass.jsp">密码修改</a></li>

                </ul>
            </div>
        </div>
    </div>
    <div class="main-content">
        <div class="container-fluid" style="padding-bottom: 66px;">
            <div class="pos-box bgw mtb15">
                <div class="position f14 c9 pull-left">
                    <a class="plr10 c4" href="<%=path%>/JSP/allAdministrators2.jsp">首页</a>>>班级课程信息管理</span>
                </div>
            </div>
            <div class="pos-box bgw mtb15">
                <div class="position f14 c9 pull-left">
                    <form target="hid" style="position:fixed; left: 700px" action="<%=path%>/queryBanjiCourseServlet">
                        <input type="text" name="school_id" class="ser-text pull-left" placeholder="班级编号" />
                        <input type="submit" class="ser-sub pull-left" value="">
                    </form>

                </div>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-12 pull-left pd0">
                <div class="p17">
                    <div class="bgw" style="height:491px" >
                        <div class="title c6 f16 plr15">班级课程信息</div><br>
                        <div style="overflow:auto">
                            <table class="table table-bordered table-condensed" contenteditable="false">
                                <thead>
                                <tr>
                                    <th>班级编号</th>
                                    <th>班级名称</th>
                                    <th>课程编号</th>
                                    <th>课程名称</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="i" items="${requestScope.banjiCourse}"
                                           varStatus="status">
                                    <c:if test="${status.count%2==0}">
                                        <tr style="background: #eeeeff">
                                    </c:if>
                                    <c:if test="${status.count%2!=0}">
                                        <tr style="background: #dedeff">
                                    </c:if>
                                    <td>${i.bno}</td>
                                    <td>${i.bname}</td>
                                    <td>${i.cno}</td>
                                    <td>${i.cname}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>

</body>

</html>
