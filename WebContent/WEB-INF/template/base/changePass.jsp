<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html lang="en">

<head>
<meta charset="utf-8">
<title>修改密码</title>
<link rel="stylesheet" type="text/css" href="<%=basePath%>easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>easyui/themes/color.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>easyui/themes/default/easyui.css">
<script type="text/javascript" src="<%=basePath%>js/main.js"></script>
<script type="text/javascript" src="<%=basePath%>easyui/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=basePath%>easyui/plugins/jquery.edatagrid.js"></script>
<script type="text/javascript" src="<%=basePath%>easyui/locale/easyui-lang-zh_CN.js"></script>

<style type="text/css">
#container {
	position: relative;
	margin-top: 80px;
	left: 26%;
	width: 450px;
	height: 300px;
	border: 2px solid #E0ECFF;
	padding: 15px 10px 10px 40px;
}

#help {
	width: 350px;
	height: 50px;
	font-size: 14px;
	margin-bottom: 20px;
}

.k-table {
	margin-top: 20px;
}

.k-table tr {
	height: 35px;
}

.k-table td {
	width: 100px;
	text-align: center;
	background: #cacaca;
}

.k-table th {
	width: 300px;
	height: 30px;
}
</style>


</head>

<body>
	<div id="container">
		<div id="help">
			<a class="easyui-menubutton" data-options="iconCls:'icon-help'"
				style="float: left; height: 50px; margin-right: 10px;"></a> <span>定期更换密码可以让你的账户更加安全.</span><br>
			<span>请确保新密码与原密码不一样!</span><br> <span>密码只能包含字母、数字，长度在6-18位!</span>
		</div>
		<hr style="width: 100%"></hr>

		<form id="changePassword" method="Post">
			<table class="k-table">
				<tr>
					<td>用户:</td>
					<th><input class="easyui-textbox"  style="width: 80%; height: 30px"
						data-options="iconCls:'icon-man',editable:false"
						value="${curUser.name }"></th>
				</tr>
				<tr>
					<td>原密码:</td>
					<th><input class="easyui-textbox"
						data-options="iconCls:'icon-lock',editable:false"
						value="${curUser.password }" style="width: 80%; height: 30px"></th>
				</tr>
				<tr>
					<td>新密码:</td>
					<th><input id="oldPass" name="password"
						class="easyui-passwordbox" prompt="******" iconWidth="28"
						style="width: 80%; height: 30px; padding: 10px"></th>
				</tr>
				<tr>
					<td>确认密码:</td>
					<th><input id="newPass" class="easyui-passwordbox"
						prompt="******" iconWidth="28"
						style="width: 80%; height: 30px; padding: 10px"></th>
				</tr>
			</table>
		</form>

		<div style="float: right; margin: 10px 80px 0px 0px;">
			<a href="javascript:void(0)" class="easyui-linkbutton"
				onclick="submitForm()">提交</a>
			<!-- <a href="javascript:void(0)"  class="easyui-linkbutton" onclick="clearForm()">清空</a></div> -->
		</div>

	</div>
<script type="text/javascript">
  
   /* 提交新密码 */
   function submitForm(){
	   
	   var oldPass=$("#oldPass").val();
	   var newPass=$("#newPass").val();
	   var pass=${curUser.password };
	   var reg_password = /^[0-9a-zA-Z]{6,18}$/;
	   var params = {
		        id: '',
		        mode: 'insert'
		    };
	   var id = ${curUser.id};
	   
	   if(oldPass==""||newPass==""){
		  $.messager.alert("消息","新密码不能为空!");
	   }
	   else if(oldPass!=newPass){
			  $.messager.alert("消息","新密码输入不一致!");
		   }
	   else if(oldPass==pass){
		  $.messager.alert("消息","新密码与原密码一致!");
	   }else if(!reg_password.test(newPass)){
		  $.messager.alert("消息","新密码只能包含字母、数字，长度在6-18位");
	   }else{
			$('#changePassword').form('submit', {
		        url: '<%=basePath%>base/updatePass',
				onSubmit : function(param) {
					param.uId = id;
					return $(this).form('validate');
				},
				success : function(result) {
					var result = eval('(' + result + ')');
					console.log(result);
					$.messager.show({
						title : "消息",
						msg : result.msg
					});
					$("#oldPass").attr("value", "");
					$("#newPass").attr("value", "");
				}
			});
		}
	}
	function clearForm() {
		$("#oldPass").attr("value", "");
		$("#newPass").attr("value", "");
	}
</script>
</body>
</html>