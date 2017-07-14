<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${rootPath}css/manager/checkmenutype.css">
    <link rel="stylesheet" type="text/css" href="${rootPath}css/bootstrap.css">
    <style type="text/css">
    .input{
    	border-radius:7px;background-color: #F0F0F0;height:25px; width:130px;
    }
    .selectBtn{
    	background-color: #75c7ed;
    	border-radius: 5px;
    }
    </style>
</head>
<body>
<center>
${marknews}<br>
<div style="margin-left:50%;">
	<form action="${rootPath}manage/MenuTypeAction_Inquiry" method="post">
		<input class="input" type="text" name="inquiry">
		<button class="selectBtn">名称查询</button>	
	</form>
</div>
</center>
<body   style="background: url(${rootPath}/images/m-91.jpg);">
<center>${marknews}</center>
<div class="wall">
       <table border="1" style="border-color:#C6C6C6;background-color: white;">
			<tr>
				<th>编号</th>
				<th>类型</th>
				<th style="width:110px;">图片</th>
				<th style="width:300px;">介绍</th>
				<th>操作</th>
			</tr>
		<c:forEach items="${pc.data}" var="pageCut">
			<tr>
				<td>${pageCut.id}</td>
				<td>${pageCut.name}</td>
				<td><img style="height:50px;width:110px;" src="${rootPath}uploadImg/${pageCut.imgUrl}" alt="未添加图片"></td>
				<td>
					<textarea rows="2" cols="35" readonly="readonly">${pageCut.remark}</textarea>
				</td>
				<td>
					<a href="${rootPath}manage/MenuTypeAction_toUpdateType?id=${pageCut.id}"><span  class="glyphicon glyphicon-pencil"></span></a>&nbsp;&nbsp;
					<a href="${rootPath}manage/MenuTypeAction_Delet?id=${pageCut.id}"><span class="glyphicon glyphicon-trash"></span></a>
				</td>
			</tr>
		</c:forEach>
        </table>
   </div>
   <div class="page">
        <ul class="pagination">
          <li><a href="${rootPath}manage/MenuTypeAction_${adss}?page=${pc.prePage}">上一页</a></li>
 						<c:forEach var="i" 
 							begin="${pc.currentPage-3>0?pc.currentPage-3:1 }" 
 							end="${pc.currentPage+3>pc.pageNum?pc.pageNum:pc.currentPage+3  }"> 
 							<c:choose> 
 								<c:when test="${i>0 && i == pc.currentPage &&i<=3}"> 
 									<li class="active"><a 
 										href="${rootPath}manage/MenuTypeAction_${adss}?page=${i }">${i}</a></li> 
 								</c:when>
 								<c:when test="${i>0 && i != postPS.currentPage &&i<=3}"> 
 									<li><a href="${rootPath}manage/MenuTypeAction_${adss}?page=${i }">${i}</a></li> 
 								</c:when> 
 							</c:choose> 
 						</c:forEach> 
  		<li><a href="${rootPath}manage/MenuTypeAction_${adss}?page=${pc.nextPage}">下一页</a></li>
       </ul>
   </div>   
  
</body>
</html>