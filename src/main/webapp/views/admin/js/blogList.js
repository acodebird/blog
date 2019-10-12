$(function(){
	//搜索框
	searchBox();
	//加载博客类型
	loadType();
	//加载博客年份
	loadPublishYear();
	//显示查询条件，由于typeId和publishYear都是异步加载，在这里设置后总会被覆盖，所以放到下面请求成功再设置，keyWord则不需要，直接填充
	//功能：保证翻页也是根据查询条件翻页的
	if(keyWord!=null&&keyWord!=""){
		$("#keyWord").val(keyWord);
	}
	//查询提交操作
	$("#searchBtn").on("click",function(){
		var publishYear = $("#publishYear").val();
		var typeId = $("#type").val();
		var keyWord = $("#keyWord").val();
		location.href="/blog/admin/showBlogs?search=true&publishYear="+publishYear+
		"&typeId="+typeId+"&keyWord="+keyWord;
	})
	//自动触发tags上绑定的click事件，从而实现不用点击就可以展示标签
	$(".tags").each(function(index,obj){
		$(obj).trigger("click",[obj]);
	})
});

//显示编辑、删除按钮
function showEdit(obj){
	$(obj).find("a").eq(1).show();
	$(obj).find("a").eq(2).show();
}
//隐藏编辑、删除按钮
function hiddenEdit(obj){
	$(obj).find("a").eq(1).hide();
	$(obj).find("a").eq(2).hide();
}
//多条件查询框js控制
function searchBox(){
	$(".selemenu").click(function(){
			$(this).next().slideToggle();
			$(this).parents().siblings().find(".list").slideUp();
	})
	$(".list span").click(function(){
			var text=$(this).text();
			$(this).parent().prev().html(text);
			$(this).parent().prev().css("color","#666")
			$(this).parent().fadeOut();
	})
	$(function(){
		$(document).not($(".selectbox")).click(function(){
		     $(".list").fadeOut();
		})
		$(".selectbox").click(function(event){
		     event.stopPropagation();
		})
	})
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

//加载博客类型进行选择
function loadType(){
	$.ajax({
		url: "/blog/blogType/admin/loadType",
		type: "POST",
		dataType: "json",
		success: function(data){
			if(data!=null&&data.length>0){
				var content = "<option value=''>--不限(博客类型)--</option>";
				for(i=0;i<data.length;i++){
					if(typeId!=null&&typeId!=""&&typeId==data[i].id){
						content += "<option value='"+data[i].id+"' selected='selected'>"+data[i].typename+"</option>";
					}else{
						content += "<option value='"+data[i].id+"'>"+data[i].typename+"</option>";
					}

				}
				$("#type").html(content);
			}
		}
	});
}
//加载博客年份
function loadPublishYear(){
	$.ajax({
		url: "/blog/admin/loadPublishYear",
		type: "POST",
		data: {"state":1},
		dataType: "json",
		success: function(data){
			if(data!=null&&data.length>0){
				var content = "<option value=''>--不限(博客发表时间)--</option>";
				for(i=0;i<data.length;i++){
					if(publishYear!=null&&publishYear!=""&&publishYear==data[i]){
						content += "<option value='"+data[i]+"' selected='selected'>"+data[i]+"</option>";
					}else{
						content += "<option value='"+data[i]+"'>"+data[i]+"</option>";
					}
				}
				$("#publishYear").html(content);
			}
		}
	});
}
/**
 * 根据id删除博客信息
 */
function deteleBlog(id){
	var result = confirm("确认删除博客？删除后将无法恢复！");
	if(result){
		$.ajax({
			url: "/blog/admin/deleteBlog",
			data: {"id":id},
			type: "POST",
			dataType: "json",
			success: function(data){
				if(data.result=="success"){
					alert("删除成功");
					location.href="/blog/admin/showBlogs";
				}else{
					alert("删除失败");
				}
			}
		});
	}
}

/**
 * 博客管理列表翻页功能
 * @param currentPage
 * @returns
 */
function pageTurning(currentPage){
	var publishYear = $("#publishYear").val();
	var typeId = $("#type").val();
	var keyWord = $("#keyWord").val();
	if(search!=null&&search=="true"){
		location.href="/blog/admin/showBlogs?search="+search+"&currentPage="+currentPage+"&publishYear="+publishYear+
		"&typeId="+typeId+"&keyWord="+keyWord;
	}else{
		location.href="/blog/admin/showBlogs?currentPage="+currentPage;
	}
}