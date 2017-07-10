<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
   <link href="${rootPath}css/bootstrap.css" rel="stylesheet" />
    <link href="${rootPath}css/font-awesome.css" rel="stylesheet" />
    <link href="${rootPath}css/basic.css" rel="stylesheet" />
</head>
<body>
<div class="header"><!-- 头部 -->
            <img src="${rootPath}images/beijing.jpg" style="width:100%;height:125px;">
           <span class="span1">订餐管理系统</span>
            <span class="span2">欢迎管理员登录</span>
    </div>
    <div class="container"><!-- 此处包含左侧菜单和iframe标签的内容 -->
        <div class="sidebar-collapse"><!-- 左边的菜单栏 -->
        <!--父目录-->
          <ul class="nav" id="main-menu">
              <li>
                <a><span class="glyphicon glyphicon-user"></span>&nbsp&nbsp&nbsp用户管理</a>
                  <!--子目录-->
                  <ul class="nav nav-second-level" style="background-color:red">
                    <li>
                      <a href="${rootPath}manage/Change_addUser" target="mainFrame"><span class="glyphicon glyphicon-plus-sign"></span>&nbsp&nbsp&nbsp增加用户</a>
                    </li>
                    <li>
                      <a href="${rootPath}manage/UserManager" target="mainFrame"><span class="glyphicon glyphicon-list-alt"></span>&nbsp&nbsp&nbsp管理用户</a>
                    </li>
                  </ul>
                
              </li>
              <li><!-- 第二个父目录 -->
                <a><span class="glyphicon glyphicon-fire"></span>&nbsp&nbsp&nbsp配料管理</a>
                <!--子目录-->
                    <ul class="nav nav-second-level">
                      <li>
                        <a href="${rootPath}manage/Change_addIngredient" target="mainFrame"><span class="glyphicon glyphicon-log-in"></span>&nbsp&nbsp&nbsp增加配料</a>
                      </li>
                      <li>
                          <a href="${rootPath}manage/Ingredient" target="mainFrame"><span class="glyphicon glyphicon-folder-close"></span>&nbsp&nbsp&nbsp管理配料</a>
                      </li>
                    </ul>
              </li>
              <li><!-- 第三个父目录 -->
                  <a><span class="glyphicon glyphicon-book"></span>&nbsp&nbsp&nbsp菜品管理</a>
                    <ul class="nav nav-second-level" >
                      <li>
                           <a href="${rootPath}manage/Change_addMenu" target="mainFrame"><span class="glyphicon glyphicon-move"></span>&nbsp&nbsp&nbsp增加菜品</a>
                      </li>
                      <li>
                          <a href="${rootPath}manage/MenuManager" target="mainFrame"><span class="glyphicon glyphicon-book"></span>&nbsp&nbsp&nbsp管理菜品</a>
                      </li>
                       <li>
                           <a href="${rootPath}manage/Change_addMenuType" target="mainFrame"><span class="glyphicon glyphicon-move"></span>&nbsp&nbsp&nbsp增加菜品类型</a>
                      </li>
                        <li>
                          <a href="${rootPath}manage/MenuTypeAction" target="mainFrame"><span class="glyphicon glyphicon-book"></span>&nbsp&nbsp&nbsp管理菜品类型</a>
                      </li>
                  </ul> 
              </li>
              <li><!-- 第四个父目录 -->
                   <a> <span class="glyphicon glyphicon-th-large"></span>&nbsp&nbsp&nbsp订单中心</a>
                   <ul class="nav nav-second-level">
                      
                       <li>
                          <a href="${rootPath}manage/OrderAction" target="mainFrame"><span class="glyphicon glyphicon-glass"></span>&nbsp&nbsp&nbsp管理订单</a>
                      </li>
                   </ul> 
              </li>
              <li><!-- 第五个父目录 -->
                  <a> <span class="glyphicon glyphicon-shopping-cart"></span>&nbsp&nbsp&nbsp进货管理</a>
                    <ul class="nav nav-second-level">
                      <li>
                          <a href="${rootPath}manage/Change_addStocks" target="mainFrame"> <span class="glyphicon glyphicon-plus-sign"></span>&nbsp&nbsp&nbsp增加进货</a>
                      </li>
                      <li>
                          <a href="${rootPath}manage/StockAction" target="mainFrame"><span class="glyphicon glyphicon-tint"></span>&nbsp&nbsp&nbsp管理进货</a>
                       </li>
                     </ul> 
              </li>
              <li> <!-- 第六个父目录 -->
                <a><span class="glyphicon glyphicon-folder-open"></span>&nbsp&nbsp&nbsp个人中心</a>
                 <ul class="nav nav-second-level">
                    <li>
                        <a href="${rootPath}manage/Change_getMyself" target="mainFrame"><span class="glyphicon glyphicon-phone"></span>&nbsp&nbsp&nbsp查看资料</a>
                    </li>
                    <li>
                        <a href="${rootPath}manage/Change_logOff"><span class="glyphicon glyphicon-new-window"></span>&nbsp&nbsp&nbsp退出登陆</a>
                    </li>
                </ul> <!-- 第六个子目录结束 -->
             </li> <!-- 第六个父目录结束 -->
          </ul><!-- 总父目录结束 -->
        </div><!-- 左边的菜单栏结束 -->
        <iframe src="${rootPath}manage/Change_getMyself"   id="ifr" name="mainFrame"></iframe>
    </div><!-- 左侧菜单和iframe标签的内容结束 -->
    <div class="footer">
       <a href="">技术支持:河南艾未特网络有限公司</a>  
    </div>
   
   <script src="${rootPath}js/jquery-1.10.2.js"></script>
   <script src="${rootPath}js/bootstrap.js"></script>  
   <script src="${rootPath}js/jquery.metisMenu.js"></script>
   <script src="${rootPath}js/custom.js"></script>


