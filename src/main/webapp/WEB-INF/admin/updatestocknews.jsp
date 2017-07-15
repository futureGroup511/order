<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${rootPath}css/manager/updatestocknews.css">
</head>
<body  style="background: url(${rootPath}/images/m-91.jpg);">
 <div class="updatestocknews">
      <form action="${rootPath}manage/StockDetailsAction_Update" method="post">
          <lable id="text">编号：</lable><input name="details.id" value="${stockDetails.id}" type="text" readonly="readonly"><br>
          <lable id="text">进货编号：</lable><input name="details.stockId" value="${stockDetails.stockId}" type="text" ><br>
          <lable id="text">配料编号：</lable><input type="text" name="details.ingId" value="${stockDetails.ingId}" ><br>
          <lable id="text">配料名称：</lable><input type="text" name="details.ingName" value="${stockDetails.ingName}"><br>
          <lable id="text">单价（元）：</lable><input type="text" name="details.price" value="${stockDetails.price}" ><br>
          <lable id="text">数量：</lable><input type="text" name="details.num" value="${stockDetails.num}"><br>
          <lable id="text">进货时间：</lable><input type="text" name="details.createDate" value="${stockDetails.createDate}" class="sang_Calender"><br>
          	<script type="text/javascript" src="../js/datetime.js"></script>
      	<lable>溯源:</lable><textarea style="" rows="5" cols="35" name="details.origins">${stockDetails.origins}</textarea><br>
      <div class="button">
         <input type="submit" value="修改" style="width:80px;">
      </div>
      </form>        
    </div>
</body>
</html>