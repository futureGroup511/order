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
	<form action="${rootPath}manage/StockAction_Update" method="post"> 
	<center>
	<tr>
		<td>编号:</td>
		<td><input name="stocks.id" value="${stock.id}" type="text" readonly="readonly"></td>
	</tr>
	<tr>
		<td>进货地点:</td>
		<td><input name="stocks.site" value="${stock.site}" type="text"><br></td>
		</tr>
	<tr>
		<td>进货总支出:</td>
		<td><input name="stocks.total" value="${stock.total}" type="text"></td>
	</tr>
	<tr>
		<td>进货时间:</td>
		<td> <input name="stocks.createDate" value="${stock.createDate}" type="text"><br></td>
	</tr>
	<tr>
		<td>备注:</td>
		<td><input name="stocks.remark" value="${stock.remark}" type="text"><br></td>
	</tr>
	         <button type="submit" value="修改">修改</button>
	</center>
	</form>
</body>
</html>