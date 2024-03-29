<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	<script type="text/javascript" src="<%=basePath%>easyui/jquery.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>easyui/plugins/jquery.edatagrid.js"></script>
	<script type="text/javascript" src="<%=basePath%>easyui/locale/easyui-lang-zh_CN.js"></script>
	
	
</head> 

<body>
	<div class="container">
		
		<div class="content">
			<div class="easyui-tabs1" style="width:100%;">
		      <div  class="basic-info">
		      	<hr>
		      	<div class="column"><span class="current">基本信息</span></div>
		      	<table class="kv-table">
					<tbody>
						<tr>
							<td class="kv-label">姓名</td>
							<td class="kv-content"><input id="userName"/></td>
							<td class="kv-label">性别</td>
							<td class="kv-content">
								<input style="width:80%;" placeholder="必填" name="stuSex" class="easyui-combobox"
                           data-options="editable:false,
									required:true,
                                    valueField:'id',
                                    textField:'name',
                                    panelHeight:'auto',
                                    data:[{'id':0,'name':'男'},{'id':1,'name':'女'}]">
							</td>
							<td class="kv-label">户籍</td>
							<td class="kv-content">
								<input style="width:80%;" placeholder="必填" name="registeredResidence" class="easyui-combobox"
                           			data-options="editable:false,
									required:true,
                                    valueField:'id',
                                    textField:'registeredResidence',
                                    panelHeight:'auto',
                                    data:[{'id':1,'registeredResidence':'城镇'},{'id':2,'registeredResidence':'农村'}]">
							</td>
						</tr>
						<tr>
							<td class="kv-label">所在大学</td>
							<td class="kv-content">
								<input style="width:80%;" placeholder="必填" name="college" class="easyui-combobox"
                           			data-options="editable:false,
									required:true,
                                    valueField:'id',
                                    textField:'collegeName',
                                    panelHeight:'auto',
                                    data:[{'id':10421,'collegeName':'江西财经大学'}]">
							</td>
							
							
							<td class="kv-label">所在班级</td>
							<td class="kv-content">
								<input placeholder="必填" name="classes" type="text" class="easyui-validatebox" data-options="required:true"/>
							</td>
							<td class="kv-label">家庭经济情况</td>
							<td class="kv-content">
								<input style="width:80%;" placeholder="必填" name="economy" class="easyui-combobox"
                           			data-options="editable:false,
									required:true,
                                    valueField:'id',
                                    textField:'economyState',
                                    panelHeight:'auto',
                                    data:[{'id':1,'economyState':'贫困'},{'id':2,'economyState':'一般'},{'id':3,'economyState':'富裕'}]" />
							</td>
						</tr>
						<tr>
							<td class="kv-label">生日</td>
							<td class="kv-content">
								<input style="width:80%;" placeholder="必填" name="stuBirthday" class="easyui-datebox">
							</td>
							<td class="kv-label">生源地</td>
							<td class="kv-content" >
								<input placeholder="必填" name="stuOrgin" type="text" class="easyui-validatebox" data-options="required:true" />
							</td>
							<td class="kv-label">毕业后目标</td>
							<td class="kv-content" >
								<input style="width:80%;" placeholder="必填" name="target"class="easyui-combobox"
                           			data-options="editable:false,
									required:true,
                                    valueField:'id',
                                    textField:'employment',
                                    panelHeight:'auto',
                                    data:[{'id':1,'employment':'考研'},{'id':2,'employment':'考公务员'},{'id':3,'employment':'签约就业'}]"/>
							</td>
						</tr>
						<tr>
							<td class="kv-label">毕业后的职业理想</td>
							<td class="kv-content" colspan="5">
								<input  placeholder="必填" name="stuIdeal" type="text" />
							</td>
						</tr>
					</tbody>
				</table>
				<div >
					<a style="float:right;" id="commit-baseInfo" onclick="commit_baseInfo()" class="easyui-linkbutton c4" iconCls="icon-ok" >提交</a>
					
				</div>
				
				
				<hr style="margin-top:15%;">
				
				<div class="column"><span class="current">亲属信息</span> <!-- <a onclick="add()" style="float:right;cursor:pointer;" class="iconfont show-family">&#xe663;</a> --></div>
		      	<!-- <table class="kv-table">
					<tbody class="family-table" >
						<tr class="family-modle" style="display:none;">
							<td class="kv-label">成员姓名</td>
							<td class="kv-content">
								<input name="membersName" type="text">
							</td>
							<td class="kv-label">与学生的关系</td>
							<td class="kv-content">
								<input name="membersRelationship" type="text">
							</td>
							<td class="kv-label">成员工作</td>
							<td class="kv-content">
								<input name="membersJob" type="text">
							</td>
							<td class="kv-label">
								<a id="save-member" onclick="save_member()" class="easyui-linkbutton c4" iconCls="icon-save" >保存</a>
								<a id="delete-member" onclick="delete_member()" class="easyui-linkbutton c5" iconCls="icon-remove" >删除</a>
								</td>
						</tr>
					</tbody>
				</table> -->
				
				<div id="controlBox">
				    <a href="#" class="easyui-linkbutton c2" iconCls="icon-add" onclick="addForm()">添加</a>
				    <a href="#" class="easyui-linkbutton c4" iconCls="icon-edit" onclick="loadForm()">编辑</a>
				    <a href="#" class="easyui-linkbutton c3" iconCls="icon-remove"
				       onclick="javascript:grid.edatagrid('cancelRow')">取消</a>
				    <a href="#" class="easyui-linkbutton c5" iconCls="icon-cancel"
				       onclick="javascript:grid.edatagrid('destroyRow')">删除</a>
				</div>
				
				
				<div id="memberFormContainer" class="easyui-dialog" 
					style="width:45%;height:40%;vertical-align: center" closed="true" buttons="#memberFormBtns">
				    <form id="formMember" method="POST" novalidate>
				        <table class='kv-table' style='width:80%;height:75%;border-collapse:separate; border-spacing:0px 25px;margin:0 auto;'>
				        	<tr >
								<td class="kv-label" style="text-align:center;width:25%;" >成员姓名</td>
								<td class="kv-content">
									<input name="membersName" type="text">
								</td>
							</tr>
							<tr >
								
								<td class="kv-label" style="text-align:center;width:25%;" >与学生的关系</td>
								<td class="kv-content">
									<input name="membersRelationship" type="text">
								</td>
							</tr>
							<tr >
								<td class="kv-label" style="text-align:center;width:25%;">成员工作</td>
								<td class="kv-content">
									<input name="membersJob" type="text">
								</td>
								<!-- <td class="kv-label">
									<a id="save-member" onclick="save_member()" class="easyui-linkbutton c4" iconCls="icon-save" >保存</a>
									<a id="delete-member" onclick="delete_member()" class="easyui-linkbutton c5" iconCls="icon-remove" >删除</a>
								</td> -->
							</tr>
						</table>
				    </form>
		    	</div>
		    	<div id="memberFormBtns">
				    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveForm()">保存</a>
				    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel"
				       onclick="javascript:$('#memberFormContainer').dialog('close')">取消</a>
				</div>
				
				<!--亲属成员清单表格  -->
				<table id="grid"></table>
		    	
		</div>
	</div>
