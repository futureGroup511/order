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
         <th>餐桌id</th>
         <th>餐桌名称</th>
         <th>订单ID</th>
         <th>菜品ID</th>
         <th>菜品名称</th>
         <th>菜品数量</th>
         <th>菜品状态</th>
         <th>下单时间</th>
         <th>厨师ID</th>
         <th>厨师名称</th>
         <td>备注</td>
         <th>操作</th>
         
	</tr>
       	 <c:forEach items="${orderdetail}" var="item"> 
	            <tr>  
	                <td><intput >${item.id}</td>
	                <td>${item.tableId}</td>
	                <td>${item.tableName}</td>
	                <td>${item.orderId}</td>
	                <td>${item.menuId}</td>
	                <td>${item.menuName}</td>
	                <td>${item.menuNum}</td>
	                <td>${item.status}</td>
	                <td>${item.creatDate}</td>
	                <td>${item.cookId}</td>
	                <td>${item.cookName}</td>
	                <td>${item.remark}</td>
	                <td><a href="${rootPath}cook/orderCenter_doOrder?OrderId=${item.id}">完成</a></td>
	            </tr>  
        	</c:forEach>
	</table>
</body>
</html>