
<%String path = request.getContextPath();%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>健康码申请</title>
    <script type="text/javascript" src="<%=path%>/JS/checkform.js"></script>
    <style>
        input[type="radio"] {
            height:20px;
            width:20px;
            display:none;
        }
        [type="radio"]+label {
            position: relative;
            height: 20px;
            width: 20px;
            border-radius: 50%;
            border: 1px solid #e7e7e7;
            display: inline-block;
            top:5px;

        }
        [type="radio"]:checked+label {
            position: relative;
            height: 20px;
            width: 20px;
            border-radius: 50%;
            border: 1px solid #0088FE;
            display: inline-block;
            top:5px;

        }
        [type="radio"]:checked+label:after {
            position: absolute;
            content: '';
            border: 5px solid #0088FE;
            border-radius: 50%;
            top:5px;
            left:5px;
        }

        input[type="checkbox"] {
            width: 20px;
            height: 20px;
            display: none;
        }
        [type="checkbox"]+label {
            position: relative;
            width: 20px;
            height: 20px;
            display: inline-block;
            border: 1px solid #E7E7E7;
            top:5px;
        }
        [type="checkbox"]:checked+label {
            position: relative;
            height: 20px;
            width: 20px;
            display: inline-block;
            top:5px;
            background-color: #0088FE;
            border: 1px solid #0088FE;
        }
        [type="checkbox"]:checked+label:after {
            position: absolute;
            content: "";
            width: 5px;
            height: 10px;
            top: 3px;
            left: 6px;
            border: 3px solid white;
            border-top: none;
            border-left: none;
            transform: rotate(45deg)
        }
    </style>
