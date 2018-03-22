<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户注册</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style>
td{
	height:50px;
}
</style>
  </head>
  
  <body>
    <h2 align="center"><br></h2><h2 align="center">电子商城，欢迎您的注册</h2>
    <div style="width:500px;height:800px;margin-left:100px;padding-left:50px;border:1 solid black">
    <form action="register" method="post" onsubmit="return check()">
    <br/>
    <h3 align="center">请填写以下信息</h3>
<table>
    <tr><td>请输入用户名：</td><td>
    <c:if test="${empty error}"><input type="text" name="uname" id="uname" style="width:156">*<span id="error1" style="color:red"></span></c:if>
    <c:if test="${error != null}"><input type="text" name="uname" id="uname" value="${uname }" style="width:156">*<span id="error1" style="color:red">${error }</span></c:if>
    </td></tr>
 	<tr><td> 请输入身份证号：</td><td><input type="text" name="cardcode" id="cardcode" style="width:156">*<span id="error2" style="color:red"></span></td></tr>
    <tr><td> 请输入密码：</td><td><input type="password" name="psw1" id="psw1" style="width:156">*<span id="error3" style="color:red"></span></td></tr>
    <tr><td>请确认密码：</td><td><input type="password" name="psw2" id="psw2" style="width:156">*<span id="error4" style="color:red"></span></td></tr>
	<tr><td>性   别：</td><td><select name="sex" style="width:80px"><option value="男">男</option><option value="女">女</option></select></td></tr>
	<tr><td>密码提示问题：</td><td><input type="text" name="pswquestion" id="pswquestion">*<span id="error5" style="color:red"></span></td></tr>
	<tr><td>问题答案：</td><td><input type="text" name="answer" id="answer">*<span id="error6" style="color:red"></span></td></tr>
	<tr><td>邮箱号：</td><td><input type="text" name="email" id="email"></td></tr>
	<tr><td>家庭地址：</td><td><input type="text" name="address" id="address"></td></tr>
<tr><td colspan="2" style="padding-left:130px"><input type="submit" value="注    册"></td></tr>
</table>
<%String regtime = new Date().toLocaleString();%>
<input type="hidden" value=<%=regtime %> name="regtime" >
    </form><br/>
    <p style="padding-right: 50px;">
    注册完成后您就是电子商城的合法使用客户了，通过该注册账号您可以随意在商城内购买您需要的商品，祝您购物愉快！
    </p>
    </div>
  </body>
</html>
<script>
function check()
{
	var uname = document.getElementById("uname").value;
	var cardcode = document.getElementById("cardcode").value;
	var psw1 = document.getElementById("psw1").value;
	var psw2 = document.getElementById("psw2").value;
	var pswquestion = document.getElementById("pswquestion").value;
	var answer = document.getElementById("answer").value;
	if(!uname)
	{
		error1.innerHTML="用户名不能为空"
		return false;
	}else{
		error1.innerHTML="";	
	}
	if(!cardcode){
		error2.innerHTML="身份证号不能为空";
		return false;
	}else if(isNaN(cardcode)){
		error2.innerHTML = "请正确输入身份证号";
		return false;
	}else{
		error2.innerHTML="";
	} 
	if(!psw1){
		error3.innerHTML="密码不能为空";
		return false;
	}else{
		error3.innerHTML="";
	}
	if(!psw2){
		error4.innerHTML="确认密码不能为空";
		return false;
	}else{
		error4.innerHTML="";
	}
	if(psw1 != psw2){
		error4.innerHTML="两次密码不一致";
		return false;
	}else{
		error4.innerHTML="";
	}
	if(!pswquestion){
		error5.innerHTML = "请设置提示问题"
		return false;
	}else{
		error5.innerHTML = "";
	}
	if(!answer){
		error6.innerHTML = "请设置答案";
		return false;
	}else{
		error6.innerHTML = "";
	}
	
}
</script>
