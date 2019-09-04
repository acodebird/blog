<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>博客类型管理</title>

	<link href="${pageContext.request.contextPath }/views/assets/stylesheets/bootstrap/bootstrap.css" media="all" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath }/views/assets/stylesheets/bootstrap/bootstrap-responsive.css" media="all" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath }/views/assets/stylesheets/jquery_ui/jquery-ui-1.10.0.custom.css" media="all" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath }/views/assets/stylesheets/jquery_ui/jquery.ui.1.10.0.ie.css" media="all" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath }/views/assets/stylesheets/plugins/bootstrap_switch/bootstrap-switch.css" media="all" rel="stylesheet" type="text/css" />
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/views/plugins/font-awesome/css/font-awesome.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/views/admin/css/jquery.dataTables.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/views/admin/css/buttons.dataTables.min.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/views/admin/css/editor.dataTables.min.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/views/admin/css/showAdmins.css">
    
    <!--[if lt IE 9]>
    <script src='${pageContext.request.contextPath }/views/assets/javascripts/html5shiv.js' type='text/javascript'></script>
    <![endif]-->
	<link href='${pageContext.request.contextPath }/views/assets/stylesheets/bootstrap/bootstrap.css' media='all'
		rel='stylesheet' type='text/css' />
	<link href='${pageContext.request.contextPath }/views/assets/stylesheets/bootstrap/bootstrap-responsive.css'
		media='all' rel='stylesheet' type='text/css' />
	<!-- / jquery ui -->
	<link href='${pageContext.request.contextPath }/views/assets/stylesheets/jquery_ui/jquery-ui-1.10.0.custom.css'
		media='all' rel='stylesheet' type='text/css' />
	<link href='${pageContext.request.contextPath }/views/assets/stylesheets/jquery_ui/jquery.ui.1.10.0.ie.css'
		media='all' rel='stylesheet' type='text/css' />
	<!-- / switch buttons -->
	<link
		href='${pageContext.request.contextPath }/views/assets/stylesheets/plugins/bootstrap_switch/bootstrap-switch.css'
		media='all' rel='stylesheet' type='text/css' />
	<!-- / xeditable -->
	<link href='${pageContext.request.contextPath }/views/assets/stylesheets/plugins/xeditable/bootstrap-editable.css'
		media='all' rel='stylesheet' type='text/css' />
	<link href='${pageContext.request.contextPath }/views/assets/stylesheets/plugins/common/bootstrap-wysihtml5.css'
		media='all' rel='stylesheet' type='text/css' />
	<!-- / wysihtml5 (wysywig) -->
	<link href='${pageContext.request.contextPath }/views/assets/stylesheets/plugins/common/bootstrap-wysihtml5.css'
		media='all' rel='stylesheet' type='text/css' />
	<!-- / jquery file upload -->
	<link
		href='${pageContext.request.contextPath }/views/assets/stylesheets/plugins/jquery_fileupload/jquery.fileupload-ui.css'
		media='all' rel='stylesheet' type='text/css' />
	<!-- / full calendar -->
	<link href='${pageContext.request.contextPath }/views/assets/stylesheets/plugins/fullcalendar/fullcalendar.css'
		media='all' rel='stylesheet' type='text/css' />
	<!-- / select2 -->
	<link href='${pageContext.request.contextPath }/views/assets/stylesheets/plugins/select2/select2.css' media='all'
		rel='stylesheet' type='text/css' />
	<!-- / mention -->
	<link href='${pageContext.request.contextPath }/views/assets/stylesheets/plugins/mention/mention.css' media='all'
		rel='stylesheet' type='text/css' />
	<!-- / tabdrop (responsive tabs) -->
	<link href='${pageContext.request.contextPath }/views/assets/stylesheets/plugins/tabdrop/tabdrop.css' media='all'
		rel='stylesheet' type='text/css' />
	<!-- / jgrowl notifications -->
	<link href='${pageContext.request.contextPath }/views/assets/stylesheets/plugins/jgrowl/jquery.jgrowl.min.css'
		media='all' rel='stylesheet' type='text/css' />
	<!-- / datatables -->
	<link
		href='${pageContext.request.contextPath }/views/assets/stylesheets/plugins/datatables/bootstrap-datatable.css'
		media='all' rel='stylesheet' type='text/css' />
	<!-- / dynatrees (file trees) -->
	<link href='${pageContext.request.contextPath }/views/assets/stylesheets/plugins/dynatree/ui.dynatree.css'
		media='all' rel='stylesheet' type='text/css' />
	<!-- / color picker -->
	<link
		href='${pageContext.request.contextPath }/views/assets/stylesheets/plugins/bootstrap_colorpicker/bootstrap-colorpicker.css'
		media='all' rel='stylesheet' type='text/css' />
	<!-- / datetime picker -->
	<link
		href='${pageContext.request.contextPath }/views/assets/stylesheets/plugins/bootstrap_datetimepicker/bootstrap-datetimepicker.min.css'
		media='all' rel='stylesheet' type='text/css' />
	<!-- / daterange picker) -->
	<link
		href='${pageContext.request.contextPath }/views/assets/stylesheets/plugins/bootstrap_daterangepicker/bootstrap-daterangepicker.css'
		media='all' rel='stylesheet' type='text/css' />
	<!-- / flags (country flags) -->
	<link href='${pageContext.request.contextPath }/views/assets/stylesheets/plugins/flags/flags.css' media='all'
		rel='stylesheet' type='text/css' />
	<!-- / slider nav (address book) -->
	<link href='${pageContext.request.contextPath }/views/assets/stylesheets/plugins/slider_nav/slidernav.css'
		media='all' rel='stylesheet' type='text/css' />
	<!-- / fuelux (wizard) -->
	<link href='${pageContext.request.contextPath }/views/assets/stylesheets/plugins/fuelux/wizard.css' media='all'
		rel='stylesheet' type='text/css' />
	<!-- / flatty theme -->
	<link href='${pageContext.request.contextPath }/views/assets/stylesheets/light-theme.css'
		id='color-settings-body-color' media='all' rel='stylesheet'
		type='text/css' />
	<!-- / demo -->
	<link href='${pageContext.request.contextPath }/views/assets/stylesheets/demo.css' media='all' rel='stylesheet'
		type='text/css' />
	
    
