<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
	<title></title>
	<link rel="stylesheet" type="text/css" href="${rootPath}css/customer/bootstrap.min.css">
	<link rel="stylesheet" href="${rootPath}css/customer/public.css">
	<link rel="stylesheet" type="text/css" href="${rootPath}css/customer/time.css">
</head>
<body>
<body>
<ul class="list-group">
  <li class="list-group-item">${ingName}</li><!-- 顶部的  配料名 -->
   <li class="list-group-item"></li>  <!--  制空的 一个  没有实际用处的快 -->
   <!--  此处  每出现一个   第几次进货  就是一个快  -->
<c:forEach items="${stockDetails}" var="s" varStatus="status">
	<c:if test="${status.index==0 }">
		<li class="list-group-item list-group-item-success">最近进货</li>
		  <li class="list-group-item">
			    <span class="badge">${s.createDate}</span>
			    进货时间
		  </li>
		  <li class="list-group-item">
		  	<span class="badge">${s.place}</span>
			    进货地点
		  </li>
		      <li class="list-group-item">
		      溯源：
		      <pre>${s.origins}</pre>
		</li>
	</c:if>
	<c:if test="${status.index==1 }">
		<li class="list-group-item list-group-item-success">最近次进货</li> 
		  <li class="list-group-item">
			    <span class="badge">${s.createDate}</span>
			    进货时间
		  </li>
		  <li class="list-group-item">
		  	<span class="badge">${s.place}</span>
			    进货地点
		  </li>
		     <li class="list-group-item">
		    <pre> ${s.origins}</pre>
		</li>
	</c:if>
</c:forEach>
</ul>
	<!--  留白处 -->
   <div class="liubai">
   </div>
   <!-- 公共底部 -->
   <footer>
     <a href="${rootPath}customer/customer_toIndex?id=${userId}">
      <div class="left">
      	<div><img src="${rootPath}images/sy1.png" style="width:100%; height:100%; "></div>
      	
      	<p>首页</p>
      </div>
      </a>
      <a href="${rootPath}customer/cart_getCart">
      <div class="left">
      	<div><img src="${rootPath}images/gwc.png" style="width:100%; height:100%; "></div>
      	<p>购物车</p>
      </div>
      </a>
      <a href="${rootPath}customer/cart_getOrderDetails">
      <div class="left">
      	<div><img src="${rootPath}images/dd.png" style="width:70%; height:70%;"></div>
      	<p>订单</p>
      </div>
      </a>
   </footer>
</body>
</html>