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
                    <a class="plr10 c4" href="<%=path%>/JSP/allAdministrators2.jsp">首页</a>>>课程信息管理</span>
                </div>
            </div>
            <div class="pos-box bgw mtb15">
                <div class="position f14 c9 pull-left">
                    <form target="hid" style="position:fixed; left: 700px" action="<%=path%>/queryCourseServlet">
                        <input type="text" name="school_id" class="ser-text pull-left" placeholder="课程编号" />
                        <input type="submit" class="ser-sub pull-left" value="">
                    </form>

                </div>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-12 pull-left pd0">
                <div class="p17">
                    <div class="bgw" style="height:491px">
                        <div class="title c6 f16 plr15">课程信息</div><br>
                        <div class="row-fluid">
                            <div class="span12">
                                <h3 class="text-center">
                                    课程信息新增
                                </h3>
                                <div class="accordion" id="accordion-794631">
                                    <div class="accordion-group">
                                        <div class="accordion-heading" style="border: 1px #444444 solid">
                                            <a class="accordion-toggle collapsed" data-parent="#accordion-794631" data-toggle="collapse" href="#accordion-element-66275" style="text-decoration: none">单条导入&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
                                        </div>
                                        <div class="accordion-body collapse" id="accordion-element-66275">
                                            <div class="accordion-inner">
                                                <form action="<%=path%>/addCourseServlet">
                                                    <table>
                                                        <tr>
                                                            <td>课程编号：</td><td><input type="text" name="cno"></td>
                                                        </tr>
                                                        <tr>
                                                            <td>教师编号：</td><td><input type="text" name="tno"></td>
                                                        </tr>
                                                        <tr>
                                                            <td>学院编号：</td><td><input type="text" name="collegeno"></td>
                                                        </tr>
                                                        <tr>
                                                            <td>课程名称：</td><td><input type="text" name="cname"></td>
                                                        </tr>
                                                        <tr>
                                                            <td>开课学期：</td><td><input type="text" name="cterm"></td>
                                                        </tr>
                                                        <tr>
                                                            <td>课时：</td><td><input type="text" name="ctime"></td>
                                                        </tr>
                                                        <tr>
                                                            <td>考查方式：</td><td><input type="text" name="cway"></td>
                                                        </tr>
                                                        <tr>
                                                            <td>学分：</td><td><input type="text" name="ccredit"></td>
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
                                </div>
                            </div>
                            <a href="<%=path%>/JSP/allAdministrators2.jsp">返回主界面</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="footer bgw">版权所有 © 浙江工业大学 | 信息化办公室维护 | 网络管理 www@zjut.edu.cn</div>
</div>

</body>
</html>
