window.onload=function(){
    var oDt=new Date();
    var iMonth=parseInt(oDt.getMonth())+1;
    document.getElementById("displaydate").innerHTML="<h1 align=\"center\">"+iMonth+"月"+oDt.getDate()+"日"+"</h1>";
    var iTimerid=window.setInterval("showtime()",1000);
    if(document.getElementById("a1")!=null){
        document.getElementById("a1").onmouseover=function(){
            document.getElementById("badimg").src=img[0];
            num=0;
        }
    }
    if(document.getElementById("a2")!=null){
        document.getElementById("a2").onmouseover=function(){
            document.getElementById("badimg").src=img[1];
            num=1
        }
    }
    if(document.getElementById("a3")!=null){
        document.getElementById("a3").onmouseover=function(){
            document.getElementById("badimg").src=img[2];
            num=2
        }
    }
    if(document.getElementById("a4")!=null){
        document.getElementById("a4").onmouseover=function(){
            document.getElementById("badimg").src=img[3];
            num=3;
        }
    }
    setInterval(function(){changeimg()},5000);
    window.onscroll=function(){admove();}
    if(document.getElementById("advl")!=null){advinit();}
    if(document.getElementById("closel")!=null){document.getElementById("closel").onclick=function(){advclosel();}}
    if(document.getElementById("closer")!=null){document.getElementById("closer").onclick=function(){advcloser();}}
}
var num=0;
function changeimg(){
    document.getElementById("badimg").src=img[num];
    num++;
    if(num>=4)
        num=0;
}
function showtime(){
    var oDt=new Date();
    var iTimerid;
    var sTime="";
    if(oDt.getHours()<10){
        sTime+="0"+oDt.getHours()+":";}
    else{
        sTime+=oDt.getHours()+":";}
    if(oDt.getMinutes()<10){
        sTime+="0"+oDt.getMinutes()+":";}
    else{
        sTime+=oDt.getMinutes()+":";}
    if(oDt.getSeconds()<10){
        sTime+="0"+oDt.getSeconds();}
    else{
        sTime+=oDt.getSeconds();}
    document.getElementById("displaytime").innerHTML="<h1 align=\"center\"><b>"+sTime+"</b></h1>";
}