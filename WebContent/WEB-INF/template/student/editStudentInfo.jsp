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
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>easyui/themes/icon.css">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>easyui/themes/color.css">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>easyui/themes/default/easyui.css">
<script type="text/javascript" src="<%=basePath%>js/main.js"></script>
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
									<td class="kv-content" style="font-size: 12px;">${curStu.name }
										${curStu.id }<input name="id" value="${curStu.id}"
										style="display: none;" />
									</td>
									<td class="kv-label">性别</td>
									<td class="kv-content"><input style="width: 80%;"
										placeholder="必填" id="stuSex" name="stuSex"
										class="easyui-combobox"
										data-options="editable:false,
									required:true,
                                    valueField:'id',
                                    textField:'name',
                                    panelHeight:'auto',
                                    data:[{'id':'true','name':'男'},{'id':'false','name':'女'}],
                                    value: '${curStu.stuSex }'">
									</td>
									<td class="kv-label">户籍</td>
									<td class="kv-content"><input style="width: 80%;"
										placeholder="必填" name="registeredResidence"
										class="easyui-combobox"
										data-options="editable:false,
									required:true,
                                    valueField:'id',
                                    textField:'registeredResidence',
                                    panelHeight:'auto',
                                    data:[{'id':'','registeredResidence':'请选择'},{'id':'true','registeredResidence':'城镇'},{'id':'false','registeredResidence':'农村'}],
                                    value: '${curStu.registeredResidence }'">
									</td>
								</tr>
								<tr>
									<td class="kv-label">所在大学</td>
									<td class="kv-content"><input style="width: 80%;"
										placeholder="必填" name="college" class="easyui-combobox"
										data-options="editable:false,
									required:true,
                                    valueField:'id',
                                    textField:'collegeName',
                                    panelHeight:'auto',
                                    <%-- url:'<%=basePath%>/seedType/data' --%>
                                    data:[{'id':10421,'collegeName':'江西财经大学'}],
                                    value: '${curStu.college.id }'">
									</td>


									<td class="kv-label">所在班级</td>
									<td class="kv-content"><input style="width: 80%;"
										placeholder="必填" name="classes"
										value="${curStu.classes.name }" class="easyui-combobox"
										data-options="editable:false,
									required:true,
                                    valueField:'id',
                                    textField:'name',
                                    panelHeight:'auto',
                                    <%-- url:'<%=basePath%>/seedType/data' --%>
                                    data:[{'id':1,'name':'电信161'},{'id':2,'name':'电信162'}]" />
									</td>
									<td class="kv-label">家庭经济情况</td>
									<td class="kv-content"><input style="width: 80%;"
										placeholder="必填" name="economy" class="easyui-combobox"
										data-options="editable:false,
									required:true,
                                    valueField:'id',
                                    textField:'economyState',
                                    panelHeight:'auto',
                                    <%-- url:'<%=basePath%>/seedType/data' --%>
                                    data:[{'id':1,'economyState':'贫困'},{'id':2,'economyState':'一般'},{'id':3,'economyState':'富裕'}],
                                    value: '${curStu.economy.id }'" />
									</td>
								</tr>
								<tr>
									<td class="kv-label">生日</td>
									<td class="kv-content"><input style="width: 80%;"
										placeholder="必填" name="stuBirthday"
										value="${curStu.stuBirthday }" class="easyui-datebox">
									</td>
									<td class="kv-label">生源地</td>
									<td class="kv-content"><input placeholder="必填"
										name="stuOrgin" type="text" class="easyui-validatebox"
										value="${curStu.stuOrgin }" data-options="required:true" /></td>
									<td class="kv-label">毕业后目标</td>
									<td class="kv-content"><input style="width: 80%;"
										placeholder="必填" name="target" class="easyui-combobox"
										data-options="editable:false,
									required:true,
                                    valueField:'id',
                                    textField:'employment',
                                    panelHeight:'auto',
                                    <%-- url:'<%=basePath%>/seedType/data' --%>
                                    data:[{'id':1,'employment':'考研'},{'id':2,'employment':'考公务员'},{'id':3,'employment':'签约就业'}],
                                    value: '${curStu.target.targetCaption }'" />
									</td>
								</tr>
								<tr>
									<td class="kv-label">毕业后的职业理想</td>
									<td class="kv-content" colspan="5"><input placeholder="必填"
										name="stuIdeal" value="${curStu.stuIdeal }" type="text" /></td>
								</tr>
							</tbody>

						</table>
					</form>
					<div>
						<a style="float: right;" id="commit-baseInfo"
							onclick="commit_baseInfo()" class="easyui-linkbutton c4"
							iconCls="icon-ok">提交</a>

					</div>


					<hr style="margin-top: 10%;">

					<div class="column">
						<span class="current">亲属信息</span>
						<!-- <a onclick="add()" style="float:right;cursor:pointer;" class="iconfont show-family">&#xe663;</a> -->
					</div>
					<div id="controlBox">
						<a href="javascript:void(0)" class="easyui-linkbutton c2" iconCls="icon-add" onclick="addForm()">添加</a>
						<a href="javascript:void(0)" class="easyui-linkbutton c4" iconCls="icon-edit" >编辑</a>
						<a href="javascript:void(0)" class="easyui-linkbutton c5" iconCls="icon-cancel" onclick="destroy()">删除</a>
					</div>
					
					<!--成员名单 -->
					<table id="id_detailTable" class="kv-table">
						<tbody class="family-table" >
							<tr id="family" class="family-modle">
								<td class="kv-label" style="text-align:center">成员姓名</td>
								<td class="kv-label" style="text-align:center">与学生的关系</td>
								<td class="kv-label" style="text-align:center">成员工作</td>
							</tr>
							<c:forEach items="${member}" var="c" varStatus="st">
								<tr>
									<td class="kv-content" style="text-align:center">${c.membersName}</td>
									<td class="kv-content" style="text-align:center">${c.membersRelationship}</td>
									<td class="kv-content" style="text-align:center">${c.membersJob}</td>
								</tr>
							</c:forEach>


						</tbody>
					</table>

					<div id="memberFormContainer" class="easyui-dialog"
						style="width: 45%; height: 65%; vertical-align: center"
						closed="true" buttons="#memberFormBtns" data-options="modal:true">
						<form id="formMember" method="POST" novalidate>
							<table class='kv-table'
								style='width: 80%; height: 75%; border-collapse: separate; border-spacing: 0px 25px; margin: 0 auto;'>
								<tr>
									<td class="kv-label" style="text-align: center; width: 25%;">成员姓名</td>
									<td class="kv-content">
										<input id="id" name="id" value="0"style="display: none;" />
										<input id="membersName" name="membersName"type="text">
										<input id="student" name="student" value="${curStu.id}"style="display: none;" />
									</td>
								</tr>
								<tr>

									<td class="kv-label" style="text-align: center; width: 25%;">与学生的关系</td>
									<td class="kv-content"><input id="membersRelationship" name="membersRelationship"
										type="text"></td>
								</tr>
								<tr>
									<td class="kv-label" style="text-align: center; width: 25%;">成员工作</td>
									<td class="kv-content"><input id="membersJob" name="membersJob"
										type="text"></td>
								</tr>
							</table>
						</form>
					</div>
					<div id="memberFormBtns">
						<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveForm()">保存</a>
						<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#memberFormContainer').dialog('close')">取消</a>
					</div>


				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	
	var params = {
	        id: '',
	        mode: 'insert'
	    };
	var stuId=${curStu.id};
	
	//实现选择变颜色
	$(function(){
		$("#id_detailTable").find('tr').click(function(){
			var trs = $("#id_detailTable").find('.delete');
			$(trs).removeClass("delete");
			
			$("#id_detailTable").find('tr').css('background-color','white');//查找白色背景的tr
			$(this).css('background-color','#e2f5ff'); /**选中行改变背景色**/
			$(this).addClass("delete");
		});
	});
	
