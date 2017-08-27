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
	<link rel="stylesheet" type="text/css" href="${rootPath}css/customer/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${rootPath}css/customer/public.css">
	<link rel="stylesheet" href="${rootPath}css/customer/food.css">
    <script>
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
    	function addShopCart(id) {
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
    					show_notice('添加成功',1);
    				}else if(parseInt(result)==0){
    					show_notice('配料不足',1);
    				}
    				else{
    					show_notice('添加失败',1);
    				}
    							
    			}
    		}
    		xmlhttp.open("POST", "customer_joinCart", true);
    		xmlhttp.setRequestHeader("Content-type",
    				"application/x-www-form-urlencoded");
    		xmlhttp.send("id="+id);
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
<body>
		                       <!-- 顶部菜的图片 -->
		  <div class="food">
			    <div>
			    	   <img src="${rootPath}uploadImg/${menu.imgUrl}">
			    </div>
		                        <!--  顶部图片的解释部分 -->
		        <div class="explain">
		              <p>${menu.name}</p>
		        </div>
		  </div>
		                          <!-- 菜的信息 -->
		  <div class="information">
				        <div class="top" id="div1">
						     	<p class="left money">￥${menu.price}</p>
						     	<p class="left buy">销量: ${menu.num}</p>
						 
						     </a>
				        </div>
				        <div class="center">
				        	<p><b>简介:</b>${menu.introduce}</p>
				        	</div>
				     <div class="bottom">     <!--   每一个date是一种配料 -->

				     		<c:forEach items="${menuMaterial}" var="m">
							     <div class="date">
										         <div class="sdate">
										     	   	 <p class="left"><b>配料名称：</b>${m.ingName}</p>
												</div>
										         <div class="nub">
									                 <p class="left"><b>用量:</b>&nbsp;&nbsp;${m.num}(kg)</p>
										         </div>
												 <div class="introduce"><b>简介：</b>${m.introduce}</div>
										         <div class="time">
									<a href="${rootPath}OrderDetail_getStockDate?ingId=${m.ingId}">进货信息</a>           
							 		</div>
							                <section></section>
							     </div>
							 </c:forEach>
							 
				     </div>
		    </div>
		         <!-- 留白  -->
		  <div class="liubai">
		  </div>
		       <!-- 公共脚部 -->
		
</body>
</html>