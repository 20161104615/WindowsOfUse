<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<head>
  <title>MainPage</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <link rel="stylesheet" href="./layui/css/layui.css" media="all">
  <link rel="stylesheet" href="./css/admin.css" media="all">
  
  
</head>
<body class="layui-layout-body">
 <div id="LAY_app">
    <div class="layui-layout layui-layout-admin">
      <div class="layui-header">
        <!-- å¤´é¨åºå -->
        <ul class="layui-nav layui-layout-left">
          <li class="layui-nav-item layadmin-flexible" lay-unselect>
            <a href="javascript:;" layadmin-event="flexible" title="ä¾§è¾¹ä¼¸ç¼©">
              <i class="layui-icon layui-icon-shrink-right" id="LAY_app_flexible"></i>
            </a>
          </li>
          <li class="layui-nav-item" lay-unselect>
            <a href="javascript:;" layadmin-event="refresh" title="å·æ°">
              <i class="layui-icon layui-icon-refresh-3"></i>
            </a>
          </li>
        </ul>
        <ul class="layui-nav layui-layout-right" lay-filter="layadmin-layout-right">
        	<li class="layui-nav-item layui-hide-xs" lay-unselect>
	            <a href="javascript:;" layadmin-event="theme">
	              <i class="layui-icon layui-icon-theme"></i>
	            </a>
            </li>
        </ul>
      </div>
      
      <!-- ä¾§è¾¹èå -->
      <div class="layui-side layui-side-menu">
        <div class="layui-side-scroll">
          <div class="layui-logo" >
            <span>书有汇</span>
          </div>
          
          <ul class="layui-nav layui-nav-tree" lay-shrink="all" id="LAY-system-side-menu" lay-filter="layadmin-system-side-menu">
            <li data-name="home" class="layui-nav-item">
              <a href="javascript:;" lay-tips="主页" lay-direction="2">
                <i class="layui-icon layui-icon-home"></i>
                <cite>主页</cite>
              </a>
            </li>
            <li data-name="user" class="layui-nav-item">
              <a href="javascript:;" lay-tips="用户" lay-direction="2">
                <i class="layui-icon layui-icon-user"></i>
                <cite>用户</cite>
              </a>
              <dl class="layui-nav-child">
                <dd>
	              <a lay-href="/Homework/personinformation/demo.jsp" lay-tips="个人信息" lay-direction="2">
	                
	                <cite>个人信息</cite>
	              </a>
                </dd>
                <dd>
	              <a href="/Homework/mainpage/index.jsp" lay-tips="退出登陆" lay-direction="2">
	                <cite>退出登陆</cite>
	              </a>
                </dd>
              </dl>
            </li>
            
            <li data-name="set" class="layui-nav-item">
              <a href="javascript:;" lay-tips="查询" >
                <i class="layui-icon layui-icon-set"></i>
                <cite>查询</cite>
              </a>
              <dl class="layui-nav-child">
                <dd>
                  <a href="javascript:;" lay-tips="图书查询">图书查询</a>
                  <dl class="layui-nav-child">
                    <dd><a lay-href="set/system/website.html" lay-tips="书名查询">书名查询</a></dd>
                    <dd><a lay-href="set/system/email.html" lay-tips="作者查询">作者查询</a></dd>
                  </dl>
                </dd>
                <dd>
                  <a href="javascript:;" lay-tips="订单查询">订单查询</a>
                  <dl class="layui-nav-child">
                    <dd><a lay-href="set/user/info.html">NULL</a></dd>
                    <dd><a lay-href="set/user/password.html">NULL</a></dd>
                  </dl>
                </dd>
              </dl>
            </li>
            
            <li data-name="set" class="layui-nav-item">
              <a lay-href="/Homework/ShoppingCart/ShoppingCart.jsp" lay-tips="购物车" lay-direction="2">
	                <i class="layui-icon layui-icon-senior"></i>
	                <cite>购物车</cite>
	          </a>
            </li>
            
            <li data-name="set" class="layui-nav-item">
              <a href="javascript:;" lay-tips="订单" >
                <i class="layui-icon layui-icon-template"></i>
                <cite>订单</cite>
              </a>
              <dl class="layui-nav-child">
                <dd>
                  <a lay-href="/Homework/WebContent/PreviewOrderForm/PreviewOrderForm.jsp" lay-tips="确认订单">
                  	确认订单
                  </a>
                </dd>
                <dd>
                  <a lay-href="set/user/info.html" lay-tips="订单预览">订单预览</a>
                </dd>
              </dl>
            </li>
            
            
            
          </ul>
        </div>
      </div>

      <!-- é¡µé¢æ ç­¾ -->
      <div class="layadmin-pagetabs" id="LAY_app_tabs">
        <div class="layui-icon layadmin-tabs-control layui-icon-prev" layadmin-event="leftPage"></div>
        <div class="layui-icon layadmin-tabs-control layui-icon-next" layadmin-event="rightPage"></div>
        <!-- <div class="layui-icon layadmin-tabs-control layui-icon-next" layadmin-event="rightPage"></div> -->
        <div class="layui-icon layadmin-tabs-control layui-icon-down">
          <ul class="layui-nav layadmin-tabs-select" lay-filter="layadmin-pagetabs-nav">
            <li class="layui-nav-item" lay-unselect>
              <a href="javascript:;"></a>
              <dl class="layui-nav-child layui-anim-fadein">
                <dd layadmin-event="closeThisTabs"><a href="javascript:;">å³é­å½åæ ç­¾é¡µ</a></dd>
                <dd layadmin-event="closeOtherTabs"><a href="javascript:;">å³é­å¶å®æ ç­¾é¡µ</a></dd>
                <dd layadmin-event="closeAllTabs"><a href="javascript:;">å³é­å¨é¨æ ç­¾é¡µ</a></dd>
              </dl>
            </li>
          </ul>
        </div>
        <div class="layui-tab" lay-unauto lay-allowClose="true" lay-filter="layadmin-layout-tabs">
          <ul class="layui-tab-title" id="LAY_app_tabsheader">
            <li lay-id="console.html" class="layui-this"><i class="layui-icon layui-icon-home"></i></li>
          </ul>
        </div>
      </div>
      
      
      <!-- ä¸»ä½åå®¹ -->
      <div class="layui-body" id="LAY_app_body">
        <div class="layadmin-tabsbody-item layui-show">
          <iframe src="console.html" frameborder="0" class="layadmin-iframe"></iframe>
        </div>
      </div>
      
      <!-- è¾å©åç´ ï¼ä¸è¬ç¨äºç§»å¨è®¾å¤ä¸é®ç½© -->
      <div class="layadmin-body-shade" layadmin-event="shade"></div>
    </div>
  </div>

  <script src="./layui/layui.js"></script>
  <script>
  layui.config({
    base: './' //éæèµæºæå¨è·¯å¾
  }).extend({
    index: 'lib/index' //ä¸»å¥å£æ¨¡å
  }).use('index');
  </script>
</body>
</html>