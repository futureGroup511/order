<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <!-- <meta name="viewport" content="width=device-width, initial-scale=1.0" /> -->
    <title>物联网餐饮管理系统-厨师</title>
    
    <link href="${rootPath}css/bootstrap.css" rel="stylesheet" />
    <link href="${rootPath}css/font-awesome.css" rel="stylesheet" />
    <link href="${rootPath}css/cook/basicwqj.css" rel="stylesheet" />
    <link href='http:/fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' >
</head>
<body>
    <div class="header"><!-- 头部 -->
            <img src="${rootPath}images/top.jpg" style="width:100%;height:125px;">
            <span>物联网餐饮管理系统</span> 
    </div>
    <div class="container"><!-- 此处包含左侧菜单和iframe标签的内容 -->
        <div class="sidebar-collapse"><!-- 左边的菜单栏 -->
          <ul class="nav" id="main-menu">
          
              <li><!-- 第一个父目录 -->
                   <a onclick=""><span class="glyphicon glyphicon-book"></span>订单中心<span class="fa arrow"></span></a>
                   <ul class="nav nav-second-level">
                      <li>
                          <a href="${rootPath}cook/orderCenter_checkorder" target="mainFrame"><span class="glyphicon glyphicon-tags"></span>所有订单</a>
                      </li>
                       <li>
                          <a href="${rootPath}cook/orderCenter_finish" target="mainFrame"><span class="glyphicon glyphicon-ok"></span>已完成订单</a>
                      </li>
                       <li>
                          <a href="${rootPath}cook/orderCenter_unfinishd" target="mainFrame"><span class="glyphicon glyphicon-repeat"></span>未完成订单</span></a>
                      </li>
                      <li>
                          <a href="${rootPath}cook/orderCenter_unfinishdmenu" target="mainFrame"><span class="glyphicon glyphicon-time"></span>未完成菜品</a>
                      </li> 
                   </ul> 
              </li>
              <li>
                   <a href="${rootPath}cook/orderCenter_reminder" target="mainFrame"><span class="glyphicon glyphicon-file"></span>催单中心<span class="fa arrow"></span></a>
                </li>
              <li> <!-- 第二个父目录 -->
                <a href="#"><span class="glyphicon glyphicon-map-marker"></span>个人中心<span class="fa arrow"></span></a>
                 <ul class="nav nav-second-level">
                    <li>
                        <a href="${rootPath}cook/Cookdetail_viewUser"  target="mainFrame"><span class="glyphicon glyphicon-eye-open"></span>查看个人资料</a>
                    </li>
                    <li>
                        <a href="${rootPath}cook/Cookdetail_updateUser"  target="mainFrame"><span class="glyphicon glyphicon-pencil"></span>修改个人资料</a>
                    </li>
                   
                      <li>
                       <a href="${rootPath}cook/Cookdetail_logOff"><span class="glyphicon glyphicon-off"></span>退出</a>
                  </li>
                  </ul>
              </li>
            </ul><!-- 总父目录结束 -->
        </div><!-- 左边的菜单栏结束 -->
         <iframe name="mainFrame" src="${rootPath}welcome.jsp"  id="ifr">
		 
		 </iframe>
          
        </div>
 
   <script src="${rootPath}js/jquery-1.10.2.js"></script>
   <script src="${rootPath}js/bootstrapwqj.js"></script>  
   <script src="${rootPath}js/jquery.metisMenu.js"></script>
   <script src="${rootPath}js/customwqj.js"></script>
</body>
<script>
  var ifr = document.getElementById('ifr');
  function aa(a){
     ifr.src = a + '.html';
  }
</script>
</html>

