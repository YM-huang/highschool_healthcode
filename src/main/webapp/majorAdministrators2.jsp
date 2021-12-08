<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%String path = request.getContextPath();%>
<%String college= (String) request.getAttribute("college");%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<%@page import="com.dao.HealthCodeDao" %>
<%@page import="com.model.Student" %>
<%@page import="com.model.Teacher" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%

    HealthCodeDao dao = new HealthCodeDao();

    Double unfinishedTeacher = dao.teacherDailyAttendence();
    Double unfinishedStudent = dao.studentDailyAttendence();
    request.setAttribute("teacherAttendence",unfinishedTeacher);
    request.setAttribute("studentAttendence",unfinishedStudent);
    ArrayList<Teacher> teacher = dao.findUnfinishedTeacher();
    ArrayList<Student> student = dao.findUnfinishedStudent();

    request.setAttribute("teacher",teacher);
    request.setAttribute("student",student);
    int stunum = dao.studentnumber();
    int teanum = dao.teachernumber();
%>
<%
    Date d1 = new Date();
    SimpleDateFormat dfd = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");
    String date = dfd.format(d1);

%>

<%
    //饼图数据
    ArrayList<Integer> stuTea = dao.majorstatistics(college);
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
                <h3 class="mypcip"><span class="f14 cw">院级管理员</span></h3>
                <ul class="menu">


                    <li id="memuA"> <a class="menu_home" href="<%=path%>/majordataStatisticServlet?college=<%=college%>">院内打卡情况</a></li>


                </ul>
            </div>
        </div>
    </div>
    <div class="main-content">
        <div class="container-fluid" style="padding-bottom: 66px;">
            <div class="pos-box bgw mtb15">
                <div class="position f14 c9 pull-left">
                    <a class="plr10 c4" href="<%=path%>/majorAdministrators2.jsp">首页</a></span>
                </div>
            </div>
            <div class="server bgw mtb15">
                <div class="title c6 f16 plr15">
                    <h3 class="c6 f16pull-left"><%=college%> 学院师生打卡请况汇总</h3>
                </div>
                <h6>&nbsp&nbsp截至<%=date%></h6><br>
                <%--饼图--%>
                <div id="main" style="width: 700px;height:300px;margin:0 auto;text-align:center;"></div>
                <script type="text/javascript">
                    //饼状图的方法
                    //对应放图片的Id（imageId）
                    //typeArr:对应名称的数组
                    //dataArr:对应名称数组的对应数据的数组
                    var dataArr = [fs1,ufs1,ft1,uft1];
                    var typeArr = new Array("打卡学生","未打卡学生","打卡教师","未打卡教师");
                    var ListFirstArr = new Array();
                    for (var i = 0; i < typeArr.length; i++) {
                        var item = {
                            value: dataArr[i],
                            name: typeArr[i]
                        };
                        ListFirstArr.push(item);
                    }
                    // 基于准备好的dom，初始化echarts图表
                    var myChart = echarts.init(document.getElementById('main'));
                    option = {
                        title: {
                            text: '',
                            subtext: '',
                            x: 'center'
                        },
                        tooltip: {
                            trigger: 'item',
                            formatter: "{a} <br/>{b} : {c} ({d}%)"
                        },
                        legend: {
                            orient: 'vertical',
                            left: 'left',
                            data: typeArr
                        },
                        series: [
                            {
                                name: '今日数据',
                                type: 'pie',
                                radius: '55%',
                                center: ['50%', '60%'],
                                data: ListFirstArr,
                                itemStyle: {
                                    emphasis: {
                                        shadowBlur: 10,
                                        shadowOffsetX: 0,
                                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                                    }
                                }
                            }
                        ]
                    };
                    myChart.setOption(option);
                </script>
                <%--统计未打卡情况表--%>
            </div>
            <div class="server bgw mtb15">
                <div class="title c6 f16 plr15">
                    <h3 class="c6 f16pull-left">今日教师未打卡情况</h3>
                </div>
                <%--                <h4>&nbsp&nbsp&nbsp&nbsp教师打卡率：<%=request.getAttribute("teacherAttendence")%></h4>--%>
                <p >&nbsp&nbsp&nbsp&nbsp教师打卡率：<%=1.0*ft/(ft+uft)*100+"%"%></p>
                <table class="table ">
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
            </div>
            <div class="server bgw mtb15">
                <div class="title c6 f16 plr15">
                    <h3 class="c6 f16pull-left">今日学生未打卡情况</h3>
                </div>
                <%--                <h4>&nbsp&nbsp&nbsp&nbsp学生打卡率：<%=request.getAttribute("studentAttendence")%></h4>--%>
                <p >&nbsp&nbsp&nbsp&nbsp学生打卡率：<%=1.0*fs/(fs+ufs)*100+"%"%></p>
                <p></p>
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
</body>
</html>