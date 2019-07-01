<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="<%=basePath%>/images/school.png"
	type="image/x-icon" />
<title>学习规划</title>
<link href="<%=basePath%>css/main_base.css" rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>easyui/themes/icon.css">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>easyui/themes/color.css">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>easyui/texteditor.css">
<script type="text/javascript" src="<%=basePath%>easyui/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>easyui/plugins/jquery.edatagrid.js"></script>
<script type="text/javascript"
	src="<%=basePath%>easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript"
	src="<%=basePath%>easyui/jquery.texteditor.js"></script>

</head>
<style>
.column {
	position: relative;
	height: 23px;
	border-bottom: 1px solid #d4d4d4;
	margin-bottom: 10px
}

.column span.current {
	position: relative;
	top: 0px;
	display: inline-block;
	color: #1da02b;
	font-size: 12px;
	font-weight: bold;
	height: 22px;
	line-height: 22px;
	border-bottom: 2px solid #ff9d02
}
</style>
<body>
	<%--  ${editSemester}  --%>
	<div style="width: 75%; margin: 0 auto; padding-top: 3%;">
		<div class="column">
			<span class="current">学期小目标信息</span>
		</div>

		<form id="smallTargetForm" method="POST" style="margin-top: 2%;">
			<table class="kv-table">
				
				<tr>
					<td class="kv-label">学期小目标</td>
					<td class="kv-content" colspan="5" style="margin: 0;">
						<input id="id" name="id" value="${editSemester.id}"style="display: none;" />
						<input id="student" name="student" value="${editSemester.student.id}"style="display: none;" />
						<div id="targetInfo" class="easyui-texteditor"
							style="width: 100%; height: 300px;" >${editSemester}</div>
					</td>
				</tr>

			</table>

		</form>

		<div>
			<a style="float: right;" id="smallTarget" onclick="smallTarget()"
				class="easyui-linkbutton c4" iconCls="icon-ok">提交</a>

		</div>


		<br> <br>
		<br>
		<div class="column">
			<span class="current">目标反馈信息</span>
		</div>
		<form id="TargetFeedBackForm"  method="POST" style="margin-top: 2%;">

			<table class="kv-table">

				<tr>
					<td class="kv-label">学期目标反馈</td>
					<td class="kv-content" colspan="5" style="margin: 0;">
						<div id="feddBackInfo" class="easyui-texteditor"
							style="width: 100%; height: 300px;"></div>
					</td>
				</tr>

			</table>

		</form>

		<div>
			<a style="float: right;" id="targetFeedBack"
				onclick="targetFeedBack()" class="easyui-linkbutton c4"
				iconCls="icon-ok">提交</a>

		</div>
	<br>
	</div>


	<script>
		
	var params = {
	        id: '',
	        mode: 'insert'
	    };
	
		function targetFeedBack() {
			var Audit="${editSemester.teacherAudit}";
			
			if(Audit==null || Audit.length<2){
				alert("学期没结束，请您学期末填写");
			}else{
				/* alert("success"); */

				$('#TargetFeedBackForm').form('submit', {
	            url: '<%=basePath%>student/saveTrem',
	            onSubmit: function (param) {
	                param.id = params.id;
	                param.mode = params.mode;
	                return $(this).form('validate');
	            },
	            success: function (result) {
	                var result = eval('(' +result+ ')');
	                console.log(result);
	                if (result.code == 200) {
	                
	                }
	                
	                $.messager.show({
	                    title: "消息",
	                    msg: result.msg
	                });
	            }
	       	 }); 
				
			}
			
		}

		function smallTarget() {
			
			var Trem;
			
			var json=eval('(' +"${editSemester}"+ ')');
			
			console.log(json);
			
			$('#smallTargetForm').form('submit', {
            url: '<%=basePath%>student/saveTrem',
            onSubmit: function (param) {
                param.id = params.id;
                param.mode = params.mode;
                return $(this).form('validate');
            },
            success: function (result) {
                var result = eval('(' +result+ ')');
                console.log(result);
                if (result.code == 200) {
                
                }
                
                $.messager.show({
                    title: "消息",
                    msg: result.msg
                });
            }
        }); 
			
	}
	</script>




</body>
</html>

