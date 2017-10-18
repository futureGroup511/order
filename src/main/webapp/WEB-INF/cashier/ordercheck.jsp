<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" type="text/css" href="${rootPath}css/ordercheck.css">
 <link rel="stylesheet" type="text/css" href="${rootPath}css/bootstrap.css">
 <script language="javascript">
window.onload=function(){
	 var array = new Array();  
	 <c:forEach items="${pc.data}" var="t">  
	 array.push("${t.id}"); //js中可以使用此标签，将EL表达式中的值push到数组中  
	 </c:forEach>
	 var a = array.length;
 if(a==0){
	 document.getElementById('div1').style.display='none';
	 document.getElementById('div2').style.display='none';
	 document.getElementById('div3').style.display='none';
	 document.getElementById('div4').style.display='none';
 }
  }
 <script type="text/javascript">
	function print(id) {
		window.open ("${rootPath}manage/OrderDetailsAction_Print?id="+id, "newwindow", " top=50, left=400, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no"); //写成一行
	}
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" type="text/css" href="${rootPath}css/manager/ordercheck.css">
 <link rel="stylesheet" type="text/css" href="${rootPath}css/bootstrap.css">
</head>
<body  style="background: url(${rootPath}/images/iframebg.jpg);">
<center>
<div style="font-weight: bold;font-size:20px;margin-top:2%;">${marknews}${mark}</div>
</center>
<c:if test="${fn:length(pc.data)>0 }">
<div class="ordercheck" id="div1">
	<div  style="float:right;margin-right:55%;width:40%;height:30px; margin-top:2%; margin-bottom:-10%;">
	</div>
     <div class="button">
      <input type="button" onclick="window.location.href='${rootPath}manage/OrderAction?sign=no&sort=cashier';" value="未付款" style="border-radius: 5px;">
      <input type="button" onclick="window.location.href='${rootPath}manage/OrderAction?sign=yes&sort=cashier';" value="已付款" style="border-radius: 5px;">
      </div>  
      <div  style="float:right;margin-right:5%;width:25%;height:30px; margin-top:2%; margin-bottom:2%;">
	<form action="${rootPath}manage/OrderAction_Inquiry?sort=cashier" method="post">
	<select name="ask" style="margin-left:0px;border-radius:7px;background-color: #F0F0F0; height:23px; ">
		<option value="tableName">餐桌名称</option>
		<option value="cookName">厨师名称</option>
	</select>
		<input type="text" name="inquiry" style="border-radius:7px;background-color: #F0F0F0;" required="required">
		<button class="btnForm" style="border-radius: 5px;width:15%;background-color: #82C0E9;">查询</button>	
</form>
</div>
      <div class="order">
       <table cellspacing="0" border="1">
         <thead>
          <tr>
             <td colspan="12">订单信息</td>
          </tr>   
         </thead>
         <tbody>
          <tr>
             <td>编号</td>
             <td>餐桌编号</td>
             <td>餐桌名称</td>
             <td>总价</td>
             <td>状态</td>
             <td>订单时间</td>
             <td>厨师编号</td>
             <td>厨师姓名</td>
             <td>备注</td>
             <td style="width:150px;">操作</td>
           </tr>
                  	 <c:forEach items="${pc.data}" var="item"> 
	            <tr>  
	                <td><intput >${item.id}</td>
	                <td>${item.tableId}</td>
	                <td>${item.tableName}</td>
	                <td>${item.total}</td>
	                <td  id="status">${item.status}</td>
	                <td>${item.createDate}</td>
	                <td>${item.cookId}</td>
	                <td>${item.cookName}</td>
	                <td style="width:130px;height:10px"><textarea readonly="readonly" style="width:100%;height:105%">${item.remark}</textarea></td>
	               <td  class="four">
	               		<a href="${rootPath}manage/OrderDetailsAction_CheckOrderDetails?id=${item.id}&sort=cashier">查看详情</a>&nbsp;&nbsp;&nbsp;&nbsp;
	               		<c:if test="${item.status ne '已付款'}"><a href="${rootPath}manage/OrderAction_toPay?id=${item.id}&IDcard=order">付款</a></c:if>
	               		<c:if test="${item.status eq '已付款'}">已付款</c:if>
	               </td>      
	            </tr>  
        	</c:forEach>                         
         </tbody>
     </table>
<div class="page" id="div2">
<ul class="pagination">
  <li><a href="${rootPath}manage/OrderAction_${adss}?page=${pc.prePage}&sign=${sign}&sort=cashier">上一页</a></li>
  				<c:forEach var="i" begin="${pc.currentPage-3>0?pc.currentPage-3:1 }"
 					end="${pc.currentPage+3>pc.pageNum?pc.pageNum:pc.currentPage+3  }">
 
 							<c:choose> 
 								<c:when test="${i>0 && i == pc.currentPage}"> 
 									<li class="active"><a 
 										href="${rootPath}manage/OrderAction_${adss }?page=${i }&sign=${sign}&sort=cashier">${i}</a></li> 
 								</c:when> 

 								<c:when test="${i>0 && i != postPS.currentPage}"> 
 									<li><a href="${rootPath}manage/OrderAction_${adss}?page=${i }&sign=${sign}&sort=cashier">${i}</a></li> 
 								</c:when> 
 							</c:choose> 
 						</c:forEach> 
  <li><a href="${rootPath}manage/OrderAction_${adss}?page=${pc.nextPage}&sign=${sign}&sort=cashier">下一页</a></li>
</ul>
 </div> 
 </c:if>
</body>
</html>