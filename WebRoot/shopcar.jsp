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
    
    <title>My JSP 'shopcar.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style>
	select{
		font-size:13pt;
		font-family:Verdana;
	}
	a{
		color:red;
		text-decoration:none;
	}
	a:hover{
		text-decoration:underline;
	}
	</style>
  </head>
  <script type="text/javascript">
	function fenlei(id){
		document.getElementById(id).style.display="";				
	}
	function fenout(id){
		document.getElementById(id).style.display="none";				
	}
  </script>
  <body onload="setup()">
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
						<form action="selectgoods" method="post" onsubmit="return checked()">
							<input type="text" name="selectinfo" id="selectinfo"
								style="width: 250px; height: 30px;">
							<input type="submit" value="搜  索"
								style="width: 90px; height: 30px">
						</form>
		</div>
   </div>
   <!-- 购物车显示栏 -->
   <div>
   	您的位置：<a href="index">首页</a>>我的购物车
   	<c:choose>
	   	<c:when test="${empty shopcarinfo}">
	   	<table>
	   	<tr>
	   	<td><img src="img/shopcar.jpg"/></td>
	   	<td>您的购物车还是空的，赶紧行动吧。。。。</td>
	   	</tr>
	   	</table>
	   	</c:when>
   	<c:otherwise>
   	<form action="jiesuan" method="post" onsubmit="return check()">
   	<table width="100%">
   	<tr background="#aaaaaa">
   	<td><input type="checkbox" name="allchecked" id="allchecked" onclick="allchecked1()" >全选&nbsp;&nbsp;&nbsp;&nbsp;商品</td><td>商品信息</td><td>单价</td><td>数量</td><td>小计</td><td>操作</td>
   	</tr>
   	<c:forEach var="shopcarinfo" items="${shopcarinfo}" varStatus="i">
   	<tr>
   		<td><input type="checkbox" name="checked" id="checked${i.count }" value="${shopcarinfo.gname }" onclick="unbuy('${i.count}')"><img src="${shopcarinfo.img }" style="width:150px;height:50px;"></td>
   		<td>${shopcarinfo.gname }</td>
   		
   		<td>${shopcarinfo.price }元<input type="hidden" id="price${i.count }" value="${shopcarinfo.price }"></td>
   		<td><input type="button" value="-" onclick="changenum('1','${i.count }')">
   		<input type="text" value="${shopcarinfo.gnum }" id='${i.count }' style="width:50px;" readonly="readonly">
   		<input type="button" value="+" onclick="changenum('2','${i.count }')"></td>
   		<td><span id="money${i.count }">${shopcarinfo.price*shopcarinfo.gnum }元</span></td>
   		<td><a href="delete?goodsname=${shopcarinfo.gname }">删除</a></td>
   	</tr>
   	</c:forEach>
   	<tr>
   	<td colspan="5" style="text-align: right;">总计：<input type="button" value="购   买" id="buybutton" disabled onclick="jiesuan()"></td>
   	</tr>
   	</table>
   	 <div style="border:1 solid red;display:none;" id="u7">
   请填写以下信息：
   <br/>
   <table>
   <tr>
   <td>选择所在地：</td>
   <td>
		<select id="s1"><option>省份</option></select>
		<select id="s2"><option>地级市</option></select>
		<select id="s3"><option value="市、县级市、县">市、县级市、县</option></select>
		<span id="a1" style="color: red"></span>
	</td>
	</tr>
	<tr>
	<td>街道地址：</td><td><textarea rows="6" cols="60" id="address" name="address"></textarea><span id="a2" style="color: red"></span></td>
	</tr>
	<tr>
	<td>收货人姓名：</td><td><input type="text" name="emailname" id="emailname"><span id="a3" style="color: red"></span></td>
	</tr>
	<tr>
	<td>手机号码：</td><td><input type="text" name="phone" id="phone"><span id="a4" style="color: red"></span></td>
	</tr>
	<tr>
	<td>
	</td>
	<td><input type="submit" value="确  认">&nbsp;&nbsp;&nbsp;<input type="button" value="取  消" onclick="quxiao()"></td>
	</tr>
	</table>
	</form>
</div>
</c:otherwise>
</c:choose>
   </div>
   </div>
  </body>
