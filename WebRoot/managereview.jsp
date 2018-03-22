<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'managereview.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <table width="100%">
    <tr>
    <td>评论商品</td><td>评论用户</td><td>评论语</td><td>判定操作</td>
    </tr>
    <c:forEach var="ri" items="${reviewinfo}">
    <tr>
    <td>${ri.gname }</td><td>${ri.username }</td><td>${ri.info }</td><td><a href="">好评</a>&nbsp;&nbsp;&nbsp;<a href="">中评</a>&nbsp;&nbsp;&nbsp;<a href="">差评</a></td>
    </tr>
    </c:forEach>
    </table>
  </body>
</html>
