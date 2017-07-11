<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="${rootPath}css/managermenu.css">
    <link rel="stylesheet" type="text/css" href="${rootPath}css/bootstrap.css">
<script language="javascript">
window.onload=function(){
	 var array = new Array();  
	 <c:forEach items="${allMenu.data}" var="t">  
	 array.push("${t.id}"); //js中可以使用此标签，将EL表达式中的值push到数组中  
	 </c:forEach>
	 var a = array.length;
 if(a==0){
	 document.getElementById('div1').style.display='none';
	 document.getElementById('div2').style.display='none';
 }
}
	</script>
<script type="text/javascript">
	function inquiryByName() {
		document.inquiry.action="${rootPath}manage/MenuManager?ask=name";
		document.getElementById("inquiry").submit();
	}
	function inquiryByType() {
		document.inquiry.action="${rootPath}manage/MenuManager?ask=type";
		document.getElementById("inquiry").submit();
	}    
	function inquiryAll() {
		document.inquiry.action="${rootPath}manage/MenuManager?ask=all";
		document.getElementById("inquiry").submit();
	}
</script>
</head>
<body>
<center>
${updateMsg}${deleteMenuMsg }
共有数据${allMenu.count}条
  <div class="photowall" id="div1"> 
<center>
	<form name="inquiry" method="post" id="inquiry">
		<input type="text" name="inquiry">
		<input type="button" onclick="inquiryByName()" value="按菜名查询">
		<input type="button" onclick="inquiryByType()" value="按菜品类型查询">
		<input type="button" onclick="inquiryAll()" value="查看全部">
	</form>
</center>
<!--   <div class="photowall"> -->
    <div class="picture_wall">
    		${inquiryMsg}
   			<c:forEach items="${allMenu.data}" var="data"> 
				<div>
					<img src="${rootPath}uploadImg/${data.imgUrl}">
					<a href="${rootPath}manage/MenuManager_toUpdateMenu?menu.id=${data.id}">${data.name}&nbsp;&nbsp;&nbsp;${data.typeName}</a>
			     </div>
			</c:forEach>
    </div>
 </div>   
   <div class="page" id="div2">
    <ul class="pagination">
      <li><a href="${rootPath }manage/MenuManager?page=${allMenu.prePage}">上一页</a></li>
     		<c:forEach var="i" begin="${allMenu.currentPage-3>0?allMenu.currentPage-3:1 }"
 					end="${allMenu.currentPage+3>allMenu.pageNum?allMenu.pageNum:allMenu.currentPage+3  }"> 
 					<c:choose> 
						<c:when test="${i>0 && i == allMenu.currentPage &&i<=3}">
 							<li class="active"><a href="${rootPath }manage/MenuManager?page=${i }">${i}</a></li> 
 						</c:when>
 						<c:when test="${i>0 && i != allMenu.currentPage &&i<=3}"> 
 							<li><a href="${rootPath }manage/MenuManager?page=${i }">${i}</a></li> 
 						</c:when> 
					</c:choose> 
 				</c:forEach> 
      <li><a href="manage/MenuManager?page=${allMenu.nextPage}">下一页</a></li>
    </ul>
   </div>
   </center>
<%-- 	<center> --%>
<%-- 	${updateMsg}${deleteMenuMsg } --%>
<%-- 	共有数据${allMenu.count}条 --%>
<!-- 		<table> -->
<%-- 			<c:forEach items="${allMenu.data}" var="data">  --%>
<!-- 				<tr> -->
<%-- 					<td><img src="${rootPath}uploadImg/${data.imgUrl}" height="50px" width="70px"></td> --%>
<!-- 				</tr> -->
<!-- 				<tr> -->
<%-- 					<td><a href="${rootPath}manage/MenuManager_toUpdateMenu?menu.id=${data.id}">${data.name}&nbsp;&nbsp;&nbsp;${data.typeName}</a></td> --%>
<!-- 				</tr> -->
<%-- 			</c:forEach> --%>
<!-- 		</table> -->
		
<%-- 		<a href="${rootPath }manage/MenuManager?page=${allMenu.prePage}">上一页</a> --%>
		
<%-- 		<c:forEach var="i" begin="${allMenu.currentPage-3>0?allMenu.currentPage-3:1 }" --%>
<%-- 					end="${allMenu.currentPage+3>allMenu.pageNum?allMenu.pageNum:allMenu.currentPage+3  }"> --%>
<%-- 					<c:choose> --%>
<%-- 						<c:when test="${i>0 && i == allMenu.currentPage }"> --%>
<%-- 							<li class="active"><a href="${rootPath }manage/MenuManager?page=${i }">${i}</a></li> --%>
<%-- 						</c:when> --%>
<%-- 						<c:when test="${i>0 && i != allMenu.currentPage }"> --%>
<%-- 							<li><a href="${rootPath }manage/MenuManager?page=${i }">${i}</a></li> --%>
<%-- 						</c:when> --%>
<%-- 					</c:choose> --%>
<%-- 				</c:forEach> --%>
<%-- 			<a href="${rootPath }manage/MenuManager?page=${allMenu.nextPage}">下一页</a> --%>
<%-- 	</center> --%>
</body>
</html>