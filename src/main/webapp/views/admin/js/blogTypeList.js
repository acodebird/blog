$(function() {
/**
 * DataTable属性配置以及生成datatable
 */	
    $('#myDatatable').DataTable({
    	"select": true,
        "processing": true,//数据加载时显示进度条
        "searching": false,//启用搜索功能
        "serverSide": true,//启用服务端分页（这是使用Ajax服务端的必须配置）
        "ajax": {
	        "url": "/blog/blogType/admin/showPage",
	        "type": "POST",
	        "data": function (d) {
	            d.pageNo = $("#myDatatable").DataTable().page();//获取当前页码
	        }
	    },
	    "dom": 'l<"right"B>rtip',//自定义文档对象，因为使用了自定义button,B代表Button,right是绑定在button上从classs，已经在showPage.jsp页面定义
	    //自定义button,实现添加用户、批量删除等操作，其中添加用户使用bootstrap的模态框实现（模态框在showPage.jsp页面配置，使用模态框时最好将其隐藏起来，可以解决引入模态框时影响页面其他布局焦点消失的问题）
	    "buttons": [
            {
                text: '添加博客类型',
                action: function ( e, dt, node, config ) {
                	//清除上次的数据
                	$("#typename").val("");
                	$("#orderNo").val("");
                	$("#addWindow").modal();//启用模态框，关闭调用$("#addWindow").modal(false)
                }
            },
            {
                text: '批量删除',
                action: function ( e, dt, node, config ) {
                	var strIds=[];
                	$("input:checked").each(function(){
                		if($(this).attr("name")!="checkAll"){
                			strIds.push($(this).parents("tr").children().eq(1).html());//获取选中的用户                 			
                		}
                	});
                	var strIds = strIds.join(",");//将选中的用户拼成?,?,?的格式
                	if(strIds!=null&&strIds.trim()!=""){
                		var data = {"ids":strIds};
                		var option = confirm("是否确认删除?删除后无法恢复！");
                		if(option){
                			$.ajax({
                				url :"/blog/blogType/admin/deleteMore",
                				type: "POST",
                				//traditional: true,
                				contentType: "application/json",
                				data: JSON.stringify(data),
                				success: function(data){
                					var table = $('#myDatatable').DataTable();
                					table.draw(false);
                					$('#checkAll').prop("checked",false);
                				}
                			});
                		}
                	}else{
                		alert("请选择要删除的用户!");
                	}
                }
            }
        ],
        "columns": [
        	/**
        	 * 设置列，必须跟后端传来的数据名保持一致（null代表没有对应数据），需要特别操作时给数据绑定函数，
        	 * "render":function (data, type, full, meta)，其中的data就是对应列从后台传来的数据，直接使用即可
        	 */
        	{"data":"null","render":function (data, type, full, meta) {
	            return "<td> <input type='checkbox' name='checkbox' class='checkboxes' /><td>";
	        }},
            {"data": "id"},
            {"data": "typename"},
            {"data": "orderNo"},
            {"data": "enable","render":function (data, type, full, meta) {
            	var content="<td> <div class='text-left'>";
            	content+="<a class='btn btn-primary  btn-mini' onclick='fnEdit(this)'><i class='fa fa-cog' aria-hidden='true''>编辑</i></a>";
            	content+="<a class='btn btn-danger  btn-mini' onclick='fnDelete(this)'><i class='fa fa-trash' aria-hidden='true'>删除</i></a>";
            	content+="</div></td>";
            	return content;
	        }},
        ],
        "info":true, //分页信息提示等等
        "paging":   true,
        "pagingType":   "full_numbers",
        "bLengthChange": true, //开关，是否显示每页显示多少条数据的下拉框
        "aLengthMenu": [[5, 10, 20], [5, 10, 20]],//设置每页显示数据条数的下拉选项
        'iDisplayLength': 10, //每页初始显示5条记录
        'bFilter': false,  //是否使用内置的过滤功能（是否去掉搜索框）
        "bSort": false, //是否可排序
        //"aoColumnDefs": [ { "bSortable": false, "aTargets": [ 0 ] }],//进制某列排序
       // "aaSorting": [[1, "asc"]],//指定某列按照什么规则排序
        "oLanguage":{  //语言转换
            "sProcessing": "处理中...",
            "sLengthMenu": "显示 _MENU_ 项结果",
            "sZeroRecords": "没有匹配结果",
            "sInfo": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
            "sInfoEmpty": "显示第 0 至 0 项结果，共 0 项",
            "sInfoFiltered": "(由 _MAX_ 项结果过滤)",
            "sInfoPostFix": "",
            "sSearch": "搜索:",
            "sUrl": "",
            "sEmptyTable": "表中数据为空",
            "sLoadingRecords": "载入中...",
            "sInfoThousands": ",",
            "oPaginate": {
            "sFirst": "  首页  ",
            "sPrevious": "  上一页  ",
            "sNext": "   下一页  ",
            "sLast": "  末页  "
            },
            "oAria": {
            "sSortAscending": ": 以升序排列此列",
            "sSortDescending": ": 以降序排列此列"
            }
        }
    });
    
    /**
     * 全选和全不选
     */
    $('#checkAll').change(function () {
	    var checked = $(this).prop("checked");
	    $("input[name='checkbox']").each(function() {
	    	$(this).prop("checked", checked);
	    });
	}); 
    /**
     * 添加博客类型后与后台进行交互
     */
    $("#addTypename").click(function(){
    	var typename = $("#typename").val();
    	var orderNo = $("#orderNo").val();
    	var data = {"typename":typename,"orderNo":orderNo};
    	$.ajax({
    		url: "/blog/blogType/admin/add",
    		type: "POST",
    		data: JSON.stringify(data),
    		dataType: "json",
    		contentType: 'application/json',
    		success: function(data) {
    			if(data.result=="success"){
    				alert("添加类型成功!");
    				$('#addWindow').modal('hide');
    			}else{
    				alert("添加类型失败!");
    			}
    			var table = $('#myDatatable').DataTable();
    			table.draw(false);
    		}
    	});
    });
    
    /**
     * 编辑博客类型后与后台进行交互
     */
    $("#update").click(function(){
    	var id = $("#id").val();
    	var typename = $("#oldTypename").val();
    	var orderNo = $("#oldOrderNo").val();
    	var data = {"id":id,"typename":typename,"orderNo":orderNo};
    	$.ajax({
    		url: "/blog/blogType/admin/update",
    		type: "POST",
    		data: JSON.stringify(data),
    		dataType: "json",
    		contentType: 'application/json',
    		success: function(data) {
    			if(data.result=="success"){
    				alert("修改成功!");
    				$('#editWindow').modal('hide');
    			}else{
    				alert("修改失败!");
    			}
    			var table = $('#myDatatable').DataTable();
    			table.draw(false);
    		}
    	});
    });
});
/**
 * 编辑博客类型信息时显示当前博客类型信息
 * @param obj
 * @returns
 */
function fnEdit(obj){
	var row = $(obj).parents("tr")[0];
	var rowData = $("#myDatatable").dataTable().fnGetData(row);//获取datatable指定行的所有数据
	$("#editWindow").modal();//初始化模态框
	$("#id").val(rowData.id);
	$("#oldTypename").val(rowData.typename);
	$("#oldOrderNo").val(rowData.orderNo);
}
/**
 * 删除单个博客类型
 * @param obj
 * @returns
 */
function fnDelete(obj){
	var option = confirm("是否确认删除?删除后无法恢复！");
	if(option){
		var id = $(obj).parents("tr").children().eq(1).html();
		var data = {"id":id};
		$.ajax({
			url :"/blog/blogType/admin/delete",
			type: "POST",
			//contentType: "application/json",
			//data: JSON.stringify(data),
			data: data,
			success: function(data){
				var table = $('#myDatatable').DataTable();
				table.draw(false);//刷新当前页面
			}
		});
	}
}