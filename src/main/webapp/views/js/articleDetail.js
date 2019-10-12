$(function(){
	//投喂博主的图片延迟加载
	$("img.lazyload").lazyload({failurelimit : 3});
	//加载热门文章
	loadHottestArticles();
	//加载最新文章
	loadLatestArticles();
	//展示博客标签
	showTags();
	//动态显示输入文字个数提示
	$("#comment").on("keyup",function(){
		var commentValue = $(this).val();
		if(commentValue.length>100){
			$(this).val(commentValue.substr(0,100));
		}
		var tip = "还能输入"+(100-$(this).val().length)+"字";
		$("#countOfComment").html(tip);
	});
	//加载评论
	loadComment($("#blogId").val());
	
})

function addComment(option){
	var content = $("#comment").val();
	if(content==null||content==""){
		$("#err").html("请输入内容！");
		$("#err").addClass("Huialert-danger");
		$("#err").removeClass("hidden");
		$("#err").fadeIn(3000);
		$("#err").fadeOut(2000,function(){
			$("#err").addClass("hidden");
		});
		return;
	}
	var blogId = $("#blogId").val();
	var replyId = $("#replyId").val();
	var replyIp = $("#replyIp").val();
	var state = 1;
	if(replyId==""||replyId==null){
		replyId = 0;
	}
	var data = {"blogId":blogId,"content":content,"replyId":replyId,"replyIp":replyIp,"state":state};
	$.ajax({
		url: "/blog/comment/addComment",
		type: "post",
		data: JSON.stringify(data),
		contentType: "application/json",
		dataType: "json",
		success: function(data){
			if(option==1) {
				$("#err").html("评论"+data.result+"！");
			}else {
				$("#err").html("回复"+data.result+"！");
			}
			if(data.result=="成功"){
				loadComment(blogId);//重新加载评论
				cancelReply();//回复完成后关闭回复框
				$("#err").addClass("Huialert-success");
				$("#blogId").val()
			}else{
				$("#err").addClass("Huialert-danger");
			}
			$("#err").removeClass("hidden");
			$("#err").fadeIn(2000);
			$("#err").fadeOut(3000,function(){
				$("#err").addClass("hidden");
			});
		}
	});
}

/**
 * 打开回复框，打开之前需要隐藏评论按钮
 * @param obj
 * @param replyId
 * @param replyIp
 * @returns
 */
function openReply(obj,replyId,replyIp){
	$("#commentBtn").addClass("hidden");//隐藏发表评论按钮
	$("#replyBtn").removeClass("hidden");//显示回复按钮
	$("#cancelReplyBtn").removeClass("hidden");//显示取消回复按钮
	$("#comment").val("");//清除上一次评论文本框的内容
	$("#comment").attr("placeholder","回复："+replyIp);//添加提示语，回复哪一个用户
	//初始化输入文字个数提示
	$("#countOfComment").html("还能输入"+100+"字");
	//将回复所需数据置于隐藏域，方便与后台交互
	$("#replyId").val(replyId);
	$("#replyIp").val(replyIp);
	$("#comment").focus();
}
/**
 * 取消回复，隐藏回复框，显示评论框
 * @returns
 */
function cancelReply(){
	$("#commentBtn").removeClass("hidden");//显示发表评论按钮
	$("#replyBtn").addClass("hidden");//隐藏回复按钮
	$("#cancelReplyBtn").addClass("hidden");//隐藏取消回复按钮
	$("#comment").val("");//清除上一次评论文本框的内容
	$("#comment").attr("placeholder","说点什么吧！");//将提示语重置成评论的提示语
	//初始化输入文字个数提示
	$("#countOfComment").html("还能输入"+100+"字");
	//将回复的数据清空
	$("#replyId").val("");
	$("#replyIp").val("");
}
/**
 * 展示标签
 * @returns
 */
function showTags(){
	var tags = keyWord.split(",");
	var content = "";
	for(var i=0;i<tags.length;i++){
		content += '<i class="Hui-iconfont" title="关键词">&#xe64b;</i>'+tags[i]+"&nbsp;&nbsp;";
	}
	$("#tags").html(content);
}
/**
 * 加载评论
 * 
 */
function loadComment(id){
	$.ajax({
		url: "/blog/comment/loadComment",
		type: "get",
		data: {"id":id},
		dataType: "json",
		success: function(data){
			var content = "";
			if(data.commentList!=null&&data.commentList.length>0){
				for(var i=0;i<data.commentList.length;i++){
					content += showComment(data.commentList[i]);
				}
			}else{
				content += "沙发还在，赶紧评论吧！";
			}
			$("#commentArea").html(content);
		}
	});
}
/**
 * 拼接评论
 * @param comment
 * @returns
 */

function showComment(comment){
	var content = "";
	content += '<li class="item cl"><a href="#"><i class="avatar size-L radius"><img alt="" src="http://q.qlogo.cn/qqapp/101388738/1CF8425D24660DB8C3EBB76C03D95F35/100"></i></a>';
	content += '<div class="comment-main"><header class="comment-header"><div class="comment-meta">';
	content += '<a class="comment-author" href="#">'+comment.userIp+'</a><time  class="f-r">'+comment.commentDateStr+'</time></div></header>';
	content += '<div class="comment-body"><p>'+comment.content+'</p>';
	content += '<button onclick="openReply(this,'+comment.id+',\''+comment.userIp+'\')" class="hf f-r btn btn-default size-S mt-10" name="2">回复</button><br><br>';
	/*评论回复开始	*/
	content += '<ul class="commentList">';
	if(comment.replys!=null&&comment.replys.length>0){
		for(var i=0;i<comment.replys.length;i++){
			content += '<li class="item cl"><a href="#"><i class="avatar size-L radius"><img alt="" src="http://qzapp.qlogo.cn/qzapp/101388738/1CF8425D24660DB8C3EBB76C03D95F35/100"></i></a>';
			content += '<div class="comment-main"><header class="comment-header"><div class="comment-meta"><a class="comment-author" href="#">'+comment.replys[i].userIp+'</a>';
			content += '&nbsp;&nbsp;回复&nbsp;&nbsp;'+comment.replys[i].replyIp+'<time class="f-r">'+comment.replys[i].commentDateStr+'</time></div></header><div class="comment-body">';
			content += '<p>'+comment.replys[i].content+'</p>';
			content += '<button onclick="openReply(this,'+comment.id+',\''+comment.replys[i].userIp+'\')" class="hf f-r btn btn-default size-S mt-10" name="2">回复</button></div></div></li>';
		}
		/*评论回复结束	*/
	}
	content += '</ul></div></div></li>';
	return content;	
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