</head>
<body class='contrast-blue '>
<header>
		<div class='navbar'>
			<div class='navbar-inner'>
				<div class='container-fluid'>
					<a class='brand' href='${pageContext.request.contextPath }/views/admin/main.jsp'> <i class='icon-heart-empty'></i>
						<span class='hidden-phone'>Welcome ACodeBird!</span>
					</a> 
					<ul class='nav pull-right'>
						<li class='dropdown dark user-menu'>
						<a class='dropdown-toggle' data-toggle='dropdown' href='#'> 
							<img alt='ACodeBird' height='23' src='${pageContext.request.contextPath }/views/admin/images/icon.jpg' width='23' /> 
								<span class='user-name hidden-phone'>ACodeBird</span>
						</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</header>
<div id="wrapper">
	<div id='main-nav-bg'></div>
		<nav class='' id='main-nav'>
			<div class='navigation'>
				<ul class='nav nav-stacked'>
					<li class=''>
					    <a href='${pageContext.request.contextPath }/views/admin/main.jsp'>
					        <i class='icon-dashboard'></i>
					        <span>Dashboard</span>
					    </a>
					</li>
					<li class='active'><a href='${pageContext.request.contextPath }/views/admin/blogTypeList.jsp'> <i
							class='icon-user'></i> <span>博客类型管理</span>
					</a></li>
					<li class=''><a href='${pageContext.request.contextPath }/views/showRooms.jsp'> <i
							class='icon-home'></i> <span>写博客</span>
					</a></li>
					<li class=''><a href='#'> <i
							class='icon-desktop'></i> <span>博客管理</span>
					</a></li>	
					<li class=''><a href='${pageContext.request.contextPath }/views/admin/listOrder.jsp'> <i
							class='icon-tasks'></i> <span>评论管理</span>
					</a></li>
					<li class=''><a href='${pageContext.request.contextPath }/views/index.jsp'> <i
							class='icon-reply'></i> <span>我的博客</span>
					</a></li>
					<li class=''>
						<a href='${pageContext.request.contextPath }/views/admin/login.jsp'> 
							<i class='icon-signout'></i> <span>退出</span>
						</a>
					</li>
				</ul>
			</div>
		</nav>
		<section id="content">
		<div class='container-fluid' style="height:120px">
                <div class='row-fluid' id='content-wrapper'>
                    <div class='span12'>
                        <div class='row-fluid'>
                            <div class='span12'>
                                <div class='page-header'>
                                    <h1 class='pull-left'>
                                        <i class='icon-tasks'></i>
                                        <span>博客类型列表</span>
                                    </h1>
                                    <div class='pull-right'>
                                        <ul class='breadcrumb'>
                                            <li>
                                                <a href="#"><i class='icon-dashboard'></i>
                                                </a>
                                            </li>
                                            <li class='separator'>
                                                <i class='icon-angle-right'></i>
                                            </li>
                                            <li class='active'>博客类型管理</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                     </div>
               </div>
         </div>
		<div class='row-fluid'>
	          <div class='span12 box bordered-box orange-border' style='margin-bottom:0;'>
	              <div class='box-content box-no-padding'>
	                  <div class='responsive-table'>
	                      <div class='scrollable-area'>
	                          <table id="myDatatable" class='table table-bordered table-striped' style='margin-bottom:0;'>
	                              <thead>
	                                  <tr>
	                                      <th><input type="checkbox" id="checkAll" name="checkAll" class='group-checkable' /></th>
	                                      <th>类型ID</th>
	                                      <th>类型名</th>
	                                      <th>序号</th>
	                                      <th>操作</th>
	                                  </tr>
	                              </thead>
	                              <tbody>
	                                       
	                              </tbody>
	                          </table>
	                      </div>
	                  </div>
	              </div>
	          </div>
		</div>
		
		<!-- 编辑博客类型模态框 -->
		<div class="modal fade hid" id="editWindow" tabindex="0" role="dialog" aria-hidden="true">
		    <div class="modal-dialog">
		        <div class="modal-content">
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		                <h4 class="modal-title" id="myModalLabel">编辑博客类型</h4>
		            </div>
		            <div class="modal-body">
		            	<div class="form-horizontal">
		            		<div class="form-group">
			                  <label for="id" class="col-sm-2 control-label">ID：</label>
			                  <div class="col-sm-10">
			                    <input class="form-control" id="id" type="text" readonly="readonly">
			                  </div>
			                </div>
			                <br>
			                <div class="form-group">
			                  <label for="oldTypename" class="col-sm-2 control-label">类型名：</label>
			                  <div class="col-sm-10">
			                    <input class="form-control" id="oldTypename" type="text">
			                  </div>
			                </div>	
			                <br>
			                <div class="form-group">
			                  <label for="oldOrderNo" class="col-sm-2 control-label">序号：</label>
			                  <div class="col-sm-10">
			                    <input class="form-control" id="oldOrderNo" type="text">
			                  </div>
			                </div>
		                </div>
		            </div>
		            <div class="modal-footer">
		                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
		                <button id="update" type="button" class="btn btn-primary">保存</button>
		            </div>
		        </div>
		    </div>
		</div>