/* 提交基本信息 */
function commit_baseInfo(){
		
	 $('#basicInfoForm').form('submit', {
         url: '<%=basePath%>student/save',
         onSubmit: function (param) {
             param.id = params.id;
             param.mode = params.mode;
             return $(this).form('validate');
         },
         success: function (result) {
             var result = eval('(' +result+ ')');
             console.log(result);
             if (result.code == 200) {
            	 location.reload();
             }
             $.messager.show({
                 title: "消息",
                 msg: result.msg
             });
         }
     }); 
    }
    
/* 修改 */
function loadForm() {
        //console.log(data);
       /*  params.mode = 'edit';
        $('#memberFormContainer').dialog('open').dialog('setTitle', '修改亲属');
        $("#id").val(data.id);
        $("#membersName").val(data.membersName);
        $("#student").val("${curStu.id}");
        $("#membersRelationship").val(data.membersRelationship);
        $("#membersJob").val(data.membersJob);
         */
    }
    
/* 添加 */
function addForm() {
        $('#formMember').form('reset');
        $('#memberFormContainer').dialog('open').dialog('setTitle', '添加亲属');
    }
    
    
/* 保存添加 */
function saveForm() {
        $('#formMember').form('submit', {
            url: '<%=basePath%>student/addMember',
            onSubmit: function (param) {
                param.id = params.id;
                param.mode = params.mode;
                return $(this).form('validate');
            },
            success: function (result) {
                var result = eval('(' +result+ ')');
                console.log(stuId);
                console.log(result);
                if (result.code == 200) {
                    $('#memberFormContainer').dialog('close');
                
                }
                
                $.messager.show({
                    title: "消息",
                    msg: result.msg
                });
            }
        }); 
    }
    
    
//删除一行数据
function destroy(){
	
	var tr = $("#id_detailTable").find('.delete');//查找白色背景的tr
	
	 $.ajax({
		 	type: "POST",
			url: "<%=basePath%>student/deleteMember",
			data:{id:7,student:stuId},
			success:function (result) {
                var result = eval('(' +result+ ')');
                /* if (result.code == 200) {
                	
                } */
				 $.messager.show({
			         title: "消息",
			         msg: result.msg
				 });
				 
			}
		});
	
	 if($(tr).attr('id')=="family"){
	 }else{
		 $(tr).remove();
	 }
	
	
}
	</script>

</body>
</html>

