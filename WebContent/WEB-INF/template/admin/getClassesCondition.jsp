<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>班级详情</title>
<link href="<%=basePath%>css/main_base.css" rel="stylesheet">
<link href="<%=basePath%>css/basic_info.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/viewComments.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>easyui/themes/color.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>easyui/themes/default/easyui.css">
<script type="text/javascript" src="<%=basePath%>js/main.js"></script>
<script type="text/javascript" src="<%=basePath%>easyui/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=basePath%>easyui/plugins/jquery.edatagrid.js"></script>
<script type="text/javascript" src="<%=basePath%>easyui/locale/easyui-lang-zh_CN.js"></script>

<style type="text/css">
table.kv-table td.t-content {
		height: 80px;
		padding: 5px 0;
		width: 23% px;
		border-bottom: 1px solid #cacaca;
		font-size: 14px;
		padding-left: 20px;
		border-left: 1px solid #cacaca;
		border-right: 1px solid #cacaca;
	}
	
</style>
</head>
<body>

<div class="container">
		<div class="content">
			<div class="easyui-tabs1" style="width: 90%;">
				<div class="basic-info">
					<hr>
					<div class="column">
						<span class="current">详情信息</span>
					</div>
						<table class="kv-table">
							<tbody>
								<tr>
									<td class="kv-label">班级</td>
									<td class="kv-content" style="font-size: 12px;">${teacherVo.className }</td>
									<td class="kv-label">班主任</td>
									<td class="kv-content" style="font-size: 12px;">${teacherVo.teacherName }</td>
									<td class="kv-label">班级人数</td>
									<td class="kv-content" style="font-size: 12px;">${teacherVo.studentCount }</td>
								</tr>
								
								<!-- 小目标填写情况 -->
								<tr>
								<td class="kv-label" colspan="2" font-weight: bold>已填写当前学期小目标人数</td>
						        <td class="kv-content" colspan="4">${teacherVo.smallTargetCount}</td>
						        </tr>
						        
						         <c:if test="${fn:length(teacherVo.lackSmallTarget)!=0 }">
						        <tr>
						           <td class="kv-content"
						            style="text-align: center; border-left: 1px solid #cacaca; font-weight: bold;"
							       colspan="6">当前学期小目标未填写的同学</td>
						        </tr>
					           </c:if>
						      
						      <c:if test="${fn:length(teacherVo.lackSmallTarget)!=0 }">
						        <tr>
						        <td class="t-content" colspan="6" style="height:80px">
						       <c:forEach items="${teacherVo.lackSmallTarget }" var="studentName">
						        <span style="margin:5px" > ${studentName }</span>
						       </c:forEach>
						       </td>
						       </tr>
						       </c:if>
						       
						       <!-- 班主任审核情况 -->
								<tr>
								<td class="kv-label" colspan="2" font-weight: bold>当前学期班主任已审核数</td>
						        <td class="kv-content" colspan="4">${teacherVo.teacherAuditCount}</td>
						        </tr>
						        
						       
						         <c:if test="${fn:length(teacherVo.lackTeacherAudit)!=0 }">
						        <tr>
						           <td class="kv-content"
						            style="text-align: center; border-left: 1px solid #cacaca; font-weight: bold;"
							       colspan="6">当前学期小目标未被班主任审核的同学</td>
						        </tr>
						        </c:if>
					     
						      
						       <c:if test="${fn:length(teacherVo.lackTeacherAudit)!=0 }">
						        <tr>
						        <td class="t-content" colspan="6" style="height:80px">
						       <c:forEach items="${teacherVo.lackTeacherAudit }" var="studentName">
						        <span style="margin:5px"> ${studentName }</span>
						       </c:forEach>
						       </td>
						       </tr>
						       </c:if>
						       
						       <!--  学生反馈情况 -->
								<tr>
								<td class="kv-label" colspan="2" font-weight: bold>已填写当前学期反馈人数</td>
						        <td class="kv-content" colspan="4">${teacherVo.targetFeedbackCount}</td>
						        </tr>
						        
						     
						      <c:if test="${fn:length(teacherVo.lackTargetFeedback)!=0 }">
						        <tr>
						           <td class="kv-content"
						            style="text-align: center; border-left: 1px solid #cacaca; font-weight: bold;"
							       colspan="6">当前学期未填写反馈的同学</td>
						        </tr>
					          </c:if>
						      
						        <c:if test="${fn:length(teacherVo.lackTargetFeedback)!=0 }">
						        <tr>
						        <td class="t-content" colspan="6" style="height:80px">
						       <c:forEach items="${teacherVo.lackTargetFeedback }" var="studentName">
						        <span style="margin:5px"> ${studentName }</span>
						       </c:forEach>
						       </td>
						       </tr>
						       </c:if>
						       
						       <!-- 班主任评价情况 -->
								<tr>
								<td class="kv-label" colspan="2" font-weight: bold>班主任已评价数</td>
						        <td class="kv-content" colspan="4">${teacherVo.teacherCommentCount}</td>
						        </tr>
						        
						       <c:if test="${fn:length(teacherVo.lackTeacheComment)!=0 }">
						        <tr>
						           <td class="kv-content"
						            style="text-align: center; border-left: 1px solid #cacaca; font-weight: bold;"
							       colspan="6">当前学期反馈未被班主任评价的同学</td>
						        </tr>
					          </c:if>
						      
						       <c:if test="${fn:length(teacherVo.lackTeacheComment)!=0 }">
						        <tr>
						        <td class="t-content" colspan="6" >
						       <c:forEach items="${teacherVo.lackTeacheComment }" var="studentName">
						        <span style="margin:5px" > ${studentName }</span>
						       </c:forEach>
						       </td>
						       </tr>
						       </c:if>
						     
						     </tbody>
						     </table>
						     </div>
						     </div>
						     </div>
						     </div>   
						      
</body>
</html>