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
<c:forEach items="${stockDetails}" var="s">
	<div class="panel panel-info">
		  <div class="panel-heading">
		    <h3 class="panel-title">第一次进货时间</h3>
		  </div>
		  <div class="panel-body">
		       ${s.createDate}
		  </div>
	</div>
</c:forEach>
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
         <div><img src="${rootPath}images/dd.png" height=70% width=70%></div>
         <p>订单</p>
      </div>
      </a>
   </footer>
</body>
</html>