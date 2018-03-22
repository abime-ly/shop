<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>电子商城后台管理</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<style>
td {
	text-align: center;
	width: 20%;
}
ul{
	list-style: none;
	text-align: left;
}
li{
	font-size: 10pt;
	padding-top:-15px;
	margin-left:-15px;
}
</style>
<style type="text/css"> 
* { margin:0; padding:0; } 
ul { list-style:none; } 
a:hover {color:#555; } 
.nav { float:left; overflow:hidden; text-align:center; font-size:14px; } 
.nav dd { float:left; width:300px; margin:-888px -150px 0 0; } 
.nav dd a { float:left; margin-top:888px; display:block; position:relative; background:#eee; width:150px; height:30px; line-height:30px; border-bottom:1px solid #fff; } 
.nav a:hover { margin-right:1px; background:#3cf; } 
.nav dd ul { float:left; font-size:0; z-index:888; } 
.nav dd li a { clear:left; width:150px; margin-top:0; font-size:14px; } 
.nav dd li a:hover { margin-right:1px; } 
</style> 
</head> 
<body> 
	<div style="width:60%;margin-left:20%;">
		<h4> 
			嗨，${managername } 
		</h4>
		<h2 align="center">
			欢迎进入电子商城后台管理
		</h2>
<dl class="nav"> 
<dd><a href="">首页</a></dd> 
<dd> 
<a href="">关于我们</a>
</dd>
<dd>
<ul> 
<li><a href="">销售处理</a></li> 
<li><a href="manager_down.jsp" target="down">订单处理</a></li>
<li><a href="managereview.jsp" target="down">客户评论处理</a></li>
</ul> 
</dd> 
<dd> 
<a href="">商品管理</a> 
<ul> 
<li><a href="addnewgoods.jsp" target="down">添加新商品</a></li>
<li><a href="deletegoods.jsp" target="down">下架商品</a></li>
<li><a href="addgoods.jsp" target="down">商品入库</a></li>
<li><a href="overinfo" target="down">商品售罄提醒</a></li>
</ul> 
</dd>
<dd>
<a href="">成员管理</a> 
<ul> 
<li><a href="addOrdeletemanager.jsp" target="down">添加/删除管理员</a></li>
<li><a href="changemanagerinfo" target="down">管理员信息修改</a></li>
</ul>
</dd>
<dd>
<a href="">活动促销</a>
<ul>
<li><a href="setacount.jsp" target="down">设置折扣</a></li>
<li><a href="crazysale.jsp" target="down">疯狂甩卖</a></li>
</ul>
</dd>
<dd>
<a href="">销售统计</a>
<ul>
<li><a href="salelist" target="down">销售排行榜</a></li>
<li><a href="salesearch.jsp" target="down">商品销售查询</a></li>
<li><a href="calculateprofit.jsp" target="down">利润统计</a></li>
</ul>
</dd> 
</dl> 
		</div>
	</body>
</html>
<script type="text/javascript">
function fun1(id)
{

	document.getElementById("b"+id).style.display="";
}
function fun2(id)
{
	document.getElementById("b"+id).style.display="none";
}
</script>
