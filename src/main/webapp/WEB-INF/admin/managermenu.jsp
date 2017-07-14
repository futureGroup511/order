<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="${rootPath}css/manager/managermenu.css">
    <link rel="stylesheet" type="text/css" href="${rootPath}css/bootstrap.css">
    <link href="${rootPath}css/basic.css" rel="stylesheet" />
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
</head>
<body  style="background: url(${rootPath}/images/m-91.jpg);">
<center>
	<span class="error">${updateMsg}${deleteMenuMsg }</span>
</cenetr>
 <div class="photowall" style="margin-left:35%;"> 
	<form action="${rootPath}manage/MenuManager_Inquiry" method="post">
	<select name="ask" style="border-radius:7px;background-color: #F0F0F0; height:25px;">
		<option value="name">菜名</option>
		<option value="typeName">类型</option>
		<option value="price">价格</option>
	</select>
		<input class="input" type="text" name="inquiry">
		<button style="border-radius: 5px;width:6%;background-color: #82C0E9;" type="submit">查询</button>

	</form>
</div>
    <div class="picture_wall" id="div1">
    		${inquiryMsg}
    		<table>
    			<tr>
    				<th>菜名</th>
    				<th style="width:95px;">图片</th>
    				<th>类型</th>
    				<th>价格/元</th>
    				<th style="width:90px;">被定/次</th>
    				<th>状态</th>
    				<th>简介</th>
    				<th style="width:90px;">操作</th>
    			</tr>
    		<c:forEach items="${allMenu.data}" var="data">
    			<tr>
    				<td>${data.name}</td>
    				<td><img src="${rootPath}uploadImg/${data.imgUrl}" alt="未添加图片"></td>
    				<td>${data.typeName}</td>
    				<td>${data.price}</td>
    				<td>${data.num}</td>
    				<td><c:if test="${data.exist eq '0'}">暂缺</c:if><c:if test="${data.exist eq '1'}">可做</c:if></td>
    				<td>
    					<textarea rows="2" cols="14" readonly="readonly">${data.introduce}</textarea>
    				</td>
    				<td>
    					<a href="${rootPath}manage/MenuManager_toUpdateMenu?menu.id=${data.id}"><span class="glyphicon glyphicon-pencil"></span></a>&nbsp;&nbsp;&nbsp;&nbsp;
    					<a href="${rootPath}manage/MenuManager_deleteMenu?menu.id=${data.id}&menu.imgUrl=${data.imgUrl}" ><span class="glyphicon glyphicon-trash"></span></a>
    				</td>
    			</tr>
    		</c:forEach>
    		</table>
    </div>  
   <div class="page" id="div2">
    <ul class="pagination">
      <li><a href="${rootPath }manage/MenuManager_${adss}?page=${allMenu.prePage}">上一页</a></li>
     		<c:forEach var="i" begin="${allMenu.currentPage-3>0?allMenu.currentPage-3:1 }"
 					end="${allMenu.currentPage+3>allMenu.pageNum?allMenu.pageNum:allMenu.currentPage+3  }"> 
 					<c:choose> 
						<c:when test="${i>0 && i == allMenu.currentPage}">
 							<li class="active"><a href="${rootPath }manage/MenuManager_${adss}?page=${i }">${i}</a></li> 
 						</c:when>
 						<c:when test="${i>0 && i != allMenu.currentPage}">
 							<li><a href="${rootPath }manage/MenuManager_${adss}?page=${i }">${i}</a></li> 
 						</c:when> 
					</c:choose> 
 				</c:forEach> 
      <li><a href="manage/MenuManager_${adss}?page=${allMenu.nextPage}">下一页</a></li>
    </ul>
   </div>
</body>
</html>