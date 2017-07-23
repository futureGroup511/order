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
	 var a = '${domain.id}';
 	if(a==0){
	 document.getElementById('div1').style.display='none';
 	}
}
	</script>
</head>
<body  style="background: url(${rootPath}/images/m-91.jpg);">
<div style="margin-left:45%;font-size:15px;font-weight: bold;">${mark}</div>
<div class="wall"style="width:49%;">
	<div id="div1" >
	
     <table cellspacing="0" border="1" align="center" style="background-color: white;" >
         <thead>
         <tr>
            <th style="width: 70px;">域名编号</th>
            <th style="width: 300px;">域名</th>
        	<th>操作</th>
          </tr>
         </thead>
        <tbody>
        <tr>
        	<td>${domain.id}</td>
        	<td><textarea rows="3" cols="" style="width:100%;">${domain.ip}</textarea></td>
        	<td>
        		<a href="${rootPath}manage/DomainAction_toUpdateIp?"><span class="glyphicon glyphicon-pencil"></span></a>&nbsp;&nbsp;&nbsp;
				<a href="${rootPath}manage/DomainAction_deleteIp?"><span class="glyphicon glyphicon-trash"></span></a>
			</td>
        </tr>
        
     </table>       
    </div>
    </div>
</body>
</html>