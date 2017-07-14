<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
	<title>订餐管理系统</title>
	<link rel="stylesheet" type="text/css" href="${rootPath}css/customer/bootstrap.min.css">
	<link rel="stylesheet" href="${rootPath}css/customer/public.css">
	<link rel="stylesheet" href="${rootPath}css/customer/show.css">
</head>
<body>
      <!-- 头部 店铺与联系方式-->
   <div class="header">
     <div class="banner">
     	<img src="${rootPath}images/canting.jpg" alt="">
     </div>
     <div class="information">
         <div>
       		地址: ${r.address}
         </div>
     	<div>
     	    电话: ${r.phone}
     	</div>
     </div>
   </div>
   <!-- 菜品的分类 -->
   <div class="classification">
     <!-- 里面每一个块都是一个类别 -->
	   	 <a href="${rootPath}customer/customer_getMenuByTypeId?id=1" title=""><div class="one left">
	   	 	<img src="${rootPath}images/1.png" alt="">

	   	 	<p>川菜</p>
	   	 </div></a>
	   	 <a href="${rootPath}customer/customer_getMenuByTypeId?id=2" title=""><div class="one left">  
	   	 	<img src="${rootPath}images/2.png" alt="">
	   	 	<p>京菜</p>
	   	 </div></a>
	   	 <a href="${rootPath}customer/customer_getMenuByTypeId?id=3" title=""><div class="one left">  
	   	 	<img src="${rootPath}images/3.png" alt="">
	   	 	<p>豫菜</p>
	   	 </div></a>
	   	 <a href="${rootPath}customer/customer_getMenuByTypeId?id=4" title=""><div class="one left">  
	   	 	<img src="${rootPath}images/4.png" alt="">
	   	 	<p>闽菜</p>
	   	 </div></a>
	   	<a href="${rootPath}customer/customer_getMenuByTypeId?id=5" title=""><div class="one left">  
	   	 	<img src="${rootPath}images/5.png" alt="">
	   	 	<p>海鲜</p>
	   	 </div></a>
	   	 <a href="${rootPath}customer/customer_getMenuByTypeId?id=6" title=""><div class="one left">  
	   	 	<img src="${rootPath}images/6.png" alt="">
	   	 	<p>湘菜</p>
	   	 </div></a>
	   	 <a href="${rootPath}customer/customer_getMenuByTypeId?id=7" title=""><div class="one left">  
	   	 	<img src="${rootPath}images/7.png" alt="">
	   	 	<p>豫菜</p>
	   	 </div></a>
	   	 <a href="${rootPath}customer/customer_getMenuByTypeId?id=1" title=""><div class="one left">  
	   	 	<img src="${rootPath}images/8.png" alt="">
	   	 	<p>粤菜</p>
	   	 </div></a>
   	</div>
   <!-- 菜品的展示 -->
   <c:forEach items="${menus}" var="m" >
   <div class="show">
       <!-- 以下层级每一个块   都会是一道菜 -->
	 
	    <div class="food">
		      <a href="${rootPath}customer/customer_getMenuMaterial?id=${m.id}">
	            <div class="left photo">
	              <img src="${rootPath}images/haixian.jpg" alt="" width="100px" height="90px">	
	            </div>
	      	  </a>
            <div class="left indu">
            	<div class="name">
            		<b>${m.name}</b>
            	</div>
            	<div class="indu2">
            		${m.introduce}
            	</div>
            	<div class="di">
            	<p class="left p1">￥${m.price}</p>
              <p class="left p2">销量：${m.num}</p>
              <a href="${rootPath}customer/customer_joinCart?id=${m.id}">
            	<input type="button" name="" value="+" class="right" />
              </a>
            	</div>
            </div>
	    </div>
	    
       </div>
     </c:forEach>
     <!-- 底部留白 -->
       <div class="liubai">
       	
       </div>
     <!-- 底部固定的菜单 -->
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
<script>
alter(<h3>${addMeg}</h3>);
</script>
</html>