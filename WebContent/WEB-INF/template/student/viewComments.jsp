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
<title>查看评语</title>
<link href="<%=basePath%>css/main_base.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/viewComments.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>easyui/themes/color.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>easyui/themes/default/easyui.css">
<script type="text/javascript" src="<%=basePath%>easyui/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/main.js"></script>
<script type="text/javascript" src="<%=basePath%>easyui/plugins/jquery.edatagrid.js"></script>
<script type="text/javascript" src="<%=basePath%>easyui/locale/easyui-lang-zh_CN.js"></script>

</head>
<body>

	<div style="float:left">
		选择要查看的学期：第<input id="curTrem" class="easyui-combobox" name="curTrem"
    						data-options="editable:false,
											required:true,
		                                    valueField:'id',
		                                    textField:'name',
		                                    panelHeight:'auto',
		                                    data:[{'id':1,'name':'1'},{'id':2,'name':'2'},{'id':3,'name':'3'},{'id':4,'name':'4'},{'id':5,'name':'5'},{'id':6,'name':'6'},{'id':7,'name':'7'}],
		                                    value: '${semester}',
		                                    onSelect: changeNo" />学期
	</div>
	<!-- <div style="float:left">
		<span style="font-size: 22px;">第&nbsp;<input id="termSearch" class="easyui-validatebox">&nbsp;学期:
		</span> <a href="javascript:void(0)" class="easyui-linkbutton c1" iconCls="icon-search" onclick="doSearch()">查询</a>
	</div> -->
	
	<%-- <c:if test="${showSemester == null}" var="flag">
		<div style="top:50%;lefe:50%">
			<span style="font-size: 50px;">您要查看的学期不存在！</span>
		</div>
	</c:if>
	<c:if test="${not flag}">
		<div class="container">
			<div class="target">
			<img class="img_target" id="img_s" alt="关于学期小目标" src="#">
			<div class="box1" tilte="学期小目标">
				<h1 class="title">学期小目标 &nbsp;:&nbsp; </h1>
				<p class="p" id="smallTarget">${showSemester.smallTarget}</p>
			</div>
			</div>
			<div class="audit">
				<div class="box2" tilte="班主任对学期小目标评语">CSS
					<h1 class="title">班主任评语 &nbsp;:&nbsp; </h1>
					<p class="p" id="teacherAudit">${showSemester.teacherAudit}</p>
				</div>
				<img id="img2" alt="关于学期小目标的评语" src="<%=basePath%>images/comment/Teacher_male.png">
			</div>
			<div class="feedBack">
				<img class="img_feedBack" id="img_s" alt="关于目标反馈" src="#">
				<div class="box1" tilte="目标反馈">
					<h1 class="title">目标反馈 &nbsp;:&nbsp; </h1>
					<p class="p" id="targetFeedback">${showSemester.targetFeedback}</p>
				</div>
			</div>
			<div class="comment">
				<div class="box2" tilte="班主任对目标反馈的评语">
					<h1 class="title">班主任考核意见 &nbsp;:&nbsp; </h1>
					<p class="p" id="teacherComment">${showSemester.teacherComment}</p>
					<div class="result">成绩：<a id="result" style="color:#FF0000;">${showSemester.score}</a></div>
				</div>
				<img id="img2" alt="关于学期小目标的评语" src="<%=basePath%>images/comment/Teacher_male.png">
		
			</div>
		</div>
	</c:if> --%>
	<div id="notComment" style="top:50%;lefe:50%;display:none">
			<span style="font-size: 50px;">您要查看的学期不存在！</span>
		</div>
	<div class="container">
		<div class="target">
			<img class="img_target" id="img_s" alt="关于学期小目标" src="#">
			<div class="box1" tilte="学期小目标">
				<h1 class="title">学期小目标 &nbsp;:&nbsp; </h1>
				<p class="p" id="smallTarget"></p>
			</div>
		</div>
		<div class="audit">
			<div class="box2" tilte="班主任对学期小目标评语">
				<h1 class="title">班主任评语 &nbsp;:&nbsp; </h1>
				<p class="p" id="teacherAudit"></p>
			</div>
			<img id="img2" alt="关于学期小目标的评语" src="<%=basePath%>images/comment/Teacher_male.png">
		</div>
		<div class="feedBack">
			<img class="img_feedBack" id="img_s" alt="关于目标反馈" src="#">
			<div class="box1" tilte="目标反馈">
				<h1 class="title">目标反馈 &nbsp;:&nbsp; </h1>
				<p class="p" id="targetFeedback"></p>
			</div>
		</div>
		<div class="comment">
			<div class="box2" tilte="班主任对目标反馈的评语">
				<h1 class="title">班主任考核意见 &nbsp;:&nbsp; </h1>
				<p class="p" id="teacherComment"></p>
				<div class="result">成绩：<a id="result" style="color:#FF0000;"></a></div>
			</div>
			<img id="img2" alt="关于学期小目标的评语" src="<%=basePath%>images/comment/Teacher_male.png">
		</div>
	</div>

