<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html lang="en"> 
<head> 
    <meta charset="utf-8"> 
    <meta name="viewport" content="width=device-width, initial-scale=1"> 
    <title>工作台</title> 
    
    <link href="<%=basePath%>css/layui.css" rel="stylesheet">

</head> 
<body>
<div class="admin-main">
			<blockquote class="layui-elem-quote" >
			<p class="head">WELCOME TO YOU , THIS IS YOUR WORLD!</p>
		  </blockquote>
			<fieldset class="layui-elem-field">
				<legend>HELLO</legend>
				<div class="layui-field-box layui-form" style="width:100%;height:78%;">
				<img alt="start" src="<%=basePath%>images/sa.jpg" style="width:100%;height:99%;">
				</div>
			</fieldset>
			<div class="admin-table-page">
				<div id="paged" class="page">
				</div>
			</div>
		</div>
</body> 
</html>