<!-- 添加博客类型模态框 -->
<div class="modal fade hid" id="addWindow" tabindex="0" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">添加博客类型</h4>
            </div>
            <div class="modal-body">
            	<div class="form-horizontal">
	                <div class="form-group">
	                  <label for="typename" class="col-sm-2 control-label">博客类型名：</label>
	                  <div class="col-sm-10">
	                    <input class="form-control" id="typename" type="text">
	                  </div>
	                </div>
					<br>          			
	                <div class="form-group">
	                  <label for="orderNo" class="col-sm-2 control-label">序号：</label>
	                  <div class="col-sm-10">
	                    <input class="form-control" id="orderNo" type="text">
	                  </div>
	                </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button id="addTypename" type="button" class="btn btn-primary">添加</button>
            </div>
        </div>
    </div>
</div>
	</section>
</div>

	<!-- / jquery -->
	<script src='${pageContext.request.contextPath }/views/assets/javascripts/jquery/jquery.min.js'
		type='text/javascript'></script>
	<!-- / jquery mobile events (for touch and slide) -->
	<script
		src='${pageContext.request.contextPath }/views/assets/javascripts/plugins/mobile_events/jquery.mobile-events.min.js'
		type='text/javascript'></script>
	<!-- / jquery migrate (for compatibility with new jquery) -->
	<script src='${pageContext.request.contextPath }/views/assets/javascripts/jquery/jquery-migrate.min.js'
		type='text/javascript'></script>
	<!-- / jquery ui -->
	<script src='${pageContext.request.contextPath }/views/assets/javascripts/jquery_ui/jquery-ui.min.js'
		type='text/javascript'></script>
	<!-- / bootstrap -->
	<script src='${pageContext.request.contextPath }/views/assets/javascripts/bootstrap/bootstrap.min.js'
		type='text/javascript'></script>
	<script src='${pageContext.request.contextPath }/views/assets/javascripts/plugins/flot/excanvas.js'
		type='text/javascript'></script>
	<!-- / sparklines -->
	<script
		src='${pageContext.request.contextPath }/views/assets/javascripts/plugins/sparklines/jquery.sparkline.min.js'
		type='text/javascript'></script>
	<!-- / flot charts -->
	<script src='${pageContext.request.contextPath }/views/assets/javascripts/plugins/flot/flot.min.js'
		type='text/javascript'></script>
	<script src='${pageContext.request.contextPath }/views/assets/javascripts/plugins/flot/flot.resize.js'
		type='text/javascript'></script>
	<script src='${pageContext.request.contextPath }/views/assets/javascripts/plugins/flot/flot.pie.js'
		type='text/javascript'></script>
	<!-- / bootstrap switch -->
	<script
		src='${pageContext.request.contextPath }/views/assets/javascripts/plugins/bootstrap_switch/bootstrapSwitch.min.js'
		type='text/javascript'></script>
	<!-- / fullcalendar -->
	<script
		src='${pageContext.request.contextPath }/views/assets/javascripts/plugins/fullcalendar/fullcalendar.min.js'
		type='text/javascript'></script>
	<!-- / datatables -->
	<script
		src='${pageContext.request.contextPath }/views/assets/javascripts/plugins/datatables/jquery.dataTables.min.js'
		type='text/javascript'></script>
	<script
		src='${pageContext.request.contextPath }/views/assets/javascripts/plugins/datatables/jquery.dataTables.columnFilter.js'
		type='text/javascript'></script>
	<!-- / wysihtml5 -->
	<script src='${pageContext.request.contextPath }/views/assets/javascripts/plugins/common/wysihtml5.min.js'
		type='text/javascript'></script>
	<script src='${pageContext.request.contextPath }/views/assets/javascripts/plugins/common/bootstrap-wysihtml5.js'
		type='text/javascript'></script>
	<!-- / select2 -->
	<script src='${pageContext.request.contextPath }/views/assets/javascripts/plugins/select2/select2.js'
		type='text/javascript'></script>
	<!-- / color picker -->
	<script
		src='${pageContext.request.contextPath }/views/assets/javascripts/plugins/bootstrap_colorpicker/bootstrap-colorpicker.min.js'
		type='text/javascript'></script>
	<!-- / mention -->
	<script src='${pageContext.request.contextPath }/views/assets/javascripts/plugins/mention/mention.min.js'
		type='text/javascript'></script>
	<!-- / input mask -->
	<script
		src='${pageContext.request.contextPath }/views/assets/javascripts/plugins/input_mask/bootstrap-inputmask.min.js'
		type='text/javascript'></script>
	<!-- / fileinput -->
	<script
		src='${pageContext.request.contextPath }/views/assets/javascripts/plugins/fileinput/bootstrap-fileinput.js'
		type='text/javascript'></script>
	<!-- / modernizr -->
	<script src='${pageContext.request.contextPath }/views/assets/javascripts/plugins/modernizr/modernizr.min.js'
		type='text/javascript'></script>
	<!-- / retina -->
	<script src='${pageContext.request.contextPath }/views/assets/javascripts/plugins/retina/retina.js'
		type='text/javascript'></script>
	<!-- / fileupload -->
	<script src='${pageContext.request.contextPath }/views/assets/javascripts/plugins/fileupload/tmpl.min.js'
		type='text/javascript'></script>
	<script src='${pageContext.request.contextPath }/views/assets/javascripts/plugins/fileupload/load-image.min.js'
		type='text/javascript'></script>
	<script
		src='${pageContext.request.contextPath }/views/assets/javascripts/plugins/fileupload/canvas-to-blob.min.js'
		type='text/javascript'></script>
	<script
		src='${pageContext.request.contextPath }/views/assets/javascripts/plugins/fileupload/jquery.iframe-transport.min.js'
		type='text/javascript'></script>
	<script
		src='${pageContext.request.contextPath }/views/assets/javascripts/plugins/fileupload/jquery.fileupload.min.js'
		type='text/javascript'></script>
	<script
		src='${pageContext.request.contextPath }/views/assets/javascripts/plugins/fileupload/jquery.fileupload-fp.min.js'
		type='text/javascript'></script>
	<script
		src='${pageContext.request.contextPath }/views/assets/javascripts/plugins/fileupload/jquery.fileupload-ui.min.js'
		type='text/javascript'></script>
	<script
		src='${pageContext.request.contextPath }/views/assets/javascripts/plugins/fileupload/jquery.fileupload-init.js'
		type='text/javascript'></script>
	<!-- / timeago -->
	<script src='${pageContext.request.contextPath }/views/assets/javascripts/plugins/timeago/jquery.timeago.js'
		type='text/javascript'></script>
	<!-- / slimscroll -->
	<script
		src='${pageContext.request.contextPath }/views/assets/javascripts/plugins/slimscroll/jquery.slimscroll.min.js'
		type='text/javascript'></script>
	<!-- / autosize (for textareas) -->
	<script
		src='${pageContext.request.contextPath }/views/assets/javascripts/plugins/autosize/jquery.autosize-min.js'
		type='text/javascript'></script>
	<!-- / charCount -->
	<script src='${pageContext.request.contextPath }/views/assets/javascripts/plugins/charCount/charCount.js'
		type='text/javascript'></script>
	<!-- / validate -->
	<script
		src='${pageContext.request.contextPath }/views/assets/javascripts/plugins/validate/jquery.validate.min.js'
		type='text/javascript'></script>
	<script src='${pageContext.request.contextPath }/views/assets/javascripts/plugins/validate/additional-methods.js'
		type='text/javascript'></script>
	<!-- / naked password -->
	<script
		src='${pageContext.request.contextPath }/views/assets/javascripts/plugins/naked_password/naked_password-0.2.4.min.js'
		type='text/javascript'></script>
	<!-- / nestable -->
	<script src='${pageContext.request.contextPath }/views/assets/javascripts/plugins/nestable/jquery.nestable.js'
		type='text/javascript'></script>
	<!-- / tabdrop -->
	<script src='${pageContext.request.contextPath }/views/assets/javascripts/plugins/tabdrop/bootstrap-tabdrop.js'
		type='text/javascript'></script>
	<!-- / jgrowl -->
	<script src='${pageContext.request.contextPath }/views/assets/javascripts/plugins/jgrowl/jquery.jgrowl.min.js'
		type='text/javascript'></script>
	<!-- / bootbox -->
	<script src='${pageContext.request.contextPath }/views/assets/javascripts/plugins/bootbox/bootbox.min.js'
		type='text/javascript'></script>
	<!-- / inplace editing -->
	<script
		src='${pageContext.request.contextPath }/views/assets/javascripts/plugins/xeditable/bootstrap-editable.min.js'
		type='text/javascript'></script>
	<script src='${pageContext.request.contextPath }/views/assets/javascripts/plugins/xeditable/wysihtml5.js'
		type='text/javascript'></script>
	<!-- / ckeditor -->
	<script src='${pageContext.request.contextPath }/views/assets/javascripts/plugins/ckeditor/ckeditor.js'
		type='text/javascript'></script>
	<!-- / filetrees -->
	<script
		src='${pageContext.request.contextPath }/views/assets/javascripts/plugins/dynatree/jquery.dynatree.min.js'
		type='text/javascript'></script>
	<!-- / datetime picker -->
	<script
		src='${pageContext.request.contextPath }/views/assets/javascripts/plugins/bootstrap_datetimepicker/bootstrap-datetimepicker.js'
		type='text/javascript'></script>
	<!-- / daterange picker -->
	<script
		src='${pageContext.request.contextPath }/views/assets/javascripts/plugins/bootstrap_daterangepicker/moment.min.js'
		type='text/javascript'></script>
	<script
		src='${pageContext.request.contextPath }/views/assets/javascripts/plugins/bootstrap_daterangepicker/bootstrap-daterangepicker.js'
		type='text/javascript'></script>
	<!-- / max length -->
	<script
		src='${pageContext.request.contextPath }/views/assets/javascripts/plugins/bootstrap_maxlength/bootstrap-maxlength.min.js'
		type='text/javascript'></script>
	<!-- / dropdown hover -->
	<script
		src='${pageContext.request.contextPath }/views/assets/javascripts/plugins/bootstrap_hover_dropdown/twitter-bootstrap-hover-dropdown.min.js'
		type='text/javascript'></script>
	<!-- / slider nav (address book) -->
	<script src='${pageContext.request.contextPath }/views/assets/javascripts/plugins/slider_nav/slidernav-min.js'
		type='text/javascript'></script>
	<!-- / fuelux -->
	<script src='${pageContext.request.contextPath }/views/assets/javascripts/plugins/fuelux/wizard.js'
		type='text/javascript'></script>
	<!-- / flatty theme -->
	<script src='${pageContext.request.contextPath }/views/assets/javascripts/nav.js' type='text/javascript'></script>
	<script src='${pageContext.request.contextPath }/views/assets/javascripts/tables.js' type='text/javascript'></script>
	<script src='${pageContext.request.contextPath }/views/assets/javascripts/theme.js' type='text/javascript'></script>
	<!-- / demo -->
	<script src='${pageContext.request.contextPath }/views/assets/javascripts/demo/jquery.mockjax.js'
		type='text/javascript'></script>
	<script src='${pageContext.request.contextPath }/views/assets/javascripts/demo/inplace_editing.js'
		type='text/javascript'></script>
	<script src='${pageContext.request.contextPath }/views/assets/javascripts/demo/charts.js' type='text/javascript'></script>
	<script src='${pageContext.request.contextPath }/views/assets/javascripts/demo/demo.js' type='text/javascript'></script>
<!--  自定义js-->
	<script type="text/javascript" src="${pageContext.request.contextPath}/views/admin/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/views/admin/js/jquery.dataTables.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/views/admin/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/views/admin/js/dataTables.buttons.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/views/admin/js/dataTables.editor.min.js"></script>
	<script type='text/javascript' src='${pageContext.request.contextPath}/views/admin/js/blogTypeList.js'></script>
	
	
</body>
</html>