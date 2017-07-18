<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <label>餐桌 &nbsp;id:</label>
              <input type="text" name="table.id" value="${updateTables.id}" readonly="readonly"><br>
            <label>餐桌名称:</label>
              <input type="text" name="table.name" value="${updateTables.name}" required="required"><br>
            <label>餐桌状态：</label>
	        <select name="table.status">
	            <option value="有人" <c:if test='${updateTables.status eq "有人"}'> selected="selected"</c:if>>有人</option>
	            <option value="无人" <c:if test='${updateTables.status eq "无人"}'> selected="selected"</c:if>>无人</option>
	        </select><br>
              <button style="background-color: #1BAFE0" type="submit">确认修改</button>
        </form>
    </div>
</body>
</html>