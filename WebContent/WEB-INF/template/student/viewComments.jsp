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
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/viewComments.css">

<style type="text/css">
.container {
  margin-left:80px;
  margin-top:20px;
  width:80%;
}

.search{
 margin-top:20px; 
}

.target {
    margin-top:50px;	
	margin-left:10px;
	width:70%;
    height:200px; 
}

.audit {
	
	width:70%;
 height:200px;
float:right;
}

.feedBack {
	margin-left:10px;
	width:70%;
    height:200px;
    margin-top:200px;
}

.comment {
	
	width:70%;
 height:200px;
 float:right;
}


			
		 .left{
            width: 350px;
            height: 90px;
            position:relative;
            border: 1px solid lightgreen;
            text-align:center;
            border-radius: 10px;
            filter: drop-shadow(0 0 2px #999);
            background: #fff;
        }
        
        .left::before{
            content: '';
            position: absolute;
            left: -10px;
            top: 45px;
            border-top: 6px solid transparent;
            border-bottom: 6px solid transparent;
            border-right:8px solid lightgreen;
        }
        
        .left::after{
            content: '';
            position: absolute;
            left: -8px;
            top: 45px;
            border-top: 6px solid transparent;
            border-bottom: 6px solid transparent;
            border-right:8px solid #fff;
        }

			 .right{
            width: 350px;
            height: 90px;
            float:right;
            border: 1px solid lightgreen;
            margin-right:35px;
            margin-top:25px;
             position:relative;
            text-align:center;
            border-radius: 10px;
            filter: drop-shadow(0 0 2px blue);
            background: #fff;
        }
        
        .right::before{
            content: '';
            position: absolute;
            right: -10px;
            top: 45px;
            border-top: 6px solid transparent;
            border-bottom: 6px solid transparent;
            border-left:8px solid lightgreen;
        }
        
        .right::after{
            content: '';
            position: absolute;
            right: -8px;
            top: 45px;
            border-top: 6px solid transparent;
            border-bottom: 6px solid transparent;
            border-left:8px solid #fff;
        }
			

</style>

</head>
<body style="background:#FFFAE8;">

	<div class="container">
        <div class="search">
		<span style="font-size: 23px;">第&nbsp;<input id="termSearch"
			class="easyui-validatebox">&nbsp;学期:
		</span> <a href="javascript:void(0)" class="easyui-linkbutton c1"
			iconCls="icon-search" onclick="doSearch()">查询</a>
        </div>
        
		<div class="target">
			
			
			<h1 class="title">学期小目标 &nbsp;&nbsp; </h1>
			  <img id="img1" alt="关于学期小目标"
				src="<%=basePath%>images/comment/man_student.png" >

			<div class="left" style=" margin-left:100px; margin-top:25px;">
			<p style="margin-top:20px;">${showSemester.smallTarget}<p>
			</div>
		
				
        
		</div>

		<div class="audit">
		
			<h1 class="title" style=" float:right">班主任评语 &nbsp;&nbsp; </h1>
			 <img style="float:right; margin-top:20px;" alt="关于学期小目标的评语"
				src="<%=basePath%>images/comment/Teacher_male.png">
				<div class="right" >
			 <p style="margin-top:20px;"> ${showSemester.teacherAudit}<p>
			</div>
			
		</div>


		<div class="feedBack">
			
		  <h1 class="title" style="margin-bottom:20px;">目标反馈 &nbsp;&nbsp; </h1>
			 <img  alt="关于目标反馈" src="<%=basePath%>images/comment/man_student.png">
			
		  <div class="left" style=" margin-left:100px; margin-top:-90px;" >
		  <p style="margin-top:20px;">${showSemester.targetFeedback}<p>
		  </div>	
		</div>


		<div class="comment">
			
				<h1 class="title"  style=" float:right">班主任考核意见 &nbsp;&nbsp; </h1>
				<img  style="float:right; margin-top:20px;" alt="关于学期小目标的评语" src="<%=basePath%>images/comment/Teacher_male.png">
				
				<div class="right" >
			 <p style="margin-top:20px;"> ${showSemester.teacherComment}<p>
			 <p style="margin-top:60px;margin-left:200px; font-weight:bold;"> 成绩：${showSemester.score}</p>
			</div>
			
		</div>

	</div>


	<script>
		
		
	
	
	
	
	</script>




</body>
</html>

