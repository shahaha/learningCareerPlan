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
<link rel="icon" href="<%=basePath%>/images/school.png" type="image/x-icon" />
<title>学习规划</title>
<link href="<%=basePath%>css/main_base.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="<%=basePath%>easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>easyui/themes/color.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>easyui/texteditor.css">
<script type="text/javascript" src="<%=basePath%>easyui/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=basePath%>easyui/plugins/jquery.edatagrid.js"></script>
<script type="text/javascript" src="<%=basePath%>easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=basePath%>easyui/jquery.texteditor.js"></script>
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
			<span class="current">学期规划信息</span>
		</div>

		<form id="targetForm" method="POST" style="margin-top: 2%;">
			<table class="kv-table">
				
				<tr id="smallTargetInfo">
					<td class="kv-label">学期小目标</td>
					
					<td class="kv-content" colspan="5" style="margin: 0;">
						<div id="targetInfo" name="smallTarget" class="easyui-texteditor"
							style="width: 100%; height: 300px;">${editSemester.smallTarget}</div>
					</td>
				</tr>
				<tr id="targetFeedbackInfo">
					<td class="kv-label">学期目标反馈</td>
					<td class="kv-content" colspan="5" style="margin: 0;">
						<input id="semester" name="semester" value="${editSemester.semester}" style="display: none;" /> 
						<div id="feddBackInfo" name="targetFeedback" class="easyui-texteditor"
						style="width: 100%; height: 300px;">${editSemester.targetFeedback}</div>
					</td>
				</tr>
			</table>
		</form>
		<div>
			<a style="float: right; margin-top:10px" href="javascript:void(0)" onclick="targetCommit()" class="easyui-linkbutton c4" iconCls="icon-ok">提交</a>
		</div>
		<br>
	</div>
<script type="text/javascript">
	var params = {
	        id: '',
	        mode: 'insert'
	    };
	var stuId = ${editSemester.student.id};
	var id = ${editSemester.id};
	var Audit = "${editSemester.teacherAudit}";
	var teacherComment = "${editSemester.teacherComment}";
	
	
	$(document).ready(function () {
		/* console.log(stuId);
		console.log(id); */
		if(Audit==null || Audit.length<2){
			$("#targetFeedbackInfo").css("display","none");
		}else{
			$("#targetInfo").attr("contenteditable",false)//contenteditable="true"属性则可以对该标签进行编辑,相当与只读
			if(teacherComment == null || teacherComment.length<2){
				$("#feddBackInfo").attr("contenteditable",true)//contenteditable="true"属性则可以对该标签进行编辑,相当与只读
			}else{
				$("#feddBackInfo").attr("contenteditable",false)//contenteditable="true"属性则可以对该标签进行编辑,相当与只读
			}
			
		}
		
	}); 
	
	function targetCommit() {
		$('#targetForm').form('submit', {
	         url: '<%=basePath%>student/saveTrem',
				onSubmit : function(param) {
					param.student = stuId;
					param.id = id;
					
					var smallTarget = $("#targetInfo").text();
					var targetFeedback = $("#feddBackInfo").text();
					if (smallTarget.length < 1 || smallTarget.length > 500) {
						$.messager.show({
							title : "消息",
							msg : "请填写1~500字的目标描述"
						});
						return false;
					}
					console.log(Audit);
					if ((Audit !=null && Audit.length > 1) && (targetFeedback.length < 1 || targetFeedback.length > 500)) {
						$.messager.show({
							title : "消息",
							msg : "请填写1~500字的目标反馈"
						});
						return false;
					}
					return $(this).form('validate');
				},
				success : function(result) {
					var result = eval('(' + result + ')');
					//console.log(result);
					$.messager.show({
						title : "消息",
						msg : result.msg
					});
				}
			});
		}
</script>




</body>
</html>

