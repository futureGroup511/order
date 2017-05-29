<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script language="javascript">
function CheckNopay(){
	window.location.href="${rootPath}manage/OrderAction_ChecknoPoy";
	}
function CheckPay(){
	window.location.href="${rootPath}manage/OrderAction_CheckPay";
	}
function Check(){
	window.location.href="${rootPath}manage/OrderAction";
	}
	</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<button onclick="return CheckNopay();">未付款</button>
<button onclick="return CheckPay();">已付款</button>
<button onclick="return Check();">查看全部</button>
	${marknews}
	<table width="1000px" height="100px" align="center" border="1">
	<tr>
				<td colspan="11" align="center">订单信息</td>
	</tr>
	<tr>
	  	 <th>id</th>
         <th>餐桌id</th>
         <th>餐桌名称</th>
         <th>总价</th>
         <th>状态</th>
         <th>订单时间</th>
         <th>厨师id</th>
         <th>厨师姓名</th>
         <th>备注</th>
         <th>操作</th>
         <th>操作</th>
	</tr>
       	 <c:forEach items="${alllist}" var="item"> 
	            <tr>  
	                <td><intput >${item.id}</td>
	                <td>${item.tableId}</td>
	                <td>${item.tableName}</td>
	                <td>${item.total}</td>
	                <td>${item.status}</td>
	                <td>${item.createDate}</td>
	                <td>${item.cookId}</td>
	                <td>${item.cookName}</td>
	                <td>${item.remark}</td>
	                <td  class="four"> <img src="./staticFile/images/bian.png" style="width:25px;height:25px;"><a href="${rootPath}manage/OrderDetailsAction?id=${item.id}">查看详情</a>&nbsp;&nbsp;&nbsp;&nbsp;<img src="./staticFile/images/lajitong.png" style="width:25px;height:25px;"><a href="${rootPath}manage/OrderAction_Pay()?id=${item.id}">付款</a></td>      
	                <td  class="four"> <img src="./staticFile/images/bian.png" style="width:25px;height:25px;"><a href="${rootPath}manage/OrderAction_Delet()?id=${item.id}">删除</a>&nbsp;&nbsp;&nbsp;&nbsp;<img src="./staticFile/images/lajitong.png" style="width:25px;height:25px;"><a href="${rootPath}manage/OrderAction_CheckOrder()?id=${item.id}">修改</a></td>      
	            </tr>  
        	</c:forEach>
	</table>
</body>
</html>