<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>学生学期规划打印</title>
<link rel="stylesheet" type="text/css" href="<%=basePath%>easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>easyui/themes/color.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>easyui/themes/default/easyui.css">
<script type="text/javascript" src="<%=basePath%>js/main.js"></script>
<script type="text/javascript" src="<%=basePath%>easyui/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=basePath%>easyui/plugins/jquery.edatagrid.js"></script>
<script type="text/javascript" src="<%=basePath%>easyui/locale/easyui-lang-zh_CN.js"></script>

<style type="text/css">
	.content {
		margin: 0 auto;
		width: 100%;
	}
	
	.container {
		position: relative;
		top: 8%;
		left: 13%;
		width: 75%;
	}
	
	table.k-table {
		width: 100%
	}
	
	table.k-table .k-label {
		padding: 0 10px;
		width: 15%;
		background: #f5f5f5;
		border: 1px solid #cacaca;
		font-size: 14px;
		font-weight: bold;
		border-top: none
	}
	
	table.k-table td.k-content {
		height: 29px;
		padding: 5px 0;
		width: 23%;
		border-bottom: 1px solid #cacaca;
		font-size: 14px;
		padding-left: 20px
	}
	
	table.k-table td.t-content {
		height: 80px;
		padding: 5px 0;
		width: 23% px;
		border-bottom: 1px solid #cacaca;
		font-size: 14px;
		padding-left: 20px;
		border-left: 1px solid #cacaca;
		border-right: 1px solid #cacaca;
	}
	
	table.k-table tr:first-child td.k-content, table.k-table tr:first-child td.k-label{
		border-top: 1px solid #cacaca
	}
	
	table.k-table tr td.k-content:last-child {
		border-right: 1px solid #cacaca
	}
	
	#print {
		left: 0;
		width: 100%;
		margin-top: 20px;
	}
</style>

<style media="print">
@page {
	size: auto;
	margin: 0mm;
}
</style>


</head>
<body>
	<div class="content">
		<div class="container">
			<h1 style="margin-left: 25%;">${curStu.college.collegeName }学生学期规划表</h1>
			<table class="k-table">
				<tr>
					<td class="k-label">姓名</td>
					<td class="k-content">${curUser.name }</td>
					<td class="k-label">学号</td>
					<td class="k-content">${curUser.account }</td>
				</tr>

				<c:forEach items="${tremsList}" var="t" varStatus="st">
					<tr>
						<td class="k-label">第${t.semester }学期小目标</td>
						<td class="k-content" colspan="3">${t.smallTarget}</td>
					</tr>

					<tr>
						<td class="k-content"
							style="text-align: center; border-left: 1px solid #cacaca; font-weight: bold;"
							colspan="4">班主任对第${t.semester }学期小目标的审核意见</td>
					</tr>

					<tr>
						<td class="t-content" colspan="4">${t.teacherAudit}</td>
					</tr>

					<tr>
						<td class="k-label">第${t.semester }学期目标反馈</td>
						<td class="k-content" colspan="3">${t.targetFeedback}</td>
					</tr>

					<tr>
						<td class="k-content"
							style="text-align: center; border-left: 1px solid #cacaca; font-weight: bold;"
							colspan="4">班主任对第${t.semester }学期考核的评语与成绩</td>
					</tr>

					<tr>
						<td class="t-content" colspan="4">${t.teacherComment}</td>
					</tr>

					<tr>
						<td class="k-label" style="border-bottom: 3px solid #cacaca">成绩</td>
						<td class="k-content" style="border-bottom: 3px solid #cacaca"
							colspan="3">${t.score}</td>
					</tr>
				</c:forEach>
			</table>
		</div>

	</div>

	<div id="print">
		<hr style="width: 100%; height: 20zpx; background: black;"></hr>
		<a class="easyui-linkbutton" data-options="iconCls:'icon-print'"
			style="width: 80px; margin-left: 45%;">打印</a>
	</div>

	<script type="text/javascript">
		function $(selector) {
			return document.querySelector(selector);
		}

		$(".easyui-linkbutton").onclick = function() {
			var oldHtml = $("body").innerHTML;
			var printbox = $(".container").innerHTML;
			$("body").innerHTML = printbox;

			if (!!window.ActiveXObject || "ActiveXObject" in window) { //去除页眉、页脚
				remove_ie_header_and_footer();
			}
			window.print();
			$("body").innerHTML = oldHtml;
		}

		function remove_ie_header_and_footer() {
			var hkey_root, hkey_path, hkey_key;
			hkey_path = "HKEY_CURRENT_USER\\Software\\Microsoft\\Internet Explorer\\PageSetup\\";
			try {
				var RegWsh = new ActiveXObject("WScript.Shell");
				RegWsh.RegWrite(hkey_path + "header", "");
				RegWsh.RegWrite(hkey_path + "footer", "");
			} catch (e) {
			}
		}
	</script>

</body>
</html>