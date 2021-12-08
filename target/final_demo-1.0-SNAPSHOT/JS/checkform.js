function check_form() {



    var cq1 = false;
    var cq2 = false;
    var cq3 = false;
    var cq4 = false;

    var csituation = false;
    var cpromise = false;

    /*基础信息*/
    var name = document.getElementsByName("name");
    var id = document.getElementsByName("id");
    var stuId = document.getElementsByName("stuId");
    var tel = document.getElementsByName("tel");

    /*四个单项*/
    var q1 = document.getElementsByName("q1");
    var q2 = document.getElementsByName("q2");
    var q3 = document.getElementsByName("q3");
    var q4 = document.getElementsByName("q4");

    /*两个多选*/
    var situation = document.getElementsByName("situation");
    var promise = document.getElementsByName("promise");

    /*基础信息判断*/


    /*单选判定*/
    for(var i = 0;i<q1.length;i++){
        if(q1[i].checked == true){
            cq1 = true;
        }
    }
    for(var i = 0;i<q2.length;i++){
        if(q2[i].checked == true){
            cq2 = true;
        }
    }
    for(var i = 0;i<q3.length;i++){
        if(q3[i].checked == true){
            cq3 = true;
        }
    }
    for(var i = 0;i<q4.length;i++){
        if(q4[i].checked == true){
            cq4 = true;
        }
    }
    /*多选判断*/
    for(var i = 0;i<situation.length;i++){
        if(situation[i].checked == true){
            csituation = true;
        }
    }
    for(var i = 0;i<promise.length;i++){
        if(promise[i].checked == true){
            cpromise = true;
        }
    }

    /*提示*/
    if(form.name.value == ""){
        alert("请输入姓名");
        return false;
    }
    else if(form.id.value == ""){
        alert("请输入身份证号");
        return false;
    }
    else if(form.stuId.value == ""){
        alert("请输入学号(工号)");
        return false;
    }
    else if(form.tel.value == "" || form.tel.value.length !== 11){
        alert("请输入正确的手机号");
        return false;
    }
    else if(!cq1){
        alert("问题一未选择");
        return false;
    }
    else if(!cq2){
        alert("问题二未选择");
        return false;
    }
    else if(!cq3){
        alert("问题三未选择");
        return false;
    }
    else if(!cq4){
        alert("问题四未选择");
        return false;
    }
    else if(!csituation){
        alert("个人情况未填");
        return false;
    }
    else if(!cpromise){
        alert("请作出承诺");
        return false;
    }
}