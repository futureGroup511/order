<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>餐饮管理系统</title>
   <link href="${rootPath}css/bootstrap.css"  rel="stylesheet" />
    <link href="${rootPath}css/font-awesome.css" rel="stylesheet" />
    <link href="${rootPath}css/basic.css" rel="stylesheet" />
</head>
<body class="login" >
<div class="header" ><!-- 头部 -->
            <img src="${rootPath}images/header.jpg" style="width:100%;height:125px;">
           <span class="span1">餐饮管理系统</span>
            <span class="span2">欢迎<span style="font-family: 微软雅黑;">${userIndex.name}</span>登录</span>
    </div>
    <div class="container"><!-- 此处包含左侧菜单和iframe标签的内容 -->
        <div class="sidebar-collapse"><!-- 左边的菜单栏 -->
        <!--父目录-->
          <ul class="nav" id="main-menu">
                <li>
                	<a href="${rootPath}manage/TableManager?sort=cashier" target="mainFrame"><span class="glyphicon glyphicon-book"></span>&nbsp;&nbsp;&nbsp;管理餐桌</a>
         		</li>
               <li>
      				<a href="${rootPath}manage/OrderAction?sort=cashier" target="mainFrame"><span class="glyphicon glyphicon-glass"></span>&nbsp;&nbsp;&nbsp;管理订单</a>              
              <li>
                <a><span class="glyphicon glyphicon-folder-open"></span>&nbsp;&nbsp;&nbsp;个人中心</a>
                 <ul class="nav nav-second-level">
                    <li>
                        <a href="${rootPath}manage/Change_getMyself?sort=cashier" target="mainFrame"><span class="glyphicon glyphicon-phone"></span>&nbsp;&nbsp;&nbsp;查看资料</a>
                    </li>
                    <li>
                        <a href="${rootPath}manage/Change_logOff?sort=cashier"><span class="glyphicon glyphicon-new-window"></span>&nbsp;&nbsp;&nbsp;退出登陆</a>
                    </li>
                </ul> <!-- 第六个子目录结束 -->
             </li> <!-- 第六个父目录结束 -->
             </ul>
        </div><!-- 左边的菜单栏结束 -->
        <iframe src="${rootPath}welcome.jsp"   id="ifr" name="mainFrame"></iframe>
    </div><!-- 左侧菜单和iframe标签的内容结束 -->
    <div class="footer">
       <a href="">技术支持:河南艾未特网络有限公司</a>  
    </div>
   
   <script src="${rootPath}js/jquery-1.10.2.js"></script>
   <script src="${rootPath}js/bootstrap.js"></script>  
   <script src="${rootPath}js/jquery.metisMenu.js"></script>
   <script src="${rootPath}js/custom.js"></script>
	</body>
</html>