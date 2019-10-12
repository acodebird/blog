$(function(){
	//投喂博主的图片延迟加载
	$("img.lazyload").lazyload({failurelimit : 3});
	//加载热门文章
	loadHottestArticles();
	//加载最新文章
	loadLatestArticles();
	//加载专栏分类，即博客类型
	loadBlogType();
	//初始化首页展示的博客
	showBlogs();
});
//展示博客信息
function showBlogs(currentPage){
	$.ajax({
		url: "/blog/index/showBlogs",
		type: "get",
		data: {"currentPage":currentPage,"typeId":typeId},
		dataType: "json",
		success: function(data){
			window.currentPage = data.pageBean.currentPage;
			var content = "";
			if(data.pageBean!=null&&data.pageBean.list!=null&&data.pageBean.list.length>0){
				//拼接博客信息
				for(var i=0;i<data.pageBean.list.length;i++){
					content += splitBlogData(data.pageBean.list[i]);
				}
				$("#showBlogs").append(content);
				//如果还有博客则显示点击加载更多的按钮
				if(data.pageBean.currentPage<data.pageBean.totalPage){
					$("#moreBlog").html('<a class="btn  radius btn-block " href="javascript:void(0);" onclick="moreBlog();">点击加载更多</a>');
				}else{
					$("#moreBlog").html('<a class="btn  radius btn-block " href="javascript:void(0);">没有啦！</a>');
				}
			}else{
				//没有博客提示用户
				$("#moreBlog").html('<a class="btn  radius btn-block " href="javascript:void(0);">博主好懒啊，什么都没有！请尝试点击其他栏目......</a>');
			}
			//自动触发tags上绑定的click事件，从而实现不用点击就可以展示标签
			$(".tags").each(function(index,obj){
				$(obj).trigger("click",[obj]);
			});
		},
		//ajax请求加载完成之前给出正在加载等提示
		beforeSend:function(){
			$("#moreBlog").html('<a class="btn  radius btn-block" href="javascript:void(0);">加载中……</a>');
		  }
	});
} 
//拼接博客信息
function splitBlogData(blog){
	var content = "";
	content += '<li class="index_arc_item no_pic"><h4 class="title">';
	content += '<a href="/blog/blogDetail?id='+blog.id+'">'+blog.title+'</a>';
	content += '</h4><div class="date_hits"><span>ACodeBird</span><span>'+blog.releaseDateStr+'</span><span>';
	content += '<a href="/blog/views/article.jsp">'+blog.blogType.typename+'</a></span>';
	content += '<input class="tagsStr" type="hidden" value="'+blog.keyWord+'"> <span class="tags" onclick="showTags(this)"> </span>';
	content += '<p class="hits"><i class="Hui-iconfont" title="点击数量">&#xe6c1;</i>'+blog.clickHit+'°</p>';
	content += '<p class="commonts"><i class="Hui-iconfont" title="回复数量">&#xe622;</i> <span id="sourceId::105" class="cy_cmt_count">'+blog.replyHit+'</span></p></div>';
	content += '<div class="desc"><a href="/blog/blogDetail?id='+blog.id+'">'+blog.summary+'</a></div></li>';
	return content;
}
/**
 * 展示标签
 * @returns
 */
function showTags(obj){
	var tagsSpan = $(".tags");
	var tagsStrInput = $(".tagsStr");
	var tagsStr = "";
	for(var i=0;i<tagsSpan.length;i++){
		if(obj===tagsSpan[i]){
			tagsStr = $(tagsStrInput[i]).val();
		}
	}
	var tags = tagsStr.split(",");
	var content = "";
	for(var i=0;i<tags.length;i++){
		content += '<i class="Hui-iconfont" title="关键词">&#xe64b;</i>'+tags[i]+"&nbsp;&nbsp;";
	}
	$(obj).html(content);
}
/*
 * 加载更多博客
 */
function moreBlog(){
	showBlogs(window.currentPage+1);
}
/**
 * 加载博客类别
 * @returns
 */
function loadBlogType(){
	$.ajax({
		url: "/blog/blogType/admin/loadType",
		type: "POST",
		dataType: "json",
		success: function(data){
			var content = "";
			for(var i=0;i<data.length;i++){
				//判断当前博客类型并选中当前类型，未选中的绑定点击函数showBlogsByTypeId(typeId)
				if(typeId==0&&i==0){
					$("#navbar").html(data[0].typename);//导航栏显示当前博客类别
					content += '<input class="btn btn-primary radius nav-btn" type="button" value="'+data[0].typename+'">';
				}else if(typeId==data[i].id){
					$("#navbar").html(data[i].typename);//导航栏显示当前博客类别
					content += '<input class="btn btn-primary radius nav-btn" type="button" value="'+data[i].typename+'">';
				}else{
					content += '<input class="btn btn-primary-outline radius nav-btn" onclick="showBlogsByTypeId('+data[i].id+')" type="button" value="'+data[i].typename+'">';
				}
			}
			$("#blogType").html(content);
		}
	});
}
/**
 * 根据类型id展示指定类型博客
 * @param typeId
 * @returns
 */
function showBlogsByTypeId(typeId){
	location.href="/blog//views/article.jsp?typeId="+typeId;
}
/**
* 加载热门文章
*/
function loadHottestArticles(){
	$.ajax({
		url: "/blog/index/loadHottestArticles",
		type: "get",
		dataType: "json",
		success: function(data){
			var content = "";
			for(var i=0;i<data.length;i++){
				content += '<li><a href="/blog/blogDetail?id='+data[i].id+'" title="'+data[i].title+'">'+data[i].title+'</a>';
                content += '<p class="hits"><i class="Hui-iconfont" title="点击量">&#xe6c1;</i> '+data[i].clickHit+'° </p></li>';
			}
			$("#hottestArticles").html(content);
		}
	})
}
/**
* 加载最新文章
*/
function loadLatestArticles(){
	$.ajax({
		url: "/blog/index/loadLatestArticles",
		type: "get",
		dataType: "json",
		success: function(data){
			var content = "";
			for(var i=0;i<data.length;i++){
				content += '<li><a href="/blog/blogDetail?id='+data[i].id+'" title="'+data[i].title+'">'+data[i].title+'</a>';
                content += '<p class="hits"><i class="Hui-iconfont" title="评论量">&#xe622;</i> '+data[i].replyHit+' </p></li>';
			}
			$("#latestArticles").html(content);
		}
	})
}