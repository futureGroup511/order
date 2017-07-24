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
	 <c:forEach items="${allTables.data}" var="t">  
	 array.push("${t.id}"); //js中可以使用此标签，将EL表达式中的值push到数组中  
	 </c:forEach>
	 var a = array.length;
 if(a==0){
	 document.getElementById('div1').style.display='none';
	 document.getElementById('div2').style.display='none';
 }
}
	</script>
</head>
<body  style="background: url(${rootPath}/images/m-91.jpg);">
		<center>
		<div style="font-weight: bold;">${managerMsg}</div>
		<div style="width:40%;height:35px; margin-bottom:2%;margin-top:3%;padding-top:3px;margin-left:0%; ">
			<form action="${rootPath}manage/TableManager_Inquiry" method="post">
				<select name="pass" style="margin-left:0px;border-radius:7px;background-color: #F0F0F0; height:23px; ">
					<option value="name">按名称查询</option>
					<option value="status">按状态查询</option>
				</select>
				<input style="background-color: #F0F0F0;border-radius: 5px;" type="text" name="replace" required="required">
				<button type="submit" style="border-radius: 5px;width:15%;background-color: #82C0E9;">查询</button>
			</form>
			
		</div> 
		</center>
<div class="wall">
	<div id="div1">
     <table cellspacing="0" border="1" align="center" style="background-color: white;" >
         <thead>
         <tr>
         	<th>餐桌编号</th>
            <th style="width: 90px;">餐桌名称</th>
            <th>状态</th>
            <th>操作</th>
             <th>操作</th>
          </tr>
         </thead>
        <tbody>
        <c:forEach items="${allTables.data}" var="pageCut">
			<tr>
				<td>${pageCut.id}</td>
				<td>${pageCut.name}</td>
				<td>
					<c:if test="${pageCut.status eq '无人'}">无人</c:if>
					<c:if test="${pageCut.status eq '有人'}">有人</c:if>
				</td>
				<td><a href="${rootPath}manage/TableManager_reWeiMa?name=${pageCut.name}&id=${pageCut.id}">下载二维码</a></td>
				<td>
					<a href="${rootPath}manage/TableManager_toUpdateTable?table.id=${pageCut.id}"><span class="glyphicon glyphicon-pencil"></span></a>&nbsp;&nbsp;&nbsp;
					<a href="${rootPath}manage/TableManager_deleteTable?table.id=${pageCut.id}"><span class="glyphicon glyphicon-trash"></span></a>
				</td>
			</tr>
		</c:forEach>
     </table>       
    </div>
    </div>
 <div class="page" id="div2">
      <ul class="pagination">
        <li><a href="${rootPath }manage/TableManager_${adss}?page=${allTables.prePage}">上一页</a></li>
       			<c:forEach var="i" begin="${allTables.currentPage-3>0?allTables.currentPage-3:1 }"
 					end="${allTables.currentPage+3>allTables.pageNum?allTables.pageNum:allTables.currentPage+3  }">

					<c:choose>
						<c:when test="${i>0 && i == allTables.currentPage &&i<=3}">
							<li class="active"><a href="${rootPath }manage/TableManager_${adss}?page=${i }">${i}</a></li>
						</c:when>
						<c:when test="${i>0 && i != allTables.currentPage &&i<=3}">
							<li><a href="${rootPath }manage/TableManager_${adss}?page=${i }">${i}</a></li>
						</c:when>
					</c:choose>
				</c:forEach>
        <li><a href="${rootPath }manage/TableManager_${adss}?page=${allTables.nextPage}">下一页</a></li>
      </ul>
 </div>
</body>
</html>