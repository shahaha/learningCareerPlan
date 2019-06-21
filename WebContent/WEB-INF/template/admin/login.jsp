<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<base href="<%=basePath%>">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="<%=basePath%>/images/school.png"
	type="image/x-icon" />
<title>学生学习规划系统</title>
<link href="<%=basePath%>/css/base.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>/css/loading.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>/css/login/login.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%=basePath%>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/main.js"></script>

</head>
<body>

	<ul id="loading" class="cssload-cssload-ballsncups">
			<li>
				<div class="cssload-circle"></div>
				<div class="cssload-ball"></div>
			</li>
			<li>
				<div class="cssload-circle"></div>
				<div class="cssload-ball"></div>
			</li>
			<li>
				<div class="cssload-circle"></div>
				<div class="cssload-ball"></div>
			</li>
			<li>
				<div class="cssload-circle"></div>
				<div class="cssload-ball"></div>
			</li>
			<li>
				<div class="cssload-circle"></div>
				<div class="cssload-ball"></div>
			</li>
	</ul>
	<div class="login-hd">
		<div class="left-bg"></div>
		<div class="right-bg"></div>
		<div class="hd-inner">
			<span class="logo"></span> <span class="sys-name">学生学习规划系统</span>
		</div>
	</div>
	<div class="login-bd">
		<div class="bd-inner">
			<div class="inner-wrap">
				<div class="lg-zone">
					<div class="lg-box">
						<div class="lg-label">
							<h4>管理员登录</h4>
						</div>
						<form id="logonForm">
							<div class="lg-account input-item clearfix"
								style="border-radius: 8px;">
								<i class="iconfont">&#xe60d;</i> 
								<input id="account" name="account" type="text" placeholder="账号">
							</div>
							<div class="lg-password input-item clearfix"
								style="border-radius: 8px;">
								<i class="iconfont">&#xe634;</i> 
								<input id="password" name="password" type="password" placeholder="请输入密码">
							</div>
							<div id="vcode"  class="lg-check clearfix">
								<div class="input-item" style="border-radius: 8px;">
									<i class="iconfont">&#xe633;</i>
									<input id="vcodeText" type="text" name="imageCodeName"placeholder="验证码">
								</div>
								<img style="margin-bottom: -15px;border-radius:5px;cursor:pointer;" src="<%=basePath%>base/getGifCode">
							</div>
							<div class="tips clearfix">
								<label><input type="checkbox" checked="checked">记住用户密码</label>
								<!-- <a href="javascript:;" class="forget-pwd">忘记密码</a> -->
							</div>
							
						</form>
						<div class="enter">
								<input id="btnLogin" class="purchaser" type="button" value="登录" onclick="loginThis()"/>
								<!-- <input class="supplier"type="submit" value="注册"  /> -->
							</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var basePath = '<%=basePath%>';
		var loading = $("#loading");
		loading.css("top","50%");
		loading.hide();
		$(document).ready(function (){
			$("#vcode").on("click",'img',function(){
				var i = new Image();
				i.src = basePath + 'base/getGifCode?'  + Math.random();
				$(i).replaceAll(this);
			});
		})
		function checkInput(account,password,vcodeText) {
			var reg_account = /^[0-9]{7,11}$/;
			var reg_password = /^[0-9a-zA-Z]{6,18}$/;
			var reg_vcodeText = /^[0-9a-zA-Z]{4}$/;
			if (!reg_account.test(account)) {
				showMessage("请输入7-11位账号，且不能有字母和特殊字符！");
				return false;
			}else if(!reg_password.test(password)) {
				showMessage("密码只能包含字母、数字，长度在6-18位！");
				return false;
			}else if(!reg_vcodeText.test(vcodeText)){
				showMessage("请输入4位的验证码");
				return false;
			}else {
				return true;
			}
		}
		function loginThis() {
			var account = $("#account").val();
			var password = $("#password").val();
			var vcodeText =  $("#vcodeText").val();
			if(checkInput(account,password,vcodeText)){
				var loginData = {
							"account": account.trim(),
							"password": password,
							"vcodeText": vcodeText
						};
				$.ajax({
		            url: basePath+"base/loginValidate",
		            async: true,
		            data: loginData,
		            beforeSend: function () {
		            	loading.show();
		            },
		            complete: function () {
		            	loading.hide();
		            },
		            method: "POST"
		        }).done(loginSuccess).fail(serverError);
			}
		}
		function loginSuccess(responseData) {
			
			if( responseData.code == 200 ) {
				window.location.href = basePath+"base/loginAdministrator";
			}
			showMessage(responseData.msg);
		}
		
</script>

	
	
</body>
</html>