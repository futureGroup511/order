<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.wall{
	width: 40%;
    height: auto;
    margin: 0 auto;
    margin-top: 2%;
}
table{
    width: 100%;
    text-align: center;
    background-color:white;
    border-color: #C6C6C6;
}
table th{
    text-align: center;
    height: 35px;
    background-color: #82C0E9;
    font-size: 18px;
}
table td{
    height: 32px;
}
.btn{
 	   hight:4%;
 	   width:13%;
       height:29px;
	   background:#75c7ed;
	   border-radius:5px; 
	   font-size:15px;
/* 	   margin-top:1%;} */}

</style>
</head>
<body  style="background: url(${rootPath}/images/m-91.jpg);">
${addrest}
	<div class="wall" >
	<table cellspacing="0" border="1">
         <tbody>
          <tr>
             <th>名称</th>
             <th>电话</th>
             <th>地址</th>
             <th>简介</th>
             <th>操作</th>	
           </tr>
	       <tr>  
	         <td>${restaurants.name}</td>
	         <td>${restaurants.phone}</td>
	         <td>${restaurants.address}</td>
	         <td>${restaurants.introduce}</td>
	         <td  class="four"><a href="${rootPath}manage/Restaurant_toUpdate?id=${restaurants.id}"><span class="glyphicon glyphicon-pencil"></span>修改</a></td>            
	       </tr>                        
         </tbody>
     </table>
</div>
</body>
</html>