<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'manager_down.jsp' starting page</title>
    
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
  <form action="fahuo" method="post">
    <table align="center" width="60%" style="border:1 solid black">
    	<tr><td colspan="4"><h2>订单详情</h2></td></tr>
    	<tr><td>商品名</td><td>数量</td><td>邮寄地址</td><td>联系电话</td></tr>
    	<c:forEach var="order" items="${orderinfo}">
    	<tr>
    		<td>${order.gname }<input type="hidden" value="${order.gname }"></td>
    		<td>${order.gnum }<input type="hidden" value="${order.gnum }"></td>
    		<td>${order.address }<input type="hidden" value="${order.address }"></td>
    		<td>${order.phone }<input type="hidden" value="${order.phone }"></td>
   		</tr>
   		</c:forEach>
   		<tr><td colspan="5" align="right"><input type="submit" value="生成文件"></td></tr>
    </table>
  </form>
  </body>
</html>
