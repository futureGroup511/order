<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <script type="text/JavaScript" src="js/jquery.js"></script>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	function changeSelected() {
		var typeName = '${updateMenu.typeName}';	//获得后台的要选中的值
		   var all_options = document.getElementById("typeName").options;
		   for (i=0; i<all_options.length; i++){
		      if (all_options[i].value == typeName)  // 根据option标签的value来进行判断  测试的代码这里是两个等号
		      {
		         all_options[i].selected = true;
		      }
		   }
		}
</script>
 <link rel="stylesheet" type="text/css" href="../css/updatemenu.css">
</head>
<body  onload="changeSelected()">
<div class="updatemenu">
   <form action="${rootPath}manage/MenuManager_updateMenu?menu.id=${updateMenu.id}&menu.imgUrl=${updateMenu.imgUrl}" method="post">
          <lable id="text">菜名：</lable><input type="text" name="menu.name" value="${updateMenu.name}">
          <lable id="text">类型名称：</lable>
          <select name="menu.typeName" id="typeName">
          <c:forEach items="${Typelist}" var="item">
          <option value="${item.name}">${item.name}</option>
          </c:forEach>
          </select><br>
          <lable id="text">价格：</lable><input type="text"name="menu.price" value="${updateMenu.price}">
          <lable id="text">被定次数：</lable><input type="text" name="menu.num" value="${updateMenu.num}"><br>
          <lable id="text">是否可以做：</lable>
			<select name="menu.exist">
			<option value="1" <c:if test="${updateMenu.exist eq '1'}">selected = selected</c:if>>可做</option>
			<option value="0" <c:if test="${updateMenu.exist eq '0'}">selected = selected</c:if>>暂缺</option>
			</select>
          <lable id="text">简介：</lable><input type="text" name="menu.introduce" value="${updateMenu.introduce}"><br>
           <lable id="text">图片：</lable><br>
           <img alt="加载中" src="${rootPath}uploadImg/${updateMenu.imgUrl}" width="70" height="50">
      <div class="button">
       <input type="submit" value="修改">&nbsp;&nbsp;&nbsp;<a href="${rootPath}manage/MenuManager_deleteMenu?menu.id=${updateMenu.id}&menu.imgUrl=${updateMenu.imgUrl}">删除</a>
      </div>
  </form>        
  </div> 
<%-- 	<center>	 --%>
<%-- 	<form action="${rootPath}manage/MenuManager_updateMenu?menu.id=${updateMenu.id}&menu.imgUrl=${updateMenu.imgUrl}" method="post" > --%>
<!-- 		<table> -->
<!-- 			<tr> -->
<!-- 				<td>菜名</td> -->
<%-- 				<td><input type="text" name="menu.name" value="${updateMenu.name}"></td> --%>
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td>类型名称</td> -->
<!-- 				<td> -->
<!-- 					<select name="menu.typeName" id="typeName"> -->
<%-- 						 <c:forEach items="${Typelist}" var="item"> --%>
<%-- 	           				<option value="${item.name}">${item.name}</option> --%>
<%--         				</c:forEach> --%>
<!-- 					</select> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td>价格</td> -->
<%-- 				<td><input type="text" name="menu.price" value="${updateMenu.price}"></td> --%>
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td>被定次数</td> -->
<%-- 				<td><input type="text" name="menu.num" value="${updateMenu.num}"></td> --%>
<!-- 			</tr> -->
<!-- 			<tr>	 -->
<!-- 				<td>是否可以做</td> -->
<!-- 				<td> -->
<!-- 					<select name="menu.exist"> -->
<%-- 						<option value="1" <c:if test="${updateMenu.exist eq '1'}">selected = selected</c:if>>可做</option>         --%>
<%-- 						<option value="0" <c:if test="${updateMenu.exist eq '0'}">selected = selected</c:if>>暂缺</option> --%>
<!-- 					</select> -->
<!-- 				</td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td>简介</td> -->
<%-- 				<td><input type="text" name="menu.introduce" value="${updateMenu.introduce}"></td> --%>
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td>图片</td> -->
<%-- 				<td><img alt="加载中" src="${rootPath}uploadImg/${updateMenu.imgUrl}" width="70" height="50"></td> --%>
<!-- 			</tr> -->
<!-- 			<tr> -->
<%-- 				<td><input type="submit" value="修改">&nbsp;&nbsp;&nbsp;<a href="${rootPath}manage/MenuManager_deleteMenu?menu.id=${updateMenu.id}&menu.imgUrl=${updateMenu.imgUrl}">删除</a></td> --%>
<!-- 			</tr> -->
<!-- 		</table> -->
<!-- 	</form> -->
<%-- 	</center> --%>
</body>
</html>