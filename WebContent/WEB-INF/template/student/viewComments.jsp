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

<style type="text/css">
.container {
  margin-left:80px;
  margin-top:50px;
  width:80%;
}

.search{
    margin:20px 0px 0px 40px;
    font-size:16px;
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
   margin-top:100px;

}

.comment {
	width:70%;
 	height:200px;
float:right;
 	
}
	
       	
		 .left{
            width: 450px;
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
            top: 50%;
            border-top: 6px solid transparent;
            border-bottom: 6px solid transparent;
            border-right:8px solid lightgreen;
        }
        
        .left::after{
            content: '';
            position: absolute;
            left: -8px;
            top: 50%;
            border-top: 6px solid transparent;
            border-bottom: 6px solid transparent;
            border-right:8px solid #fff;
        }

		
			 .right{
            width: 450px;
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
            top: 50%;
            border-top: 6px solid transparent;
            border-bottom: 6px solid transparent;
            border-left:8px solid lightgreen;
        }
        
        .right::after{
            content: '';
            position: absolute;
            right: -8px;
            top: 50%;
            border-top: 6px solid transparent;
            border-bottom: 6px solid transparent;
            border-left:8px solid #fff;
        }
        
    .img_target{
    margin-bottom:15px;
    }    
        
  </style>
</head>


</style>
<body>
  
   
	<div  class="search" >选择要查看的学期: 第<span style="margin:0px 5px 0px 5px"><input id="curTrem" class="easyui-combobox" name="curTrem" 
											data-options="editable:false,
											required:true,
		                                    valueField:'id',
		                                    textField:'name',
		                                    panelHeight:'auto',
		                                    data:[{'id':1,'name':'1'},{'id':2,'name':'2'},{'id':3,'name':'3'},{'id':4,'name':'4'},{'id':5,'name':'5'},{'id':6,'name':'6'},{'id':7,'name':'7'}],
		                                    value: '${semester}',
		                                    onSelect: changeNo" /></span>学期
	</div>
	
	<div id="notComment" style="top:50%; position:relative; left:50%;display:none">
			<span style="font-size: 50px;">您要查看的学期不存在！</span>
	</div>
	
	 <div class="container">
	 
		<div class="target" style="display: none;">
			
			<div style="float:left;">
				<img class="img_target" id="img_s" alt="关于学期小目标" src="#">
				<h1 class="title">学期小目标 &nbsp;&nbsp; </h1>
			</div>
			<div class="left" style=" margin-left:120px; margin-top:10px;">
				<p class="p" id="smallTarget" style="margin-bottom:25px;"></p>
			</div >
		</div>
		
		<div class="audit" style="display: none;">
		  <div class="right" tilte="班主任对学期小目标评语" style=" margin-right:150px;margin-bottom:-240px;">
				<p class="p" id="teacherAudit" style="margin-bottom:25px;"></p>
			</div>
			<div style="float:right;" >
				<img id="img2" alt="关于学期小目标的评语" src="<%=basePath%>images/comment/Teacher_male.png">
				<h1 class="title" style="margin-right:0px;">班主任评语 &nbsp;&nbsp; </h1>
			</div>
		</div>
		
		<div class="feedBack" style="display: none; ">
			<div style="float:left;">
				<img class="img_feedBack" id="img_s" alt="关于目标反馈" src="#">
				<h1 class="title">目标反馈 &nbsp;&nbsp; </h1>
			</div>
			<div class="left" tilte="目标反馈" style=" margin-left:100px;margin-top:45px;">
				<p class="p" id="targetFeedback" style="margin-bottom:25px;"></p>
			</div>
		</div>
		
		<div class="comment" style="display: none;">
			<div class="right" tilte="班主任对目标反馈的评语" style="margin-right:170px;margin-bottom:-240px;">
				<p class="p" id="teacherComment"></p>
				<div class="result" style="margin-bottom:25px;">成绩：<a id="result" style="color:#FF0000;"></a></div>
			</div>
			<div style="float:right;">
				<img id="img2" alt="关于学期小目标的评语" src="<%=basePath%>images/comment/Teacher_male.png">
				<h1 class="title"  style="margin-right:-25px;">班主任考核意见 &nbsp;&nbsp; </h1>
			</div>
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
		request("POST",basePath+"student/gridComments",requestParam,showComment,serverError,true);
	});
	function changeNo(rec){
		//console.log(rec);
		var requestParam = {
				"stuId": ${stuId},
				"semester": rec.id
			};
		request("POST",basePath+"student/gridComments",requestParam,showComment,serverError,true);
	}
	
	function showComment(showSemester) {
		if (showSemester != null && showSemester != "") {
			$(".container").css("display","block");
			$("#notComment").css("display","none");
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
			if(showSemester.student.stuSex==true){
				$(".img_target").attr("src",basePath+"images/comment/man_student.png");
				$(".img_feedBack").attr("src",basePath+"images/comment/man_student.png");
			}else{
				$(".img_target").attr("src",basePath+"images/comment/woman_student.png");
				$(".img_feedBack").attr("src",basePath+"images/comment/woman_student.png");
			}
		}else {
			$("#notComment").css("display","block");
			$(".container").css("display","none");
		}
	}
</script>

</body>
</html>

