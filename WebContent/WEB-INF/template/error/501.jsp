<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
 
"https://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=basePath%>css/main_base.css" rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>easyui/themes/icon.css">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>easyui/themes/color.css">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>easyui/themes/default/easyui.css">
<script type="text/javascript" src="<%=basePath%>easyui/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>easyui/locale/easyui-lang-zh_CN.js"></script>

</head>

<style>
input {
	height: 22px;
	text-align: center;
	border-radius: 5px;
	width: 50px;
	border-radius: 5px;
}
</style>
<body>
	<h1 style="font-size: 22px;">当前学期，您没有可查看的评语,请选择其他学期</h1>
	<br>
	<span style="font-size: 22px;">第&nbsp;<input id="termSearch"
		class="easyui-validatebox">&nbsp;学期:
	</span>
	<a href="javascript:void(0)" class="easyui-linkbutton c1"
		iconCls="icon-search" onclick="doSearch()">查询</a>


	<script type="text/javascript">
		function doSearch() {
			
			
			$.messager.progress({ 
				title:'请稍后', 
				msg:'页面加载中...' 
				});
			
			/* $.messager.progress('close');//关闭 */
		}
	</script>
</body>
</html>