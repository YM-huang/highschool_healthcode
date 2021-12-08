<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.dao.HealthCodeDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.model.Student" %>
<%@ page import="com.model.Teacher" %>
<%@ page import="com.model.school_info" %>
<%String path = request.getContextPath();%>
<%
    Date d1 = new Date();
    SimpleDateFormat dfd = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");
    String date = dfd.format(d1);
%>
<%

    HealthCodeDao dao = new HealthCodeDao();
    ArrayList<Teacher> teacher = dao.allTeacherInfo();
    ArrayList<Student> student = dao.allStudentInfo();

    request.setAttribute("teacher",teacher);
    request.setAttribute("student",student);
    int stunum = dao.studentnumber();
    int teanum = dao.teachernumber();
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="referer" content="never" />
    <meta name="renderer" content="webkit">
    <title>学生管理</title>
    <link rel="shortcut icon" href="<%=path%>/static/image/favicon.ico" type="image/x-icon" />
    <link href="<%=path%>/static/bootstrap-3.3.5/css/bootstrap.min.css" rel="stylesheet" />
    <link href="<%=path%>/static/css/site.css" rel="stylesheet" />
    <link href="<%=path%>/static/codemirror/lib/codemirror.css" rel="stylesheet" />
    <script src="https://cdn.bootcss.com/echarts/4.2.1-rc1/echarts.min.js"></script>
    <!--[if lte IE 9]>
    <script src="<%=path%>/static/js/requestAnimationFrame.js"></script>
    <![endif]-->
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
</head>
<body>
<div class="bt-warp bge6">
    <div id="container" class="container-fluid">
        <div class="sidebar-scroll">
            <div class="sidebar-auto">
                <h3 class="mypcip"><span class="f14 cw">校级管理员</span></h3>
                <ul class="menu">


                    <li id="memuA"> <a class="menu_home" href="<%=path%>/SchoolAdministrators2.jsp">首页</a></li>



                    <li id="memuAsite"> <a class="menu_web" href="<%=path%>/StudentInfoCheckServlet">全校学生信息</a></li>


                    <li id="memuBsite"> <a class="menu_web" href="<%=path%>/TeacherInfoCheckServlet">全校老师信息</a></li>


                    <li id="memuCsite"> <a class="menu_web" href="<%=path%>/schoolInfoServlet">师生信息总览</a></li>

                </ul>
            </div>
        </div>

    </div>

    <div class="main-content pb55">
        <div class="container-fluid">
            <div class="pos-box bgw mtb15">
                <div class="position f14 c9 pull-left">
                    <a class="plr10 c4" href="<%=path%>/SchoolAdministrators2.jsp">首页</a>&gt&gt<span class="plr10 c4">信息总览</span>
                </div>
            </div>
            <div class="safe bgw mtb15 pd15">

                <div class="divtable mtb10">
                <div class="tablescroll">
                    <table id="DataBody" class="table table-hover" width="100%" cellspacing="0" cellpadding="0" border="0" style="border: 0 none;">
                        <thead>
                        <tr>
                            <th>学院</th>
                            <th>专业</th>
                            <th>班级</th>
                            <th>详情</th>

                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="school_info" items="${requestScope.school_infos}"
                                   varStatus="status">
                            <c:if test="${status.count%2==0}">
                                <tr style="background: #eeeeff">
                            </c:if>
                            <c:if test="${status.count%2!=0}">
                                <tr style="background: #dedeff">
                            </c:if>
                            <td>${school_info.college}</td>
                            <td>${school_info.major}</td>
                            <td>${school_info.class1}</td>
                            <td>
                                <button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#${status.count}">详情</button>
                                <div class="modal fade" id="${status.count}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                <h4 class="modal-title" id="myModalLabel" style="text-align: center">学生信息</h4>
                                            </div>
                                            <div class="modal-body">

                                                <table class="table table-condensed" contenteditable="false">
                                                    <tbody>
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
                                                    <c:forEach var="i" items="${student}"
                                                               varStatus="status">
                                                    <c:if test="${status.count%2==0}">
                                                    <tr style="background: #eeeeff">
                                                        </c:if>
                                                        <c:if test="${status.count%2!=0}">
                                                    <tr style="background: #dedeff">
                                                        </c:if>
                                                        <c:if test="${i.college.equals(school_info.college) and i.major.equals(school_info.major) and i.class1.equals(school_info.class1)}">
                                                        <td>${i.name}</td>
                                                        <td>${i.id}</td>
                                                        <td>${i.school_id}</td>
                                                        <td>${i.college}</td>
                                                        <td>${i.major}</td>
                                                        <td>${i.class1}</td>
                                                        <td>${i.attendenceRecord}</td>
                                                        <td>${i.healthcode}</td>
                                                        </c:if>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>

                                                <p>
                                                    <audio controls="controls" style="display: none;">&nbsp;</audio>
                                                </p>

                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </td>

                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                    <div class="tablescroll">
                        <table id="DataBody2" class="table table-hover" width="100%" cellspacing="0" cellpadding="0" border="0" style="border: 0 none;">
                            <thead>
                            <tr>
                                <th>学院</th>
                                <th>&nbsp;&nbsp;&nbsp;&nbsp;</th>
                                <th>&nbsp;&nbsp;&nbsp;&nbsp;</th>
                                <th>详情</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%String coll = null;%>
                            <c:forEach var="school_info" items="${requestScope.school_infos}"
                                       varStatus="status">
                                <c:if test="${status.count%2==0}">
                                    <tr style="background: #eeeeff">
                                </c:if>
                                <c:if test="${status.count%2!=0}">
                                    <tr style="background: #dedeff">
                                </c:if>
                                <c:if test="${!school_info.college.equals(coll)}">
                                    <div style="visibility: hidden">${coll=school_info.college}</div>
                                <td>${school_info.college}</td>
                                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                <td>

                                    <button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#${status.count}ss">详情</button>
                                    <div class="modal fade" id="${status.count}ss" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                    <h4 class="modal-title" id="myModalLabel2" style="text-align: center">学生信息</h4>
                                                </div>
                                                <div class="modal-body">

                                                    <table class="table table-condensed" contenteditable="false">
                                                        <tbody>
                                                        <tr>
                                                            <th>姓名</th>
                                                            <th>身份证号</th>
                                                            <th>工号</th>
                                                            <th>学院</th>
                                                            <th>打卡情况</th>
                                                            <th>健康码</th>
                                                        </tr>

                                                        <c:forEach var="i2" items="${teacher}"
                                                                   varStatus="status">
                                                        <c:if test="${status.count%2==0}">
                                                        <tr style="background: #eeeeff">
                                                            </c:if>
                                                            <c:if test="${status.count%2!=0}">
                                                        <tr style="background: #dedeff">
                                                            </c:if>
                                                            <c:if test="${i2.college.equals(school_info.college)}">
                                                            <td>${i2.name}</td>
                                                            <td>${i2.id}</td>
                                                            <td>${i2.school_id}</td>
                                                            <td>${i2.college}</td>
                                                            <td>${i2.attendenceRecord}</td>
                                                            <td>${i2.healthcode}</td>
                                                            </c:if>
                                                            </c:forEach>
                                                        </tbody>
                                                    </table>

                                                    <p>
                                                        <audio controls="controls" style="display: none;">&nbsp;</audio>
                                                    </p>

                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                </c:if>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                <div id='databasePage' class="dataTables_paginate paging_bootstrap page">
                </div>
            </div>

            </div>
            <form id="toPHPMyAdmin" action="http://39.97.238.64:888/phpmyadmin_9d6bd9ac44b8d96f/index.php" method="post" style="display: none;" target="_blank">
                <input type="text" name="pma_username" id="pma_username" value="" />
                <input type="password" name="pma_password" id="pma_password" value="" />
                <input type="text" name="server" value="1" />
                <input type="text" name="target" value="index.php" />
                <input type="text" name="db" id="db" value="" />
            </form>
        </div>
    </div>


    <div class="footer bgw">版权所有 © 浙江工业大学 | 信息化办公室维护 | 网络管理 www@zjut.edu.cn</div>
