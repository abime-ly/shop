<%@ page language="java" import="java.util.*,com.bean.*"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

		<title>电子商城</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<style>
#maxdiv {
	width: 990px;
	height: 1500px;
	border: 1px solid red;
}

.top {
	width: 990px;
	height: 100px;
	border: 1px solid red;
	background: #E3170D;
}

#topapply {
	widtrh: 770px;
	height: 98px;
	margin-left: 110px;
	margin-right: 100px;
	border: 1px solid red;
	backgrond-color: red;
}

.center {
	width: 775px;
	float: left;
	border: 1px solid red;
}

.img {
	width: 110px;
	height: 98px;
}

td {
	height: 55px;
	font-size: 20px;
	padding-left: 30px;
}

li {
	font-size: 16px;
	color: #ff0016;
	margin-left: -20px;
}

img {
	width: 150px;
	height: 200px;
}

a:link,a:visited {
	text-decoration: none;
}

a:hover,actived {
	text-decoration: underline;
	color: red;
}
</style>
	</head>

	<body>
		<div id="maxdiv">
			<div class="top">
				<img src="img/topimg.png" style="width: 990px; height: 100px">
			</div>
			<div class="top">
				<div id="topapply">
					<h5 align="right">

						<c:if test="${empty username}">嗨，欢迎来到电子商城！请
   						<a href="login.jsp">登录</a>
						</c:if>
						<c:if test="${username != null}">嗨，
						<span onmouseover="fenlei('u6')" ><font color="blue">${username}</font>
								<div id="u6" onmouseout="fenout('u6')"
									style="position: absolute; display:none;margin-top: -10px; margin-left: 180px;text-align: left;">
									<ul style="list-style: none;">
										<li style="font-size: 12px;">
											<a href="changeinfo">修改密码</a>
										</li>
										<li style="font-size:12px;">
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

					<div style="float: left;">
						<font face="幼圆" size="5">电子商城</font>
					</div>
					<div style="float: right;">
						<form action="selectgoods" method="post" onsubmit="return checked()">
							<input type="text" name="selectinfo" id="selectinfo"
								style="width: 250px; height: 30px">
							<input type="submit" value="搜  索"
								style="width: 90px; height: 30px">
						</form>
					</div>
				</div>
			</div>
			<!-- 广告左 -->
			<div style="width: 110px; height: 300px; float: left;">
				<img class="img" src="img/leftadvertisement1.jpg">
				<img class="img" src="img/leftadvertisement2.jpg">
				<img class="img" src="img/leftadvertisement3.jpg">
			</div>
			<!-- 广告 -->
			<div
				style="float: left; width: 765px; height: 300px; border: 1 solid red">
				<img style="width: 765px; height: 305px; margin-top: -5px;"
					src="img/centersale.png">
			</div>
			<!-- 广告右 -->
			<div
				style="width: 110px; height: 300px; float: left; margin-top: -5px;">
				<img class="img" src="img/rightadvertisement1.jpg">

				<img class="img" src="img/rightadvertisement2.jpg">

				<img class="img" src="img/rightadvertisement3.jpg">
			</div>
			<!--商品归类 -->
			<div
				style="float: left; width: 210px; height: 300px; border: 1 solid red">
				<font size="4" color="blue">商品类别</font>
				<table style="height: 270px; width: 210px">
					<tr style="background-color: gray">
						<td onmouseover="fenlei('u1')" onmouseout="fenout('u1')">
							家用电器
							<ul style="display: none; list-style: none" id="u1">
								<li>
									<a href="connection?key=空调">空调</a>
								</li>
								<li>
									<a href="connection?key=冰箱">冰箱</a>
								</li>
								<li>
									<a href="connection?key=洗衣机">洗衣机</a>
								</li>
								<li>
									<a href="connection?key=微波炉">微波炉</a>
								</li>
								<li>
									<a href="connection?key=电视机">电视机</a>
								</li>
							</ul>
						</td>
					</tr>
					<tr style="background-color: white">
						<td onmouseover="fenlei('u2')" onmouseout="fenout('u2')">

							服装/鞋/箱包
							<ul style="display: none; list-style: none;" id="u2">
								<li>
									<a href="connection?key=男装">男装</a>
								</li>
								<li>
									<a href="connection?key=女装">女装</a>
								</li>
								<li>
									<a href="connection?key=男鞋">男鞋</a>
								</li>
								<li>
									<a href="connection?key=女鞋">女鞋</a>
								</li>
								<li>
									<a href="connection?key=旅游箱/背包">旅游箱/背包</a>
								</li>
							</ul>
						</td>
					</tr>
					<tr style="background-color: gray">
						<td onmouseover="fenlei('u3')" onmouseout="fenout('u3')">
							手机数码
							<ul style="display: none; list-style: none;" id="u3">
								<li>
									<a href="connection?key=手机">手机</a>
								</li>
								<li>
									<a href="connection?key=相机">相机</a>
								</li>
								<li>
									<a href="connection?key=笔记本">笔记本</a>
								</li>
								<li>
									<a href="connection?key=手机配件">手机配件</a>
								</li>
								<li>
									<a href="connection?key=移动电源">移动电源</a>
								</li>
							</ul>
						</td>
					</tr>
					<tr style="background-color: white">
						<td onmouseover="fenlei('u4')" onmouseout="fenout('u4')">
							图书音箱
							<ul style="display: none; list-style: none;" id="u4">
								<li>
									<a href="connection?key=考试">考试</a>
								</li>
								<li>
									<a href="connection?key=小说">小说</a>
								</li>
								<li>
									<a href="connection?key=期刊杂志’">期刊杂志</a>
								</li>
								<li>
									<a href="connection?key=童书">童书</a>
								</li>
								<li>
									<a href="connection?key=社会科学">社会科学</a>
								</li>
							</ul>
						</td>
					</tr>
					<tr style="background-color: gray">
						<td onmouseover="fenlei('u5')" onmouseout="fenout('u5')">
							运动户外
							<ul style="display: none; list-style: none;" id="u5">
								<li>
									<a href="connection?key=垂钓用品">垂钓用品</a>
								</li>
								<li>
									<a href="connection?key=帐篷/睡袋">帐篷/睡袋</a>
								</li>
								<li>
									<a href="connection?key=健身用品">健身用品</a>
								</li>
								<li>
									<a href="connection?key=自行车">自行车</a>
								</li>
								<li>
									<a href="connection?key=户外工具">户外工具</a>
								</li>
							</ul>
						</td>
					</tr>
				</table>




			</div>
			<!-- 商城中心 -->
			<div class="center">
				<div>
					<div
						style="float: left; line-height: 40px; height: 40px; width: 80px; text-align: center; background: orange;"
						id="c1" onmouseover="cen('1')">
						新品上市
					</div>
					<div
						style="float: left; line-height: 40px; height: 40px; width: 80px; text-align: center;"
						id="c2" onmouseover="cen('2')">
						活动促销
					</div>

				</div>
				<!-- 新品上市 -->
				<%
			ArrayList<goodsinfo> newgoodsinfo = (ArrayList<goodsinfo>)request.getAttribute("newgoodsinfo");
			ArrayList<goodsinfo> cheapgoodsinfo = (ArrayList<goodsinfo>)request.getAttribute("cheapgoodsinfo");
			%>
				<div style="clear: both;"
					id="cen1">
					<table width="100%">
						<tr>
							<td>
								<a
									href="goodsdetail?goodsname=<%=newgoodsinfo.get(0).getGname() %>"><img
										alt="<%=newgoodsinfo.get(0).getGname() %>"
										src="<%=newgoodsinfo.get(0).getImg() %>">
									<br /><%=newgoodsinfo.get(0).getGname() %></a>
							</td>
							<td>
								<a
									href="goodsdetail?goodsname=<%=newgoodsinfo.get(1).getGname() %>"><img
										alt="<%=newgoodsinfo.get(1).getGname() %>"
										src="<%=newgoodsinfo.get(1).getImg() %>">
									<br /><%=newgoodsinfo.get(1).getGname() %></a>
							</td>
							<td>
								<a
									href="goodsdetail?goodsname=<%=newgoodsinfo.get(2).getGname() %>"><img
										alt="<%=newgoodsinfo.get(2).getGname() %>"
										src="<%=newgoodsinfo.get(2).getImg() %>">
									<br /><%=newgoodsinfo.get(2).getGname() %></a>
							</td>
						</tr>
						<tr>
							<td>
								<a
									href="goodsdetail?goodsname=<%=newgoodsinfo.get(3).getGname() %>"><img
										alt="<%=newgoodsinfo.get(3).getGname() %>"
										src="<%=newgoodsinfo.get(3).getImg() %>">
									<br /><%=newgoodsinfo.get(3).getGname() %></a>
							</td>
							<td>
								<a
									href="goodsdetail?goodsname=<%=newgoodsinfo.get(4).getGname() %>"><img
										alt="<%=newgoodsinfo.get(4).getGname() %>"
										src="<%=newgoodsinfo.get(4).getImg() %>">
									<br /><%=newgoodsinfo.get(4).getGname() %></a>
							</td>
							<td>
								<a
									href="goodsdetail?goodsname=<%=newgoodsinfo.get(5).getGname() %>"><img
										alt="<%=newgoodsinfo.get(5).getGname() %>"
										src="<%=newgoodsinfo.get(5).getImg() %>">
									<br /><%=newgoodsinfo.get(5).getGname() %></a>
							</td>
						</tr>
						<tr>
							<td>
								<a
									href="goodsdetail?goodsname=<%=newgoodsinfo.get(6).getGname() %>"><img
										alt="<%=newgoodsinfo.get(6).getGname() %>"
										src="<%=newgoodsinfo.get(6).getImg() %>">
									<br /><%=newgoodsinfo.get(6).getGname() %></a>
							</td>
							<td>
								<a
									href="goodsdetail?goodsname=<%=newgoodsinfo.get(7).getGname() %>"><img
										alt="<%=newgoodsinfo.get(7).getGname() %>"
										src="<%=newgoodsinfo.get(7).getImg() %>">
									<br /><%=newgoodsinfo.get(7).getGname() %></a>
							</td>
							<td>
								<a
									href="goodsdetail?goodsname=<%=newgoodsinfo.get(8).getGname() %>"><img
										alt="<%=newgoodsinfo.get(8).getGname() %>"
										src="<%=newgoodsinfo.get(8).getImg() %>">
									<br /><%=newgoodsinfo.get(8).getGname() %></a>
							</td>
						</tr>
					</table>
				</div>
				<!-- 活动促销 -->
				<div
					style="clear: both; display: none;"
					id="cen2">
					<table>
						<tr>
							<td>
								<a
									href="goodsdetail?goodsname=<%=cheapgoodsinfo.get(0).getGname() %>"><img
										alt="<%=cheapgoodsinfo.get(0).getGname() %>"
										src="<%=cheapgoodsinfo.get(0).getImg() %>">
									<br /><%=cheapgoodsinfo.get(0).getGname() %><br>原价：<%=cheapgoodsinfo.get(0).getPrice() %>元<br />现价：<font
									size="6px"><%=cheapgoodsinfo.get(0).getPrice()*cheapgoodsinfo.get(0).getAcount() %>元</font>
								</a>
							</td>
							<td>
								<a
									href="goodsdetail?goodsname=<%=cheapgoodsinfo.get(1).getGname() %>"><img
										alt="<%=cheapgoodsinfo.get(1).getGname() %>"
										src="<%=cheapgoodsinfo.get(1).getImg() %>">
									<br /><%=cheapgoodsinfo.get(1).getGname() %><br>原价：<%=cheapgoodsinfo.get(1).getPrice() %>元<br />现价：<font
									size="6px"><%=cheapgoodsinfo.get(1).getPrice()*cheapgoodsinfo.get(1).getAcount() %>元</font>
								</a>
							</td>
							<td>
								<a
									href="goodsdetail?goodsname=<%=cheapgoodsinfo.get(2).getGname() %>"><img
										alt="<%=cheapgoodsinfo.get(2).getGname() %>"
										src="<%=cheapgoodsinfo.get(2).getImg() %>">
									<br /><%=cheapgoodsinfo.get(2).getGname() %><br>原价：<%=cheapgoodsinfo.get(2).getPrice() %>元<br />现价：<font
									size="6px"><%=cheapgoodsinfo.get(2).getPrice()*cheapgoodsinfo.get(2).getAcount() %>元</font>
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a
									href="goodsdetail?goodsname=<%=cheapgoodsinfo.get(3).getGname() %>"><img
										alt="<%=cheapgoodsinfo.get(3).getGname() %>"
										src="<%=cheapgoodsinfo.get(3).getImg() %>">
									<br /><%=cheapgoodsinfo.get(3).getGname() %><br>原价：<%=cheapgoodsinfo.get(3).getPrice() %>元<br />现价：<font
									size="6px"><%=cheapgoodsinfo.get(3).getPrice()*cheapgoodsinfo.get(3).getAcount() %>元</font>
								</a>
							</td>
							<td>
								<a
									href="goodsdetail?goodsname=<%=cheapgoodsinfo.get(4).getGname() %>"><img
										alt="<%=cheapgoodsinfo.get(4).getGname() %>"
										src="<%=cheapgoodsinfo.get(4).getImg() %>">
									<br /><%=cheapgoodsinfo.get(4).getGname() %><br>原价：<%=cheapgoodsinfo.get(4).getPrice() %>元<br />现价：<font
									size="6px"><%=cheapgoodsinfo.get(4).getPrice()*cheapgoodsinfo.get(4).getAcount() %>元</font>
								</a>
							</td>
							<td>
								<a
									href="goodsdetail?goodsname=<%=cheapgoodsinfo.get(5).getGname() %>"><img
										alt="<%=cheapgoodsinfo.get(5).getGname() %>"
										src="<%=cheapgoodsinfo.get(5).getImg() %>">
									<br /><%=cheapgoodsinfo.get(5).getGname() %><br>原价：<%=cheapgoodsinfo.get(5).getPrice() %>元<br />现价：<font
									size="6px"><%=cheapgoodsinfo.get(5).getPrice()*cheapgoodsinfo.get(5).getAcount() %>元</font>
								</a>
							</td>
						</tr>
						<tr>
							<td>
								<a
									href="goodsdetail?goodsname=<%=cheapgoodsinfo.get(6).getGname() %>"><img
										alt="<%=cheapgoodsinfo.get(6).getGname() %>"
										src="<%=cheapgoodsinfo.get(6).getImg() %>">
									<br /><%=cheapgoodsinfo.get(6).getGname() %><br>原价：<%=cheapgoodsinfo.get(6).getPrice() %>元<br />现价：<font
									size="6px"><%=cheapgoodsinfo.get(6).getPrice()*cheapgoodsinfo.get(6).getAcount() %>元</font>
								</a>
							</td>
							<td>
								<a
									href="goodsdetail?goodsname=<%=cheapgoodsinfo.get(7).getGname() %>"><img
										alt="<%=cheapgoodsinfo.get(7).getGname() %>"
										src="<%=cheapgoodsinfo.get(7).getImg() %>">
									<br /><%=cheapgoodsinfo.get(7).getGname() %><br>原价：<%=cheapgoodsinfo.get(7).getPrice() %>元<br />现价：<font
									size="6px"><%=cheapgoodsinfo.get(7).getPrice()*cheapgoodsinfo.get(7).getAcount() %>元</font>
								</a>
							</td>
							<td>
								<a
									href="goodsdetail?goodsname=<%=cheapgoodsinfo.get(8).getGname() %>"><img
										alt="<%=cheapgoodsinfo.get(8).getGname() %>"
										src="<%=cheapgoodsinfo.get(8).getImg() %>">
									<br /><%=cheapgoodsinfo.get(8).getGname() %><br>原价：<%=cheapgoodsinfo.get(8).getPrice() %>元<br />现价：<font
									size="6px"><%=cheapgoodsinfo.get(8).getPrice()*cheapgoodsinfo.get(8).getAcount() %>元</font>
								</a>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</body>
</html>
<script type="text/javascript">
			function cen(id){
				for(var i=1;i<=2;i++){
					document.getElementById("cen"+i).style.display="none";
				document.getElementById("c"+i).style.background="white";
				}
				document.getElementById("c"+id).style.background="orange";
				document.getElementById("cen"+id).style.display="";
			}

	function fun_center() {
		var mg = (screen.width - 990) / 2;
		document.getElementById("maxdiv").style.marginLeft = mg;
	}
	fun_center();
	
	function checked()
	{
		var goods = document.getElementById("selectinfo").value;
		if(!goods){
			document.getElementById("selectinfo").value="请输入要搜索的商品信息";
			return false;
		}
	}
	function fenlei(id){
		document.getElementById(id).style.display="";				
	}
	function fenout(id){
		document.getElementById(id).style.display="none";				
	}
</script>