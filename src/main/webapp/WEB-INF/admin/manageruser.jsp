<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="${rootPath}css/manager/mangeruser.css">
    <link href="${rootPath}css/bootstrap.css" rel="stylesheet" />
    <script type="text/javascript">
	function inquiryByName() {
		document.inquiry.action="${rootPath}manage/UserManager?ask=phone";
		document.getElementById("inquiry").submit();
	}
</script>

</head>
<body  style="background: url(${rootPath}images/iframebg.jpg);"  >
	
	<div style="margin-left:60%; height:30px;margin-top:1%;">
		<div style="margin-left:-30%;font-weight: bold;">${updateUserMsg}${deleteUserMsg}</div>
		<c:if test="${fn:length(allUser.data) > 0 }">
		<form action="${rootPath}manage/UserManager_Inquiry" method="post">
		<select name="ask" style="border-radius:7px;background-color: #F0F0F0; height:25px;">
			<option value="phone">账号</option>
			<option value="name">姓名</option>
			<option value="sort">身份</option>
		</select>
			<input style="border-radius:7px;background-color: #F0F0F0;height:25px; width:30%;" type="text" name="inquiry" required="required">
			<input style="background-color: #82C0E9" type="submit" value="查询" >
		</form>
	</div>
<div class="mangeruser" id="div1" style="margin-top:1%;">
     <table cellspacing="0">
         <thead>
         <tr>
            <th>账号</th>
            <th>姓名</th>
            <th>注册时间</th>
            <th>身份</th>
            <th>操作</th>
          </tr>
         </thead>
        <tbody>
        <c:forEach items="${allUser.data}" var="pageCut">
			<tr>
				<td>${pageCut.phone}</td>
				<td>${pageCut.name }</td>
				<td>${pageCut.createDate }</td> 
				<td>
					<c:if test="${pageCut.sort eq 'manager' }">管理员</c:if>
					<c:if test="${pageCut.sort eq 'cook' }">厨师</c:if>
					<c:if test="${pageCut.sort eq 'cashier' }">收银员</c:if>	
				</td>
				<td>
					<a href="${rootPath}manage/UserManager_toUpdateUser?userId=${pageCut.id}"><span class="glyphicon glyphicon-pencil"></span></a>&nbsp;&nbsp;
					<a href="${rootPath}manage/UserManager_deleteUser?user.id=${pageCut.id}"><span class="glyphicon glyphicon-trash"></span></a>
				</td>
			</tr>
		</c:forEach>
     </table>       
    </div>
 <div class="page" id="div2">
      <ul class="pagination">
        <li><a href="${rootPath }manage/UserManager_${adss}?page=${allUser.prePage}">上一页</a></li>
        		<c:forEach var="i" begin="${allUser.currentPage-3>0?allUser.currentPage-3:1 }"
 					end="${allUser.currentPage+3>allUser.pageNum?allUser.pageNum:allUser.currentPage+3  }">
					<c:choose>
						<c:when test="${i>0 && i == allUser.currentPage}">
							<li class="active"><a href="${rootPath }manage/UserManager_${adss}?page=${i }">${i}</a></li>
						</c:when>
						<c:when test="${i>0 && i != allUser.currentPage}">
							<li><a href="${rootPath }manage/UserManager_${adss}?page=${i }">${i}</a></li>
						</c:when>
					</c:choose>
				</c:forEach>
        <li><a href="${rootPath }manage/UserManager_${adss}?page=${allUser.nextPage}">下一页</a></li>
      </ul>
 </div>
 </c:if>
</body>
</html>