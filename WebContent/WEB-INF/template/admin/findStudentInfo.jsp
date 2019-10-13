<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生信息</title>
<script type="text/javascript" src="<%=basePath%>js/main.js"></script>
<script type="text/javascript" src="<%=basePath%>easyui/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=basePath%>easyui/plugins/jquery.edatagrid.js"></script>
<script type="text/javascript" src="<%=basePath%>easyui/locale/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet" type="text/css" href="<%=basePath%>easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>easyui/themes/color.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/main_base.css">
<style type="text/css">
        .tbledit td {
            padding: 5px 15px;
        }

        input {
            height: 25px;
            border-radius: 5px
        }
    </style>
</head>
<body>
<div id="controlBox" style="margin-top:30px;">
<table style="border-collapse: separate; border-spacing: 150px 0px;">
	<tr>
		<td >
			<span>年级:</span>
		    <input id="grade" placeholder="必选"  class="easyui-combobox"
										data-options="editable:false,
											required:true,
		                                    valueField:'id',
		                                    textField:'grade',
		                                    panelHeight:'auto',
		                                    panelMaxHeight:200,
		                                    url: '<%=basePath%>/classes/findGrade',
		                                    loadFilter: function (data) {
										        var obj = {};
										        obj.id = 0;
										        obj.grade = '请选择'
										        //在数组0位置插入obj,不删除原来的元素
										        data.splice(0, 0, obj)
										        return data;
										    },
		                                    onSelect: function(rec){
										    	if(rec.id != 0){
										    		var targetUrl = '<%=basePath%>/classes/fdByGrade?year=';
										    		$('#className').combobox({
													    url: targetUrl+rec.grade,
													    loadFilter: function (data) {
													        var obj = {};
													        obj.id = 0;
													        obj.name = '请选择'
													        //在数组0位置插入obj,不删除原来的元素
													        data.splice(0, 0, obj)
													        return data;
													    },
													    value: 0
													});
										    	}else{
										    		$('#grade').combobox('clear');
										    		$('#className').combobox({
										    			data: [],
													    loadFilter: function (data) {
													    	var d1 = [];
												    		var classData = {};
												    		classData.id = 0;
												    		classData.name = '请先选择年级';
												    		d1.push(classData);
													        return d1;
													    },
													    value: 0
													});
										    	}
											}">
	    </td>
	    <td >
			<span>班级:</span>
		    <input id="className" id="seedSearch" placeholder="请输入班级"  class="easyui-combobox"
		    					data-options="editable:false,
		                                    valueField:'id',
		                                    textField:'name',
		                                    panelHeight:'auto',
		                                    panelMaxHeight:200">
	    </td>
	    <td type>
			<span>学号:</span>
		    <input id="account" id="seedSearch" class="easyui-combobox" placeholde="请输入学生学号"
										data-options="
		                                    panelHeight:'auto',
		                                    panelMaxHeight:200">
	    </td> 
    </tr>
  </table>
   <a style="float:right;margin-right:5%;" class="easyui-linkbutton c1" iconCls="icon-search" onclick="doSearch()">查询</a>
</div>

<hr style="border:1px dotted;width:100%;margin-top:3%;">

<!--学生名单表格  -->
<table id="grid" style="width:100%; margin-top:50px;"></table>
<!--学生详情编辑窗口 -->
<div id="studentWin">
<iframe id="studentFrame" width="100%" height="95%" style="border-width:0px">
</iframe>
</div>

<script>
    var params = {
        id: '',
        mode: 'insert'
    };

    var grid = null;
    var studentWin = null;
    var basePath = '<%=basePath%>';
    
    
    $(document).ready(function () {
        //配置表格
        studentWin = $('#studentWin');
        grid = $('#grid').edatagrid({
            title: '学生名单',
            height: '420px',
            method: 'post',
            url: basePath + 'manage/adminQueryStuInfo',
            border: false,
            rownumbers: true,
            remoteSort: true,
            nowrap: false,
            singleSelect: true,
            fitColumns: true,
            pagination: true,
            striped: true,
            pagination: true,
            idField: "id",
            columns: [[
            	
                {field: 'account', title: '学号', width: 60, sortable: true, align: 'center', halign: 'center',
                	
                },
                {field: 'name', title: '姓名', width: 60, align: 'center', halign: 'center',
               },
                {
                    field: 'stuSex', title: '性别', width: 60, align: 'center', halign: 'center',
                    formatter: function (value, row) {
                    	if(value==true)
                        	return '男';
                    	else if(value==false)
                    		return '女';
                    }
                },
                {field: 'smallTargetCount', title: '已填写小目标数', width: 80, align: 'center', halign: 'center'  },
                {field: 'targetFeedbackCount', title: '已填写目标反馈数', width: 80, align: 'center', halign: 'center'}
            ]],
            queryParams: {
            	grade: 0,
            	classes: 0,
            	id: 0
        	},
            onSuccess: function (index, result) {
                $("#msgBox").text(result.msg);
                grid.datagrid("load");
            },
            onDestroy: function (index, result) {
                $("#msgBox").text(result.msg);
            }, 
            onLoadSuccess: function () {
            	var target = studentWin;
                target.window({
                    title: "学生详情信息",
                    width: '95%',
                    height: '100%',
                    collapsible: false,
                    minimizable: false,
                    maximizable: false,
                    modal: true,
                    iconCls: 'icon-edit',
                    closed: true,
                    cache: false, 
                });
            }, 
        });
        grid.datagrid("getPager").pagination({
            pageSize: 10,
            pageList: [10, 15, 20]
        });
    });

    function doSearch() {
        grid.datagrid("load", {
        	grade: $('#grade').combobox('getValue'),
        	classes: $('#className').combobox('getValue'),
        	account: $('#account').combobox('getValue')
        });
    }

   
    
    
    function addTab(title, url, parameter){
		if (parent.$('#menuTabs').tabs('exists', title)){
			parent.$('#menuTabs').tabs('select', title);
		} else {
			request( "POST",basePath+url,JSON.parse(parameter),addTabSuccess,serverError,true);
			function addTabSuccess(data) {
				var content = $('<iframe></iframe>',{
					srcdoc: data,
					scrolling: "auto",
					frameborder: "0",
					style: "width:100%;height:100%;"
				});
				parent.$('#menuTabs').tabs('add',{
					title:title,
					content: content,
					closable:true
				});
			}
		}
	}
    
</script>
</body>
</html>