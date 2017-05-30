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

	<table width="1000px" height="100px" align="center" border="1">
	<tr>
				<td colspan="11" align="center">订单信息</td>
	</tr>
	<tr>
	  	 <th>id</th>
         <th>菜品名称</th>
         <th>图片</th>
         <th>简介</th>
         <th>菜品类型Id</th>
         <th>类型名称</th>
         <th>价格</th>
         <th>被订次数</th>
         <th>是否可以做</th>
         <th>创建时间</th>
         
	</tr>
	            <tr>  
	                <td><intput >${menu.id}</td>
	                <td>${menu.name}</td>
	                <td>${menu.imgUrl}</td>
	                <td>${menu.introduce}</td>
	                <td>${menu.typeId}</td>
	                <td>${menu.typeName}</td>
	                <td>${menu.price}</td>
	                <td>${menu.exist}</td>
	                <td>${menu.createDate}</td>
	                <td><a href="${rootPath}cook/orderCenter_domenu">完成</a></td>
	            </tr>  
	</table>
</body>
</html>