</html>
<script>
function allchecked1()
{
	var checkgoods = document.getElementsByName("checked");
	if(document.getElementById("allchecked").checked){
		document.getElementById("buybutton").disabled=false;
		for(j=0;j<checkgoods.length;j++){
			var x = j+1;
			document.getElementById("checked"+x).checked=true;
			}	
	}else{
		document.getElementById("buybutton").disabled=true;
		for(j=0;j<checkgoods.length;j++){
			var x = j+1;
			document.getElementById("checked"+x).checked=false;
			}	
		}
}
function unbuy(i)
{
	if(document.getElementById("checked"+i).checked==true){

		document.getElementById("buybutton").disabled=false;
	}
	if(document.getElementById("checked"+i).checked==false){
		var checkgoods = document.getElementsByName("checked");
		for(j=0;j<checkgoods.length;j++){
			if(checkgoods[j].checked){
					document.getElementById("buybutton").disabled=false;
					break;
			}	
			if(j==checkgoods.length-1){
				document.getElementById("allchecked").checked=false;
				document.getElementById("buybutton").disabled=true;
			}
		}
	}
}
function check()
{
	var province = document.getElementById("s1").value;
	var city = document.getElementById("s2").value;
	var country = document.getElementById("s3").value;
	var address = document.getElementById("address").value;
	var emailname = document.getElementById("emailname").value;
	var phone = document.getElementById("phone").value;
	if(country=="市、县级市、县"){
		a1.innerHTML="请选择收货城市";
		return false;
	}
	if(!address){
		a1.innerHTML="";
		a2.innerHTML="请填写详细地址"
		return false;
	}
	if(!emailname){
		a2.innerHTML=""
		a3.innerHTML="请填写收货人"
		return false;
	}if(!phone || isNaN(phone)) {
		a3.innerHTML=""
		a4.innerHTML="请正确填写联系电话";
		return false;
		}
}
function jiesuan()
{
	document.getElementById("u7").style.display="";
}
function quxiao()
{
	document.getElementById("u7").style.display="none";
}
function changenum(id,num)
{
if(id==1){
	if(parseInt(document.getElementById(num).value)>1){
		document.getElementById(num).value=parseInt(document.getElementById(num).value)-1;
		document.getElementById("money"+num).innerHTML=parseFloat(document.getElementById("price"+num).value)*parseInt(document.getElementById(num).value);
		}
	}
if(id==2){
	document.getElementById(num).value=parseInt(document.getElementById(num).value)+1;
	document.getElementById("money"+num).innerHTML=parseFloat(document.getElementById("price"+num).value)*parseInt(document.getElementById(num).value);
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
function Dsy()
{
	this.Items = {};
}
Dsy.prototype.add = function(id,iArray)
{
	this.Items[id] = iArray;
}
Dsy.prototype.Exists = function(id)
{
	if(typeof(this.Items[id]) == "undefined") 
		return false;
	return true;
}
function change(v)
{
	var str="0";
	for(i=0;i<v;i++){ str+=("_"+(document.getElementById(s[i]).selectedIndex-1));};
	var ss=document.getElementById(s[v]);
	with(ss){
		length = 0;
		options[0]=new Option(opt0[v],opt0[v]);
		if(v && document.getElementById(s[v-1]).selectedIndex>0 || !v)
		{
			if(dsy.Exists(str)){
				ar = dsy.Items[str];
				for(i=0;i<ar.length;i++)
					options[length]=new Option(ar[i],ar[i]);
				if(v)options[1].selected = true;
			}
		}
		if(++v<s.length){
			change(v);
		}
	}
}
var dsy = new Dsy();
dsy.add("0",["北京","安徽","福建","甘肃","广东","广西","贵州","海南","河北","河南","黑龙江","湖北","湖南","吉林","江苏","江西","辽宁","内蒙古","宁夏","青海","山东","山西","陕西","上海","四川","天津","西藏","新疆","云南","浙江","重庆"]);
dsy.add("0_0",["北京"]);
dsy.add("0_0_0",["北京市","东城","西城","崇文","宣武","朝阳","丰台","石景山","海淀","门头沟","房山","通州","顺义","昌平","大兴","平谷","怀柔","密云","延庆"]);
dsy.add("0_1",["安庆","蚌埠","巢湖","池州","滁州","阜阳","合肥","淮北","淮南","黄山","六安","马鞍山","宿州","铜陵","芜湖","宣城","亳州"]);
dsy.add("0_1_0",["安庆市","怀宁县","潜山县","宿松县","太湖县","桐城市","望江县","岳西县","枞阳县"]);
dsy.add("0_1_1",["蚌埠市","固镇县","怀远县","五河县"]);
dsy.add("0_1_2",["巢湖市","含山县","和县","庐江县","无为县"]);
dsy.add("0_1_3",["池州市","东至县","青阳县","石台县"]);
dsy.add("0_1_4",["滁州市","定远县","凤阳县","来安县","明光市","全椒县","天长市"]);
dsy.add("0_1_5",["阜南县","阜阳市","界首市","临泉县","太和县","颖上县"]);
dsy.add("0_1_6",["长丰县","肥东县","肥西县"]);
dsy.add("0_1_7",["淮北市","濉溪县"]);
dsy.add("0_1_8",["凤台县","淮南市"]);
dsy.add("0_1_9",["黄山市","祁门县","休宁县","歙县","黟县"]);
dsy.add("0_1_10",["霍邱县","霍山县","金寨县","六安市","寿县","舒城县"]);
dsy.add("0_1_11",["当涂县","马鞍山市"]);
dsy.add("0_1_12",["灵璧县","宿州市","萧县","泗县","砀山县"]);
dsy.add("0_1_13",["铜陵市","铜陵县"]);
dsy.add("0_1_14",["繁昌县","南陵县","芜湖市","芜湖县"]);
dsy.add("0_1_15",["广德县","绩溪县","郎溪县","宁国市","宣城市","泾县","旌德县"]);
dsy.add("0_1_16",["利辛县","蒙城县","涡阳县","亳州市"]);
dsy.add("0_2",["福州","龙岩","南平","宁德","莆田","泉州","三明","厦门","漳州"]);
dsy.add("0_2_0",["长乐市","福清市","福州市","连江县","罗源县","闽侯县","闽清县","平潭县","永泰县"]);
dsy.add("0_2_1",["长汀县","连城县","龙岩市","上杭县","武平县","永定县","漳平市"]);
dsy.add("0_2_2",["光泽县","建阳市","建瓯市","南平市","浦城县","邵武市","顺昌县","松溪县","武夷山市","政和县"]);
dsy.add("0_2_3",["福安市","福鼎市","古田县","宁德市","屏南县","寿宁县","霞浦县","周宁县","柘荣县"]);
dsy.add("0_2_4",["莆田市","仙游县"]);
dsy.add("0_2_5",["安溪县","德化县","惠安县","金门县","晋江市","南安市","泉州市","石狮市","永春县"]);
dsy.add("0_2_6",["大田县","建宁县","将乐县","明溪县","宁化县","清流县","三明市","沙县","泰宁县","永安市","尤溪县"]);
dsy.add("0_2_7",["厦门市"]);
dsy.add("0_2_8",["长泰县","东山县","华安县","龙海市","南靖县","平和县","云霄县","漳浦县","漳州市","诏安县"]);
dsy.add("0_3",["白银","定西","甘南藏族自治州","嘉峪关","金昌","酒泉","兰州","临夏回族自治州","陇南","平凉","庆阳","天水","武威","张掖"]);
dsy.add("0_3_0",["白银市","会宁县","景泰县","靖远县"]);
dsy.add("0_3_1",["定西县","临洮县","陇西县","通渭县","渭源县","漳县","岷县"]);
dsy.add("0_3_2",["迭部县","合作市","临潭县","碌曲县","玛曲县","夏河县","舟曲县","卓尼县"]);
dsy.add("0_3_3",["嘉峪关市"]);
dsy.add("0_3_4",["金昌市","永昌县"]);
dsy.add("0_3_5",["阿克塞哈萨克族自治县","安西县","敦煌市","金塔县","酒泉市","肃北蒙古族自治县","玉门市"]);
dsy.add("0_3_6",["皋兰县","兰州市","永登县","榆中县"]);
dsy.add("0_3_7",["东乡族自治县","广河县","和政县","积石山保安族东乡族撒拉族自治县","康乐县","临夏市","临夏县","永靖县"]);
dsy.add("0_3_8",["成县","徽县","康县","礼县","两当县","文县","武都县","西和县","宕昌县"]);
dsy.add("0_3_9",["崇信县","华亭县","静宁县","灵台县","平凉市","庄浪县","泾川县"]);
dsy.add("0_3_10",["合水县","华池县","环县","宁县","庆城县","庆阳市","镇原县","正宁县"]);
dsy.add("0_3_11",["甘谷县","秦安县","清水县","天水市","武山县","张家川回族自治县"]);
dsy.add("0_3_12",["古浪县","民勤县","天祝藏族自治县","武威市"]);
dsy.add("0_3_13",["高台县","临泽县","民乐县","山丹县","肃南裕固族自治县","张掖市"]);
dsy.add("0_4",["潮州","东莞","佛山","广州","河源","惠州","江门","揭阳","茂名","梅州","清远","汕头","汕尾","韶关","深圳","阳江","云浮","湛江","肇庆","中山","珠海"]);
dsy.add("0_4_0",["潮安县","潮州市","饶平县"]);
dsy.add("0_4_1",["东莞市"]);
dsy.add("0_4_2",["佛山市"]);
dsy.add("0_4_3",["从化市","广州市","增城市"]);
dsy.add("0_4_4",["东源县","和平县","河源市","连平县","龙川县","紫金县"]);
dsy.add("0_4_5",["博罗县","惠东县","惠阳市","惠州市","龙门县"]);
dsy.add("0_4_6",["恩平市","鹤山市","江门市","开平市","台山市"]);
dsy.add("0_4_7",["惠来县","揭东县","揭西县","揭阳市","普宁市"]);
dsy.add("0_4_8",["电白县","高州市","化州市","茂名市","信宜市"]);
dsy.add("0_4_9",["大埔县","丰顺县","蕉岭县","梅县","梅州市","平远县","五华县","兴宁市"]);
dsy.add("0_4_10",["佛冈县","连南瑶族自治县","连山壮族瑶族自治县","连州市","清新县","清远市","阳山县","英德市"]);
dsy.add("0_4_11",["潮阳市","澄海市","南澳县","汕头市"]);
dsy.add("0_4_12",["海丰县","陆丰市","陆河县","汕尾市"]);
dsy.add("0_4_13",["乐昌市","南雄市","曲江县","仁化县","乳源瑶族自治县","韶关市","始兴县","翁源县","新丰县"]);
dsy.add("0_4_14",["深圳市"]);
dsy.add("0_4_15",["阳春市","阳东县","阳江市","阳西县"]);
dsy.add("0_4_16",["罗定市","新兴县","郁南县","云安县","云浮市"]);
dsy.add("0_4_17",["雷州市","廉江市","遂溪县","吴川市","徐闻县","湛江市"]);
dsy.add("0_4_18",["德庆县","封开县","高要市","广宁县","怀集县","四会市","肇庆市"]);
dsy.add("0_4_19",["中山市"]);
dsy.add("0_4_20",["珠海市"]);
dsy.add("0_5",["百色","北海","崇左","防城港","桂林","贵港","河池","贺州","来宾","柳州","南宁","钦州","梧州","玉林"]);
dsy.add("0_5_0",["百色市","德保县","靖西县","乐业县","凌云县","隆林各族自治县","那坡县","平果县","田东县","田林县","田阳县","西林县"]);
dsy.add("0_5_1",["北海市","合浦县"]);
dsy.add("0_5_2",["崇左市","大新县","扶绥县","龙州县","宁明县","凭祥市","天等县"]);
dsy.add("0_5_3",["东兴市","防城港市","上思县"]);
dsy.add("0_5_4",["恭城瑶族自治县","灌阳县","桂林市","荔浦县","临桂县","灵川县","龙胜各族自治县","平乐县","全州县","兴安县","阳朔县","永福县","资源县"]);
dsy.add("0_5_5",["桂平市","贵港市","平南县"]);
dsy.add("0_5_6",["巴马瑶族自治县","大化瑶族自治县","东兰县","都安瑶族自治县","凤山县","河池市","环江毛南族自治县","罗城仡佬族自治县","南丹县","天峨县","宜州市"]);
dsy.add("0_5_7",["富川瑶族自治县","贺州市","昭平县","钟山县"]);
dsy.add("0_5_8",["合山市","金秀瑶族自治县","来宾市","武宣县","象州县","忻城县"]);
dsy.add("0_5_9",["柳城县","柳江县","柳州市","鹿寨县","融安县","融水苗族自治县","三江侗族自治县"]);
dsy.add("0_5_10",["宾阳县","横县","隆安县","马山县","南宁市","上林县","武鸣县","邕宁县"]);
dsy.add("0_5_11",["灵山县","浦北县","钦州市"]);
dsy.add("0_5_12",["苍梧县","蒙山县","藤县","梧州市","岑溪市"]);
dsy.add("0_5_13",["北流市","博白县","陆川县","容县","兴业县","玉林市"]);
dsy.add("0_6",["安顺","毕节","贵阳","六盘水","黔东南苗族侗族自治州","黔南布依族苗族自治州","黔西南布依族苗族自治州","铜仁","遵义"]);
dsy.add("0_6_0",["安顺市","关岭布依族苗族自治县","平坝县","普定县","镇宁布依族苗族自治县","紫云苗族布依族自治县"]);
dsy.add("0_6_1",["毕节市","大方县","赫章县","金沙县","纳雍县","黔西县","威宁彝族回族苗族自治县","织金县"]);
dsy.add("0_6_2",["贵阳市","开阳县","清镇市","息烽县","修文县"]);
dsy.add("0_6_3",["六盘水市","六枝特区","盘县","水城县"]);
dsy.add("0_6_4",["从江县","丹寨县","黄平县","剑河县","锦屏县","凯里市","雷山县","黎平县","麻江县","三穗县","施秉县","台江县","天柱县","镇远县","岑巩县","榕江县"]);
dsy.add("0_6_5",["长顺县","都匀市","独山县","福泉市","贵定县","惠水县","荔波县","龙里县","罗甸县","平塘县","三都水族自治县","瓮安县"]);
dsy.add("0_6_6",["安龙县","册亨县","普安县","晴隆县","望谟县","兴仁县","兴义市","贞丰县"]);
dsy.add("0_6_7",["德江县","江口县","石阡县","思南县","松桃苗族自治县","铜仁市","万山特区","沿河土家族自治县","印江土家族苗族自治县","玉屏侗族自治县"]);
dsy.add("0_6_8",["赤水市","道真仡佬族苗族自治县","凤冈县","仁怀市","绥阳县","桐梓县","务川仡佬族苗族自治县","习水县","余庆县","正安县","遵义市","遵义县","湄潭县"]);
dsy.add("0_7",["白沙黎族自治县","保亭黎族苗族自治县","昌江黎族自治县","澄迈县","定安县","东方","海口","乐东黎族自治县","临高县","陵水黎族自治县","琼海","琼中黎族苗族自治县","三亚","屯昌县","万宁","文昌","五指山","儋州"]);
dsy.add("0_7_0",["白沙黎族自治县"]);
dsy.add("0_7_1",["保亭黎族苗族自治县"]);
dsy.add("0_7_2",["昌江黎族自治县"]);
dsy.add("0_7_3",["澄迈县"]);
dsy.add("0_7_4",["定安县"]);
dsy.add("0_7_5",["东方市"]);
dsy.add("0_7_6",["海口市"]);
dsy.add("0_7_7",["乐东黎族自治县"]);
dsy.add("0_7_8",["临高县"]);
dsy.add("0_7_9",["陵水黎族自治县"]);
dsy.add("0_7_10",["琼海市"]);
dsy.add("0_7_11",["琼中黎族苗族自治县"]);
dsy.add("0_7_12",["三亚市"]);
dsy.add("0_7_13",["屯昌县"]);
dsy.add("0_7_14",["万宁市"]);
dsy.add("0_7_15",["文昌市"]);
dsy.add("0_7_16",["五指山市"]);
dsy.add("0_7_17",["儋州市"]);
dsy.add("0_8",["保定","沧州","承德","邯郸","衡水","廊坊","秦皇岛","石家庄","唐山","邢台","张家口"]);
dsy.add("0_8_0",["安国市","安新县","保定市","博野县","定兴县","定州市","阜平县","高碑店市","高阳县","满城县","清苑县","曲阳县","容城县","顺平县","唐县","望都县","雄县","徐水县","易县","涞水县","涞源县","涿州市","蠡县"]);
dsy.add("0_8_1",["泊头市","沧县","沧州市","东光县","海兴县","河间市","黄骅市","孟村回族自治县","南皮县","青县","任丘市","肃宁县","吴桥县","献县","盐山县"]);
dsy.add("0_8_2",["承德市","承德县","丰宁满族自治县","宽城满族自治县","隆化县","滦平县","平泉县","围场满族蒙古族自治县","兴隆县"]);
dsy.add("0_8_3",["成安县","磁县","大名县","肥乡县","馆陶县","广平县","邯郸市","邯郸县","鸡泽县","临漳县","邱县","曲周县","涉县","魏县","武安市","永年县"]);
dsy.add("0_8_4",["安平县","阜城县","故城县","衡水市","冀州市","景县","饶阳县","深州市","武强县","武邑县","枣强县"]);
dsy.add("0_8_5",["霸州市","大厂回族自治县","大城县","固安县","廊坊市","三河市","文安县","香河县","永清县"]);
dsy.add("0_8_6",["昌黎县","抚宁县","卢龙县","秦皇岛市","青龙满族自治县"]);
dsy.add("0_8_7",["高邑县","晋州市","井陉县","灵寿县","鹿泉市","平山县","深泽县","石家庄市","无极县","辛集市","新乐市","行唐县","元氏县","赞皇县","赵县","正定县","藁城市","栾城县"]);
dsy.add("0_8_8",["乐亭县","滦南县","滦县","迁安市","迁西县","唐海县","唐山市","玉田县","遵化市"]);
dsy.add("0_8_9",["柏乡县","广宗县","巨鹿县","临城县","临西县","隆尧县","南宫市","南和县","内丘县","宁晋县","平乡县","清河县","任县","沙河市","威县","新河县","邢台市","邢台县"]);
dsy.add("0_8_10",["赤城县","崇礼县","沽源县","怀安县","怀来县","康保县","尚义县","万全县","蔚县","宣化县","阳原县","张北县","张家口市","涿鹿县"]);
dsy.add("0_9",["安阳","鹤壁","济源","焦作","开封","洛阳","南阳","平顶山","三门峡","商丘","新乡","信阳","许昌","郑州","周口","驻马店","漯河","濮阳"]);
dsy.add("0_9_0",["安阳市","安阳县","滑县","林州市","内黄县","汤阴县"]);
dsy.add("0_9_1",["","鹤壁市","浚县","淇县"]);
dsy.add("0_9_2",["济源市"]);
dsy.add("0_9_3",["博爱县","焦作市","孟州市","沁阳市","温县","武陟县","修武县"]);
dsy.add("0_9_4",["开封市","开封县","兰考县","通许县","尉氏县","杞县"]);
dsy.add("0_9_5",["洛宁县","洛阳市","孟津县","汝阳县","新安县","伊川县","宜阳县","偃师市","嵩县","栾川县"]);
dsy.add("0_9_6",["邓州市","方城县","南阳市","南召县","内乡县","社旗县","唐河县","桐柏县","西峡县","新野县","镇平县","淅川县"]);
dsy.add("0_9_7",["宝丰县","鲁山县","平顶山市","汝州市","舞钢市","叶县","郏县"]);
dsy.add("0_9_8",["灵宝市","卢氏县","三门峡市","陕县","义马市","渑池县"]);
dsy.add("0_9_9",["民权县","宁陵县","商丘市","夏邑县","永城市","虞城县","柘城县","睢县"]);
dsy.add("0_9_10",["长垣县","封丘县","辉县市","获嘉县","卫辉市","新乡市","新乡县","延津县","原阳县"]);
dsy.add("0_9_11",["固始县","光山县","淮滨县","罗山县","商城县","息县","新县","信阳市","潢川县"]);
dsy.add("0_9_12",["长葛市","襄城县","许昌市","许昌县","禹州市","鄢陵县"]);
dsy.add("0_9_13",["登封市","巩义市","新密市","新郑市","郑州市","中牟县","荥阳市"]);
dsy.add("0_9_14",["郸城县","扶沟县","淮阳县","鹿邑县","商水县","沈丘县","太康县","西华县","项城市","周口市"]);
dsy.add("0_9_15",["泌阳县","平舆县","确山县","汝南县","上蔡县","遂平县","西平县","新蔡县","正阳县","驻马店市"]);
dsy.add("0_9_16",["临颍县","舞阳县","郾城县","漯河市"]);
dsy.add("0_9_17",["范县","南乐县","清丰县","台前县","濮阳市","濮阳县"]);
dsy.add("0_10",["大庆","大兴安岭","哈尔滨","鹤岗","黑河","鸡西","佳木斯","牡丹江","七台河","齐齐哈尔","双鸭山","绥化","伊春"]);
dsy.add("0_10_0",["大庆市","杜尔伯特蒙古族自治县","林甸县","肇源县","肇州县"]);
dsy.add("0_10_1",["呼玛县","漠河县","塔河县"]);
dsy.add("0_10_2",["阿城市","巴彦县","宾县","方正县","哈尔滨市","呼兰县","木兰县","尚志市","双城市","通河县","五常市","延寿县","依兰县"]);
dsy.add("0_10_3",["鹤岗市","萝北县","绥滨县"]);
dsy.add("0_10_4",["北安市","黑河市","嫩江县","孙吴县","五大连池市","逊克县"]);
dsy.add("0_10_5",["虎林市","鸡东县","鸡西市","密山市"]);
dsy.add("0_10_6",["抚远县","富锦市","佳木斯市","汤原县","同江市","桦川县","桦南县"]);
dsy.add("0_10_7",["东宁县","海林市","林口县","牡丹江市","穆棱市","宁安市","绥芬河市"]);
dsy.add("0_10_8",["勃利县","七台河市"]);
dsy.add("0_10_9",["拜泉县","富裕县","甘南县","克东县","克山县","龙江县","齐齐哈尔市","泰来县","依安县","讷河市"]);
dsy.add("0_10_10",["宝清县","集贤县","饶河县","双鸭山市","友谊县"]);
dsy.add("0_10_11",["安达市","海伦市","兰西县","明水县","青冈县","庆安县","绥化市","绥棱县","望奎县","肇东市"]);
dsy.add("0_10_12",["嘉荫县","铁力市","伊春市"]);
dsy.add("0_11",["鄂州","恩施土家族苗族自治州","黄冈","黄石","荆门","荆州","潜江","神农架林区","十堰","随州","天门","武汉","仙桃","咸宁","襄樊","孝感","宜昌"]);
dsy.add("0_11_0",["鄂州市"]);
dsy.add("0_11_1",["巴东县","恩施市","鹤峰县","建始县","来凤县","利川市","咸丰县","宣恩县"]);
dsy.add("0_11_2",["红安县","黄冈市","黄梅县","罗田县","麻城市","团风县","武穴市","英山县","蕲春县","浠水县"]);
dsy.add("0_11_3",["大冶市","黄石市","阳新县"]);
dsy.add("0_11_4",["荆门市","京山县","沙洋县","钟祥市"]);
dsy.add("0_11_5",["公安县","洪湖市","监利县","江陵县","荆州市","石首市","松滋市"]);
dsy.add("0_11_6",["潜江市"]);
dsy.add("0_11_7",["神农架林区"]);
dsy.add("0_11_8",["丹江口市","房县","十堰市","郧西县","郧县","竹山县","竹溪县"]);
dsy.add("0_11_9",["广水市","随州市"]);
dsy.add("0_11_10",["天门市"]);
dsy.add("0_11_11",["武汉市"]);
dsy.add("0_11_12",["仙桃市"]);
dsy.add("0_11_13",["赤壁市","崇阳县","嘉鱼县","通城县","通山县","咸宁市"]);
dsy.add("0_11_14",["保康县","谷城县","老河口市","南漳县","襄樊市","宜城市","枣阳市"]);
dsy.add("0_11_15",["安陆市","大悟县","汉川市","孝昌县","孝感市","应城市","云梦县"]);
dsy.add("0_11_16",["长阳土家族自治县","当阳市","五峰土家族自治县","兴山县","宜昌市","宜都市","远安县","枝江市","秭归县"]);
dsy.add("0_30",["重庆"]);
dsy.add("0_30_0",["城口县","大足县","垫江县","丰都县","奉节县","合川市","江津市","开县","梁平县","南川市","彭水苗族土家族自治县","荣昌县","石柱土家族自治县","铜梁县","巫山县","巫溪县","武隆县","秀山土家族苗族自治县","永川市","酉阳土家族苗族自治县","云阳县","忠县","重庆市","潼南县","璧山县","綦江县"]);

</SCRIPT>
<SCRIPT LANGUAGE = JavaScript>
var s=["s1","s2","s3"];
var opt0 = ["省份","地级市","市、县级市、县"];
function setup()
{
	for(i=0;i<s.length-1;i++)
		document.getElementById(s[i]).onchange=new Function("change("+(i+1)+")");
	change(0);
}
</SCRIPT>