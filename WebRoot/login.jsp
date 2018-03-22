<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>登录商城</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
	#maxdiv{
	width:280px;
	height:160px;
	float:left;
	margin-top:40px;
	margin-left:100px;
	border:1px solid black;
	padding:20px 10px 20px 10px;
	}
	</style>
	
  </head>
  
  <body> 
 <div style="background: #aa0044;width: 100%;height:120px;">
 <p style="padding-left: 100px;font-size: 30px;padding-top: 45px;font-family: 幼圆">电子商城，欢迎您的登录</p>
 </div>
    <div style="margin-top:80px;margin-left:150px;"> 
    <img src="img/loginlogo.jpg" style="float:left;">
    <div id="maxdiv">
<span  id="errorinfo" style="color:red">
<c:if test="${error != null}">${error}</c:if>
</span>
    <form action="login" method="post" onsubmit="return fun2()">
    <b>登录名：</b><br>
    <input type="text" name="name" id="name" style="width:250px;"><br><span id="error1" style="color:red"></span>
  <b>登录密码：</b><br>
  	<input type="password" name="psw" id="psw" style="width:250px;"><br><span id="error2" style="color:red"></span>
 <input type="radio" name="logintype" value="客户登录" checked="checked">客户登录
 <input type="radio" name="logintype" value="管理员登录">管理员登录<br>
 <input type="submit" value="登     录" style="width:250px;background-color:orange;height:30px">
 </form>
 </div>
    </div>
  </body>
</html>
<script>
function fun2()
{
  		var name2 = document.getElementById("name").value;
		var pwd2 = document.getElementById("psw").value;
		if(!name2)
		{
			errorinfo.innerHTML="";
			error1.innerHTML="用户名不能为空<br>";
			return false;
		}else{
			error1.innerHTML="";
		}
		if(!pwd2)
		{
			error2.innerHTML="密码不能为空<br>";
			return false;
		}else{
			error2.innerHTML="";
			return true;
		}
}
</script>

