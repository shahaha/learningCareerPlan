<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<title>详情信息</title>
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
.containers {
	width: 100%;
}

.search {
	margin: 20px 0px 0px 40px;
	font-size: 16px;
}

.target {
	margin-top: 50px;
	margin-left: 10px;
	width: 70%;
	height: 200px;
}

.audit {
	width: 70%;
	height: 200px;
	float: right;
}

.feedBack {
	margin-left: 10px;
	width: 70%;
	height: 200px;
	margin-top: 100px;
}

.comment {
	width: 70%;
	height: 200px;
	float: right;
}

.left {
	width: 450px;
	position: relative;
	border: 1px solid lightgreen;
	text-align: center;
	border-radius: 10px;
	filter: drop-shadow(0 0 2px #999);
	background: #fff;
}

.left::before {
	content: '';
	position: absolute;
	left: -10px;
	top: 50%;
	border-top: 6px solid transparent;
	border-bottom: 6px solid transparent;
	border-right: 8px solid lightgreen;
}

.left::after {
	content: '';
	position: absolute;
	left: -8px;
	top: 50%;
	border-top: 6px solid transparent;
	border-bottom: 6px solid transparent;
	border-right: 8px solid #fff;
}

.right {
	width: 450px;
	float: right;
	border: 1px solid lightgreen;
	margin-right: 35px;
	margin-top: 25px;
	position: relative;
	text-align: center;
	border-radius: 10px;
	filter: drop-shadow(0 0 2px blue);
	background: #fff;
}

.right::before {
	content: '';
	position: absolute;
	right: -10px;
	top: 50%;
	border-top: 6px solid transparent;
	border-bottom: 6px solid transparent;
	border-left: 8px solid lightgreen;
}

.right::after {
	content: '';
	position: absolute;
	right: -8px;
	top: 50%;
	border-top: 6px solid transparent;
	border-bottom: 6px solid transparent;
	border-left: 8px solid #fff;
}

.img_target {
	margin-bottom: 15px;
}
</style>
</head>

<body>
	<div class="container">
		<div class="content">
			<div class="easyui-tabs1" style="width: 100%;">
				<div class="basic-info">
					<hr>
					<div class="column">
						<span class="current">详情信息</span>
					</div>
						<table class="kv-table">
							<tbody>
								<tr>
									<td class="kv-label">姓名</td>
									<td class="kv-content" style="font-size: 12px;">${curStu.name }</td>
									<td class="kv-label">性别</td>
									<td class="kv-content" style="font-size: 12px;">
										<input style="width: 80%;" readOnly="true" placeholder="必填" id="stuSex" name="stuSex" class="easyui-combobox"
											data-options="editable:false,
												required:true,
			                                    valueField:'id',
			                                    textField:'name',
			                                    panelHeight:'auto',
			                                    data:[{'id':'true','name':'男'},{'id':'false','name':'女'}],
			                                    value: ${curStu.stuSex}">
									</td>
									<td class="kv-label">户籍</td>
									<td class="kv-content">
										<input style="width: 80%;" readOnly="true" name="registeredResidence" class="easyui-combobox"
										data-options="editable:false,
											required:true,
		                                    valueField:'id',
		                                    textField:'registeredResidence',
		                                    panelHeight:'auto',
		                                    data:[{'id':'true','registeredResidence':'城镇'},{'id':'false','registeredResidence':'农村'}],
		                                    value: '${curStu.registeredResidence }'">
									</td>
								</tr>
								<tr>
									<td class="kv-label">所在大学</td>
									<td class="kv-content" style="font-size: 12px;">${curStu.college.collegeName }</td>
									<td class="kv-label">所在班级</td>
									<td class="kv-content" style="font-size: 12px;">${curStu.classes.name }</td>
									<td class="kv-label">家庭经济情况</td>
									<td class="kv-content" style="font-size: 12px;">${curStu.economy.economyState }</td>
								</tr>
								<tr>
									<td class="kv-label">生日</td>
									<td class="kv-content" style="font-size: 12px;"><fmt:formatDate value="${curStu.stuBirthday }" pattern="yyyy-MM-dd"/></td>
									<td class="kv-label">生源地</td>
									<td class="kv-content" style="font-size: 12px;">${curStu.stuOrgin }</td>
									<td class="kv-label">毕业后目标</td>
									<td class="kv-content" style="font-size: 12px;">${curStu.target.targetCaption }</td>
								</tr>
								<tr>
									<td class="kv-label">毕业后的职业理想</td>
									<td class="kv-content" colspan="5" style="font-size: 12px;">${curStu.stuIdeal }</td>
								</tr>
							</tbody>

						</table>
					
					
					<hr style="margin-top: 1%;">
					
					<div class="column">
						<span class="current">亲属信息</span>
					</div>
					
					<!--成员名单 -->
					<div style="width: 100%;height:240px;vertical-align: center">
						<table id="memberDatagrid" class="easyui-edatagrid">
							<thead>
								<tr>
									<th data-options="field:'membersName',width:10">成员姓名</th>
									<th data-options="field:'membersRelationship',width:10">与学生的关系</th>
									<th data-options="field:'membersJob',width:10">成员工作</th>
								</tr>
							</thead>
						</table>
					</div>
					
					<div class="column">
						<span class="current">当前学期规划信息</span>
					</div>
					
					<div class="containers">
	 
					<div class="target" >
						
						<div style="float:left;">
							<img class="img_target" id="img_s" alt="关于学期小目标" src="<%=basePath%>images/comment/man_student.png">
							<h1 class="title">学期小目标 &nbsp;&nbsp; </h1>
						</div>
						<div class="left" style=" margin-left:120px; margin-top:10px;">
							<p class="p" id="smallTarget" style="margin-bottom:25px;"></p>
						</div >
					</div>
					
					<div class="audit" style="display: none;">
							<form id="auditForm" method="POST" style="margin-top: 2%;">
								<table class="kv-table">
									<tr >
										<td>
											<div class="right" id="auditInfo" tilte="班主任对学期小目标评语" name="teacherAudit"
												style="margin-right: 150px; margin-bottom: -240px;"
												contenteditable="true">
												<p class="p" id="teacherAudit" style="margin-bottom: 25px;"></p>
												<input id="auditCommit" name="teacherAudit" style="display: none;" />
												<input id="semester" name="semester" value="${trem.semester}" style="display: none;" />
											</div>
										</td>
										</tr>
								</table>
							</form>

							<div style="float:right;" >
							<img id="img2" alt="关于学期小目标的评语" src="<%=basePath%>images/comment/Teacher_male.png">
							<h1 id="auditH1" class="title" style="left: 120px;top: 120px;margin-right:0px;display: none;position: relative;">班主任评语 &nbsp;&nbsp; </h1>
							<div id="auditBton">
								<a style="float: right; margin-top: 10px;margin-right:-5px;"
									href="javascript:void(0)" onclick="auditCommit()"
									class="easyui-linkbutton c4" iconCls="icon-ok">班主任评语回复</a>
							</div>
						</div>
					</div>
					
					<div class="feedBack" style="display: none; ">
						<div style="float:left;">
							<img class="img_feedBack" id="img_s" alt="关于目标反馈" src="<%=basePath%>images/comment/man_student.png">
							<h1 class="title">目标反馈 &nbsp;&nbsp; </h1>
						</div>
						<div class="left" tilte="目标反馈" style=" margin-left:100px;margin-top:45px;">
							<p class="p" id="targetFeedback" style="margin-bottom:25px;"></p>
						</div>
					</div>
					
					<div class="comment" style="display: none;">
					
						<form id="commentForm" method="POST" style="margin-top: 2%;">
								<table class="kv-table">
									<tr >
										<td>
											<div id="commentInfo" class="right" tilte="班主任对目标反馈的评语"
												style="margin-right: 150px; margin-bottom: -240px;"
												contenteditable="true">
												<p class="p" id="teacherComment" style="margin-bottom: 25px;"></p>
												<input id="commentCommit" name="teacherComment" style="display: none;" />
												<input id="semester" name="semester" value="${trem.semester}"
													style="display: none;" />
												<div class="result" style="margin-bottom:25px;">成绩：<a id="result" style="color:#FF0000;"></a></div>
											</div>
										</td>
										</tr>
								</table>
							</form>
						<div style="float:right;">
							<img id="img2" alt="关于学期小目标的评语" src="<%=basePath%>images/comment/Teacher_male.png">
							<h1 id="commentH1" class="title"  style="left: 140px;top: 120px;display: none;position: relative;">班主任考核意见 &nbsp;&nbsp; </h1>
							<div id="commentBton">
								<a style="float: right; margin-top: 10px;margin-right:-15px;"
									href="javascript:void(0)" onclick="commentCommit()"
									class="easyui-linkbutton c4" iconCls="icon-ok">班主任考核意见回复</a>
							</div>
						</div>
					</div>
					
			     </div>
					
				</div>
				
			</div>
		</div>
	</div>

	<script type="text/javascript">
	var grid = null;
	var basePath = '<%=basePath%>';
	var stuSex=${curStu.stuSex};
	var stuId=${curStu.id};
	var Obj;
	var trem;
	var id = ${trem.id};
	var semester='${trem.semester}';
	
	var params = {
	        id: '',
	        mode: 'insert'
	    };
	$(document).ready(function () {
		Obj = $.ajax({
			url : basePath+"student/queryTrem",
			data:{id:id},
			type : "post",
			async : false
		});//得到某个学生当前学期的学期规划
		trem = Obj.responseJSON;
		console.log(trem);
		
		grid = $('#memberDatagrid').edatagrid({
			title: '亲属成员清单',
            height: '200',
            fitColumns: true,
            method: 'post',
            url: basePath+'student/gridOneStuMemberData',
            border: false,
            rownumbers: true,
            remoteSort: true,
            nowrap: false,
            singleSelect: true,
            fitColumns: true,
            striped: true,
            autoSave: true,
            idField: "id",
            queryParams: {
        		stuId: stuId
        	},
            onSuccess: function (index, result) {
                //console.log(result);
                $.messager.show({
                	title: "消息",
                    msg: result.msg
                });
            },
            onDestroy: function (index, result) {
                //console.log(result);
                $.messager.show({
                	title: "消息",
                    msg: result.msg
                });
            }
		});
		
		showComment();
		
      });
	
	
	function showComment() {
			$(".containers").css("display","block");
			$("#smallTarget").html(trem.smallTarget);
			$("#teacherAudit").html(trem.teacherAudit);
			$("#targetFeedback").html(trem.targetFeedback);
			$("#teacherComment").html(trem.teacherComment);
			$("#result").html(trem.score);
			if(trem.smallTarget==null || trem.smallTarget.length<1){
				$(".containers").css("display","none");
			}else{
				$(".target").css("display","inline");
			}
			if(trem.teacherAudit==null || trem.teacherAudit.length<1){
				$(".audit").css("display","inline");
			}else{
				$("#auditInfo").attr("contenteditable",false); 
				$("#auditBton").css("display","none");
				$("#auditH1").css("display","inline");
				$(".audit").css("display","inline");
			}
			if(trem.targetFeedback==null || trem.targetFeedback.length<1){
				$(".feedBack").css("display","none");
			}else{
				$(".feedBack").css("display","inline");
			}
			if(trem.teacherComment==null || trem.teacherComment.length<1){
				if(trem.targetFeedback==null || trem.targetFeedback.length<1){
					$(".comment").css("display","none");
				}else{
					$(".comment").css("display","inline");
				}
				
			}else{
				$("#commentInfo").attr("contenteditable",false);
				$("#commentBton").css("display","none");
				$("#commentH1").css("display","inline");
				$(".comment").css("display","inline");
			}
			
			
			if(stuSex==true){
				$(".img_target").attr("src",basePath+"images/comment/man_student.png");
				$(".img_feedBack").attr("src",basePath+"images/comment/man_student.png");
			}else{
				$(".img_target").attr("src",basePath+"images/comment/woman_student.png");
				$(".img_feedBack").attr("src",basePath+"images/comment/woman_student.png");
			}
	}
	
	
	function auditCommit() {
		$("#auditCommit").val($("#auditInfo").text());
		$('#auditForm').form('submit', {
	         url: '<%=basePath%>student/teacherSaveTrem',
				onSubmit : function(param) {
					param.student = stuId;
					param.id = id;
					return $(this).form('validate');
				},
				success : function(result) {
					var result = eval('(' + result + ')');
					if (result.code == 200) {

					}
					$.messager.show({
						title : "消息",
						msg : result.msg
					});
				}
			});
		}
	
	function commentCommit() {
		$("#commentCommit").val($("#commentInfo").text());
		$('#commentForm').form('submit', {
	         url: '<%=basePath%>student/teacherSaveTrem',
				onSubmit : function(param) {
					param.student = stuId;
					param.id = id;
					return $(this).form('validate');
				},
				success : function(result) {
					var result = eval('(' + result + ')');
					if (result.code == 200) {

					}
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

