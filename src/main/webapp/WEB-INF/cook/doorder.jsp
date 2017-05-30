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
	<c:forEach items="${menu}" var="items">
	            <tr>  
	                <td>${items.id}</td>
	                <td>${items.name}</td>
	                <td>${items.imgUrl}</td>
	                <td>${items.introduce}</td>
	                <td>${items.typeId}</td>
	                <td>${items.typeName}</td>
	                <td>${items.price}</td>
	                <td>${items.num}</td> 
	                <td>${items.exist}</td>
	                <td>${items.createDate}</td>
	                <td><a href="${rootPath}cook/orderCenter_domenu?orderId=${items.id}">完成</a></td>
	            </tr>
	            </c:forEach>  
	</table>
</body>
</html>