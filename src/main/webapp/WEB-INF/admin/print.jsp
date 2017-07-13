<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	 function p() {
		 window.print();
	} 

</script>
</head>
<body onload="p()">
<center>
<h3>${restlist.name}</h3><br>
**********************************<br>
收银票据<br>
**********************************<br>
</center>
	<table align="center">
	      <tr>
             <td>菜品名称</td>
             <td>数量</td>
             <td>单价(元)</td>        
           </tr>
           <c:forEach items="${orderlist}" var="item">  
	            <tr>
	                <td>${item.menuName}</td>
	                <td>${item.menuNum}</td>
	                <td>${item.remark}</td>
	            </tr>  
        	</c:forEach>
	</table>	
	<center>
	**********************************<br>
	<h4>消费总金额：${total}元<h4>收银员：${user.name}<br>
	**********************************<br>
	${restlist.name}  欢迎您下次光临<br>
	电话：${restlist.phone}<br>
	地址：${restlist.address}
	</center>
	</body>
</html>