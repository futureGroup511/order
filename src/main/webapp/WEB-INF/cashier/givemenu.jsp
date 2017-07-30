<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="${rootPath}manage/OrderDetailsAction_ensureGive" method="post"> 
	菜品名称：<select name="details.menuName" class="select"> 
		<c:forEach items="${menulist}" var="item">
			<option value="${item.name}">${item.name}</option> 
		</c:forEach> 
	</select>
	数量：<input type="text" name="details.menuNum">
	<button type="submit">确认赠菜</button> 
</form>
</body>
</html>