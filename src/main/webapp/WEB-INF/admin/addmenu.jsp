<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/addmenu.css">
</head>
<body>
<center>
 <div class="addmenu">
 <h4>${addMsg}</h4>
   <form action="${rootPath}manage/MenuManager_addMenu" method="post">
     <lable>菜名：</lable><input type="text" name="menu.name"><br>
     <lable>类型名称：</lable>
     <select name="menu.typeName"> 
 			<c:forEach items="${Typelist}" var="item">  
 	           	<option value="${item.name }">${item.name}</option> 
         	</c:forEach> 
 	</select><br>
     <lable>价格：</lable><input type="text" name="menu.price"><br>
     <lable>被定次数：</lable><input type="text" name="menu.num"><br>
     <lable>是否可以做：</lable>
     <select name="menu.exist">
      <option value="1">可做</option>
       <option value="0">暂缺</option>
     </select><br>
     <label>简介：</label>
     <textarea rows="10" cols="30" name="menu.introduce"></textarea>
      <div class="button">
        <input type="submit" value="添加">          
      </div>
    </form>   
   </div> 
</center>
<%-- 	<center> --%>
<%-- 		${addMsg} --%>
<%-- 		<form action="${rootPath}manage/MenuManager_addMenu" method="post"> --%>
<!-- 			 <table> -->
<!-- 			 	<tr> -->
<!-- 			 		<td>菜名：</td> -->
<!-- 			 		<td><input type="text" name="menu.name"></td> -->
<!-- 			 	</tr> -->
<!-- 			 	<tr> -->
<!-- 			 		<td>类型名称：</td> -->
<!-- 					<td><select name="menu.typeName"> -->
<%-- 						 <c:forEach items="${Typelist}" var="item">  --%>
<%-- 	           				<option value="${item.name }">${item.name}</option> --%>
<%--         				</c:forEach> --%>
<!-- 					</select><td> -->
<!-- 			 	</tr> -->
<!-- 			 	<tr> -->
<!-- 			 		<td>价格：</td> -->
<!-- 			 		<td><input type="text" name="menu.price"></td> -->
<!-- 			 	</tr> -->
<!-- 			 	<tr> -->
<!-- 			 		<td>被定次数：</td> -->
<!-- 			 		<td><input type="text" name="menu.num"></td> -->
<!-- 			 	</tr> -->
<!-- 			 	<tr> -->
<!-- 			 		<td>是否可以做：</td> -->
<!-- 			 		<td> -->
<!-- 			 			<select name="menu.exist"> -->
<!-- 			 				<option value="1">可做</option> -->
<!-- 			 				<option value="0">暂缺</option> -->
<!-- 			 			</select> -->
<!-- 			 		</td> -->
<!-- 			 	</tr> -->
<!-- 			 	<tr> -->
<!-- 			 		<td>简介：</td> -->
<!-- 			 		<td><textarea rows="10" cols="40" name="menu.introduce"></textarea></td> -->
<!-- 			 	</tr> -->
<!-- 			 	<tr> -->
<!-- 			 		<td><input type="submit" value="添加"></td> -->
<!-- 			 	</tr> -->
<!-- 			 </table> -->
<!-- 		</form> -->
<%-- 	</center> --%>
</body>
</html>