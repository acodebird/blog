<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>博客后台登录页面</title>
	<style>
		* { margin: 0; padding: 0; }
		html { height: 100%; }
		body { height: 100%; background: #fff url(${pageContext.request.contextPath }/views/admin/images/backgroud.png) 50% 50% no-repeat; background-size: cover;}
		.dowebok { position: absolute; left: 50%; top: 50%; width: 430px; height: 550px; margin: -300px 0 0 -215px; border: 1px solid #fff; border-radius: 20px; overflow: hidden;}
		.logo { width: 104px; height: 104px; margin: 50px auto 80px; background: url(${pageContext.request.contextPath }/views/admin/images/login.png) 0 0 no-repeat; }
		.form-item { position: relative; width: 360px; margin: 0 auto; padding-bottom: 30px;}
		.form-item input { width: 288px; height: 48px; padding-left: 70px; border: 1px solid #fff; border-radius: 25px; font-size: 18px; color: #fff; background-color: transparent; outline: none;}
		.form-item button { width: 360px; height: 50px; border: 0; border-radius: 25px; font-size: 18px; color: #1f6f4a; outline: none; cursor: pointer; background-color: #fff; }
		#username { background: url(${pageContext.request.contextPath }/views/admin/images/emil.png) 20px 14px no-repeat; }
		#password { background: url(${pageContext.request.contextPath }/views/admin/images/password.png) 23px 11px no-repeat; }
		.tip { display: none; position: absolute; left: 20px; top: 52px; font-size: 14px; color: #f50; }
		.reg-bar { width: 360px; margin: 20px auto 0; font-size: 14px; overflow: hidden;}
		.reg-bar a { color: #fff; text-decoration: none; }
		.reg-bar a:hover { text-decoration: underline; }
		.reg-bar .reg { float: left; }
		.reg-bar .forget { float: right; }
		.dowebok ::-webkit-input-placeholder { font-size: 18px; line-height: 1.4; color: #fff;}
		.dowebok :-moz-placeholder { font-size: 18px; line-height: 1.4; color: #fff;}
		.dowebok ::-moz-placeholder { font-size: 18px; line-height: 1.4; color: #fff;}
		.dowebok :-ms-input-placeholder { font-size: 18px; line-height: 1.4; color: #fff;}
	
        @media screen and (max-width: 500px) {
            * { box-sizing: border-box; }
            .dowebok { position: static; width: auto; height: auto; margin: 0 30px; border: 0; border-radius: 0; }
            .logo { margin: 50px auto; }
            .form-item { width: auto; }
            .form-item input, .form-item button, .reg-bar { width: 100%; }
        }
    </style>
</head>
<body>
	<form action="${pageContext.request.contextPath }/admin/login" method="post" id="myForm">
	    <div class="dowebok">
	        <div class="logo"></div>
	        <div class="form-item">
	            <input id="username" name="username" type="text" value="${blogger.username }" autocomplete="off" placeholder="账号">
	            <p class="tip" id="usernameSpan">账号不能为空</p>
	        </div>
	        <div class="form-item">
	            <input id="password" name="password" type="password" value="${blogger.password }" autocomplete="off" placeholder="登录密码">
	            <p class="tip" id="passwordSpan">密码不能为空</p>
	        </div>
	        <div class="form-item" style="text-align: center">
	        	<span style="color:red">${errorInfo }</span>
	        	<button type="button" id="submit1">登 录</button>
	        </div>
	        <div class="reg-bar">
	            <a class="reg" href="javascript:">我的博客</a>
	        </div>
	    </div>
   </form>
    <script src="${pageContext.request.contextPath }/views/admin/js/jquery.min.js"></script>
    <script>
	    $(function(){
	    	$("#submit1").click(function(){
	    		check();
	    	});
	    	$("body").keyup(function(event) {
	    		if (event.keyCode == 13) {
	    			check();
	    		}
	    	});
	    })
	    function check(){
	    	var flag = true;
    		$(".tip").css("display","none");
        	if($("#username").val()==null || $("#username").val()==""){
        		$('#usernameSpan').show();
        		flag = false;
        	}
        	if($("#password").val()==null || $("#password").val()==""){
        		$('#passwordSpan').show();
        		flag = false;
        	}
        	if(flag) $("#myForm").submit();
	    }
    </script>

</body>
</html>