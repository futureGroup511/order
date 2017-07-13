<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" type="text/css" href="${rootPath}css/manager/updatetable.css">
</head>
<body  style="background: url(${rootPath}/images/m-91.jpg);">
	
	<div class="wall">
		<form action="${rootPath}manage/TableManager_updateTable" method="post">
			<label>餐桌 &nbsp;id;</label><input type="text" name="table.id" value="${updateTables.id}" readonly="readonly"><br>
			<label>餐桌名称:</label><input type="text" name="table.name" value="${updateTables.name}"><br>
			<input class="button" type="submit" value="确认修改">
		</form>
	</div>
</body>
</html>