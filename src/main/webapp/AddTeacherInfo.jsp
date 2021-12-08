
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>新增教师信息</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
</head>
<body>
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
                            <form action="addTeacherServlet">
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
                            <form action="addMoreTeacherServlet">
                                <p>请按name,id,school_id,college,role,password;格式依次输入，<br>逗号为间隔，分号为一条记录的结尾</p>
                                <textarea rows="6" style="width: 435px;height: 120px;text-align: left;" name="added"></textarea><br>
                                <input type="submit" value="批量导入">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <a href="allAdministrators.jsp">返回主界面</a>
    </div>
</div>
</body>
</html>