</head>
<body style="background-color: #444444;font-size: 10px">
<form action="CheckHealthCodeServlet" method="post" name="form" onsubmit="return check_form()" >
    <table align="center"width="350px">
        <tr>
            <td><h3 align="center">师生健康打卡</h3></td>
        </tr>

        <tr bgcolor=#F5F5F5>
            <td></td>
        </tr>

        <tr>
            <td height=35 align=left style="word-break:keep-all;"><span style="color:orange">*</span>姓名:<br><br></td>
        </tr>

        <tr>
            <td><input type="text" name="name"  style="padding: 6px 120px" value="${student.name}${teacher.name}" readonly style="width: 200px;border-radius: 4px"><br><br></td>
        </tr>

        <tr>
            <td height=35 align=left style="word-break:keep-all;"><span style="color:orange">*</span>身份证号:<br><br></td>
        </tr>

        <tr>
            <td><input type="text" name="id" style="padding: 6px 120px" value="${student.id}${teacher.id}" readonly style="width: 200px;border-radius: 4px"><br><br></td>
        </tr>

        <tr>
            <td height=35 align=left style="word-break:keep-all;"><span style="color:orange">*</span>请输入学号(工号):<br><br></td>
        </tr>

        <tr>
            <td><input type="text" name="school_id" style="padding: 6px 120px" value="${student.school_id}${teacher.school_id}${path}" readonly style="width: 200px;border-radius: 4px"><br><br></td>
        </tr>

        <tr>
            <td height=35 align=left style="word-break:keep-all;"><span style="color:orange">*</span>请输入手机号:<br><br></td>
        </tr>

        <tr>
            <td><input type="tel" name="tel" placeholder="请输入手机号" style="padding: 6px 120px"><br><br></td>
        </tr>


        <tr bgcolor=#F5F5F5>
            <td></td>
        </tr>

        <tr>
            <td  height=35 align=left style="word-break:keep-all;">
                <span style="color:orange">*</span>您最近14天是否去过重点疫区？
                <font style="border:1px solid #CADEFB;padding:1px 1px 1px 1px;width:27px;border-radius: 25px; color:#CADEFB;font-size:70%;" >单选</font>
                <br><br><input type="radio" name="q1" value="no" id="0" >
                <label for="0"></label>
                <span>否</span>
                <hr align=right width=330 color=#F6F6F6 size=1>
                <br><input type="radio" name="q1" value="yes" id="10">
                <label for="10"></label>
                <span>是</span>
                <br>
            </td>
        </tr>

        <tr bgcolor=#F5F5F5>
            <td>&nbsp;</td>
        </tr>

        <tr>
            <td  height=35 align=left style="word-break:keep-all;">
                <span style="color:orange">*</span>您最近14天是否去过国外？
                <font style="border:1px solid #CADEFB;padding:1px 1px 1px 1px;width:27px;border-radius: 25px; color:#CADEFB;font-size:70%;" >单选</font>
                <br><br><input type="radio" name="q2" value="no" id="1" >
                <label for="1"></label>
                <span>否</span>
                <hr align=right width=330 color=#F6F6F6 size=1>
                <br><input type="radio" name="q2" value="yes" id="11">
                <label for="11"></label>
                <span>是</span>
                <br>
            </td>
        </tr>

        <tr bgcolor=#F5F5F5>
            <td>&nbsp;</td>
        </tr>

        <tr>
            <td  height=35 align=left style="word-break:keep-all;">
                <span style="color:orange">*</span>您最近14天是否接触过新冠确诊病人或疑似病人？
                <font style="border:1px solid #CADEFB;padding:1px 1px 1px 1px;width:27px;border-radius: 25px; color:#CADEFB;font-size:70%;" >单选</font>
                <br><br><input type="radio" name="q3" value="no" id="2" >
                <label for="2"></label>
                <span>否</span>
                <hr align=right width=330 color=#F6F6F6 size=1>
                <br><input type="radio" name="q3" value="yes" id="12">
                <label for="12"></label>
                <span>是</span>
                <br>
            </td>
        </tr>

        <tr bgcolor=#F5F5F5>
            <td>&nbsp;</td>
        </tr>

        <tr>
            <td  height=35 align=left style="word-break:keep-all;">
                <span style="color:orange">*</span>您最近14天是否被确认为新冠肺炎确诊病例或疑似病例？
                <font style="border:1px solid #CADEFB;padding:1px 1px 1px 1px;width:27px;border-radius: 25px; color:#CADEFB;font-size:70%;" >单选</font>
                <br><br><input type="radio" name="q4" value="no" id="3" >
                <label for="3"></label>
                <span>否</span>
                <hr align=right width=330 color=#F6F6F6 size=1>
                <br><input type="radio" name="q4" value="yes" id="13">
                <label for="13"></label>
                <span>是</span>
                <br>
            </td>
        </tr>

        <tr bgcolor=#F5F5F5>
            <td>&nbsp;</td>
        </tr>

        <tr>
            <td height=90 align=left><font color=#FFA500>*</font>当前健康状况（若有以下状况，请在方框内勾选）
                <font style="border:1px solid #FFA500; padding:1px 1px 1px 1px;  width:27px; border-radius:25px; color:orange; font-size:70%;">多选</font>
                <br>
                <br><input type="checkbox" name="situation" value="nothing_wrong" id="21"
                           onfocus="disableElement(this)" onBlur="renewElement(this)">
                <label for="21"></label>
                <span>无异常</span>

                <hr align=right width=330 color=#F6F6F6>
                <br><input type="checkbox" name="situation" value="weak" id="22"
                           onfocus="disableElement(this)" onBlur="renewElement(this)">
                <label for="22"></label>
                <span>乏力</span>
                <hr align=right width=330 color=#F6F6F6>
                <br><input type="checkbox" name="situation" value="cough" id="23"
                           onfocus="disableElement(this)" onBlur="renewElement(this)">
                <label for="23"></label>
                <span>干咳</span>
                <hr align=right width=330 color=#F6F6F6>
                <br><input type="checkbox" name="situation" value="nasal_obstration" id="24"
                           onfocus="disableElement(this)" onBlur="renewElement(this)">
                <label for="24"></label>
                <span>鼻塞</span>
                <hr align=right width=330 color=#F6F6F6>
                <br><input type="checkbox" name="situation" value="shed_tears" id="25"
                           onfocus="disableElement(this)" onBlur="renewElement(this)">
                <label for="25"></label>
                <span>流涕</span>
                <hr align=right width=330 color=#F6F6F6>
                <br><input type="checkbox" name="situation" value="sore_throat" id="26"
                           onfocus="disableElement(this)" onBlur="renewElement(this)">
                <label for="26"></label>
                <span>咽痛</span>
                <hr align=right width=330 color=#F6F6F6>
                <br><input type="checkbox" name="situation" value="lax" id="27"
                           onfocus="disableElement(this)" onBlur="renewElement(this)">
                <label for="27"></label>
                <span>腹泻</span>
            </td>
        </tr>

        <tr bgcolor=#F5F5F5>
            <td>&nbsp;</td>
        </tr>

        <tr>
            <td height=30 align=left><font size="4"><b>本人郑重承诺：</b></font>
                <br><br>
                <br><input type="checkbox" name="promise" value="promise1" id="9">
                <label for="9"></label>
                <span>为疫情防控，本人同意以上信息依法提交所在辖区疫情防控部门统筹管理。</span>
            </td>
        </tr>

        <tr height=100px bgcolor=#F5F5F5 align=center>
            <td>
                <input style="background:#0088FE ;border:1px solid #0088FE; padding:1px 1px 1px 1px;
    width:250px;height:60px; border-radius:25px; color:white; font-size:100%;" type="submit" name="submit" value="提交">
            </td>
        </tr>
    </table>

</form>
</body>
</html>
