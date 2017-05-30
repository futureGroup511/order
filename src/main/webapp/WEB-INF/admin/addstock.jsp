<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<center>
	${stocknews}
	<form action="${rootPath}manage/StockAction_Add" method="post">
	地点:<input type="text" name="stock.site">
	总支出(元):<input type="text" name="stock.total"><br>
	进货时间:<input type="text" name="stock.createDate">
	备注:<input type="text" name="stock.remark"><br>
	<input type="submit" value="提交">
	</form>
	</center>
</body>
</html>