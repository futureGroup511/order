+<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" type="text/css" href="${rootPath}css/manager/checkstock.css">
     <link href="${rootPath}css/manager/checkstock.css" rel="stylesheet" />
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
 }
}
	</script>
</head>
<body>
<center>${stocknews }</center>
 <div class="checkstock" id="div1">
     <table cellspacing="0">
         <thead>
          <tr>
          <td colspan="7">进货信息</td>
          </tr>   
         </thead>
         <tbody>
         <tr class="tr1">
             <td>编号</td>
             <td>进货地点</td> 
             <td>进货总支出</td>
             <td>进货时间</td>
             <td>备注</td>
             <td>操作</td>
             <td>操作</td>
          </tr>
                 	 <c:forEach items="${pc.data}" var="item"> 
	            <tr>  
	                <td><intput >${item.id}</td>
	                <td>${item.site}</td>
	                <td>${item.total}</td>
	                <td>${item.createDate}</td>
	                <td>${item.remark}</td>
	                <td  class="four"><a href="${rootPath}manage/StockDetailsAction_CheckStockDetails()?id=${item.id}">查看详情</a></td>      
	                <td  class="four"><a href="${rootPath}manage/StockAction_toUpdate()?id=${item.id}"><span class="glyphicon glyphicon-pencil"></span></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="${rootPath}manage/StockAction_Delet()?id=${item.id}"><span class="glyphicon glyphicon-trash"></span></a></td>      
	            </tr>  
        	</c:forEach>   
         </tbody>
     </table>        
    </div>
    <div class="page" id="div2">
    <ul class="pagination">
     						<li><a
							href="${rootPath}manage/StockAction?page=${pc.prePage}">上一页</a></li>
						<c:if test="${1 < pc.currentPage -3}">
							<li><a href="#">1</a></li>
						</c:if>

						<c:forEach var="i"
 							begin="${pc.currentPage-3>0?pc.currentPage-3:1 }" 
							end="${pc.currentPage+3>pc.pageNum?pc.pageNum:pc.currentPage+3  }"> 
 							<c:choose> 
 								<c:when test="${i>0 && i == pc.currentPage &&i<=3}"> 
									<li class="active"><a
 										href="${rootPath}manage/StockAction?page=${i }">${i}</a></li>
 								</c:when>

 								<c:when test="${i>0 && i != postPS.currentPage &&i<=3}"> 
 									<li><a href="${rootPath}manage/StockAction?page=${i }">${i}</a></li> 
 								</c:when> 
 							</c:choose> 
						</c:forEach>
						<li><a
 							href="${rootPath}manage/StockAction?page=${pc.nextPage}">下一页</a></li> 
    </ul>
<%-- <center>${stocknews }</center> --%>
<!-- 	<table width="1000px" height="100px" align="center" border="1"> -->
<!-- 	<tr> -->
<!-- 				<td colspan="7" align="center">进货信息</td> -->
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 	  	 <th>编号</th> -->
<!--          <th>进货地点</th> -->
<!--          <th>进货总支出</th> -->
<!--          <th>进货时间</th> -->
<!--          <th>备注</th> -->
<!--          <th>操作</th> -->
<!--          <th>操作</th> -->
<!-- 	</tr> -->
<%--        	 <c:forEach items="${pc.data}" var="item">  --%>
<!-- 	            <tr>   -->
<%-- 	                <td><intput >${item.id}</td> --%>
<%-- 	                <td>${item.site}</td> --%>
<%-- 	                <td>${item.total}</td> --%>
<%-- 	                <td>${item.createDate}</td> --%>
<%-- 	                <td>${item.remark}</td> --%>
<%-- 	                <td  class="four"> <img src="./staticFile/images/bian.png" style="width:25px;height:25px;"><a href="${rootPath}manage/StockDetailsAction_CheckStockDetails()?id=${item.id}">查看详情</a></td>       --%>
<%-- 	                <td  class="four"> <img src="./staticFile/images/bian.png" style="width:25px;height:25px;"><a href="${rootPath}manage/StockAction_Delet()?id=${item.id}">删除</a>&nbsp;&nbsp;&nbsp;&nbsp;<img src="./staticFile/images/lajitong.png" style="width:25px;height:25px;"><a href="${rootPath}manage/StockAction_toUpdate()?id=${item.id}">修改</a></td>       --%>
<!-- 	            </tr>   -->
<%--         	</c:forEach> --%>
<!-- 	</table> -->
<!-- 	<div id="list-two"> -->
<!-- 		<ul class="pagination"> -->
<!-- 						<li><a -->
<%-- 							href="${rootPath}manage/StockAction?page=${pc.prePage}">上一页</a></li> --%>
<%-- 						<c:if test="${1 < pc.currentPage -3}"> --%>
<!-- 							<li><a href="#">1</a></li> -->
<%-- 						</c:if> --%>

<%-- 						<c:forEach var="i" --%>
<%-- 							begin="${pc.currentPage-3>0?pc.currentPage-3:1 }" --%>
<%-- 							end="${pc.currentPage+3>pc.pageNum?pc.pageNum:pc.currentPage+3  }"> --%>
<%-- 							<c:choose> --%>
<%-- 								<c:when test="${i>0 && i == pc.currentPage }"> --%>
<!-- 									<li class="active"><a -->
<%-- 										href="${rootPath}manage/StockAction?page=${i }">${i}</a></li> --%>
<%-- 								</c:when> --%>

<%-- 								<c:when test="${i>0 && i != postPS.currentPage }"> --%>
<%-- 									<li><a href="${rootPath}manage/StockAction?page=${i }">${i}</a></li> --%>
<%-- 								</c:when> --%>
<%-- 							</c:choose> --%>
<%-- 						</c:forEach> --%>
<!-- 						<li><a -->
<%-- 							href="${rootPath}manage/StockAction?page=${pc.nextPage}">下一页</a></li> --%>
<!-- 					</ul> -->
	
<!-- 	</div> -->
</body>
</html>