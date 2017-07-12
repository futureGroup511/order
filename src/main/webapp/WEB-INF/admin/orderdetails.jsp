<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" type="text/css" href="${rootPath}css/manager/orderdetail.css">
    <link rel="stylesheet" type="text/css" href="${rootPath}css/bootstrap.css">
<script language="javascript">
	window.onload=function(){
		 var array = new Array();  
		 <c:forEach items="${detailspc.data}" var="t">  
		 array.push("${t.id}"); //js中可以使用此标签，将EL表达式中的值push到数组中  
		 </c:forEach>
		 var a = array.length;
	 if(a==0){
		 document.getElementById('div1').style.display='none';
		 document.getElementById('div2').style.display='none';
	 }
	}
	</script>
</head>
<body>
<center><h4>${markinfo}</h4></center>
<div class="orderdetailes" id="div1">
       <table  cellspacing="0">
         <thead>
          <tr>
             <td colspan="12">订单详细信息</td>
          </tr>   
         </thead>
         <tbody>
          <tr>
             <td>餐桌id</td>
             <td>餐桌名称</td>
             <td>订单id</td>
             <td>菜品id</td>
             <td>菜品名称</td>
             <td>数量</td>
             <td>单价(元)</td>
             <td>菜品状态</td>
             <td>订单时间</td>
             <td>厨师id</td>
             <td>厨师姓名</td>         
             <td>操作</td>
           </tr>
                  	 <c:forEach items="${detailspc.data}" var="item">  
	            <tr>
	                <td>${item.tableId}</td>
	                <td>${item.tableName}</td>
	                <td>${item.orderId}</td>
	                <td>${item.menuId}</td>
	                <td>${item.menuName}</td>
	                <td>${item.menuNum}</td>
	                <td>${item.remark}</td>
	                <td>${item.status}</td>
	                <td>${item.creatDate}</td>	     
	                <td>${item.cookId}</td>
	                <td>${item.cookName}</td>
	                <td  class="four"><a href="${rootPath}manage/OrderDetailsAction_Delet()?detailid=${item.id}"><span class="glyphicon glyphicon-trash"></span>删除</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="${rootPath}manage/OrderDetailsAction_toUpdate()?detailid=${item.id}"><span class="glyphicon glyphicon-pencil"></span>修改</a></td>      
	            </tr>  
        	</c:forEach>          
         </tbody>
     </table>      
    </div>
  <center>  <div class="page" id="div2">
<ul class="pagination">
  <li><a href="${rootPath}manage/OrderDetailsAction?page=${detailspc.prePage}">上一页</a></li>
 						<c:if test="${1 < detailspc.currentPage -3}"> 
 							<li><a href="#">1</a></li> 
 						</c:if> 
 						<c:forEach var="i" 
							begin="${detailspc.currentPage-3>0?detailspc.currentPage-3:1 }"
 							end="${detailspc.currentPage+3>detailspc.pageNum?detailspc.pageNum:detailspc.currentPage+3  }"> 
 							<c:choose> 
 								<c:when test="${i>0 && i == detailspc.currentPage &&i<=3}">
 									<li class="active"><a 
 										href="${rootPath}manage/OrderDetailsAction?page=${i}">${i}</a></li> 
 								</c:when> 

 								<c:when test="${i>0 && i != postPS.currentPage &&i<=3}"> 
 									<li><a href="${rootPath}manage/OrderDetailsAction?page=${i }">${i}</a></li> 
 								</c:when> 
 							</c:choose>
 						</c:forEach> 
 						<li><a 
 							href="${rootPath}manage/OrderDetailsAction?page=${detailspc.nextPage}">下一页</a></li> 
</ul>
 </div>
 </center>    
<%-- <center>${markinfo}</center> --%>
<!-- 	<table width="1000px" height="100px" align="center" border="1"> -->
<!-- 	<tr> -->
<!-- 				<td colspan="12" align="center">订单详细信息</td> -->
<!-- 	</tr> -->
<!-- 	<tr> -->
<!--          <th>餐桌id</th> -->
<!--          <th>餐桌名称</th> -->
<!--          <th>订单id</th> -->
<!--          <th>菜品id</th> -->
<!--          <th>菜品名称 </th> -->
<!--          <th>数量</th> -->
<!--          <th>菜品状态</th> -->
<!--          <th>订单时间</th> -->
<!--          <th>厨师id</th> -->
<!--          <th>厨师姓名</th> -->
<!--          <th>备注</th> -->
<!--          <th>操作</th> -->
<!-- 	</tr> -->
<%--        	 <c:forEach items="${detailspc.data}" var="item">   --%>
<!-- 	            <tr> -->
<%-- 	                <td>${item.tableId}</td> --%>
<%-- 	                <td>${item.tableName}</td> --%>
<%-- 	                <td>${item.orderId}</td> --%>
<%-- 	                <td>${item.menuId}</td> --%>
<%-- 	                <td>${item.menuName}</td> --%>
<%-- 	                <td>${item.menuNum}</td> --%>
<%-- 	                <td>${item.status}</td> --%>
<%-- 	                <td>${item.creatDate}</td>	      --%>
<%-- 	                <td>${item.cookId}</td> --%>
<%-- 	                <td>${item.cookName}</td> --%>
<%-- 	                <td>${item.remark}</td> --%>
<%-- 	                <td  class="four"> <img src="./staticFile/images/bian.png" style="width:25px;height:25px;"><a href="${rootPath}manage/OrderDetailsAction_Delet()?detailid=${item.id}">删除</a>&nbsp;&nbsp;&nbsp;&nbsp;<img src="./staticFile/images/lajitong.png" style="width:25px;height:25px;"><a href="${rootPath}manage/OrderDetailsAction_toUpdate()?detailid=${item.id}">修改</a></td>       --%>
<!-- 	            </tr>   -->
<%--         	</c:forEach> --%>
<!-- 	</table> -->
<!-- 	<ul class="pagination"> -->
<!-- 						<li><a -->
<%-- 							href="${rootPath}manage/OrderDetailsAction?page=${detailspc.prePage}">上一页</a></li> --%>
<%-- 						<c:if test="${1 < detailspc.currentPage -3}"> --%>
<!-- 							<li><a href="#">1</a></li> -->
<%-- 						</c:if> --%>

<%-- 						<c:forEach var="i" --%>
<%-- 							begin="${detailspc.currentPage-3>0?detailspc.currentPage-3:1 }" --%>
<%-- 							end="${detailspc.currentPage+3>detailspc.pageNum?detailspc.pageNum:detailspc.currentPage+3  }"> --%>
<%-- 							<c:choose> --%>
<%-- 								<c:when test="${i>0 && i == detailspc.currentPage }"> --%>
<!-- 									<li class="active"><a -->
<%-- 										href="${rootPath}manage/OrderDetailsAction?page=${i}">${i}</a></li> --%>
<%-- 								</c:when> --%>

<%-- 								<c:when test="${i>0 && i != postPS.currentPage }"> --%>
<%-- 									<li><a href="${rootPath}manage/OrderDetailsAction?page=${i }">${i}</a></li> --%>
<%-- 								</c:when> --%>
<%-- 							</c:choose> --%>
<%-- 						</c:forEach> --%>
<!-- 						<li><a -->
<%-- 							href="${rootPath}manage/OrderDetailsAction?page=${detailspc.nextPage}">下一页</a></li> --%>
<!-- 					</ul> -->
</body>
</html>