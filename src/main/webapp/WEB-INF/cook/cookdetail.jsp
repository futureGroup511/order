<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>查看个人资料</title>
    <link rel="stylesheet" type="text/css" href="${rootPath}css/bootstrap.css">
     <style>
      .aa{
            width: 90%;
            height: 580px;
            margin: 0 auto;
            position: absolute;
            left: 5%;
            z-index: 100;
        }
        
        #a1{
            text-decoration: none;
            margin-top:30px;
            float: right;
            
        }
        #a1 a{
            color: black; 
        }
        #a1 a:hover{
            text-decoration: none;
            color: #2a6496; 
        }
        .pag{
            float: right;
            margin-top: -90px;
            margin-right:60px; 
        }
        table{
            width: 100%;
            text-align: center;
            margin:100px auto; 
            font-family: 微软雅黑;
         }
        #table1 thead td{
            border: 1px solid #c6c6c6;
            background-color: #e8e7e3;
            height: 40px;
           
        }
        #table1 tbody td{
            border: 1px solid #c6c6c6;
            background-color: #fefefe;
            height: 35px;
        }
         .footer{
            position: absolute;
            left:40%;
            top: 90%;
            }
        html{
            background: url(../images/m-91.jpg);
        }
</style>
</head>

<body>
  <div class="aa"> 
   <table id="table1">
       <thead>
          <tr>
             <td >ID</td>
             <td>姓名</td>
             <td>Phone</td>
             <td>角色</td>
             <td>注册时间</td>
             <td>备注</td>
             <td>编辑</td>
         </tr>
        </thead>
        <tbody>
          <tr>
			<td>${myself.id}</td>
			<td>${myself.name}</td>
			<td>${myself.phone}</td>
			<td>${myself.sort}</td>
			<td>${myself.createDate}</td>
			<td>${myself.remark}</td>
			<td><a href="${rootPath}cook/Cookdetail_updateUser"><span class="glyphicon glyphicon-edit"></span></a></td>
			</td>
		</tr>
        </tbody>
    </table>
        
    <div class="footer">
      <a href="">技术支持:河南艾未特网络有限公司</a> 
    </div>  
 </div>
</body>
</html>