<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
 }
}
	function opennews(id) {
		window.open("${rootPath}manage/StockDetailsAction_preview?stocksid="+id,"newwindow",'height=800,width=600,top=100,left=450,toolbar=no,menubar=no,scrollbars=yes, resizable=no,location=no, status=no')  
    } 
	</script>
</head>
<body  style="background: url(${rootPath}images/iframebg.jpg);">
<center><div style="margin-top:1%;font-size:20px;;">${deleteMark}${markinfo}</span></div>
<c:if test="${fn:length(pc.data)>0 }">
<div style="float:right;margin-right:10%;width:30%;height:30px; margin-bottom:2%;margin-top:2%;">
	<form action="${rootPath}manage/StockDetailsAction_Inquiry" method="post"style="margin-left:10%;">
	<select name="ask" style="margin-left:0px;border-radius:7px;background-color: #F0F0F0; height:23px; ">
		<option value="ingName">名称</option>
		<option value="price">单价</option>
		<option value="num">数量</option>
	</select>
		<input  class="text" style="background-color: #F0F0F0;border-radius:5px;" type="text" name="inquiry" required="required">
		<input style="border-radius: 5px;width:15%;background-color: #82C0E9;" type="submit" value="查询">
	</form>
</div>
<div class="checkstock" id="div1">
     <table cellspacing="0">
         <thead>
          <tr>
          <td colspan="9">进货详细信息</td>
          </tr>   
         </thead>
         <tbody>
         <tr class="tr1">
             <td>编号</td>
             <td>进货编号</td> 
             <td>配料号</td>
             <td>配料名称</td>
             <td>单价</td>
             <td>数量</td>
             <td>进货时间</td>
             <td>操作</td>
             <td>操作</td>
          </tr>
                 	 <c:forEach items="${pc.data}" var="item"> 
	            <tr>  
	                <td>${item.id}</td>
	                <td>${item.stockId}</td>
	                <td>${item.ingId}</td>
	                <td>${item.ingName}</td>
	                <td>${item.price}</td>
	                <td>${item.num}</td>
	                <td>${item.createDate}</td>
	                 <td><button id="target" onclick="opennews(${item.id})" style="border-radius: 5px;width:80%;background-color: #82C0E9;">预览</button></td>
	                <td  class="four"><a href="${rootPath}manage/StockDetailsAction_toUpdate()?stocksid=${item.id}"><span class="glyphicon glyphicon-pencil"></span></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="${rootPath}manage/StockDetailsAction_delet?stocksid=${item.id}"><span class="glyphicon glyphicon-trash"></span></a></td>      
	            </tr>  
        	</c:forEach>   
         </tbody>
     </table>        
    </div>
    <div class="page" id="div2">
    <ul class="pagination">
     						<li><a
							href="${rootPath}manage/StockDetailsAction_${adss}?page=${pc.prePage}">上一页</a></li>
						<c:if test="${1 < pc.currentPage -3}">
							<li><a href="#">1</a></li>
						</c:if>

						<c:forEach var="i"
 							begin="${pc.currentPage-3>0?pc.currentPage-3:1 }" 
 							end="${pc.currentPage+3>pc.pageNum?pc.pageNum:pc.currentPage+3  }"> 
 							<c:choose> 
 								<c:when test="${i>0 && i == pc.currentPage}"> 
									<li class="active"><a
 										href="${rootPath}manage/StockDetailsAction_${adss}?page=${i }">${i}</a></li> 
 								</c:when> 

 								<c:when test="${i>0 && i != postPS.currentPage}"> 
 									<li><a href="${rootPath}manage/StockDetailsAction_${adss}?page=${i }">${i}</a></li> 
 								</c:when> 
 							</c:choose> 
 						</c:forEach> 
						<li><a 
							href="${rootPath}manage/StockDetailsAction_${adss}?page=${pc.nextPage}">下一页</a></li>
    </ul>
    </div>
    </c:if>
</body>
</html>