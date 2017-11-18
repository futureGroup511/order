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
	<title>餐饮管理系统</title>
	<link rel="stylesheet" type="text/css" href="${rootPath}css/customer/bootstrap.min.css">
	<link rel="stylesheet" href="${rootPath}css/customer/public.css">
	<link rel="stylesheet" type="text/css" href="${rootPath}css/customer/order.css">
<script type="text/javascript">
	function Reminder() {
		var xmlhttp;
		if (window.XMLHttpRequest) {
			// IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
			xmlhttp = new XMLHttpRequest();
		} else {
			// IE6, IE5 浏览器执行代码
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {		
				var result = xmlhttp.responseText;								
				if(parseInt(result)==1){
					show_notice('催单成功',1);
				}else if(parseInt(result)==0){
					show_notice('催单失败',1);
				}
							
			}
		}
		xmlhttp.open("POST", "cart_Reminder", true);
		xmlhttp.setRequestHeader("Content-type",
				"application/x-www-form-urlencoded");
		xmlhttp.send();
	}
	
	
	function dishes() {
		var remark=document.getElementById("ins").value;
		console.info(remark);
		var xmlhttp;
		if (window.XMLHttpRequest) {
			// IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
			xmlhttp = new XMLHttpRequest();
		} else {
			// IE6, IE5 浏览器执行代码
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {		
				var result = xmlhttp.responseText;								
				if(remark=='叫起'){
					show_notice('叫起成功',1);
				}else if(remark=='即起'){
					show_notice('即起成功',1);
				}else if(parseInt(result)==2){
					show_notice('菜已做好',1);
				}else{
					show_notice('菜已处理,不能起菜',1);
				}
							
			}
		}
		xmlhttp.open("POST", "cart_dishes", true);
		xmlhttp.setRequestHeader("Content-type",
				"application/x-www-form-urlencoded");
		xmlhttp.send("remark="+remark);
	}
	
	function show_notice(str,second,callback){  
	    var box_id = 'notice_box';  
	    var tooltipBox = document.getElementById(box_id);  
	    if(tooltipBox){  
	        document.body.removeChild(tooltipBox);  
	    }  
	    if(!second) second = 2;  
	    tooltipBox = document.createElement('div');  
	    tooltipBox.innerHTML = str;  
	    tooltipBox.id = box_id;  
	    tooltipBox.style.background='rgba(94,94,94,.8)';  
	    tooltipBox.style.color='#fff';  
	    tooltipBox.style.display='inline-block';  
	    tooltipBox.style.padding = '0.4em 1.5em';  
	    tooltipBox.style.borderRadius = '1em';  
	    tooltipBox.style.fontSize = '0.9em';  
	    document.body.appendChild(tooltipBox);  
	    var vWidth = document.documentElement.clientWidth;  
	    var vHeight = document.documentElement.clientHeight;  
	    tooltipBox.style.position = 'fixed';  
	    tooltipBox.style.zIndex = '9999';  
	    tooltipBox.style.left = ((vWidth/2)-(tooltipBox.offsetWidth/2))+'px';  
	    tooltipBox.style.top = ((vHeight/2)-(tooltipBox.offsetHeight/2))+'px';  
	    setTimeout(function () {  
	                    document.body.removeChild(tooltipBox);  
	                    if(callback)    callback();  
	                }, second*1000);  
	}  
</script>
</head>
<body onload="tuicai()">
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
    	<img src="${rootPath}uploadImg/${o.imgUrl}" alt="" width="100px" height="90px">
    </div>
    <div class="right infors">
       <a href="${rootPath}customer/customer_getMenuMaterial?id=${o.menuId}" style="width:60%;">
       <p style="color:#000; width:60%;">
       <b>${o.menuName}</b>
       </p>
       </a>
        <c:if test="${o.gift == '赠品' }">
	   	      <p class="right zengpin">${o.gift}</p>
	    </c:if>
       <p class="left jia">价格：</p><p class="red">￥${o.price}</p>
       <p>数量：${o.menuNum}</p>   
       <p class="left" style="display:inline-block">状态：</p><p class="green pppp1"  style="display:inline-block">${o.status}</p>
       <div class="right divv1">
	       <c:if test="${o.status=='未完成'&&o.gift!='赠品'}">
	       <a class="right" href="${rootPath}customer/cart_getBack?id=${o.id}" >退菜</a>
	       </c:if>
       </div>
    </div>
 </div>
</c:forEach>
<div class="num">    
     <div>
     <p class="left">订单号:${myId}</p>
     </div>
     <div>
        <p class="left">状态:</p>
        <p class="left green"  style="margin-right:30px;">${order}</p>
     </div>
     <div>
     <p class="left jia">总价: </p>
     <p class="left red" style="font-size:18px; margin-bottom:10px;">${totall}</p>
     </div>
</div>
<input type="button" name="" value="催单"  class="cd1" onclick="Reminder()" />
<input type="button" name="" value="叫起"  class="cd1" onclick="dishes()" id="ins" />
</c:if>
 <c:if test="${empty orderDetails }">
 <center><h1 class="margin">你还没有下订单</h1></center>
 </c:if>
	<!--  留白处 -->
   <div class="liubai">
   </div>
   <!-- 公共底部 -->
   <footer>
       <a href="${rootPath}customer/customer_toIndex?id=${userId}">
      <div class="left">
         <div><img src="${rootPath}images/sy.png" style="width:100%; height:100%; "></div>
         <p>首页</p>
      </div>
      </a>
      <a href="${rootPath}customer/cart_getCart">
      <div class="left">
         <div><img src="${rootPath}images/gwc.png" style="width:100%; height:100%; "></div>
         <p>购物车</p>
      </div>
      </a>
      <a href="${rootPath}customer/cart_orderDetails">
      <div class="left dingdan">
         <div><img src="${rootPath}images/dd.png" style="height:70%;width:70%;"></div>
         <p>订单</p>
      </div>
      </a>
   </footer>
</body>
<script type="text/javascript">
   function tuicai(){
	   if('${stat}'=='退菜成功！'){
		   show_notice('${stat}',1);
	   }else if('${stat}'=='该菜已做,退不了'){
		   show_notice('${stat}',1);
	   }
	   
   }
  function $(b){
	  return document.getElementById(b);
  }
  var in1 = $('ins');
  var c = true;
  in1.addEventListener("click",function(){ 
	  c=!c;
	  console.log('temp');
	  if(c){
		  console.log('temp:叫起');
		  in1.value = "叫起";
  	  }else{
  		console.log('temp:else');
  		if('${order}'!='未处理'){
  			in1.value;
  		}else{
			in1.value = "即起";
  		}
	  }
  }
  )
</script>
</html>