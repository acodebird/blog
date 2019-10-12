$(function(){
    var E = window.wangEditor;
    //这里的id为<div id="editor"中的id.
    var editor = new E('#editor');
    // 配置服务器端地址,也就是controller的请求路径，不带项目路径，前面没有/
    editor.customConfig.uploadImgServer = '/blog/admin/upload	';
    //配置属性名称，绑定请求的图片数据
    //controller会用到，可以随便设置，但是一定要与controller一致
    editor.customConfig.uploadFileName = 'image';
    editor.customConfig.uploadImgMaxSize = 3 * 1024 * 1024; // 将图片大小限制为 3M
    //不支持网络图片上传
    editor.customConfig.showLinkImg = false;
    //创建编辑器
    editor.create();
    
    //填充博客信息
    editor.txt.html(content);

    /*$("#editor").click(function(){
        //这是设置编辑器内容
        editor.txt.html("${blog.content}");
    });*/
    $("#cancel").click(function(){
    	var result = confirm("确认取消？取消后将不保存修改！");
    	//回到上一页
    	if(result){
    		history.go(-1);
    	}
    });
    //保存草稿
    $("#save").click(function(){
    	if(check()){
    		saveBlog(editor,0);
    	}
    });
    //更新文章
    $("#update").click(function(){
    	if(check()){
    		saveBlog(editor,1);
    	}
    });
    /*标签生成工具*/
    $(".tag").tagEditor({
    	maxTags: 5,
        placeholder: '<font color="black">点击添加标签，最多可以自定义5个标签。点击标签可以进行修改，确定标签请按Enter/鼠标左键!</font>',
        initialTags: keyWord
        
    });
    //ajax加载博客类型
    loadType();
})
//保存博客到数据库
function saveBlog(editor,state){
	var id = $("#id").val();
	var title = $("#title").val();
	var content = editor.txt.html();
	var typeId = $("#typeId").val();
	var keyWord = $("#tag").val();
	var summary = editor.txt.text().substring(0,150);
	var data = {"id":id,"title":title,"content":content,"typeId":typeId,"keyWord":keyWord,"summary":summary,"state":state};
	$.ajax({
		url: "/blog/admin/updateBlog",
		type: "POST",
		data: JSON.stringify(data),
		contentType: "application/json",
		dataType: "json",
		success: function(data){
			if(data.result=="success"){
				if(state==1){
					alert("博客修改成功！");
					location.href="/blog/admin/showBlogs";
				}else{
					alert("博客保存草稿成功！");
					location.href="/blog/admin/showBlogs?state=0";
				}
			}else{
				if(state==1) alert("博客修改失败！");
				else alert("博客保存草稿失败！");
			}
		}
	});
}
//加载博客类型进行选择
function loadType(){
	$.ajax({
		url: "/blog/blogType/admin/loadType",
		type: "POST",
		dataType: "json",
		success: function(data){
			if(data!=null&&data.length>0){
				var content = "<option value=''>--选择类别--</option>";
				for(i=0;i<data.length;i++){
					if(data[i].id==blogTypeId){
						content += "<option selected='selected' value='"+data[i].id+"'>"+data[i].typename+"</option>";
					}else{
						content += "<option value='"+data[i].id+"'>"+data[i].typename+"</option>";
					}
				}
				$("#typeId").html(content);
			}
		}
	});
}

/**
 * 检验博客信息必填项
 * @returns
 */
function check(){
	var flag = true;
	$(".error").css("display","none");
 	if($("#title").val()==null || $("#title").val()==""){
 		$('#titleSpan').show();
 		flag = false;
 	}
 	if($("#typeId").val()==null || $("#typeId").val()==""){
 		$('#typeIdSpan').show();
 		flag = false;
 	}
 	return flag;
}