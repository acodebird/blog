<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>关于我 —  一个站在java开发之路上的草根程序员个人博客网站</title>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<meta name="keywords" content="个人博客,王风宇个人博客,个人博客系统,老王博客,王风宇">
<meta name="description" content="Lao王博客系统，一个站在java开发之路上的草根程序员个人博客网站。">
<LINK rel="Bookmark" href="${pageContext.servletContext.contextPath }/views/favicon.ico" >
<LINK rel="Shortcut Icon" href="${pageContext.servletContext.contextPath }/views/favicon.ico" />
<!--[if lt IE 9]>
<script type="text/javascript" src="/staticRes/js/html5shiv.js"></script>
<script type="text/javascript" src="/staticRes/js/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath }/views/plugin/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath }/views/plugin/Hui-iconfont/1.0.8/iconfont.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath }/views/css/common.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath }/views/plugin/pifu/pifu.css" />
<!--[if lt IE 9]>
<link href="/staticRes/lib/h-ui/css/H-ui.ie.css" rel="stylesheet" type="text/css" />
<![endif]-->
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } function showSide(){$('.navbar-nav').toggle();}</script>
</head>
<body>
<header class="navbar-wrapper">
    <div class="navbar navbar-fixed-top">
        <div class="container cl">
            <a class="navbar-logo hidden-xs" href="${pageContext.servletContext.contextPath }/views/index.jsp">
                <img class="logo" style="margin-right: 0px;height: 50px" width="150px" src="${pageContext.servletContext.contextPath }/views/img/logo.png" alt="程序鸟" />
            </a>
<%--             <a class="logo navbar-logo-m visible-xs" href="${pageContext.servletContext.contextPath }/views/index.jsp">Lao王博客</a>
            <a aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs" href="javascript:void(0);" onclick="showSide();">&#xe667;</a> --%>
            <nav class="nav navbar-nav nav-collapse w_menu" role="navigation">
                <ul class="cl">
                    <li> <a href="${pageContext.servletContext.contextPath }" data-hover="首页">首页</a> </li>
                    <li><a href="${pageContext.servletContext.contextPath }/views/article.jsp" data-hover="文章">文章</a></li>
                    <li> <a href="#" title="即将上线" data-hover="资源分享">资源分享</a> </li>
                    <li class="active"> <a href="${pageContext.servletContext.contextPath }/views/about.jsp" data-hover="关于我">关于我</a> </li>
                	<li> <a href="${pageContext.servletContext.contextPath }/views/mood.jsp" data-hover="公告">公告</a> </li>
                </ul>
            </nav>
            <nav class="navbar-nav navbar-userbar hidden-xs hidden-sm " style="top: 0;">
                <ul class="cl">
                    <li class="userInfo dropDown dropDown_hover">
                            <!--<a href="javascript:;" ><img class="avatar radius" src="img/40.jpg" alt="丶似浅 "></a>
                            <ul class="dropDown-menu menu radius box-shadow">
                                <li><a href="/app/loginOut">退出</a></li>
                            </ul>-->
                            <a href="/app/qq" onclick="layer.msg('正在通过QQ登入', {icon:16, shade: 0.1, time:0})" ><img class="avatar size-S" src="img/qq.jpg" title="登入">登入</a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</header>

<!--导航条-->
<nav class="breadcrumb">
    <div class="container"> <i class="Hui-iconfont">&#xe67f;</i> <a href="${pageContext.servletContext.contextPath }/views/index.jsp" class="c-primary">首页</a> <span class="c-gray en">&gt;</span>  <span class="c-gray">关于</span> </div>
</nav>

<section class="container">
    <div class="container-fluid">
        <div class="about">
            <h2>Just about me</h2>
            <ul>
                <p>一枚正在努力进步的javaWeb程序员。专长领域为Web开发、服务器端开发，目前正在向全栈工程师进发。。。</p>
            </ul>
            <h2>About my blog</h2>
            <ul>
                <p>域  名：wfyvv.com 注册于2017年02月02日</p>
                <p>服务器：腾讯云服务器 ，于2017年02月23日完成备案</p>
                <p>备案号：皖ICP备17002922号</p>
                <p>本站定位为IT技术博客站，博客内容主要涉及编程语言、前端开发、服务端开发及一些热门技术等方面，同时分享实用的开发资料。</p>
            </ul>
            <h2>Contact  me</h2>
            <ul>
                <p><i class="Hui-iconfont">&#xe67b;</i>qq : *********暂不公开 : (</p>
                <p><i class="Hui-iconfont">&#xe6d1;</i>git：https://git.oschina.net/wilco</p>
                <p><i class="Hui-iconfont">&#xe63b;</i>email : wfyv@qq.com</p>
            </ul>
        </div>

    </div>
</section>
<footer class="footer mt-20">
    <div class="container-fluid" id="foot">
        <p>Copyright &copy; 2018-2019 www.acodebird.cn <br>
	        <span id="busuanzi_container_site_pv">本站总访问量
	        	<span id="busuanzi_value_site_pv"></span>次
	        </span>
	        <a href="http://www.beian.miit.gov.cn" target="_blank">粤ICP备19103774号</a> <br>
        </p>
    </div>
</footer>
<script type="text/javascript" src="${pageContext.servletContext.contextPath }/views/plugin/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.servletContext.contextPath }/views/plugin/layer/3.0/layer.js"></script>
<script type="text/javascript" src="${pageContext.servletContext.contextPath }/views/plugin/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="${pageContext.servletContext.contextPath }/views/plugin/pifu/pifu.js"></script>
<script type="text/javascript" src="${pageContext.servletContext.contextPath }/views/js/common.js"></script>
<script> $(function(){ $(window).on("scroll",backToTopFun); backToTopFun(); }); </script>
<script async src="//busuanzi.ibruce.info/busuanzi/2.3/busuanzi.pure.mini.js"></script>
</body>
</html>
