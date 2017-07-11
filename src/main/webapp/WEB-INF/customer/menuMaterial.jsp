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
<%-- <head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<p align="center"><p>
<table align="center" width="100%" border="1">
	<tr>
	<th>名字</th>
	<th>地址</th>
	<th>介绍</th>
	<th>类型编号</th>
	<th>类型名</th>
	<th>价格</th>
	<th>数量</th>
	<th>是否存在</th>
	<th>时间</th>

	</tr>
	<c:forEach items="${menu}" var="m">
		<tr>
		<td>${menu.name}</td>
		<td>${menu.imgUrl}</td>
		<td>${menu.introduce}</td>
		<td>${menu.typeId}</td>
		<td>${menu.typeName}</td>
		<td>${menu.price}</td>
		<td>${menu.num}</td>
		<td>${menu.exist}</td>
		<td>${menu.createDate}</td>
		
		</tr>
		</c:forEach>
</table>
<table align="center" width="100%" border="1">
	<tr>
	<th>菜品id</th>
	<th>菜品名称</th>
	<th>配料id</th>
	<th>配料名称</th>
	<th>需求量</th>
	<th>进货时间</th>
	</tr>
	<c:forEach items="${menuMaterial}" var="m">
		<tr>
			<td>${m.menuId}</td>
			<td>${m.menuName}</td>
			<td>${m.ingId}</td>
			<td>${m.ingName}</td>
			<td>${m.num}</td>
			<td>${m.stockDate}<a href="${rootPath}customer/customer_getStockDate?id=${m.ingId}">更多进货时间信息</a>&nbsp;</td>
		</tr>
	</c:forEach>	
</table>
<a href="${rootPath}customer/customer_toIndex?id=${userId}">首页</a>
<a href="${rootPath}customer/cart_getCart">购物车</a>
<a href="">我的订单</a>
</body>
</html> --%>