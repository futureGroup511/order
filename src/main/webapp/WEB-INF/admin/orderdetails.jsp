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
<center>${markinfo}</center>
	<table width="1000px" height="100px" align="center" border="1">
	<tr>
				<td colspan="12" align="center">订单详细信息</td>
	</tr>
	<tr>
         <th>餐桌id</th>
         <th>餐桌名称</th>
         <th>订单id</th>
         <th>菜品id</th>
         <th>菜品名称 </th>
         <th>数量</th>
         <th>菜品状态</th>
         <th>订单时间</th>
         <th>厨师id</th>
         <th>厨师姓名</th>
         <th>备注</th>
         <th>操作</th>
	</tr>
       	 <c:forEach items="${alldetails}" var="item">  
	            <tr>
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
	                <td  class="four"> <img src="./staticFile/images/bian.png" style="width:25px;height:25px;"><a href="${rootPath}manage/OrderDetailsAction_Delet()?detailid=${item.id}">删除</a>&nbsp;&nbsp;&nbsp;&nbsp;<img src="./staticFile/images/lajitong.png" style="width:25px;height:25px;"><a href="${rootPath}manage/OrderDetailsAction_toUpdate()?detailid=${item.id}">修改</a></td>      
	            </tr>  
        	</c:forEach>
	</table>
</body>
</html>