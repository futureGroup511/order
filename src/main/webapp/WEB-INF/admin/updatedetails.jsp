<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="${rootPath}manage/OrderDetailsAction_Update" method="post"> 
	<center>
	<tr>
		<td>id:</td>
		<td><input name="details.id" value="${ordernews.id}" type="text" readonly="readonly"></td>
	</tr>
	<tr>
		<td>餐桌id:</td>
		<td><input name="details.tableId" value="${ordernews.tableId}" type="text"><br></td>
		</tr>
	<tr>
		<td>餐桌名称:</td>
		<td><input name="details.tableName" value="${ordernews.tableName}" type="text"></td>
	</tr>
	<tr>
		<td>订单id:</td>
		<td> <input name="details.orderId" value="${ordernews.orderId}" type="text" readonly="readonly"><br></td>
	</tr>
	<tr>
		<td> 菜品id:</td>
		<td><input name="details.menuId" value="${ordernews.menuId}" type="text"></td>
	</tr>
	<tr>
		<td>菜品名称:</td>
		<td><input name="details.menuName" value="${ordernews.menuName}" type="text"><br></td>
	</tr>
	<tr>
		<td>数量:</td>
		<td><input name="details.menuNum" value="${ordernews.menuNum}" type="text" readonly="readonly"></td>
	</tr>
	<tr>
		<td>菜品状态:</td>
		<td><input name="details.status" value="${ordernews.status}" type="text" readonly="readonly"><br></td>
	</tr>
	<tr>
		<td>订单时间:</td>
		<td><input name="details.creatDate" value="${ordernews.creatDate}" type="text" readonly="readonly"></td>
	</tr>
	<tr>
		<td>厨师id:</td>
		<td><input name="details.cookId" value="${ordernews.cookId}" type="text"><br></td>
	</tr>
	<tr>
		<td>厨师姓名:</td>
		<td> <input name="details.cookName" value="${ordernews.cookName}" type="text"></td>
	</tr>
	<tr>
		<td>备注:</td>
		<td> <input name="details.remark" value="${ordernews.remark}" type="text"><br></td>
	</tr>
	         <button type="submit" value="修改">修改</button>
	</center>
	</form>
</body>
</html>