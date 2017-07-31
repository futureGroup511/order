<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" type="text/css" href="${rootPath}css/manager/givemenu.css">
</head>
<body>
<center><span style="font-weight: bold;font-size:18px;">${mark}</span></center>
<body style="background: url(${rootPath}/images/m-91.jpg);">
<div class="wall">
	<form action="${rootPath}manage/OrderDetailsAction_ensureGive" method="post" class="form0">
		<table>
			<tr> 
				<td><span>菜品名称：</span></td>
				<td>
					<select name="details.menuName" class="select"> 
						<c:forEach items="${menulist}" var="item">
							<option value="${item.name}">${item.name}</option> 
						</c:forEach> 
					</select>
				</td>
			</tr>
			<tr>
				<td><span>数量：</span></td>
				<td><input type="text"  name="details.menuNum" id="num" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"></td>
			</tr>
			<tr>
			<td> <input id="btn" type="submit" value="确认赠菜"></td>
			</tr>
		</table> 
	</form>
</div>
</body>
</html>