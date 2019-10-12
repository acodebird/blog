<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
<title>程序鸟的个人博客 — 每天飞高一点点</title>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<meta name="keywords" content="程序鸟的个人博客">
<meta name="description" content="每天飞高一点点">
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
<link href="${pageContext.servletContext.contextPath }/views//staticRes/lib/h-ui/css/H-ui.ie.css" rel="stylesheet" type="text/css" />
<![endif]-->
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } function showSide(){$('.navbar-nav').toggle();}</script>
</head>
<body>
<header class="navbar-wrapper">
    <div class="navbar navbar-fixed-top">
        <div class="container cl">
            <a class="navbar-logo hidden-xs" href="${pageContext.servletContext.contextPath }">
                <img class="logo" style="margin-right: 0px;height: 50px" width="150px" src="${pageContext.servletContext.contextPath }/views/img/logo.png" alt="程序鸟" />
            </a>
            <%-- <a class="logo navbar-logo-m visible-xs" href="${pageContext.servletContext.contextPath }">程序鸟</a> --%>
            <nav class="nav navbar-nav nav-collapse w_menu" role="navigation">
                <ul class="cl">
                    <li class="active"> <a href="javascript:void(0);" data-hover="首页">首页</a> </li>
                    <li><a href="${pageContext.servletContext.contextPath }/views/article.jsp" data-hover="文章">文章</a></li>
                    <li> <a href="#" title="即将上线" data-hover="资源分享">资源分享</a> </li>
                    <li> <a href="${pageContext.servletContext.contextPath }/views/about.jsp" data-hover="关于我">关于我</a> </li>
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
                            <a href="/app/qq" onclick="layer.msg('正在通过QQ登入', {icon:16, shade: 0.1, time:0})" ><img class="avatar size-S" src="${pageContext.servletContext.contextPath }/views/img/qq.jpg" title="登录">登录</a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</header>

<section class="container pt-20">
	<!--<div class="Huialert Huialert-info"><i class="Hui-iconfont">&#xe6a6;</i>成功状态提示</div>-->
  <!--left-->
  <div class="col-sm-9 col-md-9">
		<div class="mt-20 bg-fff box-shadow radius mb-5">
			<div class="tab-category">
				<a href=""><strong class="current">最新发布</strong></a>
			</div>
		</div>
		<div class="art_content">
			<ul class="index_arc" id="showBlogs">
          		<!-- 博客列表 -->
			</ul>
	  		<div class="text-c mb-20" id="moreBlog">
	  			<!-- 更多博客按钮 -->
		    </div>
		</div>
  </div>
  
  <!--right-->
  <div class="col-sm-3 col-md-3">
  	
  	<!--站点声明-->
        <div class="panel panel-default mb-20">
            <div class="panel-body">
                <i class="Hui-iconfont" style="float: left;">&#xe62f;&nbsp;</i>
                <div class="slideTxtBox">
                    <div class="bd">
                        <ul>
                            <li><a href="javascript:void(0);">ACodeBird博客测试版上线，欢迎访问</a></li>
                            <li><a href="javascript:void(0);">内容如有侵犯，请立即联系管理员删除</a></li>
                            <li><a href="javascript:void(0);">本站内容仅供学习和参阅，不做任何商业用途</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        
  	<!--博主信息-->
        <div class="bg-fff box-shadow radius mb-20">
            <div class="tab-category">
                <a href=""><strong>博主信息</strong></a>
            </div>
            <div class="tab-category-item">
                <ul class="index_recd">
                    <li class="index_recd_item"><i class="Hui-iconfont">&#xe653;</i>姓名：ACodeBird</li>
                    <li class="index_recd_item"><i class="Hui-iconfont">&#xe70d;</i>职业：JavaWeb开发</li>
                    <li class="index_recd_item"><i class="Hui-iconfont">&#xe63b;</i>邮箱：<a href="1768577878@qq.com">1768577878@qq.com</a></li>
                    <li class="index_recd_item"><i class="Hui-iconfont">&#xe671;</i>定位：广东 &middot; 广州</li>
                </ul>
            </div>
        </div>
  	
  	<!--热门推荐-->
        <div class="bg-fff box-shadow radius mb-20">
            <div class="tab-category">
                <a href=""><strong>热门推荐</strong></a>
            </div>
            <div class="tab-category-item">
                <ul class="index_recd clickTop" id="hottestArticles">
                	<!-- 热门文章 -->
                </ul>
            </div>
        </div>
  	
  	<!--最新文章-->
  	<div class="bg-fff box-shadow radius mb-20">
			<div class="tab-category">
				<a href=""><strong>最新文章</strong></a>
			</div>
			<div class="tab-category-item">
				<ul class="index_recd" id="latestArticles">
					<!-- 最新文章 -->
				</ul>
			</div>
		</div>
		
		<!--友情链接-->
		<div class="bg-fff box-shadow radius mb-20">
			<div class="tab-category">
				<a href=""><strong>友情链接</strong></a>
			</div>
			<div class="tab-category-item">
				<span><i class="Hui-iconfont">&#xe6f1;</i><a href="https://blog.csdn.net/ChOLg" title="CSDN" class="btn-link" target="_blank">CSDN</a></span>
				<span><i class="Hui-iconfont">&#xe6f1;</i><a href="https://github.com/acodebird" title="GitHub" class="btn-link" target="_blank">GitHub</a></span>
				<span><i class="Hui-iconfont">&#xe6f1;</i><a href="https://gitee.com/acodebird" title="码云" class="btn-link" target="_blank">码云</a></span>
				<span><i class="Hui-iconfont">&#xe6f1;</i><a href="https://acodebird.github.io/" title="acodebird.github.io" class="btn-link" target="_blank">acodebird.github.io</a></span>
				<span><i class="Hui-iconfont">&#xe6f1;</i><a href="http://www.jq22.com/demo/6f8c89ba-3cde-11e4-ae90-00163e001348/" title="标签编辑器" class="btn-link" target="_blank">Tag Editor</a></span>
				<span><i class="Hui-iconfont">&#xe6f1;</i><a href="https://www.kancloud.cn/wangfupeng/wangeditor3/332599" title="轻量富文本编辑器" class="btn-link" target="_blank">wangEditor</a></span>
			</div>
		</div>
        
		<!--捐赠图片-->
		<div class="bg-fff box-shadow radius mb-20">
			<div class="tab-category">
				<a href=""><strong>投喂博主</strong></a>
			</div>
			<div class="tab-category-item">
				<img data-original="${pageContext.servletContext.contextPath }/views/img/weixinshoukuanma.png" class="img-responsive lazyload" alt="微信收款码">
				<img data-original="${pageContext.servletContext.contextPath }/views/img/zhifubaoshoukuanma.jpg" class="img-responsive lazyload" alt="支付宝收款码">
			</div>
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
<script type="text/javascript" src="${pageContext.servletContext.contextPath }/views/plugin/jquery.SuperSlide/2.1.1/jquery.SuperSlide.min.js"></script>
<script type="text/javascript" src="${pageContext.servletContext.contextPath }/views/js/index.js"></script>
<script async src="//busuanzi.ibruce.info/busuanzi/2.3/busuanzi.pure.mini.js"></script>
</body>
</html>
