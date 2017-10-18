<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" type="text/css" href="${rootPath}css/manager/managetables.css">
    <link rel="stylesheet" type="text/css" href="${rootPath}css/bootstrap.css">
    <style type="text/css">
    .card{
    	background-color: ;
    	width:600px;
    }
    
    </style>
<script language="javascript">
window.onload=function(){
	 var array = new Array();  
	 <c:forEach items="${paylist}" var="t">  
	 array.push("${t.id}"); //js中可以使用此标签，将EL表达式中的值push到数组中  
	 </c:forEach>
	 var a = array.length;
 if(a==0){
	 document.getElementById('div1').style.display='none';
 }
}
	</script>
</head>
<body  style="background: url(${rootPath}images/iframebg.jpg);">
<div class="wall">
	<center>${mark}</center>
	<div id="div1">
     <table cellspacing="0" border="1" align="center" style="background-color: white;" >
         <thead>
         <tr>
         	<th>编号</th>
            <th style="width: 90px;">支付方式</th>
             <th>操作</th>
          </tr>
         </thead>
        <tbody>
        <c:forEach items="${paylist}" var="item">
			<tr>
				<td>${item.id}</td>
				<td>${item.ways}</td>
				<td>
					<a href="${rootPath}manage/Payment_toUpdate?id=${item.id}"><span class="glyphicon glyphicon-pencil"></span></a>&nbsp;&nbsp;&nbsp;
					<a href="${rootPath}manage/Payment_deletePayWays?id=${item.id}"><span class="glyphicon glyphicon-trash"></span></a>
				</td>
			</tr>
		</c:forEach>
     </table>       
    </div>
    </div>
</body>
</html>