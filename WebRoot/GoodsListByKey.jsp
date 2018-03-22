<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"   %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'GoodsListByKey.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
 <script type="text/javascript">
							function fenlei(id){
							document.getElementById(id).style.display="";				
							}
							function fenout(id){
							document.getElementById(id).style.display="none";				
							}
</script>
  <body>
  <div style="width: 75%;margin-left: 12.5%;">
   <div style="background-color: gray;line-height: 40px">
   <h5 align="right">
						<c:if test="${empty username}">嗨，欢迎来到电子商城！请
   						<a href="login.jsp">登录</a>
						</c:if>
						<c:if test="${username != null}">嗨，
						<span onmouseover="fenlei('u6')" ><font color="red">${username}</font>
								<div id="u6" onmouseout="fenout('u6')"
									style="position: absolute;display:none;margin-top:-30px; margin-left: 450px;text-align: left;line-height: 20px;">
									<ul style="list-style: none;">
										<li style="font-size: 12px;background: gray">
											<a href="changeinfo">修改密码</a>
										</li>
										<li style="font-size:12px;background:gray">
											<a href="exist">退&nbsp;&nbsp;&nbsp;出</a>
										</li>
									</ul>
								</div></span>
					
								欢迎光临电子商城
								
   					</c:if>
						&nbsp;
						<a href="register.jsp">免费注册</a>&nbsp;|
						<a href="login.jsp">商店后台</a>&nbsp;
						<a href="shopcar">♥我的购物车</a>&nbsp;|
						<a href="#">网站导航</a>
						<a href="#">所有商品分类</a>
					</h5>
   </div>
   <!-- 搜索框 -->
   <div style="border:1 solid red;height:70px;">
   		<div><img src="img/logo.jpg" style="float: left;"></div>
   		<div style="float: right; margin-top: 18px;">
						<form action="selectgoods" method="post" onsubmit="return checked()">
							<input type="text" name="selectinfo" id="selectinfo"
								style="width: 250px; height: 30px;">
							<input type="submit" value="搜  索"
								style="width: 90px; height: 30px">
						</form>
		</div>
   </div><br>
   <div style="clear:both"><a href="index">首页</a></div>
   <!-- 目录 -->
   <div style="border:1 solid red;margin-top:10px;">
   <c:choose>
   <c:when test="${empty selectinfo}"><p style="padding-left: 150px;">
   不好意思，没找到相关商品，要不比换个关键词再找找看<br>
   建议您：<br/>
   1、您看看输入文字是否有错<br/>
   2、调整关键词，如“全铜花洒套件”改成“花洒”或“花洒 套件”<br/>
   3、<input type="text" name="select" id="select" value="${select }"/><input type="button" value="搜索" onclick="select()">
   </p>
   </c:when>
   <c:otherwise>
		<table style="border:1 solid gray;" width="100%">
			<tr style="line-height: 50px;background: orange;  border=1;">
				<td>商品图片</td><td>商品名</td><td>商品价格</td>
			</tr>
			<c:forEach var="info" items="${selectinfo}">
			<tr>
				<td><a href="goodsdetail?goodsname=${info.gname }"><img src="${info.img }" width="150px" height="60px"></a><c:if test="${info.acount<1}"><font color="red">活动期间</font></c:if></td><td><a href="goodsdetail?goodsname=${info.gname }">${info.gname }</a></td><td>${info.price }元</td>
			</tr>
			</c:forEach>
		</table>
	</c:otherwise>
	</c:choose>
   </div>
 </div>
  </body>
</html>
<script>
function select()
{
	var goods = document.getElementById("select").value;
	if(!goods){
		document.getElementById("select").value="请输入关键字";
	}else{
		window.location.href="selectgoods?selectinfo="+goods;
	}
}
function checked()
{
	var goods = document.getElementById("selectinfo").value;
	if(!goods){
		document.getElementById("selectinfo").value="请输入要搜索的商品信息";
		return false;
	}
}
</script>