<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>物联网餐饮管理系统</title>
   <link href="${rootPath}css/bootstrap.css"  rel="stylesheet" />
    <link href="${rootPath}css/font-awesome.css" rel="stylesheet" />
    <link href="${rootPath}css/basic.css" rel="stylesheet" />
</head>
<body class="login" >
<div class="header" ><!-- 头部 -->
            <img src="${rootPath}images/header.jpg" style="width:100%;height:125px;">
           <span class="span1">物联网餐饮管理系统</span>
            <span class="span2">欢迎<span style="font-family: 微软雅黑；">${userIndex.name}</span>登录</span>
    </div>
    <div class="container"><!-- 此处包含左侧菜单和iframe标签的内容 -->
        <div class="sidebar-collapse"><!-- 左边的菜单栏 -->
        <!--父目录-->
          <ul class="nav" id="main-menu">
              <li>
                <a><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;&nbsp;用户管理</a>
                  <!--子目录-->
                  <ul class="nav nav-second-level" style="background-color:red">
                    <li>
                      <a href="${rootPath}manage/Change_addUser" target="mainFrame"><span class="glyphicon glyphicon-plus-sign"></span>&nbsp;&nbsp;&nbsp;增加用户</a>
                    </li>
                    <li>
                      <a href="${rootPath}manage/UserManager" target="mainFrame"><span class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;&nbsp;管理用户</a>
                    </li>
                  </ul>
                
              </li>
              <li><!-- 第二个父目录 -->
                <a><span class="glyphicon glyphicon-fire"></span>&nbsp;&nbsp;&nbsp;配料管理</a>
                <!--子目录-->
                    <ul class="nav nav-second-level">
                      <li>
                        <a href="${rootPath}manage/Change_addIngredient" target="mainFrame"><span class="glyphicon glyphicon-log-in"></span>&nbsp;&nbsp;&nbsp;增加配料</a>
                      </li>
                      <li>
                          <a href="${rootPath}manage/Ingredient" target="mainFrame"><span class="glyphicon glyphicon-folder-close"></span>&nbsp;&nbsp;&nbsp;管理配料</a>
                      </li>
                    </ul>
              </li>
              <li><!-- 第三个父目录 -->
                  <a><span class="glyphicon glyphicon-book"></span>&nbsp;&nbsp;&nbsp;菜品管理</a>
                    <ul class="nav nav-second-level" >
                      <li>
                           <a href="${rootPath}manage/Change_addMenu" target="mainFrame"><span class="glyphicon glyphicon-move"></span>&nbsp;&nbsp;&nbsp;增加菜品</a>
                      </li>
                      <li>
                          <a href="${rootPath}manage/MenuManager?ask=all" target="mainFrame"><span class="glyphicon glyphicon-book"></span>&nbsp;&nbsp;&nbsp;管理菜品</a>
                      </li>
                  </ul> 
              </li>
              <li><!-- 第三个父目录 -->
                  <a><span class="glyphicon glyphicon-book"></span>&nbsp;&nbsp;&nbsp;菜类管理</a>
                    <ul class="nav nav-second-level" >
                       <li>
                           <a href="${rootPath}manage/Change_addMenuType" target="mainFrame"><span class="glyphicon glyphicon-move"></span>&nbsp;&nbsp;&nbsp;增加菜类</a>
                      </li>
                        <li>
                          <a href="${rootPath}manage/MenuTypeAction" target="mainFrame"><span class="glyphicon glyphicon-book"></span>&nbsp;&nbsp;&nbsp;管理菜类</a>
                      </li>
                  </ul> 
              </li>
              <li><!-- 追加父目录 -->
                  <a><span class="glyphicon glyphicon-book"></span>&nbsp;&nbsp;&nbsp;餐桌管理</a>
                    <ul class="nav nav-second-level" >
                      <li>
                           <a href="${rootPath}manage/Change_addTable" target="mainFrame"><span class="glyphicon glyphicon-move"></span>&nbsp;&nbsp;&nbsp;增加餐桌</a>
                      </li>
                      <li>
                          <a href="${rootPath}manage/TableManager" target="mainFrame"><span class="glyphicon glyphicon-book"></span>&nbsp;&nbsp;&nbsp;管理餐桌</a>
                      </li>
                  </ul> 
              </li>
              <li><!-- 第四个父目录 -->
                   <a> <span class="glyphicon glyphicon-th-large"></span>&nbsp;&nbsp;&nbsp;订单中心</a>
                   <ul class="nav nav-second-level">
                       <li>
                          <a href="${rootPath}manage/OrderAction" target="mainFrame"><span class="glyphicon glyphicon-glass"></span>&nbsp;&nbsp;&nbsp;管理订单</a>
                      </li>
                   </ul> 
              </li>
              <li><!-- 第五个父目录 -->
                  <a> <span class="glyphicon glyphicon-shopping-cart"></span>&nbsp;&nbsp;&nbsp;进货管理</a>
                    <ul class="nav nav-second-level">
                      <li>
                          <a href="${rootPath}manage/Change_addStocks" target="mainFrame"> <span class="glyphicon glyphicon-plus-sign"></span>&nbsp;&nbsp;&nbsp;增加进货</a>
                      </li>
                      <li>
                          <a href="${rootPath}manage/StockAction" target="mainFrame"><span class="glyphicon glyphicon-tint"></span>&nbsp;&nbsp;&nbsp;管理进货</a>
                       </li>
                     </ul> 
              </li>
              <li><!-- 第七个父目录 -->
                   <a> <span class="glyphicon glyphicon-th-large"></span>&nbsp;&nbsp;&nbsp;饭店管理</a>
                   <ul class="nav nav-second-level">
                       <li>
                          <a href="${rootPath}manage/Change_addRest" target="mainFrame"> <span class="glyphicon glyphicon-plus-sign"></span>&nbsp;&nbsp;&nbsp;增加饭店</a>
                      </li>
                      <li>
                          <a href="${rootPath}manage/Restaurant" target="mainFrame"><span class="glyphicon glyphicon-tint"></span>&nbsp;&nbsp;&nbsp;管理饭店</a>
                       </li>
                   </ul> 
              </li>
               <li><!-- 第七个父目录 -->
                   <a> <span class="glyphicon glyphicon-th-large"></span>&nbsp;&nbsp;&nbsp;域名管理</a>
                   <ul class="nav nav-second-level">
                       <li>
                          <a href="${rootPath}manage/Change_addIp" target="mainFrame"> <span class="glyphicon glyphicon-plus-sign"></span>&nbsp;&nbsp;&nbsp;增加域名</a>
                      </li>
                      <li>
                          <a href="${rootPath}manage/DomainAction" target="mainFrame"><span class="glyphicon glyphicon-tint"></span>&nbsp;&nbsp;&nbsp;管理域名</a>
                       </li>
                   </ul> 
              </li>
               <li><!-- 第八个父目录 -->
                   <a> <span class="glyphicon glyphicon-th-large"></span>&nbsp;&nbsp;&nbsp;支付管理</a>
                   <ul class="nav nav-second-level">
                      <li>
                        <a href="${rootPath}manage/Change_addPayment" target="mainFrame"><span class="glyphicon glyphicon-log-in"></span>&nbsp;&nbsp;&nbsp;增加方式</a>
                      </li>
                      <li>
                         <a href="${rootPath}manage/Payment" target="mainFrame"><span class="glyphicon glyphicon-glass"></span>&nbsp;&nbsp;&nbsp;管理方式</a>
                      </li>
                   </ul> 
              </li>
              <li> <!-- 第九个父目录 -->
                <a><span class="glyphicon glyphicon-folder-open"></span>&nbsp;&nbsp;&nbsp;个人中心</a>
                 <ul class="nav nav-second-level">
                    <li>
                        <a href="${rootPath}manage/Change_getMyself?sort=manager" target="mainFrame"><span class="glyphicon glyphicon-phone"></span>&nbsp;&nbsp;&nbsp;查看资料</a>
                    </li>
                    <li>
                        <a href="${rootPath}manage/Change_logOff?sort=manager"><span class="glyphicon glyphicon-new-window"></span>&nbsp;&nbsp;&nbsp;退出登录</a>
                    </li>
                </ul> <!-- 第六个子目录结束 -->
             </li> <!-- 第六个父目录结束 -->
          </ul><!-- 总父目录结束 -->
        </div><!-- 左边的菜单栏结束 -->
        <iframe src="${rootPath}welcome.jsp"   id="ifr" name="mainFrame"></iframe>
    </div><!-- 左侧菜单和iframe标签的内容结束 -->
    <div class="footer">
       <a href="#">技术支持:河南艾未特网络有限公司</a>  
    </div>
   
   <script src="${rootPath}js/jquery-1.10.2.js"></script>
   <script src="${rootPath}js/bootstrap.js"></script>  
   <script src="${rootPath}js/jquery.metisMenu.js"></script>
   <script src="${rootPath}js/custom.js"></script>
	</body>
</html>