</div>
<script src="<%=path%>/static/js/jquery-1.10.2.min.js"></script>
<script src="<%=path%>/static/js/bootstrap.min.js"></script>
<script src="<%=path%>/static/language/Simplified_Chinese/lan.js?date=7.1.0"></script>
<script src="<%=path%>/static/layer/layer.js?date=7.1.0"></script>
<script src="<%=path%>/static/js/public.js?version=7.1.0"></script>
<script src="<%=path%>/static/js/public_backup.js?version=7.1.0"></script>
<script src="<%=path%>/static/codemirror/lib/codemirror.js?version=7.1.0"></script>

<script type="text/javascript" src="js/bt_upload.js?version=7.1.0"></script>
<script src="<%=path%>/static/js/database.js?date=7.1.0"></script>
<script type="text/javascript">
    bt.set_cookie('backup_path', "/www/backup");


    database.get_list();


</script>
<script src="<%=path%>/static/js/upload.js?date=7.1.0"></script>

<script type="text/javascript">
    if (navigator.appName == "Microsoft Internet Explorer" && parseInt(navigator.appVersion.split(";")[1].replace(/[ ]/g, "").replace("MSIE", "")) < 9) {
        $(".main-content").css("margin-top", "50px");
        $('.top-tips').show();
    }
    $("#setBox").click(function () {
        if ($(this).prop("checked")) {
            $("input[name=id]").prop("checked", true);
        } else {
            $("input[name=id]").prop("checked", false);
        }
    });
    setCookie('order', 'id desc');
    var is_files_html = false;
    var task_open = 0;
    var task_close = false;
    if ($(".current").attr("id") == 'memuAfiles') {
        is_files_html = true;
    }
    function task_stat(my_init) {
        if (!my_init) {
            my_init = 0;
            if (task_open) return;
        }
        if (task_close) return;
        $.post('/task?action=get_task_lists', { status: -3 }, function (task_list) {
            if (task_list.length == 0) {
                if (my_init && is_files_html) GetFiles(getCookie('Path'));
                if (task_open) {
                    layer.close(task_open);
                    task_open = false;
                }
                return;
            }

            console.log(task_list.length)
            var msg_body = '';
            var is_add = false;
            for (var i = 0; i < task_list.length; i++) {
                if (task_list[i]['status'] == -1) {
                    if (!task_open || !$(".message-list").attr("class")) {
                        show_task();
                    }

                    if (task_list[i]['type'] == '1') {
                        msg_body += '<div class="mw-con">\
		                                <ul class="waiting-down-list">\
			                                <li>\
				                                <div class="down-filse-name"><span class="fname" style="width:80%;" title="正在下载: '+ task_list[i].shell + '">正在下载: ' + task_list[i].shell + '</span><span style="position: absolute;left: 84%;top: 25px;color: #999;">' + task_list[i].log.pre + '%</span><span class="btlink" onclick="remove_task(' + task_list[i].id + ')" style="position: absolute;top: 25px;right: 20px;">取消</span></div>\
				                                <div class="down-progress"><div class="done-progress" style="width:'+ task_list[i].log.pre + '%"></div></div>\
				                                <div class="down-info"><span class="total-size"> '+ task_list[i].log.used + '/' + ToSize(task_list[i].log.total) + '</span><span class="speed-size">' + (task_list[i].log.speed == 0 ? '正在连接..' : task_list[i].log.speed) + '/s</span><span style="margin-left: 20px;">预计还要: ' + task_list[i].log.time +'</span></div>\
			                                </li>\
	                                        </ul>\
	                                    </div>'
                    } else {
                        msg_body += '<div class="mw-title"><span style="max-width: 88%;display: block;overflow: hidden;text-overflow: ellipsis;white-space: nowrap;">' + task_list[i].name + ': ' + task_list[i].shell + '</span><span class="btlink" onclick="remove_task(' + task_list[i].id + ')"  style="position: absolute;top: 10px;right: 15px;">取消</span></div>\
	                                    <div class="mw-con codebg">\
		                                    <code>'+ task_list[i].log +'</code>\
	                                    </div>'

                    }

                } else {
                    if (!is_add) {
                        msg_body += '<div class="mw-title">等待执行任务</div><div class="mw-con"><ul class="waiting-list">';
                        is_add = true;
                    }
                    msg_body += '<li><span class="wt-list-name" style="width: 90%;">' + task_list[i].name + ': ' + task_list[i].shell + '</span><span class="mw-cancel" onclick="remove_task(' + task_list[i].id + ')">X</span></li>';
                }
            }
            if (task_open) {
                if (is_add) {
                    msg_body += '</ul></div>';
                }
                $(".message-list").html(msg_body);
            }


            if (my_init > 3) {
                if (is_files_html) GetFiles(getCookie('Path'));
                my_init = 1;
            }
            my_init +=1
            setTimeout(function () { task_stat(my_init); }, 1000);
        });
    }
    function show_task() {
        task_open = layer.open({
            type: 1,
            title: "实时任务队列",
            area: '500px',
            closeBtn: 2,
            shadeClose: false,
            shade: false,
            offset: 'auto',
            content: '<div style="margin: 10px;" class="message-list"></div>',
            cancel: function () {
                task_close = true;
            }
        });
    }
    function remove_task(id) {
        loadT = layer.msg('正在取消任务...', { time: 0, icon: 16, shade: [0.3, '#000'] });
        $.post('/task?action=remove_task', { id: id }, function (rdata) {
            layer.close(loadT)
            layer.msg(rdata.msg);
        });
    }
    loadScript([
        '<%=path%>/static/laydate/laydate.js',
        '<%=path%>/static/js/jquery.qrcode.min.js',
        '<%=path%>/static/js/clipboard.min.js'
    ],function(e){

    });
    task_stat();

</script>
</body>
</html>