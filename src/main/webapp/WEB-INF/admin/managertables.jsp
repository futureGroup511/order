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

		<center>${TableMsg}共有数据${allTables.count}条</center>
<div>
     <table cellspacing="0" border="1" align="center">
         <thead>
         <tr>
            <td>餐桌名称</td>
            <td>状态</td>
            <td>操作</td>
            <td>操作</td>
            <td>操作</td>
          </tr>
         </thead>
        <tbody>
        <c:forEach items="${allTables.data}" var="pageCut">
			<tr>
				<td>${pageCut.name}</td>
				<td>
					<c:if test="${pageCut.status eq '0'}">空闲</c:if>
					<c:if test="${pageCut.status eq '1'}">使用中</c:if>
				</td>
				<td><a href="">生成二维码</a></td>
				<td><a href="${rootPath}manage/TableManager_toUpdateTable?table.id=${pageCut.id}"><span class="glyphicon glyphicon-pencil"></span>修改</a></td>
				<td><a href="${rootPath}manage/TableManager_deleteTable?table.id=${pageCut.id}"><span class="glyphicon glyphicon-trash">删除</a></td>
			</tr>
		</c:forEach>
     </table>       
    </div>
 <div class="page">
      <ul class="pagination">
        <li><a href="${rootPath }manage/TableManager?page=${allTables.prePage}">上一页</a></li>
        <c:forEach var="i" begin="${allTables.currentPage-3>0?allTables.currentPage-3:1 }"
					end="${allTables.currentPage+3>allTables.pageNum?allTables.pageNum:allTables.currentPage+3  }">
					<c:choose>
						<c:when test="${i>0 && i == allTables.currentPage &&i<=3}">
							<li class="active"><a href="${rootPath }manage/TableManager?page=${i }">${i}</a></li>
						</c:when>
						<c:when test="${i>0 && i != allTables.currentPage &&i<=3}">
							<li><a href="${rootPath }manage/TableManager?page=${i }">${i}</a></li>
						</c:when>
					</c:choose>
				</c:forEach>
        <li><a href="${rootPath }manage/TableManager?page=${allTables.nextPage}">下一页</a></li>
      </ul>
 </div>
</body>
</html>