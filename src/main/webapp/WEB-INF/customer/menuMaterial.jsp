<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
	<title>订餐管理系统</title>
	<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="../css/public.css">
	<link rel="stylesheet" href="../css/food.css">
	<script type="text/javascript">
    window.onload = function() {
   var oDiv = document.getElementById('div1');
   var divT = oDiv.offsetTop;
  
   window.onscroll = function() {
    var scrollT =document.body.scrollTop;

    if (scrollT >= divT) {
      oDiv.style.position = 'fixed';
      oDiv.style.top = 0;
    } else
     oDiv.style.position = '';
   }
  }
	</script>
</head>
<body>
	<!-- 顶部菜的图片 -->
<div class="food">
	    <div>
	    	   <img src="../images/xiang.jpg" alt="">
	    </div>
 <!--  顶部图片的解释部分 -->
        <div class="explain">
              <p>某某店 某某菜</p>
        </div>
</div>
	<!-- 菜的信息 -->
  <div class="information">
  	
           <div class="xd" id="div1">
		     <div class="top">
				     	<p class="left">￥${menu.price}</p>
				     	<a href="${rootPath}customer/customer_joinCart?id=${menu.id}">
				     	<input type="button" name="" value="+购物车" class="right">
				     	</a>
		     </div>
		     <div class="center">
						     	<p class="left">√ 退单</p>
						     	<p class="right">月售出：${menu.num}</p>
		     </div>
		   </div>
		   
		     <div class="center1">
		     	
		     </div>
		     <div class="bottom">     <!--   每一个date是一种配料 -->
		     <c:forEach items="${menuMaterial}" var="m">
					     <div class="date">
								         <div class="sdate">
													     	   	 <p class="left">配料名：</p>
													     	   	 <p class="right">${m.ingName}</p>
								         </div>
								     	 <div class="time">
													<a href="${rootPath}customer/customer_getStockDate?id=${m.ingId}">进货时间信息</a>           
								         </div>
								         <div class="nub">
								                                  <p class="left">用量:</p>
													     	   	 <p class="right">${m.num}</p>
								         </div>
								         <div class="introduce">
														<p>	简介：</p>
														<p>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp${menu.introduce}</p>    
								         </div>
					                <section></section>
					     </div>
			</c:forEach>
    </div>
		         <!-- 留白  -->
		  <div class="liubai">
		  </div>
		       <!-- 公共脚部 -->
		  <footer>
       <a href="${rootPath}customer/customer_toIndex?id=${userId}">
      <div class="left">
      	<div><img src="../images/sy1.png" style="width:100%; height:100%; "></div>
      	<p>首页</p>
      </div>
      </a>
      <a href="${rootPath}customer/cart_getCart">
      <div class="left">
      	<div><img src="../images/gwc.png" style="width:100%; height:100%; "></div>
      	<p>购物车</p>
      </div>
      </a>
      <a href="${rootPath}customer/cart_getOrderDetails">
      <div class="left">
      	<div><img src="../images/dd.png" style="width:100%; height:100%; "></div>
      	<p>订单</p>
      </div>
      </a>
      
   </footer>
</body>
</html>