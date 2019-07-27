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
<title>基本信息</title>
<link href="<%=basePath%>css/main_base.css" rel="stylesheet">
<link href="<%=basePath%>css/basic_info.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="<%=basePath%>easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>easyui/themes/color.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>easyui/themes/default/easyui.css">
<script type="text/javascript" src="<%=basePath%>js/main.js"></script>
<script type="text/javascript" src="<%=basePath%>easyui/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=basePath%>easyui/plugins/jquery.edatagrid.js"></script>
<script type="text/javascript" src="<%=basePath%>easyui/locale/easyui-lang-zh_CN.js"></script>


</head>

<body>
	<div class="container">
		<div class="content">
			<div class="easyui-tabs1" style="width: 100%;">
				<div class="basic-info">
					<hr>
					<div class="column">
						<span class="current">基本信息</span>
					</div>
					<form id="basicInfoForm" method="POST" novalidate>
						<table class="kv-table">
							<tbody>
								<tr>
									<td class="kv-label">姓名</td>
									<td class="kv-content" style="font-size: 12px;">${curStu.name }</td>
									<td class="kv-label">性别</td>
									<td class="kv-content">
									<input style="width: 80%;" placeholder="必填" id="stuSex" name="stuSex" class="easyui-combobox"
										data-options="editable:false,
											required:true,
		                                    valueField:'id',
		                                    textField:'name',
		                                    panelHeight:'auto',
		                                    data:[{'id':'true','name':'男'},{'id':'false','name':'女'}],
		                                    value: ${curStu.stuSex}">
									</td>
									<td class="kv-label">户籍</td>
									<td class="kv-content"><input style="width: 80%;" placeholder="必填" name="registeredResidence" class="easyui-combobox"
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
									<td class="kv-content"><input style="width: 80%;" placeholder="必填" name="college" class="easyui-combobox"
										data-options="editable:false,
											required:true,
		                                    valueField:'id',
		                                    textField:'collegeName',
		                                    panelHeight:'auto',
		                                    url:'<%=basePath%>assist/collegeList',
		                                    value: '${curStu.college.id }'">
									</td>


									<td class="kv-label">所在班级</td>
									<td class="kv-content"><input style="width: 80%;" placeholder="必填" name="classes" class="easyui-combobox"
										data-options="editable:false,
											required:true,
		                                    valueField:'id',
		                                    textField:'name',
		                                    panelHeight:'auto',
		                                    data:[{'id':1,'name':'电信161'},{'id':2,'name':'电信162'},{'id':3,'name':'电信163'},{'id':4,'name':'电信164'}],
		                                    value: '${curStu.classes.id }'" />
									</td>
									<td class="kv-label">家庭经济情况</td>
									<td class="kv-content"><input style="width: 80%;" placeholder="必填" name="economy" class="easyui-combobox"
										data-options="editable:false,
											required:true,
		                                    valueField:'id',
		                                    textField:'economyState',
		                                    panelHeight:'auto',
		                                    url:'<%=basePath%>assist/economyList',
		                                    value: '${curStu.economy.id }'" />
									</td>
								</tr>
								<tr>
									<td class="kv-label">生日</td>
									<td class="kv-content"><input style="width: 80%;" placeholder="必填" name="stuBirthday" class="easyui-datebox" 
										data-options="editable:false,
											required:true,
											value: '${curStu.stuBirthday }'"/>
									</td>
									<td class="kv-label">生源地</td>
									<td class="kv-content">
										<input placeholder="必填" name="stuOrgin" class="easyui-validatebox" value="${curStu.stuOrgin }" data-options="required:true" />
									</td>
									<td class="kv-label">毕业后目标</td>
									<td class="kv-content"><input style="width: 80%;" placeholder="必填" name="target" class="easyui-combobox"
										data-options="editable:false,
											required:true,
		                                    valueField:'id',
		                                    textField:'targetCaption',
		                                    panelHeight:'auto',
		                                    url:'<%=basePath%>assist/targetList',
		                                    value: '${curStu.target.id }'" />
									</td>
								</tr>
								<tr>
									<td class="kv-label">毕业后的职业理想</td>
									<td class="kv-content" colspan="5">
										<input  placeholder="必填" name="stuIdeal" value="${curStu.stuIdeal }" type="text" />
									</td>
								</tr>
							</tbody>

						</table>
					</form>
					<div>
						<a style="float: right;" id="commit-baseInfo" onclick="commit_baseInfo()" class="easyui-linkbutton c4" iconCls="icon-ok">提交</a>
					</div>
					
					
					<hr style="margin-top: 10%;">
					
					<div class="column">
						<span class="current">亲属信息</span>
					</div>
					
					<!--成员名单 -->
					<div style="width: 100%;height:240px;top:1%; vertical-align: center">
						<table id="memberDatagrid" class="easyui-edatagrid" toolbar="#memberDatagridToolbar">
							<thead>
								<tr>
									<th data-options="field:'membersName',width:10">成员姓名</th>
									<th data-options="field:'membersRelationship',width:10">与学生的关系</th>
									<th data-options="field:'membersJob',width:10">成员工作</th>
								</tr>
							</thead>
						</table>
					</div>
					
					<!-- 数据表格组件工具栏 -->
					<div class="easyui-layout" >
						<div id="memberDatagridToolbar" region="north" border="false" style="border-bottom: 1px solid #ddd; height: 32px; padding: 2px 5px; background: #fafafa;">
							<div style="float: left;">
								<a data-url="addMember" href="javascript:void(0)" class="easyui-linkbutton c1"  plain="true" iconCls="icon-add">添加</a> 
								<a data-url="updateMember" href="javascript:void(0)" class="easyui-linkbutton c2"  plain="true" iconCls="icon-edit">编辑</a> 
								<a data-url="removeMember" href="javascript:void(0)" class="easyui-linkbutton c3"  plain="true" iconCls="icon-remove">删除</a>
								<a data-url="reloadMember" href="javascript:void(0)" class="easyui-linkbutton c4"  plain="true" iconCls="icon-reload">刷新</a>
							</div>
						</div>
					</div>
					
					<!-- 新增成员 -->
					<div id="memberDialog" class="easyui-dialog" iconCls="icon-man"
						style="width: 600px; height: 300px;vertical-align: center" data-options="closed:true,modal:true,buttons:'#memberDialogButtons'">
						<form id="memberForm" method="post">
							<table class='kv-table' style='width:85%;padding:4%; border-collapse: separate; border-spacing: 0px 10px; margin: 0 auto;border:"2"'>
								<tr>
									<td class="kv-label" style="text-align: center; width: 25%;">成员姓名</td>
									<td class="kv-content">
										<input class="easyui-validatebox" data-options="required:true" id="membersName" name="membersName"type="text">
									</td>
								</tr>
								<tr>
									<td class="kv-label" style="text-align: center; width: 25%;">与学生的关系</td>
									<td class="kv-content">
										<input class="easyui-validatebox" data-options="required:true" id="membersRelationship" name="membersRelationship" type="text">
									</td>
								</tr>
								<tr>
									<td class="kv-label" style="text-align: center; width: 25%;">成员工作</td>
									<td class="kv-content">
										<input class="easyui-validatebox" data-options="required:true" id="membersJob" name="membersJob" type="text">
									</td>
								</tr>
							</table>
						</form>
					</div>
					<!-- 新增成员保存按钮 -->
					<div id="memberDialogButtons">
						<a data-url="saveMember" href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" style="width: 90px">保存</a>
						<a data-url="cancelMember" href="javascript:void(0)" class="easyui-linkbutton c7" iconCls="icon-cancel" style="width: 90px">取消</a>
					</div>


				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	var grid = null;
	var basePath = '<%=basePath%>';
	var stuId=${curStu.id};
	var params = {
	        id: '',
	        mode: 'insert'
	    };
	$(document).ready(function () {
		grid = $('#memberDatagrid').edatagrid({
			title: '亲属成员清单',
            height: '260',
            fitColumns: true,
            method: 'post',
            url: basePath+'student/gridOneStuMemberData',
            //data: '${curStu.members}',
            saveUrl: basePath+'student/addMember',
            updateUrl: basePath+'student/addMember',
            destroyUrl: basePath+'student/deleteMember',
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
        	destroyMsg: {
                norecord: {
                    title: '警告',
                    msg: '首先需要选中记录，然后在点击删除按钮'
                },
                confirm: {
                    title: '确认',
                    msg: '是否删除选中记录?'
                }
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
		
		// 声明并缓存easyui组件
        var memberDatagrid = $("#memberDatagrid");
        var memberDialog = $("#memberDialog");
        var memberForm = $("#memberForm");
        // 创建操作data-url的json对象，把页面所有linkbutton组件的操作都统一添加到此对象上面
        var urlObjectMember = {
            addMember : function() {
            	params.id = 0;
                // 清空对话框里面的表单内容，防止原来的数据有缓存
                memberForm.form("reset");
                // 打开对话框，修改标题，然后居中
                memberDialog.dialog("open").dialog("setTitle", "添加亲属");
            },
            updateMember : function() {
                // 获取选中行数据
                var selectedRow = memberDatagrid.datagrid("getSelected");
                // 判断是否选中行
                if (selectedRow) {
                	params.id = selectedRow.id;
                    params.mode = 'edit';
                    console.log(selectedRow.id);
                    // 使用easyui的form组件load方法，只要是相同的名称，会自动回显数据
                    memberForm.form("load", selectedRow);
                    // 打开对话框
                    memberDialog.dialog("open").dialog("setTitle", "编辑亲属");
                }else {
                	$.messager.alert("操作提示", "请先选中一行数据，在修改！！", "info");
				}
                
            },
            removeMember : function() {
                memberDatagrid.edatagrid('destroyRow');
            },
            reloadMember : function() {//调用重新加载数据的方法
                memberDatagrid.datagrid("reload");
            },
            saveMember : function() {//提交表单
            	memberForm.form('submit', {
       				url: basePath+"student/addMember",
       			 	onSubmit: function (param) {
       				 	param.student = stuId;
       				 	param.id = params.id;
       				 	return $(this).form('validate');
       			 	},
       			 	success: function (result) {
       				 	var result = eval('(' +result+ ')');
       				 	console.log(result);
       				 	if (result.code == 200) {
       				 		// 成功就关掉对话框
       	                    memberDialog.dialog("close");
       	                    //重新加载最新的数据
       	                    memberDatagrid.datagrid("reload");
       				 	}
       				 	$.messager.show({
       						 title: "消息",
       						 msg: result.msg
       					 });
       				}
       		 	});
            },
            cancelMember : function() {//关闭对话框
                memberDialog.dialog("close");
            }
        };
        // 对页面所有linkbutton组件，统一监听
        $("a[data-url]").on("click", function() {
            // 获取linkbutton的data-url信息
            var url = $(this).data("url");
            //如果此目标方法是存在的并且linkbutton组件没有被禁用，才可以点击
            if (urlObjectMember[url] && !$(this).linkbutton('options').disabled) {
                //调用动态的方法
                urlObjectMember[url]();
            }
        });
	});
	
	
	
	/* 提交基本信息 */
	function commit_baseInfo(){
		 $('#basicInfoForm').form('submit', {
			 url: basePath+'student/save',
			 onSubmit: function (param) {
				 param.id = stuId;
				 return $(this).form('validate');
			 },
			 success: function (result) {
				 var result = eval('(' +result+ ')');
				 if (result.message.code == 200) {
					 //result.data.stuSex = String(result.data.stuSex);
					 //result.data.registeredResidence = String(result.data.registeredResidence);
					 var formData = jsonBoolean2String(result.data);
					 console.log(formData);
					 $('#basicInfoForm').form('load',formData);
				 }
				 $.messager.show({
					 title: "消息",
					 msg: result.message.msg
				 });
			 }
		 }); 
	}
	</script>

</body>
</html>

