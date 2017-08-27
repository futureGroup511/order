<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${rootPath}css/manager/managermaterial.css">
    <link rel="stylesheet" type="text/css" href="${rootPath}css/bootstrap.css">
</head>
<body style="background: url(${rootPath}/images/m-91.jpg);">
	<div style="margin-top:1%;">
		<div style="margin-left: 43%;margin-top:1%;font-size: 15px;">${materialMsg}</div>
		<div style="margin-left:43%;margin-top:0%;">
			<button class="btn" onclick="window.location='${rootPath}manage/MenuMaterial_addMenuMaterial?menuId=${menu.id}';">添加新配料</button>
		</div>
	</div>
	<c:if test="${fn:length(allMenuMaterial)>0 }">
	<div class="wall">
        <table border="1" cellspacing="0" style="background-color: white;">
			<tr>
				<th>菜品名称</th>
				<th>配料名称</th>
				<th style="width:70px;">类型</th>
				<th>用量(kg)</th>
				<th style="width: 160px;">操作</th>
			</tr>
			<c:forEach items="${allMenuMaterial}" var="menuMaterial">
				<form action="${rootPath}manage/MenuMaterial_updateMaterial" method="post">
							<input type="hidden" name="menuMaterial.id" value="${menuMaterial.id}">
							<input type="hidden" name="menuMaterial.menuId" value="${menuMaterial.menuId}" >
					<tr>
						<td>${menuMaterial.menuName}</td>
						<td>${menuMaterial.ingName}</td>
						<td>${menuMaterial.type}</td>
						<td><input type="text" value="${menuMaterial.num}"name="menuMaterial.num" onkeyup="this.value=/^\d+\.?\d{0,3}$/.test(this.value) ? this.value : ''" ></td>
						<td>
							<input class="tableBtn" type="submit" value="修改">
							<input class="tableBtn" type="button" onclick="window.location='${rootPath}manage/MenuMaterial_deleteMaterial?menuMaterial.id=${menuMaterial.id}&menuMaterial.menuId=${menuMaterial.menuId}';" value="删除">
						</td>
					</tr>
				</form>
			</c:forEach>
		</table>
	</div>
	</c:if>
</body>
</html>