<script  type="text/javascript">
	/* var semesterCur = $("#semesterCur"); */
	var basePath = '<%=basePath%>';
	var result=$("#result");
	var teacherComment= $("#teacherComment");
	var targetFeedback= $("#targetFeedback");
	var teacherAudit= $("#teacherAudit");
	var smallTarget= $("#smallTarget");
	$(document).ready(function () {
		var requestParam = {
			"stuId": ${stuId},
			"semester": ${semester}
		};
		$.ajax({
            url: basePath+"student/gridComments",
            async: true,
            data: requestParam,
            method: "POST"
        }).done(showComment).fail(serverError);
	});
	function changeNo(rec){
		console.log(rec);
		var requestParam = {
				"stuId": ${stuId},
				"semester": rec.id
			};
		request("POST",basePath+"student/gridComments",requestParam,showComment,serverError,true);
	}
	/* function doSearch(){
		var semester= $("#termSearch").val();
		if(semester<0 || semester>7){
			alert("没有该学期，请重新输入1~7");
		}else{
			var data = {stuId: stuId,semester: semester};
			var term= $.ajax({
				data:data,
				url: basePath+"student/girdComments",
				method: "POST",
				async : false
			});
			
			if(term.responseText==""){
				alert("该学期还没开始，请重新输入");
			}else{
				var termJson=term.responseJSON;
				smallTarget.html(termJson.smallTarget);
				teacherAudit.html(termJson.teacherAudit);
				targetFeedback.html(termJson.targetFeedback);
				teacherComment.html(termJson.teacherComment);
				result.html(termJson.score);
				//console.log("request success");
				if(teacherComment.html()==null || teacherComment.html().length<2){
					$(".comment").css("display","none");
				}else{
					$(".comment").css("display","inline");
				}
				if(targetFeedback.html()==null || targetFeedback.html().length<2){
					$(".feedBack").css("display","none");
				}else{
					$(".feedBack").css("display","inline");
				}
				if(teacherAudit.html()==null || teacherAudit.html().length<2){
					$(".audit").css("display","none");
				}else{
					$(".audit").css("display","inline");
				}
				if(smallTarget.html()==null || smallTarget.html().length<2){
					$(".target").css("display","none");
				}else{
					$(".target").css("display","inline");
				}
				if(stuSex==true){
					$(".img_target").attr("src",basePath+"images/comment/man_student.png");
					$(".img_feedBack").attr("src",basePath+"images/comment/man_student.png");
				}else{
					$(".img_target").attr("src",basePath+"images/comment/woman_student.png");
					$(".img_feedBack").attr("src",basePath+"images/comment/woman_student.png");
				}
			}
		}
	} */
	
	function showComment(showSemester) {
		console.log(showSemester);
		if (showSemester != null) {
			smallTarget.html(showSemester.smallTarget);
			teacherAudit.html(showSemester.teacherAudit);
			targetFeedback.html(showSemester.targetFeedback);
			teacherComment.html(showSemester.teacherComment);
			result.html(showSemester.score);
			if(showSemester.teacherComment==null || showSemester.teacherComment.length<1){
				$(".comment").css("display","none");
			}else{
				$(".comment").css("display","inline");
			}
			if(showSemester.targetFeedback==null || showSemester.targetFeedback.length<1){
				$(".feedBack").css("display","none");
			}else{
				$(".feedBack").css("display","inline");
			}
			if(showSemester.teacherAudit==null || showSemester.teacherAudit.length<1){
				$(".audit").css("display","none");
			}else{
				$(".audit").css("display","inline");
			}
			if(showSemester.smallTarget==null || showSemester.smallTarget.length<1){
				$(".target").css("display","none");
			}else{
				$(".target").css("display","inline");
			}
			if(showSemester.students.stuSex==true){
				$(".img_target").attr("src",basePath+"images/comment/man_student.png");
				$(".img_feedBack").attr("src",basePath+"images/comment/man_student.png");
			}else{
				$(".img_target").attr("src",basePath+"images/comment/woman_student.png");
				$(".img_feedBack").attr("src",basePath+"images/comment/woman_student.png");
			}
		}else {
			$("#notComment").css("display","block")
		}
	}
</script>

</body>
</html>

