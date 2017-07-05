<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/addstock.css">
</head>
<body>
 <div class="addstock">
   <form action="${rootPath}manage/StockAction_Add" method="post">
     <h4>${stocknews}</h4>
     <lable>地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;点&nbsp;&thinsp;：</lable><input type="text" name="stock.site"><br>
     <lable>总&nbsp;支&nbsp;出&nbsp;：</lable><input type="text" name="stock.total"><br>
     <lable>进货时间：</lable><input type="text"  name="stock.createDate" class="sang_Calender">
     <script type="text/javascript" src="../js/datetime.js"></script><br>
     <lable>备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注&nbsp;&thinsp;：</lable><input type="text" name="stock.remark">
      <div class="button">
        <input type="submit" value="提交">          
      </div>
    </form>   
   </div> 
<!-- 	<center> -->
<%-- 	${stocknews} --%>
<%-- 	<form action="${rootPath}manage/StockAction_Add" method="post"> --%>
<!-- 	地点:<input type="text" name="stock.site"> -->
<!-- 	总支出(元):<input type="text" name="stock.total"><br> -->
<!-- 	进货时间:<input type="text" name="stock.createDate"> -->
<!-- 	备注:<input type="text" name="stock.remark"><br> -->
<!-- 	<input type="submit" value="提交"> -->
<!-- 	</form> -->
<!-- 	</center> -->
</body>
</html>