<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html >
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
<title>餐饮管理系统</title>
<link rel="stylesheet" type="text/css" href="${rootPath}css/customer/bootstrap.min.css">
<link rel="stylesheet" href="${rootPath}css/customer/public.css">
<link rel="stylesheet" type="text/css" href="${rootPath}css/customer/shopping.css">
<script type="text/javascript">
	function add(id) {		
		var Id="menu"+id;
		var num=parseInt(document.getElementById(Id).innerHTML);		
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
				if(parseInt(result)==0){
					show_notice('配料不足',2);
				}else{
					document.getElementById(Id).innerHTML=num+1;
					document.getElementById("total").innerHTML=result;	
				}
							
			}
		}
		xmlhttp.open("POST", "cart_add", true);
		xmlhttp.setRequestHeader("Content-type",
				"application/x-www-form-urlencoded");
		xmlhttp.send("id="+id);
		
	}
	
	function reduce(id) {
		var Id="menu"+id;
		var num=parseInt(document.getElementById(Id).innerHTML);	
		if(num>1){
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
					document.getElementById(Id).innerHTML=num-1;
					document.getElementById("total").innerHTML=result;					
				}
			}
			xmlhttp.open("POST", "cart_reduce", true);
			xmlhttp.setRequestHeader("Content-type",
					"application/x-www-form-urlencoded");
			xmlhttp.send("id="+id);
		}
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
<body><!-- 头部 -->
  <header id="header" class="">
  <img src="${rootPath}images/left.png" alt="">
      我的购物车
  <img src="${rootPath}images/right.png" alt="">
  </header><!--  留白处 -->
   <div class="liubai">
   </div>
 <!-- 装用户添加的每一道菜    -->
 <c:if test="${!empty shopCarts }">
     <c:forEach items="${shopCarts}" var="s">
       <div class="food">
          <div class="left photo">
          	<img src="${rootPath}uploadImg/${s.imgUrl}" alt="" width="100px" height="90px">
          </div>
          <div class="left infors">
              <a href="${rootPath}customer/customer_getMenuMaterial?id=${s.menuId}"><p style="color:#000"><b>${s.menuName}</b></p></a>
              <p class="left col">价格:&nbsp;&nbsp;</p><p class="red size">￥${s.price}</p>
              <div class="zu">
                 <div class="left kong">
                      <div class="left tujia" onclick="reduce(${s.id})">
                       	<img src="${rootPath}images/jian.png"  width="12px" height="12px" />
                      </div>  
                        <span id="menu${s.id}" >${s.menuNum}</span >                                   
                      <div class="right tujian" onclick="add(${s.id})">    
                        <img src="${rootPath}images/jia.png"  width="14px" height="14px"/>   
                      </div>
                  </div>
                 <div class="left delete">
                	<a href="${rootPath}customer/cart_deleteCart?id=${s.id}">删除</a>
                 </div>
              </div>
          </div>
      </div>
    </c:forEach>
    <div id="aa" onclick="cc()">
                点击添加备注
       </div>
	<div class="end">
		<div class="right">
			<form action="${rootPath}customer/cart_getHand" method="post">
				<tr>
					<td>
					<div id="bb">
					  <textarea name="remark" rows="50" cols="50" id='dd' placeholder="请输入你的选择"></textarea>
					  </div>
					</td>
				</tr>
				<tr>
					<td><s:submit value="提交订单" class="right"/></td>
					<p class="left zongjia"><b>总价：</b></p><p class="left jiaqian">
			       <b id="total">${total}</b>
				</tr>
			<form>
		</div>
	</div>
	</c:if>
   <c:if test="${empty shopCarts }">
	<center><h1 class="margin">你还没有点餐</h1></center>
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
      <a href="${rootPath}customer/cart_orderDetails">
      <div class="left dingdan">
        <div><img src="${rootPath}images/dd.png" style="width:70%; height:70%;"></div>
        <p>订单</p>
      </div>
      </a>
   </footer>
</body>
<script type="text/javascript">
      function $(b){
          return document.getElementById(b);
       }
       var a1 = $('aa');
       var text = $('bb');
       var te2 = $('dd');
       var time1;
       var c = text.offsetHeight;
       function cc(){
             a1.style.display='none';
             time1 =  setInterval(function(){
                  c = c + 1;
                  text.style.height = c+'px';
                  if(c == 60){
                    clearInterval(time1);
                    te2.focus();
                  }
              },1);
           }
       cl.addEventListener('click',function(){
    	    ipt.focus()

    	})
</script>
</html>