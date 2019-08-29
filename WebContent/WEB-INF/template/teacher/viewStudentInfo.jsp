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
					
					
					<hr style="margin-top: 2%;">
					
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
		
      });
	
	
	</script>

</body>
</html>

