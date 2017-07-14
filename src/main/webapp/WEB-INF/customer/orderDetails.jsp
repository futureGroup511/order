<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
	<title></title>
	<link rel="stylesheet" type="text/css" href="${rootPath}css/customer/bootstrap.min.css">
	<link rel="stylesheet" href="${rootPath}css/customer/public.css">
	<link rel="stylesheet" type="text/css" href="${rootPath}css/customer/order.css">
</head>
<body>
 <div class="header">
       <img src="${rootPath}images/left.png" alt="">
      我的订单
  <img src="${rootPath}images/right.png" alt="">
 </div>
 <div class="kong">
   
 </div>
<c:if test="${!empty orderDetails }">
<c:forEach items="${orderDetails}" var="o">
 <div class="ding">
    <div class="left photo">
       <img src="${rootPath}images/haixian.jpg" alt="" width="100px" height="90px">
    </div>
    <div class="right infors">
       <p><b>${o.menuName}</b></p>
       <%-- <p class="left jia">价格：</p><p class="red">￥${o.price}</p> --%>
       <p>数量：${o.menuNum}</p>
       <p class="left">状态：</p><p class="green">${o.status}</p>
    </div>
 </div>
</c:forEach>
<div class="num">
     <p class="left">订单号：${myId}</p>
     <p class="right red" style="">${total}</p><p class="right jia">总价：</p>
</div>
<a href="${rootPath}customer/cart_getReminder" class="cd">催单</a>
</c:if>
 <c:if test="${empty orderDetails }">
	<h1>你还没有下订单</h1>
 </c:if>
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
      <div class="left dingdan">
         <div><img src="${rootPath}images/dd.png" style="height:70%;width:70%;"></div>
         <p>订单</p>
      </div>
      </a>
   </footer>
</body>
</html>