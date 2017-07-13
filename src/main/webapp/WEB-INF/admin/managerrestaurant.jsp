<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body  style="background: url(${rootPath}/images/m-91.jpg);">
<center>
${addrest}
	<table cellspacing="0" border="1">
         <thead>
          <tr>
             <td colspan="5"><center>饭店信息</center></td>
          </tr>   
         </thead>
         <tbody>
          <tr>
             <td>名称</td>
             <td>电话</td>
             <td>地址</td>
             <td>简介</td>
             <td>操作</td>
           </tr>
	       <tr>  
	         <td><intput >${restaurants.name}</td>
	         <td>${restaurants.phone}</td>
	         <td>${restaurants.address}</td>
	         <td>${restaurants.introduce}</td>
	         <td  class="four"><a href="${rootPath}manage/Restaurant_toUpdate?id=${restaurants.id}"><span class="glyphicon glyphicon-pencil"></span>修改</a></td>            
	       </tr>                        
         </tbody>
     </table>
</center>
</body>
</html>