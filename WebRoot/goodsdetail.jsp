<%@ page language="java" import="java.util.*,com.bean.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'goodsdetail.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<style type="text/css">
	tr{
		line-height: 42px;
	}
	</style>
<script language="javascript">
function fun(id)
{
	if(id==1){
		if(parseInt(document.getElementById("num").value)>1){
			document.getElementById("num").value =parseInt(document.getElementById("num").value)-1;
		}
	}
	if(id==2){
		document.getElementById("num").value =parseInt(document.getElementById("num").value)+1;
	}
}
</script>
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
  <div style="width:75%;margin-left:12.5%;">
  <!-- top -->
   	<div style="background-color: gray;line-height: 40px;">
  				 <h5 align="right">
						<c:if test="${empty username}">嗨，欢迎来到电子商城！请
   						<a href="login.jsp">登录</a>
						</c:if>
						<c:if test="${username != null}">嗨，
						<span onmouseover="fenlei('u6')" ><font color="red">${username}</font>
								<div id="u6" onmouseout="fenout('u6')"
									style="position: absolute;display:none;margin-top:-30px; margin-left: 450px;text-align: left;line-height: 20px;">
									<ul style="list-style: none;">
										<li style="font-size: 12px;background:gray">
											<a href="changeinfo">修改密码</a>
										</li>
										<li style="font-size:12px;background: gray">
											<a href="exist">退&nbsp;&nbsp;&nbsp;出</a>
										</li>
									</ul>
								</div> </span>
					
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
   <div style="border: 1 solid blue;height:80px;">
   		<div><img src="img/logo.jpg" style="float: left;"></div>
   		<div style="float: right; margin-top: 18px;">
						<form action="#" method="post">
							<input type="text" name="selectinfo" id="selectinfo"
								style="width: 250px; height: 30px;">
							<input type="submit" value="搜  索"
								style="width: 90px; height: 30px">
						</form>
		</div>
   </div>
   <!-- 商品展示 -->
   <%
		goodsinfo goodsdetail = (goodsinfo)request.getAttribute("goodsdetail");
    %>
   <div style="border:1 solid blue;height:300px;">
   <div style="float:left;border: 1 solid black;width:250px;height:280px;margin-left:20px;margin-top:10px">
   	<img src="<%=goodsdetail.getImg() %>" style="width:220px;height:260px;margin-left:15px;margin-top:10px">
   </div>
   <div style="float:left;padding-left: 100px;">
   <form action="addtocar" method="post">
   	<table width=100%> 
   		<tr> 
   			<td>商品名称：<%=goodsdetail.getGname() %><input type="hidden" value="<%=goodsdetail.getGname() %>" name="goodsname"></td> 
   		</tr> 
   		<tr> 
   			<td>好评率：<c:if test="${pro==-100}">尚未有用户评论</c:if><c:if test="${pro!=-100}">${pro }%</c:if></td> 
   		</tr> 
   		<tr> 
   			<td>商品数量：<input type="button" value="-" style="width: 25px; height: 25px;" onclick="fun(1)"> <input type="text" value="1" name="num" id="num" style="width: 50px;" readonly="readonly">&nbsp;&nbsp;&nbsp; 
   			<input type="button" value="+" style="width: 25px; height: 25px;" onclick="fun(2)"> 
   			</td> 
   		</tr>
   		<tr> 
   			<td>市场价格：<%=goodsdetail.getMartprice() %>元 
   			</td> 
   		</tr> 
   		<tr> 
   			<td>现只需要：<%=goodsdetail.getPrice()%>元 
   			</td> 
   		</tr> 
   		<tr> 
   			<td style="padding-left: 20px;"><input type="submit" value="加入购物车"> 
   			<br></td> 
   		</tr> 
   	</table>
   	</form>
    </div>
   </div>
   <!-- 评论详情 -->
   <div style=" clear: both;">
		<table style="width:35%;height: 30px;">
			<tr style="line-height: 40px;text-align: center;">
			<td onmouseover="cen('2')" id="c2">商品评价</td>
			<td onmouseover="cen('1')" id="c1">宝贝详情</td>
			</tr>
		</table>
	</div>
			<script type="text/javascript">
			function cen(id){
				for(var i=1;i<=2;i++){
					document.getElementById("cen"+i).style.display="none";
				document.getElementById("c"+i).style.background="white";
				}
				document.getElementById("c"+id).style.background="gray";
				document.getElementById("cen"+id).style.display="";
			}
			</script>
			<!-- 商品评论 -->
			<div style="border: 1px solid blue;clear: both;" id="cen2">
			<table width="100%">
			<tr style="background: orange">
			<td>评论人</td>
			<td>评论语</td>
			</tr>
			<c:forEach var="gc" items="${gcomment}">
			<tr>
			<td style="padding-left:30px;"><img src="img/touxiang.png"><br><font size="3px">${gc.username }</font></td>
			<td width="70%" style="line-height: 35px;">${gc.info }<br><font color="gray" size="3px">${gc.rtime }</font></td>
			</tr>
			</c:forEach>
			</table>
   			</div>	
			<!-- 宝贝详情 -->
			<div style="border: 1px solid blue;clear: both;" id="cen1">
			<table width="100%">
			
			</table>
			</div>
			
  </div>
  </body>
</html>
