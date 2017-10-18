<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
         <link rel="stylesheet" type="text/css" href="${rootPath}css/bootstrap.css">

    <style>
   
    .aa{
          width: 90%;
          margin: 0 auto;
          position: absolute;
          left: 5%;
          z-index: 100;
          overflow:hidden;
    }
    .aa p{
        margin-top:30px;
        float: right; 
         margin-right:60px; 
        cursor: pointer;
    }
  .pag {
	float: right;
	margin-top: -40px;
	margin-right: 0px;
}
        table{
        
            width: 100%;
            text-align: center;
            margin:100px auto; 
            font-family: 微软雅黑;
         }
        
       #table2{
    position:relative;
    top:0;
    margin-bottom:40px;
    margin-top:80px;
    width:100%;
}
       #table2 thead td{

            border: 1px solid #c6c6c6;
            background-color: #e8e7e3;
            height: 30px; 
           
        }
       
         #table2  tbody td{
            border: 1px solid #c6c6c6;
            background-color: #fefefe;
            height: 30px;
        }
           .footer{
            position: absolute;
            left:40%;
            top: 90%;
            }
	html{
        background: url(${rootPath}images/iframebg.jpg);
    }
</style>
</head>
<script language="javascript">
window.onload = function() {
	var array = new Array();
	<c:forEach items="${paCut.data}" var="t">
	array.push("${t.id}"); //js中可以使用此标签，将EL表达式中的值push到数组中  
	</c:forEach>
	var a = array.length;
	if (a != 0) {
		document.getElementById('div1').style.display = 'block';
		
	}else{
		alert("无数据")
	}
}
	</script>
<body style="">
<div class="aa" id="div1" style="display: none">
 <table id="table2">
      <thead>
        <tr>
            <td colspan="10">催单信息</td>
        </tr>
      </thead>
        <tbody>
          <tr>
             <td>编号</td>
             <td style="width:250px">通知时间</td>
             <td>餐桌编号</td>
             <td>餐桌名称</td>
             <td>通知内容</td>
          </tr>
         <c:forEach items="${paCut.data}" var="item"> 
	            <tr>  
	                <td>${item.id}</td>
	                <td>${item.createDate}</td>
	                <td>${item.tableId}</td>
	                <td>${item.tableName}</td>
	                 <td style="width:400px;height:20px"><textarea readonly="readonly" style="width:400px;height:30px">${item.content}</textarea></td>
	            </tr>  
        	</c:forEach>
        </tbody>
    </table>
      <div class="pag">
         <ul class="pagination">
                  <li><a href="${rootPath}cook/orderCenter_reminder?page=${paCut.prePage}">上一页</a></li>
 						<c:if test="${1 < paCut.currentPage -3}"> 
 							<li><a href="#">1</a></li> 
 						</c:if>
 						<c:forEach var="i" 
							begin="${paCut.currentPage-3>0?paCut.currentPage-3:1 }"
 							end="${paCut.currentPage+3>paCut.pageNum?paCut.pageNum:paCut.currentPage+3  }"> 
 							<c:choose> 
 								<c:when test="${i>0 && i == paCut.currentPage &&i<=3}">
 									<li class="active"><a 
 										href="${rootPath}cook/orderCenter_reminder?page=${i}">${i}</a></li> 
 								</c:when> 

 								<c:when test="${i>0 && i != postPS.currentPage &&i<=3}"> 
 									<li><a href="${rootPath}cook/orderCenter_reminder?page=${i }">${i}</a></li> 
 								</c:when> 
 							</c:choose>
 						</c:forEach> 
 						
 						<li><a 
 							href="${rootPath}cook/orderCenter_reminder?page=${paCut.nextPage}">下一页</a></li> 
               </ul>
    </div>
    
</div>
<div class="footer">
             <a href="">技术支持:河南艾未特网络有限公司</a> 
        </div> 
</body>
</html>