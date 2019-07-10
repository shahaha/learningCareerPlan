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
<title>查看评语</title>
<link href="<%=basePath%>css/main_base.css" rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/viewComments.css">
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
	src="<%=basePath%>easyui/plugins/jquery.edatagrid.js"></script>
<script type="text/javascript"
	src="<%=basePath%>easyui/locale/easyui-lang-zh_CN.js"></script>

</head>
<body>

	<div class="container">

		<span style="font-size: 22px;">第&nbsp;<input id="termSearch"
			class="easyui-validatebox">&nbsp;学期:
		</span> <a href="javascript:void(0)" class="easyui-linkbutton c1"
			iconCls="icon-search" onclick="doSearch()">查询</a>

		<div class="target">
			<img id="img1" alt="关于学期小目标"
				src="<%=basePath%>images/comment/man_student.png">

			<div class="box1" tilte="学期小目标">
				<h1 class="title">学期小目标 &nbsp;:&nbsp; </h1>
				<p class="p">
				CSS DEBUG.web.servlet.DispatcherServlet - Null ModelAndView returned
				to DispatcherServlet with name 'springServlet': assuming
				HandlerAdapter completed request handling 2019-06-25 15:56:00,716
				3800025 [http-nio-8080-exec-29] DEBUG .web.servlet.DispatcherServlet
				- Cleared thread-bound request context:
				org.apache.catalina.connector.RequestFacade@32441b81 2019-06-25
				15:56:00,716 3800025 [http-nio-8080-exec-29] DEBUG
				.web.servlet.DispatcherServlet - Successfully completed request
				2019-06-25 15:56:00,716 3800025 [http-nio-8080-exec-29] DEBUG
				pport.XmlWebApplicationContext - Publishing event in
				WebApplicationContext for namespace 'springServlet-servlet':
				ServletRequestHandledEvent:
				url=[/learningCareerPlan/easyui/themes/icons/search.png];
				client=[127.0.0.1]; method=[GET]; servlet=[springServlet];
				session=[9D2CCC4ABCDE83FA014DC8591119D8BA]; user=[null]; time=[9ms];
				status=[OK] 2019-06-25 15:56:00,717 3800026 [http-nio-8080-exec-29]
				DEBUG pport.XmlWebApplicationContext - Publishing event in Root
				WebAppl
				</p>
			</div>

		</div>

		<div class="audit">
			<div class="box2" tilte="班主任对学期小目标评语">CSS
			<h1 class="title">班主任评语 &nbsp;:&nbsp; </h1>
				<p class="p">
				CSS DEBUG.web.servlet.DispatcherServlet - Null ModelAndView returned
				to DispatcherServlet with name 'springServlet': assuming
				HandlerAdapter completed request handling 2019-06-25 15:56:00,716
				3800025 [http-nio-8080-exec-29] DEBUG .web.servlet.DispatcherServlet
				- Cleared thread-bound request context:
				org.apache.catalina.connector.RequestFacade@32441b81 2019-06-25
				15:56:00,716 3800025 [http-nio-8080-exec-29] DEBUG
				.web.servlet.DispatcherServlet - Successfully completed request
				2019-06-25 15:56:00,716 3800025 [http-nio-8080-exec-29] DEBUG
				pport.XmlWebApplicationContext - Publishing event in
				WebApplicationContext for namespace 'springServlet-servlet':
				ServletRequestHandledEvent:
				url=[/learningCareerPlan/easyui/themes/icons/search.png];
				client=[127.0.0.1]; method=[GET]; servlet=[springServlet];
				session=[9D2CCC4ABCDE83FA014DC8591119D8BA]; user=[null]; time=[9ms];
				status=[OK] 2019-06-25 15:56:00,717 3800026 [http-nio-8080-exec-29]
				DEBUG pport.XmlWebApplicationContext - Publishing event in Root
				WebAppl
				</p>
				</div>
			<img id="img2" alt="关于学期小目标的评语"
				src="<%=basePath%>images/comment/Teacher_male.png">

		</div>


		<div class="feedBack">
			<img id="img1" alt="关于目标反馈"
				src="<%=basePath%>images/comment/man_student.png">
			<div class="box1" tilte="目标反馈">
				<h1 class="title">目标反馈 &nbsp;:&nbsp; </h1>
				<p class="p">
				CSS DEBUG.web.servlet.DispatcherServlet - Null ModelAndView returned
				to DispatcherServlet with name 'springServlet': assuming
				HandlerAdapter completed request handling 2019-06-25 15:56:00,716
				3800025 [http-nio-8080-exec-29] DEBUG .web.servlet.DispatcherServlet
				- Cleared thread-bound request context:
				org.apache.catalina.connector.RequestFacade@32441b81 2019-06-25
				15:56:00,716 3800025 [http-nio-8080-exec-29] DEBUG
				.web.servlet.DispatcherServlet - Successfully completed request
				2019-06-25 15:56:00,716 3800025 [http-nio-8080-exec-29] DEBUG
				pport.XmlWebApplicationContext - Publishing event in
				WebApplicationContext for namespace 'springServlet-servlet':
				ServletRequestHandledEvent:
				url=[/learningCareerPlan/easyui/themes/icons/search.png];
				client=[127.0.0.1]; method=[GET]; servlet=[springServlet];
				session=[9D2CCC4ABCDE83FA014DC8591119D8BA]; user=[null]; time=[9ms];
				status=[OK] 2019-06-25 15:56:00,717 3800026 [http-nio-8080-exec-29]
				DEBUG pport.XmlWebApplicationContext - Publishing event in Root
				WebAppl
				</p>
				</div>

		</div>

		<div class="comment">
			<div class="box2" tilte="班主任对目标反馈的评语">
				<h1 class="title">班主任考核意见 &nbsp;:&nbsp; </h1>
				<p class="p">
				CSS DEBUG.web.servlet.DispatcherServlet - Null ModelAndView returned
				to DispatcherServlet with name 'springServlet': assuming
				HandlerAdapter completed request handling 2019-06-25 15:56:00,716
				3800025 [http-nio-8080-exec-29] DEBUG .web.servlet.DispatcherServlet
				- Cleared thread-bound request context:
				org.apache.catalina.connector.RequestFacade@32441b81 2019-06-25
				15:56:00,716 3800025 [http-nio-8080-exec-29] DEBUG
				.web.servlet.DispatcherServlet - Successfully completed request
				2019-06-25 15:56:00,716 3800025 [http-nio-8080-exec-29] DEBUG
				pport.XmlWebApplicationContext - Publishing event in
				WebApplicationContext for namespace 'springServlet-servlet':
				ServletRequestHandledEvent:
				url=[/learningCareerPlan/easyui/themes/icons/search.png];
				client=[127.0.0.1]; method=[GET]; servlet=[springServlet];
				session=[9D2CCC4ABCDE83FA014DC8591119D8BA]; user=[null]; time=[9ms];
				status=[OK] 2019-06-25 15:56:00,717 3800026 [http-nio-8080-exec-29]
				DEBUG pport.XmlWebApplicationContext - Publishing event in Root
				WebAppl
				</p>
				<div class="result">成绩：<a style="color:#FF0000;">99</a></div>
				</div>
			<img id="img2" alt="关于学期小目标的评语"
				src="<%=basePath%>images/comment/Teacher_male.png">

		</div>

	</div>


	<script>
		
		
	
	
	
	
	</script>




</body>
</html>

