<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<center>${mark}</center>
<div>
	<form action="${rootPath}manage/OrderDetailsAction_ensureGive" method="post">
		<table>
			<tr> 
				<td>菜品名称：</td>
				<td>
					<select name="details.menuName" class="select"> 
						<c:forEach items="${menulist}" var="item">
							<option value="${item.name}">${item.name}</option> 
						</c:forEach> 
					</select>
				</td>
			</tr>
			<tr>
				<td>数量：</td>
				<td><input type="text" name="details.menuNum"></td>
			</tr>
			<tr>
			<td><button type="submit">确认赠菜</button></td>
			</tr>
		</table> 
	</form>
</div>
</body>
</html>