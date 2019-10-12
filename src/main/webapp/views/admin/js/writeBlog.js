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
    //不知网络图片上传
    editor.customConfig.showLinkImg = false;
    //创建编辑器
    editor.create();

    /*$("#editorSetBtn").click(function(){
        //这是设置编辑器内容
        editor.txt.html("dsafdfadsfdafdsfds");
    });*/
    $("#reset").click(function(){
    	var result = confirm("确认重置？重置后将无法恢复！");
    	if(result){
    		location.reload();//刷新当前页面
    	}
    });
    //保存草稿
    $("#save").click(function(){
    	if(check()){
    		saveBlog(editor,0);
    	}
    });
    //发表文章
    $("#publish").click(function(){
    	if(check()){
    		saveBlog(editor,1);
    	}
    });
    /*标签生成工具*/
    $(".tag").tagEditor({
    	maxTags: 5,
        placeholder: '<font color="black">点击添加标签，最多可以自定义5个标签。点击标签可以进行修改，确定标签请按Enter/鼠标左键!</font>'
        
    });
    //ajax加载博客类型
    loadType();
})
//保存博客到数据库
function saveBlog(editor,state){
	var title = $("#title").val();
	var content = editor.txt.html();
	var typeId = $("#typeId").val();
	var keyWord = $("#tag").val();
	var summary = editor.txt.text().substring(0,300);
	var data = {"title":title,"content":content,"typeId":typeId,"keyWord":keyWord,"summary":summary,"state":state};
	alert(JSON.stringify(data));
	$.ajax({
		url: "/blog/admin/publishBlog",
		type: "POST",
		data: JSON.stringify(data),
		contentType: "application/json",
		dataType: "json",
		success: function(data){
			if(data.result=="success"){
				if(state==1) alert("博客发表成功！");
				else alert("博客保存草稿成功！");
				location.reload();
			}else{
				if(state==1) alert("博客发表失败！");
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
					content += "<option value='"+data[i].id+"'>"+data[i].typename+"</option>";
				}
				$("#typeId").html(content);
			}
		}
	});
}
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