</div>
	<script>
	
	var params = {
	        id: '',
	        mode: 'insert'
	    };
	var grid = null;
	var family_count=0;
	
	function add(){
		var tempMembers = $(".family-modle").clone(true).css("display","block").appendTo(".family-table");
		tempMembers.removeClass();
		family_count++;
		tempMembers.addClass("Member"+family_count);
	}
	
	//该代码为获取后台用户数据，自动添加用户姓名
	$(document).ready(function () {
		var test=window.location.search;
		//alert(test);
		var url= new Array();
		url=test.split("?"); //字符分割 
		//alert(url[url.length-1]);
		var account = url[url.length-1];//取出当前用户账号
		/*
		var user=$.ajax({
			data: {
				account:account
			},
			url: basePath+"user/findOne",
			method: "POST",
			async : false
		});
		*/
		$('#userName').val(account);//自动填写姓名
		
		grid = $('#grid').edatagrid({
            title: '亲属成员清单',
            height: '240px',
            fitColumns: true,
            method: 'post',
            url: '<%=basePath%>/member',
            saveUrl: '<%=basePath%>/saveMember.do',
            updateUrl: '<%=basePath%>/saveMember.do',
            destroyUrl: '<%=basePath%>/delMember.do',
            border: false,
            rownumbers: true,
            remoteSort: true,
            nowrap: false,
            singleSelect: true,
            fitColumns: true,
            pagination: true,
            striped: true,
            autoSave: true,
            pagination: true,
            pageSize: 5,
            pageList: [1, 3, 5],
            idField: "id",
            columns: [[
                {field: 'membersName', title: '成员姓名', width: 80, align: 'center', halign: 'center'},
                {field: 'membersRelationship', title: '与学生关系', width: 80, align: 'center', halign: 'center'},
                {field: 'membersJob', title: '成员工作', width: 100, align: 'center', halign: 'center'}
            ]],
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
                console.log(result);
                $("#msgBox").text(result.msg);
                grid.datagrid("load");
            },
            onDestroy: function (index, result) {
                console.log(result);
                $("#msgBox").text(result.msg);
            }
        });
    });
		
		
	
	function commit_baseInfo(){
		
	}
	
	function addForm() {
        $('#formMember').form('reset');
        $('#memberFormContainer').dialog({
            onClose: function () {grid.datagrid('reload');}
        }).dialog('open').dialog('setTitle', '添加亲属');
    }
	
	
	</script>
	
</body> 
</html>

