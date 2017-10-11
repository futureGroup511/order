<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" type="text/css" href="${rootPath}css/manager/orderdetail.css">
    <link rel="stylesheet" type="text/css" href="${rootPath}css/bootstrap.css">
</head>
<body   style="background: url(${rootPath}/images/m-91.jpg);">
<center style="font-size:20px;font-weight:bold;margin-top:2%;">${markinfo}</center>
<c:if test="${fn:length(detailspc.data) > 0 }">
<div class="orderdetailes" id="div1">
       <table  cellspacing="0">
         <thead>
          <tr>
             <td>餐桌编号</td>
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
          </thead>
          <tbody>
              <c:forEach items="${detailspc.data}" var="item">  
	            <tr>
	                <td>${item.tableId}</td>
	                <td>${item.tableName}</td>
	                <td>${item.orderId}</td>
	                <td>${item.menuId}</td>
	                <td>${item.menuName}</td>
	                <td>${item.menuNum}</td>
	                <td>${item.price}</td>
	                <td>${item.status}</td>
	                <td>${item.creatDate}</td>	     
	                <td>${item.cookId}</td>
	                <td>${item.cookName}</td>
	                <td  class="four"><a href="${rootPath}manage/OrderDetailsAction_delet()?detailid=${item.id}"><span class="glyphicon glyphicon-trash"></span></a></td>      
	            </tr>  
        	</c:forEach>          
         </tbody>
     </table>      
    </div>
  <center>  <div class="page" id="div2">
<ul class="pagination">
  <li><a href="${rootPath}manage/OrderDetailsAction?page=${detailspc.prePage}">上一页</a></li>
  		<c:forEach var="i" begin="${detailspc.currentPage-3>0?detailspc.currentPage-3:1 }"
 					end="${detailspc.currentPage+3>detailspc.pageNum?detailspc.pageNum:allIngredient.currentPage+3  }">

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
 </c:if> 
</body>
</html>