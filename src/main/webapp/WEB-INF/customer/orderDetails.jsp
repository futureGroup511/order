<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
	<title></title>
	<link rel="stylesheet" type="text/css" href="../css/customer/bootstrap.min.css">
	<link rel="stylesheet" href="../css/customer/public.css">
	<link rel="stylesheet" type="text/css" href="../css/customer/order.css">
</head>
<body>
 <div class="header">
       <img src="../images/left.png" alt="">
      我的订单
  <img src="../images/right.png" alt="">
 </div>
 <div class="kong">
   
 </div>
<c:forEach items="${orderDetails}" var="o">
 <div class="ding">
    <div class="left photo">
       <img src="../images/haixian.jpg" alt="" width="100px" height="90px">
    </div>
    <div class="right infors">
       <p><b>${o.menuName}</b></p>
       <p class="left jia">价格：</p><p class="red">￥25.5</p>
       <p>数量：${o.menuNum}</p>
       <p class="left">状态：</p><p class="green">${o.status}</p>
    </div>
 </div>
   <div class="num">
       <p class="left">订单号：${o.orderId}</p>
      <p class="right red" style="">256</p><p class="right jia">总价：</p>
   </div>
</c:forEach>
   <a href="" class="cd">催单</a>
	<!--  留白处 -->
   <div class="liubai">
   </div>
   <!-- 公共底部 -->
   <footer>
       <a href="show.html">
      <div class="left">
         <div><img src="../images/sy1.png" style="width:100%; height:100%; "></div>
         <p>首页</p>
      </div>
      </a>
      <a href="shopping.html">
      <div class="left">
         <div><img src="../images/gwc.png" style="width:100%; height:100%; "></div>
         <p>购物车</p>
      </div>
      </a>
      <a href="order.html">
      <div class="left dingdan">
         <div><img src="../images/dd.png" style="height:70%;width:70%;"></div>
         <p>订单</p>
      </div>
      </a>
   </footer>
</body>
</html>
<%-- <head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>${addMeg}</h3>
<table border="1" width="300px" height="200px">
			<tr>
				<th>菜品名称</th>
				<th>菜品数量</th>
				<th>状态</th>
				<th>桌子id</th>
				<th>桌子名称</th>
			</tr>
			<c:forEach items="${orderDetails}" var="o">
				<tr>
					<td>${o.menuName}</td>
					<td>${o.menuNum}</td>
					<td>${o.status}</td>
					<td>${o.tableId}</td>
					<td>${o.tableName}</td>
				</tr>	
			</c:forEach>	
</table>
<a href="${rootPath}customer/customer_toIndex?id=${userId}">首页</a>
<a href="${rootPath}customer/cart_getCart">购物车</a>
<a href="${rootPath}customer/cart_getReminder">催单</a>
</body>
</html> --%>