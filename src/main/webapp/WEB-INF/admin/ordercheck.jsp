<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!-- fn标签用来判断list集合长度 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" type="text/css" href="${rootPath}css/ordercheck.css">
 <link rel="stylesheet" type="text/css" href="${rootPath}css/bootstrap.css">

 <script language="javascript">
function checkNopay(){
	window.location.href="${rootPath}manage/OrderAction?sign=no"; 
	}
function checkPay(){
	window.location.href="${rootPath}manage/OrderAction?sign=yes";
	}
	function print(id) {
		  var xpwidth=window.screen.width-10;
	        var xpheight=window.screen.height-35;
		window.open ("${rootPath}manage/OrderDetailsAction_Print?id="+id, "newwindow", 'width='+(window.screen.availWidth-10)+',height='+(window.screen.availHeight-30)+ ',top=0,left=0,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no'); //写成一行
	}
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" type="text/css" href="${rootPath}css/manager/ordercheck.css">
 <link rel="stylesheet" type="text/css" href="${rootPath}css/bootstrap.css">
</head>
<body  style="background: url(${rootPath}images/iframebg.jpg);">
<center>
<div style="font-weight: bold;font-size:20px;margin-top:2%;">${mark}</div>
</center>
<div class="ordercheck" id="div1">
	<div  style="float:right;margin-right:55%;width:40%;height:30px; margin-top:2%; margin-bottom:-10%;">
	<form action="${rootPath}manage/OrderAction_count" method="post">
		<input typpe="text" style="background-color: #F0F0F0;border-radius: 7px;" name="starttime" placeholder="请输入开始的时间" class="sang_Calender"  style="border-radius:7px;" required="required">-<input type="text" name="endtime" placeholder="请输入截止的时间" class="sang_Calender"  style="border-radius:7px;background-color: #F0F0F0;" required="required">
		 <script type="text/javascript" src="../js/datetime.js"></script>
		<button type="submit" style="border-radius: 5px;width:15%;background-color: #82C0E9;">查询</button>
	</form> 
	</div>
     <div class="button">
      <input type="button" onclick="return checkNopay();" value="未付款" style="border-radius: 5px;">
      <input type="button" onclick="return checkPay();" value="已付款" style="border-radius: 5px;">
      </div>  
      <div  style="float:right;margin-right:5%;width:25%;height:30px; margin-top:2%; margin-bottom:2%;">
	<form action="${rootPath}manage/OrderAction_Inquiry" method="post">
		<input type="text" name="inquiry" style="border-radius:7px;background-color: #F0F0F0;" required="required">
		<button class="btnForm" style="border-radius: 5px;width:15%;background-color: #82C0E9;">查询</button>	
</form>
</div>
<c:if test="${fn:length(pc.data) > 0 }">
      <div class="order">
       <table cellspacing="0" border="1">
         <thead>
          <tr>
             <td colspan="13">订单信息</td>
          </tr>   
         </thead>
         <tbody>
          <tr>
             <td>编号</td>
             <td style="width:70px;">餐桌编号</td>
             <td>餐桌</td>
             <td>总价</td>
             <td>状态</td>
             <td style="width:160px;">订单时间</td>
             <td style="width:70px;">厨师编号</td>
             <td style="width:80px;">厨师</td>
             <td style="width:70px;">收银编号</td>
             <td style="width:80px;">收银</td>
             <td style="width:180px;">备注</td>
             <td style="width:70px;">操作</td>
             <td>操作</td>
           </tr>
                  	 <c:forEach items="${pc.data}" var="item"> 
	            <tr>  
	                <td>${item.id}</td>
	                <td>${item.tableId}</td>
	                <td>${item.tableName}</td>
	                <td>${item.total}</td>
	                <td  id="status">${item.status}</td>
	                <td>${item.createDate}</td>
	                <td>${item.cookId}</td>
	                <td>${item.cookName}</td>
	                <td>${item.cashierId}</td>
	                <td>${item.cashierName}</td>
	                <td><textarea rows="2" cols="30" maxlength="254" style="resize:none" readonly="readonly">${item.remark}</textarea></td>
	                <td><a href="${rootPath}manage/OrderDetailsAction_CheckOrderDetails?id=${item.id}">查看详情</a></td>
	                <td  class="four"><a href="${rootPath}manage/OrderAction_toUpdate()?id=${item.id}"><span class="glyphicon glyphicon-pencil"></span></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="${rootPath}manage/OrderAction_Delet()?id=${item.id}"><span class="glyphicon glyphicon-trash"></span></a></td>      
	            </tr>  
        	</c:forEach>                         
         </tbody>
     </table>
     
 <center>
      <div style="margin-top:1%;font-weight: bold;" id="div4">本页面订单的总收入为(元)：${sumprice}</div>  <br>
      <div style="margin-top:0%;font-weight: bold;" id="div3">${dateStr}${marks}${dateend}${sums}${sum}</div>
     </center>
    </div>
 </div>
<div class="page" id="div2">
<ul class="pagination">
  <li><a href="${rootPath}manage/OrderAction_${adss}?page=${pc.prePage}&sign=${sign}">上一页</a></li>
  				<c:forEach var="i" begin="${pc.currentPage-3>0?pc.currentPage-3:1 }"
 					end="${pc.currentPage+3>pc.pageNum?pc.pageNum:pc.currentPage+3  }">
 
 							<c:choose> 
 								<c:when test="${i>0 && i == pc.currentPage}"> 
 									<li class="active"><a 
 										href="${rootPath}manage/OrderAction_${adss }?page=${i }&sign=${sign}">${i}</a></li> 
 								</c:when> 

 								<c:when test="${i>0 && i != postPS.currentPage}"> 
 									<li><a href="${rootPath}manage/OrderAction_${adss}?page=${i }&sign=${sign}">${i}</a></li> 
 								</c:when> 
 							</c:choose> 
 						</c:forEach> 
  <li><a href="${rootPath}manage/OrderAction_${adss}?page=${pc.nextPage}&sign=${sign}">下一页</a></li>
</ul>
 </div>   
 </c:if>
</body>
</html>