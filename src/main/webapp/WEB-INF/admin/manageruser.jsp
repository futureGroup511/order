<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="../css/mangeruser.css">
    <link href="../css/bootstrap1.css" rel="stylesheet" />
</head>
<body>
<center>
${deleteUserMsg}
	共有数据${allUser.count}条
<div class="mangeruser" >
     <table cellspacing="0">
         <thead>
         <tr>
            <td>账号</td>
            <td>姓名</td>
            <td>注册时间</td>
            <td>身份</td>
            <td>操作</td>
            <td>操作</td>
          </tr>
         </thead>
        <tbody>
        <c:forEach items="${allUser.data}" var="pageCut">
			<tr>
				<td>${pageCut.phone}</td>
				<td>${pageCut.name }</td>
				<td>${pageCut.createDate }</td> 
				<td>${pageCut.sort }</td>
				<td><a href="${rootPath}manage/UserManager_toUpdateUser?userId=${pageCut.id}"><span class="glyphicon glyphicon-pencil"></span>修改</a></td>
				<td><a href="${rootPath}manage/UserManager_deleteUser?user.id=${pageCut.id}"><span class="glyphicon glyphicon-trash">删除</a></td>
			</tr>
		</c:forEach>
     </table>       
    </div>
 <div class="page">
      <ul class="pagination">
        <li><a href="${rootPath }manage/UserManager?page=${allUser.prePage}">上一页</a></li>
        <c:forEach var="i" begin="${allUser.currentPage-3>0?allUser.currentPage-3:1 }"
					end="${allUser.currentPage+3>allUser.pageNum?allUser.pageNum:allUser.currentPage+3  }">
					<c:choose>
						<c:when test="${i>0 && i == allUser.currentPage }">
							<li class="active"><a href="${rootPath }manage/UserManager?page=${i }">${i}</a></li>
						</c:when>
						<c:when test="${i>0 && i != allUser.currentPage }">
							<li><a href="${rootPath }manage/UserManager?page=${i }">${i}</a></li>
						</c:when>
					</c:choose>
				</c:forEach>
        <li><a href="${rootPath }manage/UserManager?page=${allUser.nextPage}">下一页</a></li>
      </ul>
 </div>
<%--  </center> --%>
<%-- 	<center> --%>
<%-- 	${deleteUserMsg} --%>
<%-- 	共有数据${allUser.count}条 --%>
<!-- 		<table border="1"> -->
<!-- 			<tr> -->
<!-- 				<td>账号</td> -->
<!-- 				<td>姓名</td> -->
<!-- 				<td>注册时间</td>  -->
<!-- 				<td>身份</td> -->
<!-- 				<td>操作</td> -->
<!-- 				<td>操作</td> -->
<!-- 			</tr> -->
<%-- 		<c:forEach items="${allUser.data}" var="pageCut"> --%>
<!-- 			<tr> -->
<%-- 				<td><input type="text" name="user.phone" value="${pageCut.phone}" readonly="readonly"></td> --%>
<%-- 				<td><input type="text" name="user.name" value="${pageCut.name }" readonly="readonly"></td> --%>
<%-- 				<td><input type="text" name="user.createDate" value="${pageCut.createDate }" readonly="readonly"></td>  --%>
<%-- 				<td><input type="text" name="user.sort" value="${pageCut.sort }" readonly="readonly"></td> --%>
<%-- 				<td><a href="${rootPath}manage/UserManager_toUpdateUser?userId=${pageCut.id}">修改</a></td> --%>
<%-- 				<td><a href="${rootPath}manage/UserManager_deleteUser?user.id=${pageCut.id}">删除</a></td> --%>
<!-- 			</tr> -->
<%-- 		</c:forEach> --%>
<!-- 		</table> -->
<%-- 		<a href="${rootPath }manage/UserManager?page=${allUser.prePage}">上一页</a> --%>
		
<%-- 		<c:forEach var="i" begin="${allUser.currentPage-3>0?allUser.currentPage-3:1 }" --%>
<%-- 					end="${allUser.currentPage+3>allUser.pageNum?allUser.pageNum:allUser.currentPage+3  }"> --%>
<%-- 					<c:choose> --%>
<%-- 						<c:when test="${i>0 && i == allUser.currentPage }"> --%>
<%-- 							<li class="active"><a href="${rootPath }manage/UserManager?page=${i }">${i}</a></li> --%>
<%-- 						</c:when> --%>
<%-- 						<c:when test="${i>0 && i != allUser.currentPage }"> --%>
<%-- 							<li><a href="${rootPath }manage/UserManager?page=${i }">${i}</a></li> --%>
<%-- 						</c:when> --%>
<%-- 					</c:choose> --%>
<%-- 				</c:forEach> --%>
<%-- 			<a href="${rootPath }manage/UserManager?page=${allUser.nextPage}">下一页</a> --%>
<%-- 	</center> --%>
</body>
</html>