<!-- 	<div style="width: 10%;float: left;"> -->
<!-- 	<details> -->
<!-- 		<summary>用户管理</summary> -->
<%-- 		<a href="${rootPath}manage/Change_addUser" target="mainFrame">增加用户</a><br> --%>
<%-- 		<a href="${rootPath}manage/UserManager" target="mainFrame">管理用户</a> --%>
<!-- 	</details> -->
<!-- 	<details> -->
<!-- 		<summary>配料管理</summary> -->
<%-- 		<a href="${rootPath}manage/Change_addIngredient" target="mainFrame">增加配料</a><br> --%>
<%-- 		<a href="${rootPath}manage/Ingredient" target="mainFrame">管理配料</a>           --%>
<!-- 	</details> -->
<!-- 	<details> -->
<!-- 		<summary>菜品管理</summary> -->
<%-- 		<a href="${rootPath}manage/Change_addMenu" target="mainFrame">增加菜品</a><br> --%>
<%-- 		<a href="${rootPath}manage/MenuManager" target="mainFrame">管理菜品</a> --%>
<!-- 	</details> -->
<!-- 	<details> -->
<!-- 		<summary>订单管理</summary> -->
<%-- 		<a href="${rootPath}manage/OrderAction" target="mainFrame">管理订单</a> --%>
<!-- 	</details> -->
<!-- 	<details> -->
<!-- 		<summary>进货管理</summary> -->
<%-- 		<a href="${rootPath}manage/Change_addStocks" target="mainFrame">增加进货</a><br> --%>
<%-- 		<a href="${rootPath}manage/StockAction" target="mainFrame">管理进货</a> --%>
<!-- 	</details> -->
<!-- 	<details> -->
<!-- 		<summary>个人中心</summary> -->
<%-- 		<a href="${rootPath}manage/Change_getMyself" target="mainFrame">查看个人资料</a><br> --%>
<%-- 		<a href="${rootPath}manage/Change_logOff">退出登录</a> --%>
<!-- 	</details> -->
<!-- 	</div> -->
<!-- 	<div style="width:90%;float: right"> -->
<!-- 		<iframe height="400px" width="100%" name="mainFrame" src=""></iframe>  -->
<!-- 	</div> -->
	</body>
</html>