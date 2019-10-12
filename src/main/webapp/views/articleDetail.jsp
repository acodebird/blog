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
<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath }/views/plugin/wangEditor/css/wangEditor.min.css">
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
                <img class="logo" src="${pageContext.servletContext.contextPath }/views/img/logo.png" alt="Lao王博客" />
            </a>
            <a class="logo navbar-logo-m visible-xs" href="${pageContext.servletContext.contextPath }/views/index.jsp">Lao王博客</a>
            <a aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs" href="javascript:void(0);" onclick="showSide();">&#xe667;</a>
            <nav class="nav navbar-nav nav-collapse w_menu" role="navigation">
                <ul class="cl">
                    <li> <a href="${pageContext.servletContext.contextPath }" data-hover="首页">首页</a> </li>
                    <li class="active"><a href="${pageContext.servletContext.contextPath }/views/article.jsp" data-hover="文章">文章</a></li>
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
                            <a href="/app/qq" onclick="layer.msg('正在通过QQ登入', {icon:16, shade: 0.1, time:0})" ><img class="avatar size-S" src="${pageContext.servletContext.contextPath }/views/img/qq.jpg" title="登入">登入</a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</header>

<!--导航条-->
<nav class="breadcrumb">
  <div class="container"> 
  <i class="Hui-iconfont">&#xe67f;</i> 
  <a href="${pageContext.servletContext.contextPath }" class="c-primary">首页</a> 
  <span class="c-gray en">&gt;</span>  
  <a href="${pageContext.servletContext.contextPath }/views/article.jsp" class="c-primary">文章</a>
   <span class="c-gray en">&gt;</span>  
   <span class="c-gray">${blog.title }</span></div>
</nav>

<section class="container pt-20">
		<div class="row w_main_row">
			<div class="col-lg-9 col-md-9 w_main_left">
				<div class="panel panel-default  mb-20">
					<!-- 文章内容 -->
					<div class="panel-body pt-10 pb-10">
						<h2 class="c_titile">${blog.title }</h2>
						<p class="box_c">
							<span class="d_time">发布时间：${blog.releaseDateStr }</span> <span>作者：<a
								href="#">ACodeBird</a></span> <span>类型：<a href="#">${blog.blogType.typename }</a></span>
							<span>阅读（${blog.clickHit }）</span>
						</p>
						<ul class="infos">${blog.content }
						</ul>
						<!-- 文章标签 -->
						<div class="keybq" id="tags"></div>
						<!-- 翻页 -->
						<div class="nextinfo">
							<p class="last">
								上一篇：
								<c:if test="${!empty lastBlog }">
									<a
										href="${pageContext.request.contextPath }/blogDetail?id=${lastBlog.id}">${lastBlog.title }</a>
								</c:if>
								<c:if test="${empty lastBlog }">
									<a href="javascript:void(0);">没有啦!</a>
								</c:if>
							</p>
							<p class="next">
								下一篇：
								<c:if test="${!empty nextBlog }">
									<a
										href="${pageContext.request.contextPath }/blogDetail?id=${nextBlog.id}">${nextBlog.title }</a>
								</c:if>
								<c:if test="${empty nextBlog }">
									<a href="javascript:void(0);">没有啦!</a>
								</c:if>
							</p>
						</div>
						<!-- 翻页结束 -->
					</div>
					<!-- 文章内容结束 -->

					<!-- 评论区 -->
					<div class="panel panel-default  mb-20">
						<div class="tab-category">
							<a href=""><strong>评论区</strong></a>
						</div>
						<!-- 评论传给后端的数据使用隐藏域，方便在js中获取-->
						<input id="blogId" type="hidden" value="${blog.id }"> <input
							id="replyId" type="hidden"> <input id="replyIp"
							type="hidden">

						<div class="panel-body">
							<div class="panel-body" style="margin: 0 3%;">
								<!--用于评论-->
								<div class="mt-20" id="ct">
									<!-- <div id="err" class="hidden Huialert radius"></div> -->
									<div id="err" class="Huialert radius" style="display: none"></div>
									<textarea id="comment" class="textarea" style="height: 100px;"
										placeholder="说点什么吧!"></textarea>
									<div id="addCommentBtn" class="text-r mt-20">
										<span id="countOfComment"
											style="padding-top: 10px; display: inline-block; vertical-align: middle;">还能输入100字</span>&nbsp;
										<button id="commentBtn" onclick="addComment(1)"
											class="btn btn-primary radius">发表评论</button>
										<button id="replyBtn" onclick="addComment(0);" type="button"
											class="hidden btn btn-primary radius mt-10">回复</button>
										&nbsp;&nbsp;&nbsp; <a><button id="cancelReplyBtn"
												onclick="cancelReply();" type="button"
												class="hidden btn btn-danger radius mt-10">取消回复</button></a>
									</div>
								</div>
								<br>
								<div class="line"></div>

								<!-- 评论信息展示开始 -->
								<div class="mb-20">
									<ul id="commentArea" class="commentList mt-50">
										<!-- 评论信息 -->
									</ul>
								</div>
								<!-- 评论信息展示结束 -->
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-3">
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
					<img data-original="${pageContext.servletContext.contextPath }/views/img/zhifubaoshoukuanma.jpg" class="img-responsive lazlyoad" alt="支付宝收款码">
				</div>
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
<script type="text/javascript" src="${pageContext.servletContext.contextPath }/views/plugin/wangEditor/js/wangEditor.min.js"></script>
<script type="text/javascript" src="${pageContext.servletContext.contextPath }/views/js/articleDetail.js"></script>
<script async src="//busuanzi.ibruce.info/busuanzi/2.3/busuanzi.pure.mini.js"></script>
<script type="text/javascript">
	//解决外部引入的js文件无法通过el表达式获取数据
	var keyWord = "${blog.keyWord}";
</script>
</body>
</html>
