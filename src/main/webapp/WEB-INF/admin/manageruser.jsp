<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<script language="javascript">
window.onload=function(){
	 var array = new Array();  
	 <c:forEach items="${allUser.data}" var="t">  
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
<body>

${deleteUserMsg}
	<form name="inquiry" method="post" id="inquiry">
		<input type="text" name="inquiry">
		<button class="btnForm" onclick="inquiryByName()">账号查询</button>	
	</form>
<div class="select">
	<button class="btn" onclick="window.location='${rootPath}manage/UserManager?ask=manager';">所有管理员</button>
	<button class="btn" onclick="window.location='${rootPath}manage/UserManager?ask=cook';">所有厨师</button>
	<button class="btn" onclick="window.location='${rootPath}manage/UserManager?ask=all';">所有员工</button>
</div>
<div class="mangeruser" >
<div class="mangeruser" id="div1">
     <table cellspacing="0">
         <thead>
         <tr>
            <td>账号</td>
            <td>姓名</td>
            <td>注册时间</td>
            <td>身份</td>
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
        <li><a href="${rootPath }manage/UserManager?page=${allUser.prePage}">上一页</a></li>
        <c:forEach var="i" begin="${allUser.currentPage-3>0?allUser.currentPage-3:1 }"
					end="${allUser.currentPage+3>allUser.pageNum?allUser.pageNum:allUser.currentPage+3  }">
					<c:choose>
						<c:when test="${i>0 && i == allUser.currentPage &&i<=3}">
							<li class="active"><a href="${rootPath }manage/UserManager?page=${i }">${i}</a></li>
						</c:when>
						<c:when test="${i>0 && i != allUser.currentPage &&i<=3}">
							<li><a href="${rootPath }manage/UserManager?page=${i }">${i}</a></li>
						</c:when>
					</c:choose>
				</c:forEach>
        <li><a href="${rootPath }manage/UserManager?page=${allUser.nextPage}">下一页</a></li>
      </ul>
 </div>
 </div>
</body>
</html>