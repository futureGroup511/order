<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script language="javascript">
        //防止页面后退
        history.pushState(null, null, document.URL);
        window.addEventListener('popstate', function () {
            history.pushState(null, null, document.URL);
        });
        window.location.href="${rootPath}manage/Change_out";
    </script>
</head>
<body>
<<<<<<< HEAD:src/main/webapp/WEB-INF/customer/success.jsp
删除成功！pretty good boy.
<%-- <table width="100%" border="1">
<tr>
	<th>菜名</th>
	<th>地址</th>
	<th>简介</th>
	<th>类型ID</th>
	<th>类型名称</th>
	<th>价格</th>
	<th>被订次数</th>
	<th>是否可以做</th>
	<th>创建时间</th>
</tr>
<c:forEach items="list" var="list">
<tr>
	<td>${menu.name}</td>
	<td>${menu.imgUrl}</td>
	<td>${menu.introduce}</td>
	<td>${menu.typeId}</td>
	<td>${menu.typeName}</td>
	<td>${menu.price}</td>
	<td>${menu.num}</td>
	<td>${menu.exist}</td>
	<td>${menu.createDate}</td>
</tr>
</c:forEach>
</table> --%>
=======

>>>>>>> 3a83ffce9b3c4e9e1fcfd6d2d7c0209cc68bf35a:src/main/webapp/WEB-INF/admin/logoff.jsp
</body>
</html>