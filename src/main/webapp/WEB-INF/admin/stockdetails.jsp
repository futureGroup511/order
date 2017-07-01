<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/checkstock.css" rel="stylesheet" />
     <link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
</head>
<body>
<div class="checkstock">
     <table cellspacing="0">
         <thead>
          <tr>
          <td colspan="8">进货详细信息</td>
          </tr>   
         </thead>
         <tbody>
         <tr class="tr1">
             <td>编号</td>
             <td>进货编号</td> 
             <td>配料号</td>
             <td>配料名称</td>
             <td>单价</td>
             <td>数量</td>
             <td>进货时间</td>
             <td>操作</td>
          </tr>
                 	 <c:forEach items="${pc.data}" var="item"> 
	            <tr>  
	                <td><intput >${item.id}</td>
	                <td>${item.stockId}</td>
	                <td>${item.ingId}</td>
	                <td>${item.ingName}</td>
	                <td>${item.price}</td>
	                <td>${item.num}</td>
	                <td>${item.createDate}</td>
	                <td  class="four"><a href="${rootPath}manage/StockDetailsAction_Delet()?stockid=${item.id}"><span class="glyphicon glyphicon-trash">删除</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="${rootPath}manage/StockDetailsAction_toUpdate()?stocksid=${item.id}"><span class="glyphicon glyphicon-pencil"></span>修改</a></td>      
	            </tr>  
        	</c:forEach>   
         </tbody>
     </table>        
    </div>
    <div class="page">
    <ul class="pagination">
     						<li><a
							href="${rootPath}manage/StockDetailsAction?page=${pc.prePage}">上一页</a></li>
						<c:if test="${1 < pc.currentPage -3}">
							<li><a href="#">1</a></li>
						</c:if>

						<c:forEach var="i"
 							begin="${pc.currentPage-3>0?pc.currentPage-3:1 }" 
 							end="${pc.currentPage+3>pc.pageNum?pc.pageNum:pc.currentPage+3  }"> 
 							<c:choose> 
 								<c:when test="${i>0 && i == pc.currentPage &&i<=3}"> 
									<li class="active"><a
 										href="${rootPath}manage/StockDetailsAction?page=${i }">${i}</a></li> 
 								</c:when> 

 								<c:when test="${i>0 && i != postPS.currentPage &&i<=3}"> 
 									<li><a href="${rootPath}manage/StockDetailsAction?page=${i }">${i}</a></li> 
 								</c:when> 
 							</c:choose> 
 						</c:forEach> 
						<li><a 
							href="${rootPath}manage/StockDetailsAction?page=${pc.nextPage}">下一页</a></li>
    </ul>
    </div>
<%-- <center>${markinfo}</center> --%>
<!-- 	<table width="1000px" height="100px" align="center" border="1"> -->
<!-- 	<tr> -->
<!-- 				<td colspan="8" align="center">进货详细信息</td> -->
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 	  	 <th>编号</th> -->
<!--          <th>进货编号</th> -->
<!--          <th>配料号</th> -->
<!--          <th>配料名称</th> -->
<!--          <th>单价</th> -->
<!--          <th>数量</th> -->
<!--          <th>进货时间</th> -->
<!--          <th>操作</th> -->
<!-- 	</tr> -->
<%--        	 <c:forEach items="${pc.data}" var="item">  --%>
<!-- 	            <tr>   -->
<%-- 	                <td><intput >${item.id}</td> --%>
<%-- 	                <td>${item.stockId}</td> --%>
<%-- 	                <td>${item.ingId}</td> --%>
<%-- 	                <td>${item.ingName}</td> --%>
<%-- 	                <td>${item.price}</td> --%>
<%-- 	                <td>${item.num}</td> --%>
<%-- 	                <td>${item.createDate}</td> --%>
<%-- 	                <td  class="four"> <img src="./staticFile/images/bian.png" style="width:25px;height:25px;"><a href="${rootPath}manage/StockDetailsAction_Delet()?stockid=${item.id}">删除</a>&nbsp;&nbsp;&nbsp;&nbsp;<img src="./staticFile/images/lajitong.png" style="width:25px;height:25px;"><a href="${rootPath}manage/StockDetailsAction_toUpdate()?stocksid=${item.id}">修改</a></td>       --%>
<!-- 	            </tr>   -->
<%--         	</c:forEach> --%>
<!-- 	</table> -->
<!-- 	<div id="list-two"> -->
<!-- 		<ul class="pagination"> -->
<!-- 						<li><a -->
<%-- 							href="${rootPath}manage/StockDetailsAction?page=${pc.prePage}">上一页</a></li> --%>
<%-- 						<c:if test="${1 < pc.currentPage -3}"> --%>
<!-- 							<li><a href="#">1</a></li> -->
<%-- 						</c:if> --%>

<%-- 						<c:forEach var="i" --%>
<%-- 							begin="${pc.currentPage-3>0?pc.currentPage-3:1 }" --%>
<%-- 							end="${pc.currentPage+3>pc.pageNum?pc.pageNum:pc.currentPage+3  }"> --%>
<%-- 							<c:choose> --%>
<%-- 								<c:when test="${i>0 && i == pc.currentPage }"> --%>
<!-- 									<li class="active"><a -->
<%-- 										href="${rootPath}manage/StockDetailsAction?page=${i }">${i}</a></li> --%>
<%-- 								</c:when> --%>

<%-- 								<c:when test="${i>0 && i != postPS.currentPage }"> --%>
<%-- 									<li><a href="${rootPath}manage/StockDetailsAction?page=${i }">${i}</a></li> --%>
<%-- 								</c:when> --%>
<%-- 							</c:choose> --%>
<%-- 						</c:forEach> --%>
<!-- 						<li><a -->
<%-- 							href="${rootPath}manage/StockDetailsAction?page=${pc.nextPage}">下一页</a></li> --%>
<!-- 					</ul> -->
	
<!-- 	</div> -->
</body>
</html>