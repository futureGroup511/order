<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" type="text/css" href="${rootPath}css/manager/manageringredient.css">
     <link href="${rootPath}css/bootstrap.css" rel="stylesheet" />
</head>
<script language="javascript">
window.onload=function(){
	 var array = new Array();  
	 <c:forEach items="${allIngredient.data}" var="t">  
	 array.push("${t.id}"); //js中可以使用此标签，将EL表达式中的值push到数组中  
	 </c:forEach>
	 var a = array.length;
 if(a==0){
	 document.getElementById('div1').style.display='none';
	 document.getElementById('div2').style.display='none';
 }
}
	</script>
<body  style="background: url(${rootPath}/images/m-91.jpg);">
<center>
${updateIngredientMsg}${deleteIngredientMsg}
</center>
<div >
	<form action="${rootPath}manage/Ingredient_Inquiry" method="post">
	<select name="ask">
		<option value="name">名称</option>
		<option value="price">单价</option>
		<option value="num">库存</option>
		<option value="type">类型</option>
	</select>
		<input class="text" type="text" name="inquiry">
		<input class="btn" type="submit" value="查询">
	</form>
</div>
<center>
<div class="manageringredient" id="div1">
     <table cellspacing="0">
         <thead>
          <tr class="tr1">
             <td>名称</td>
             <td>单价</td> 
             <td>库存</td>
             <td>注册时间</td>
             <td>类型</td>
             <td>简介</td>
             <td>操作</td>
          </tr>   
         </thead>
         <tbody>
         <c:forEach items="${allIngredient.data}" var="ingredient">
			<tr>
				<td>${ingredient.name}</td>
				<td>${ingredient.price}</td>
				<td>${ingredient.num}</td>
				<td style="width:200px;">${ingredient.createDate}</td>
				<td>${ingredient.type}</td>
				<td style="width:380px;"><textarea style="float:left;" rows="2" cols="61">${ingredient.introduce}</textarea></td>
				<td >
					<a href="${rootPath}manage/Ingredient_toUpdateIngredient?ingredient.id=${ingredient.id}"><span class="glyphicon glyphicon-pencil"></span></a>&nbsp;&nbsp;&nbsp;
					<a href="${rootPath}manage/Ingredient_deleteIngredient?ingredient.id=${ingredient.id}"><span class="glyphicon glyphicon-trash"></span></a>
				</td>
			</tr> 
		</c:forEach>
         </tbody>
     </table>        
    </div>
    <div class="page" id="div2">
    <ul class="pagination">
      <li><a href="${rootPath}manage/Ingredient_${adss}?page=${allIngredient.prePage}">上一页</a></li>
		 		<c:forEach var="i" begin="${allIngredient.currentPage-3>0?allIngredient.currentPage-3:1 }" 
 					end="${allIngredient.currentPage+3>allIngredient.pageNum?allIngredient.pageNum:allIngredient.currentPage+3  }">
 					<c:choose>
 						<c:when test="${i>0 && i == allIngredient.currentPage &&i<=3}"> 
 							<li class="active"><a href="${rootPath }manage/Ingredient_${adss}?page=${i }">${i}</a></li> 
						</c:when> 
 						<c:when test="${i>0 && i != allIngredient.currentPage &&i<=3}"> 
 							<li><a href="${rootPath }manage/Ingredient_${adss}?page=${i }">${i}</a></li> 
						</c:when> 
 					</c:choose> 
 				</c:forEach>		
      <li><a href="${rootPath }manage/Ingredient_${adss}?page=${allIngredient.nextPage}">下一页</a></li>
    </ul>
</div>
</center>
</body>
</html>