<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.dao.SchoolDao" %>
<%@page import="com.model.Student" %>
<%@page import="com.model.Teacher" %>
<%@ page import="java.util.ArrayList" %>
<%String path = request.getContextPath();%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    SchoolDao dao = new SchoolDao();
    int teaSum = dao.TeacherSum();
    int stuSum = dao.studentSum();

%>
<%
    String school_id = request.getParameter("school_id");
    String pass = request.getParameter("pass");
%>
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
                    <a class="plr10 c4" href="<%=path%>/JSP/allAdministrators2.jsp">首页</a></span>
                </div>
            </div>
            <div class="danger-tips">
                <div class="important-title" id="messageError" style="display: none; margin-top:15px"></div>
            </div>
            <div class="server bgw mtb15">
                <div class="title c6 f16 plr15">
                    <h3 class="c6 f16 pull-left">校历</h3>
                    <div class="col-md-12">

                        <div class="index_rctx" id="area_five">


                            <style type="text/css">
                                .index_rctx .list-group-item .time {
                                    float: right;
                                    margin-left: 10px;
                                    color: #858585;
                                    font: normal 12px/39px SimSun;
                                }
                            </style>

                            <style type="text/css">
                                .nextDay{background-color:#f0ad4e !important;color: #FFFFFF;}
                                td{text-align: center;}
                            </style>

                            <div class="table-responsive">
                                <table class="table table-bordered tab-bor-col-1 tab-td-padding-2 tab-td-font-12 tab-td-center">
                                    <input type="hidden" name="rcStr" value="" id="rcStr">
                                    <thead>
                                    <tr class="tab-th-1">
                                        <th rowspan="3" class="xl_jb">&nbsp;</th>

                                        <th colspan="21" style="text-align: center">2020-2021学年2学期(2021-03-02至2021-07-05)</th>


                                    </tr>
                                    <tr class="tab-th-1">

                                        <th colspan="5" style="text-align: center">3月</th>

                                        <th colspan="5" style="text-align: center">4月</th>

                                        <th colspan="5" style="text-align: center">5月</th>

                                        <th colspan="5" style="text-align: center">6月</th>

                                        <th colspan="1" style="text-align: center">7月</th>

                                    </tr>
                                    <tr class="tab-th-2">

                                        <th style="text-align: center">1</th>

                                        <th style="text-align: center">2</th>

                                        <th style="text-align: center">3</th>

                                        <th style="text-align: center">4</th>

                                        <th style="text-align: center">5</th>

                                        <th style="text-align: center">5</th>

                                        <th style="text-align: center">6</th>

                                        <th style="text-align: center">7</th>

                                        <th style="text-align: center">8</th>

                                        <th style="text-align: center">9</th>

                                        <th style="text-align: center">9</th>

                                        <th style="text-align: center">10</th>

                                        <th style="text-align: center">11</th>

                                        <th style="text-align: center">12</th>

                                        <th style="text-align: center">13</th>

                                        <th style="text-align: center">14</th>

                                        <th style="text-align: center">15</th>

                                        <th style="text-align: center">16</th>

                                        <th style="text-align: center">17</th>

                                        <th style="text-align: center">18</th>

                                        <th style="text-align: center">18</th>

                                    </tr>
                                    </thead>
                                    <tbody>

                                    <tr>
                                        <th style="">一</th>

                                        <td id="2021-03-02" title="农历：2021年二月初九">2</td>

                                        <td id="2021-03-09" title="农历：2021年二月十六">9</td>

                                        <td id="2021-03-16" title="农历：2021年二月廿三">16</td>

                                        <td id="2021-03-23" title="农历：2021年二月卅十">23</td>

                                        <td id="2021-03-30" title="农历：2021年三月初七">30</td>

                                        <td title=""></td>

                                        <td id="2021-04-06" title="农历：2021年三月十四">6</td>

                                        <td id="2021-04-13" title="农历：2021年三月廿一">13</td>

                                        <td id="2021-04-20" title="农历：2021年三月廿八">20</td>

                                        <td id="2021-04-27" title="农历：2021年四月初五">27</td>

                                        <td title=""></td>

                                        <td id="2021-05-04" title="农历：2021年四月十二">4</td>

                                        <td id="2021-05-11" title="农历：2021年四月十九">11</td>

                                        <td id="2021-05-18" title="农历：2021年四月廿六">18</td>

                                        <td id="2021-05-25" title="农历：2021年闰四月初三">25</td>

                                        <td id="2021-06-01" title="农历：2021年闰四月初十">1</td>

                                        <td id="2021-06-08" title="农历：2021年闰四月十七">8</td>

                                        <td id="2021-06-15" title="农历：2021年闰四月廿四">15</td>

                                        <td id="2021-06-22" title="农历：2021年五月初二">22</td>

                                        <td id="2021-06-29" title="农历：2021年五月初九">29</td>

                                        <td title=""></td>

                                    </tr>
                                    <tr><th style="">二</th>

                                        <td id="2021-03-03" title="农历：2021年二月初十">3</td>

                                        <td id="2021-03-10" title="农历：2021年二月十七">10</td>

                                        <td id="2021-03-17" title="农历：2021年二月廿四">17</td>

                                        <td id="2021-03-24" title="农历：2021年三月初一">24</td>

                                        <td id="2021-03-31" title="农历：2021年三月初八">31</td>
                                        <td title=""></td>

                                        <td id="2021-04-07" title="农历：2021年三月十五">7</td>

                                        <td id="2021-04-14" title="农历：2021年三月廿二">14</td>

                                        <td id="2021-04-21" title="农历：2021年三月廿九">21</td>

                                        <td id="2021-04-28" title="农历：2021年四月初六">28</td>

                                        <td title=""></td>

                                        <td id="2021-05-05" title="农历：2021年四月十三">5</td>

                                        <td id="2021-05-12" title="农历：2021年四月廿十">12</td>

                                        <td id="2021-05-19" title="农历：2021年四月廿七">19</td>

                                        <td id="2021-05-26" title="农历：2021年闰四月初四">26</td>

                                        <td id="2021-06-02" title="农历：2021年闰四月十一">2</td>

                                        <td id="2021-06-09" title="农历：2021年闰四月十八">9</td>

                                        <td id="2021-06-16" title="农历：2021年闰四月廿五">16</td>

                                        <td id="2021-06-23" title="农历：2021年五月初三">23</td>

                                        <td id="2021-06-30" title="农历：2021年五月初十">30</td>

                                        <td title=""></td>

                                    </tr>
                                    <tr>
                                        <th style="">三</th>

                                        <td id="2021-03-04" title="农历：2021年二月十一">4</td>

                                        <td id="2021-03-11" title="农历：2021年二月十八">11</td>

                                        <td id="2021-03-18" title="农历：2021年二月廿五">18</td>

                                        <td id="2021-03-25" title="农历：2021年三月初二">25</td>

                                        <td title=""></td>

                                        <td id="2021-04-01" title="农历：2021年三月初九">1</td>

                                        <td id="2021-04-08" title="农历：2021年三月十六">8</td>

                                        <td id="2021-04-15" title="农历：2021年三月廿三">15</td>

                                        <td id="2021-04-22" title="农历：2021年三月卅十">22</td>

                                        <td id="2021-04-29" title="农历：2021年四月初七">29</td>

                                        <td title=""></td>

                                        <td id="2021-05-06" title="农历：2021年四月十四">6</td>

                                        <td id="2021-05-13" title="农历：2021年四月廿一">13</td>

                                        <td id="2021-05-20" title="农历：2021年四月廿八">20</td>

                                        <td id="2021-05-27" title="农历：2021年闰四月初五">27</td>

                                        <td id="2021-06-03" title="农历：2021年闰四月十二">3</td>

                                        <td id="2021-06-10" title="农历：2021年闰四月十九">10</td>

                                        <td id="2021-06-17" title="农历：2021年闰四月廿六">17</td>

                                        <td id="2021-06-24" title="农历：2021年五月初四">24</td>

                                        <td title=""></td>

                                        <td id="2021-07-01" title="农历：2021年五月十一">1</td>

                                    </tr>
                                    <tr>
                                        <th style="">四</th>

                                        <td id="2021-03-05" title="农历：2021年二月十二">5</td>

                                        <td id="2021-03-12" title="农历：2021年二月十九">12</td>

                                        <td id="2021-03-19" title="农历：2021年二月廿六">19</td>

                                        <td id="2021-03-26" title="农历：2021年三月初三">26</td>

                                        <td title=""></td>

                                        <td id="2021-04-02" title="农历：2021年三月初十">2</td>

                                        <td id="2021-04-09" title="农历：2021年三月十七">9</td>

                                        <td id="2021-04-16" title="农历：2021年三月廿四">16</td>

                                        <td id="2021-04-23" title="农历：2021年四月初一">23</td>

                                        <td id="2021-04-30" title="农历：2021年四月初八">30</td>

                                        <td id="" title=""></td>

                                        <td id="2021-05-07" title="农历：2021年四月十五">7</td>

                                        <td id="2021-05-14" title="农历：2021年四月廿二">14</td>

                                        <td id="2021-05-21" title="农历：2021年四月廿九">21</td>

                                        <td id="2021-05-28" title="农历：2021年闰四月初六">28</td>

                                        <td id="2021-06-04" title="农历：2021年闰四月十三">4</td>

                                        <td id="2021-06-11" title="农历：2021年闰四月廿十">11</td>

                                        <td id="2021-06-18" title="农历：2021年闰四月廿七">18</td>

                                        <td id="2021-06-25" title="农历：2021年五月初五">25</td>

                                        <td title=""></td>

                                        <td id="2021-07-02" title="农历：2021年五月十二">2</td>

                                    </tr>
                                    <tr>
                                        <th style="">五</th>

                                        <td id="2021-03-06" title="农历：2021年二月十三">6</td>

                                        <td id="2021-03-13" title="农历：2021年二月廿十">13</td>

                                        <td id="2021-03-20" title="农历：2021年二月廿七">20</td>

                                        <td id="2021-03-27" title="农历：2021年三月初四">27</td>

                                        <td title=""></td>

                                        <td id="2021-04-03" title="农历：2021年三月十一">3</td>

                                        <td id="2021-04-10" title="农历：2021年三月十八">10</td>

                                        <td id="2021-04-17" title="农历：2021年三月廿五">17</td>

                                        <td id="2021-04-24" title="农历：2021年四月初二">24</td>

                                        <td title=""></td>

                                        <td id="2021-05-01" title="农历：2021年四月初九">1</td>

                                        <td id="2021-05-08" title="农历：2021年四月十六">8</td>

                                        <td id="2021-05-15" title="农历：2021年四月廿三">15</td>

                                        <td id="2021-05-22" title="农历：2021年四月卅十">22</td>

                                        <td id="2021-05-29" title="农历：2021年闰四月初七">29</td>

                                        <td id="2021-06-05" title="农历：2021年闰四月十四">5</td>

                                        <td id="2021-06-12" title="农历：2021年闰四月廿一">12</td>

                                        <td id="2021-06-19" title="农历：2021年闰四月廿八">19</td>

                                        <td id="2021-06-26" title="农历：2021年五月初六">26</td>

                                        <td title=""></td>

                                        <td id="2021-07-03" title="农历：2021年五月十三">3</td>

                                    </tr>
                                    <tr class="tab-col-2">
                                        <th style="">六</th>

                                        <td id="2021-03-07" title="农历：2021年二月十四">7</td>

                                        <td id="2021-03-14" title="农历：2021年二月廿一">14</td>

                                        <td id="2021-03-21" title="农历：2021年二月廿八">21</td>

                                        <td id="2021-03-28" title="农历：2021年三月初五">28</td>

                                        <td title=""></td>

                                        <td id="2021-04-04" title="农历：2021年三月十二">4</td>

                                        <td id="2021-04-11" title="农历：2021年三月十九">11</td>

                                        <td id="2021-04-18" title="农历：2021年三月廿六">18</td>

                                        <td id="2021-04-25" title="农历：2021年四月初三">25</td>

                                        <td title=""></td>

                                        <td id="2021-05-02" title="农历：2021年四月初十">2</td>

                                        <td id="2021-05-09" title="农历：2021年四月十七">9</td>

                                        <td id="2021-05-16" title="农历：2021年四月廿四">16</td>

                                        <td id="2021-05-23" title="农历：2021年闰四月初一">23</td>

                                        <td id="2021-05-30" title="农历：2021年闰四月初八">30</td>

                                        <td id="2021-06-06" title="农历：2021年闰四月十五">6</td>

                                        <td id="2021-06-13" title="农历：2021年闰四月廿二">13</td>

                                        <td id="2021-06-20" title="农历：2021年闰四月廿九">20</td>

                                        <td id="2021-06-27" title="农历：2021年五月初七">27</td>

                                        <td title=""></td>

                                        <td id="2021-07-04" title="农历：2021年五月十四">4</td>

                                    </tr>

                                    <tr class="tab-col-2">
                                        <th style="">日</th>

                                        <td id="2021-03-08" title="农历：2021年二月十五">8</td>

                                        <td id="2021-03-15" title="农历：2021年二月廿二">15</td>

                                        <td id="2021-03-22" title="农历：2021年二月廿九">22</td>

                                        <td id="2021-03-29" title="农历：2021年三月初六">29</td>

                                        <td title=""></td>

                                        <td id="2021-04-05" title="农历：2021年三月十三">5</td>

                                        <td id="2021-04-12" title="农历：2021年三月廿十">12</td>

                                        <td id="2021-04-19" title="农历：2021年三月廿七">19</td>

                                        <td id="2021-04-26" title="农历：2021年四月初四">26</td>

                                        <td title=""></td>

                                        <td id="2021-05-03" title="农历：2021年四月十一">3</td>

                                        <td id="2021-05-10" title="农历：2021年四月十八">10</td>

                                        <td id="2021-05-17" title="农历：2021年四月廿五">17</td>

                                        <td id="2021-05-24" title="农历：2021年闰四月初二">24</td>

                                        <td id="2021-05-31" title="农历：2021年闰四月初九">31</td>

                                        <td id="2021-06-07" title="农历：2021年闰四月十六">7</td>

                                        <td id="2021-06-14" title="农历：2021年闰四月廿三">14</td>

                                        <td id="2021-06-21" title="农历：2021年五月初一">21</td>

                                        <td id="2021-06-28" title="农历：2021年五月初八">28</td>

                                        <td title=""></td>

                                        <td id="2021-07-05" title="农历：2021年五月十五">5</td>

                                    </tr>

                                    </tbody>
                                </table>
                            </div>

                            <script type="text/javascript">


                                function cshRc(){
                                    if (!$("#rcStr").founded()) {
                                        return;
                                    }
                                    var rcStr = $("#rcStr").val();
                                    var rcObj = rcStr.split("!two!");

                                    for(var i=0;i<rcObj.length;i++){
                                        if(rcObj[i]!=null && rcObj[i]!=""){
                                            var obj = rcObj[i].split("!one!");
                                            var rc_id = obj[0];
                                            var rcmc = obj[1];
                                            var qsrq = obj[2];
                                            var jsrq = obj[3];

                                            if(qsrq!="" && jsrq!=""){
                                                showRc(qsrq,jsrq);
                                            }
                                        }
                                    }
                                }

                                //在表中显示日程
                                function showRc(kssj,jssj){
                                    var countDate = new Date(jssj).differDays(new Date(kssj));
                                    for(var i=0;i<parseInt(countDate)+1;i++){
                                        var nextDate = new Date(kssj).addDays(i).toShortDateString();
                                        $("#"+nextDate).addClass('nextDay');
                                    }
                                }
                                //在表中隐藏日程
                                function hideRc(obj,kssj,jssj){
                                    var countDate = new Date(jssj).differDays(new Date(kssj));
                                    for(var i=0;i<parseInt(countDate)+1;i++){
                                        var nextDate = new Date(kssj).addDays(i).toShortDateString();
                                        if($(obj).prop("checked")){
                                            $("#"+nextDate).removeClass('nextDay');
                                        }else{
                                            $("#"+nextDate).addClass('nextDay');
                                        }
                                    }
                                }

                                cshRc();

                            </script>


                        </div>


                    </div>
                </div>
                <div class="server-circle">

                    <%--                    图表 fs1,ufs1,ft1,uft1为数据--%>
                    <div id="main" style="width: 900px;height:400px;margin:0 auto;text-align:center;"></div>
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
                </div>
            </div>
            <div class="system-info bgw clearfix mtb15">
                <div class="title c6 f16 plr15">人员管理</div>
                <div class="system-info-con mtb20">
                    <ul class="clearfix text-center">
                        <li class="sys-li-box col-xs-3 col-sm-3 col-md-3 col-lg-3">
                            <p class="name f15 c9">教职人员</p>
                            <div class="val"><a class="btlink" href="<%=path%>/queryAllTeacherServlet"><%=teaSum%></a></div>
                        </li>
                        <li class="sys-li-box col-xs-3 col-sm-3 col-md-3 col-lg-3">
                            <p class="name f15 c9">学生</p>
                            <div class="val"><a class="btlink" href="<%=path%>/queryAllStudentServlet"><%=stuSum%></a></div>
                        </li>
                    </ul>
                </div>
            </div>


        </div>
    </div>
    <div class="footer bgw">版权所有 © 浙江工业大学 | 信息化办公室维护 | 网络管理 www@zjut.edu.cn</div>
</div>

</body>
</html>