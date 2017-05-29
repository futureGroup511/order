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
<form action="${rootPath}manage/OrderAction_Update" method="post"> 
	<center>
		id:<input name="orders.id" value="${order.id}" type="text">
	         餐桌id:<input name="orders.tableId" value="${order.tableId}" type="text">
	         餐桌名称:<input name="orders.tableName" value="${order.tableName}" type="text"><br>
	         总价:<input name="orders.total" value="${order.total}" type="text">
	         状态:<input name="orders.status" value="${order.status}" type="text"><br>
	         订单时间:<input name="orders.createDate" value="${order.createDate}" type="text">
	         厨师id:<input name="orders.cookId" value="${order.cookId}" type="text"><br>
	         厨师姓名:<input name="orders.cookName" value="${order.cookName}" type="text">
	         备注:<input name="orders.remark" value="${order.remark}" type="text"><br>
	         <button type="submit" value="修改">修改</button>
	</center>
	</form>
</body>
</html>