<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" type="text/css" href="${rootPath}css/manager/checkstock.css">
     <link href="${rootPath}css/manager/checkstock.css" rel="stylesheet" />
     <link rel="stylesheet" type="text/css" href="${rootPath}css/bootstrap.css">
     <script language="javascript">
window.onload=function(){
	 var array = new Array();  
	 <c:forEach items="${pc.data}" var="t">  
	 array.push("${t.id}"); //js中可以使用此标签，将EL表达式中的值push到数组中  
	 </c:forEach>
	 var a = array.length;
 if(a==0){
	 document.getElementById('div1').style.display='none';
	 document.getElementById('div2').style.display='none';
	 document.getElementById('div3').style.display='none';
	 document.getElementById('div4').style.display='none';
 }
}
	</script>
	<style type="text/css">
		.input{
		border-radius:7px;background-color: #F0F0F0;height:25px; width:10%;
		}
	</style>
</head>
<body   style="background: url(${rootPath}images/iframebg.jpg);">
<body>
<center>
<div style="font-weight: bold;margin-top:2%;">${stocknews }</div><br>
<div style="float:right;margin-right:55%;width:40%;height:30px; margin-top:0%; margin-bottom:-3%;">
	<form action="${rootPath}manage/StockAction_count" method="post">
		<input typpe="text" name="starttime" placeholder="请输入开始的时间" class="sang_Calender" style="border-radius:7px;background-color: #F0F0F0;" required="required">-<input type="text" name="endtime" placeholder="请输入截止的时间" class="sang_Calender" style="border-radius:7px;background-color: #F0F0F0;" required="required">
		 <script type="text/javascript" src="../js/datetime.js"></script>
		<button type="submit" style="border-radius: 5px;width:15%;background-color: #82C0E9;">查询</button>
	</form>
	</div>
<div style="margin-left:50%;">
	<form action="${rootPath}manage/StockAction_Inquiry" method="post">
		<input class="input
		" type="text" name="inquiry" style="width:20%;background-color: #F0F0F0;" placeholder="地点/总价格" required="required">
		<button style="border-radius: 5px;width:15%;background-color: #82C0E9;" class="btnForm">查询</button>	
	</form>
</div>
<c:if test="${fn:length(pc.data)>0}">
</center>
 <div class="checkstock" id="div1">
     <table cellspacing="0">
         <thead>
          <tr>
          <td colspan="7">进货信息</td>
          </tr>   
         </thead>
         <tbody>
         <tr class="tr1">
             <td>编号</td>
             <td>进货地点</td> 
             <td>进货总支出</td>
             <td>进货时间</td>
             <td>备注</td>
             <td>操作</td>
             <td>操作</td>
          </tr>
                 	 <c:forEach items="${pc.data}" var="item"> 
	            <tr>  
	                <td>${item.id}</td>
	                <td>${item.site}</td>
	                <td>${item.total}</td>
	                <td>${item.createDate}</td>
	                <td>${item.remark}</td>
	                <td  class="four"><a href="${rootPath}manage/StockDetailsAction_CheckStockDetails()?id=${item.id}">查看详情</a></td>      
	                <td  class="four"><a href="${rootPath}manage/StockAction_toUpdate()?id=${item.id}"><span class="glyphicon glyphicon-pencil"></span></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="${rootPath}manage/StockAction_Delet()?id=${item.id}"><span class="glyphicon glyphicon-trash"></span></a></td>      
	            </tr>  
        	</c:forEach>   
         </tbody>
     </table>
     <center>
      <div style="margin-top:0%;font-weight: bold;" id="div4"> 本页面进货总支出为(元):${sumprice}</div><br>
      <div style="margin-top:-1%;font-weight: bold;" id="div3"> ${dateStr}${mark}${dateend}${stocksums}${stocksum}</div>   
     </center>    
    </div>
    <div class="page" id="div2">
    <ul class="pagination">
     	<li><a href="${rootPath}manage/StockAction_${adss}?page=${pc.prePage}">上一页</a></li>
						<c:forEach var="i"
 							begin="${pc.currentPage-2>0?pc.currentPage-2:1 }" 
							end="${pc.currentPage+2>pc.pageNum?pc.pageNum:pc.currentPage+2  }"> 
 							<c:choose> 
 								<c:when test="${i>0 && i == pc.currentPage}"> 
									<li class="active"><a
 										href="${rootPath}manage/StockAction_${adss}?page=${i }">${i}</a></li>
 								</c:when>
 								<c:when test="${i>0 && i != postPS.currentPage}"> 
 									<li><a href="${rootPath}manage/StockAction_${adss}?page=${i }">${i}</a></li> 
 								</c:when> 
 							</c:choose> 
						</c:forEach>
			<li><a href="${rootPath}manage/StockAction_${adss}?page=${pc.nextPage}">下一页</a></li> 
		</ul>
    </div>
    </c:if>
</body>
</html>