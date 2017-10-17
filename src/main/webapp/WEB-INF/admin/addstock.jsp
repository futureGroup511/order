<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${rootPath}css/manager/addstock.css">
</head>
<body   style="background: url(${rootPath}/images/m-91.jpg);">
 <div class="addstock">
   <form action="${rootPath}manage/StockAction_Add" method="post">
     <h4>${stocknews}</h4>
     <lable><span style="margin-right: 40px;">地</span>点：</lable><input type="text" name="stock.site" required="required" maxlength="10"><br>
     <lable><span style="margin-right: 10px;">总</span><span style="margin-right: 10px;">支</span>出：</lable><input type="text" name="stock.total" required="required" placeholder="请输入数字" onkeyup="this.value=/^\d+\.?\d{0,2}$/.test(this.value) ? this.value : ''"><br>
     <lable>进货时间：</lable><input type="text"  name="stock.createDate" class="sang_Calender" required="required" placeholder="请点击选择时间">
     <script type="text/javascript" src="../js/datetime.js"></script><br>
     <lable><span style="margin-right: 40px;">备</span>注：</lable><input type="text" name="stock.remark">
      <div class="button">
        <input type="submit" value="提交">          
      </div>
    </form>   
   </div> 
</body>
</html>