<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<center>${addTableMsg}</center>
	<form action="${rootPath}manage/TableManager_addTable" method="post">
		<input type="text" name="table.name">
		<input type="submit" value="确认添加">
	</form>
	<center>温馨提示：新添加的餐桌并没有生成二维码，请手动生成二维码</center>
</body>
</html>