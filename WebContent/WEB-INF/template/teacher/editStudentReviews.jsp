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
<title>学生名单</title>
<script type="text/javascript" src="<%=basePath%>js/main.js"></script>
<script type="text/javascript" src="<%=basePath%>easyui/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=basePath%>easyui/plugins/jquery.edatagrid.js"></script>
<script type="text/javascript" src="<%=basePath%>easyui/locale/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet" type="text/css" href="<%=basePath%>easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>easyui/themes/color.css">

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
			<span>班级:</span>
		    <input id="classes" placeholder="必选"  class="easyui-combobox"
										data-options="editable:false,
											required:true,
		                                    valueField:'id',
		                                    textField:'name',
		                                    panelHeight:'auto',
		                                    panelMaxHeight:200,
		                                    url: '<%=basePath%>/classes/findByTeacher?id=${curter.id}',
		                                    loadFilter: function (data) {
										        var obj = {};
										        obj.id = 0;
										        obj.name = '请选择'
										        //在数组0位置插入obj,不删除原来的元素
										        data.splice(0, 0, obj)
										        return data;
										    },
											value: 0,
		                                    onSelect: function(rec){
										    	if(rec.id != 0){
										    		var targetUrl = '<%=basePath%>/assist/targetList';
										    		$('#target').combobox({
													    url: targetUrl,
													    loadFilter: function (data) {
													        var obj = {};
													        obj.id = 0;
													        obj.targetCaption = '请选择'
													        //在数组0位置插入obj,不删除原来的元素
													        data.splice(0, 0, obj)
													        return data;
													    },
													    value: 0
													});
												    var stateUrl = '<%=basePath%>/assist/stateList';
												    $('#tremState').combobox({
													    url: stateUrl,
													    loadFilter: function (data) {
													        var obj = {};
													        obj.id = 0;
													        obj.stateDes = '请选择'
													        //在数组0位置插入obj,不删除原来的元素
													        data.splice(0, 0, obj)
													        return data;
													    },
													    value: 0
													});
										    	}else{
										    		$('#target').combobox('clear');
										    		$('#tremState').combobox('clear');
										    		$('#target').combobox({
										    			data: [],
													    loadFilter: function (data) {
													    	var d1 = [];
												    		var targetData = {};
												    		targetData.id = 0;
												    		targetData.targetCaption = '请先选择班级';
												    		d1.push(targetData);
													        return d1;
													    },
													    value: 0
													});
													$('#tremState').combobox({
														data: [],
													    loadFilter: function (data) {
													    	var d2 = [];
												    		var stateData = {};
												    		stateData.id = 0;
												    		stateData.stateDes = '请先选择班级';
												    		d2.push(stateData);
													        return d2;
													    },
													    value: 0
													});
										    	}
											}">
	    </td>
	    <td >
			<span>目标:</span>
		    <input id="target" id="seedSearch" class="easyui-combobox"
		    					data-options="editable:false,
		                                    valueField:'id',
		                                    textField:'targetCaption',
		                                    panelHeight:'auto',
		                                    panelMaxHeight:200">
	    </td>
	    <td >
			<span>状态:</span>
		    <input id="tremState" id="seedSearch" class="easyui-combobox"
										data-options="editable:false,
		                                    valueField:'id',
		                                    textField:'stateDes',
		                                    panelHeight:'auto',
		                                    panelMaxHeight:200">
	    </td> 
    </tr>
  </table>
   <a style="float:right;margin-right:5%;" class="easyui-linkbutton c1" iconCls="icon-search" onclick="doSearch()">查询</a>
</div>

<hr style="border:1px dotted;width:100%;margin-top:3%;">

<!--学生名单表格  -->
<table id="grid" style="width:100%;margin-top:50px;"></table>
<!--学生详情编辑窗口 -->
<div id="studentWin">
<iframe id="studentFrame" width="100%" height="100%" scrolling="no" style="border-width:0px">
</iframe>
</div>

<script>
    var params = {
        id: '',
        mode: 'insert'
    };

    var grid = null;
    var studentWin = null;
    
    
    
    $(document).ready(function () {
        //配置表格
        studentWin = $('#studentWin');
        grid = $('#grid').edatagrid({
            title: '学生名单',
            height: '640px',
            method: 'post',
            url: '<%=basePath%>teacher/terQueryStuList',
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
                {field: 'account', title: '学号', width: 70, sortable: true, align: 'center', halign: 'center'},
                {field: 'name', title: '姓名', width: 80, align: 'center', halign: 'center'},
                {
                    field: 'stuSex', title: '性别', width: 80, align: 'center', halign: 'center',
                    formatter: function (value, row) {
                    	if(value==true)
                        	return '男';
                    	else if(value==false)
                    		return '女';
                    }
                },
                {
                    field: 'college', title: '学校', width: 100, align: 'center', halign: 'center',
                    formatter: function (obj, row) {
                        return obj.collegeName;
                    }
                },
                {
                    field: 'classes', title: '班级', width: 80, align: 'center', halign: 'center',
                    formatter: function (obj, row) {
                        return obj.name+'班';
                    }
                },
                {
                    field: 'opt', title: '操作', width: 100, align: 'center',
                    formatter: function (value, rec) {
                        var btn = '<a id="opera" name="opera" onclick="drawGrowStagesGrid('+ rec.id+')" class="op-linkbutton"' +
                            ' style="background:#8DB6CD" href="javascript:void(0)">详情</a>';
                        return btn;
                    }
                }
            ]],
            queryParams: {
            	/* classes: $('#classes').combobox('getValue'),
            	target: $('#target').combobox('getValue'),
            	tremState: $('#tremState').combobox('getValue') */
            	classes: 0,
            	target: 0,
            	tremState: 0
        	},
            onSuccess: function (index, result) {
                console.log(result);
                $("#msgBox").text(result.msg);
                grid.datagrid("load");
            },
            onDestroy: function (index, result) {
                console.log(result);
                $("#msgBox").text(result.msg);
            }, 
            onLoadSuccess: function () {
            	var target = studentWin;
                target.window({
                    title: "学生详情信息",
                    width: '85%',
                    height: 600,
                    collapsible: false,
                    minimizable: false,
                    maximizable: false,
                    modal: true,
                    iconCls: 'icon-edit',
                    closed: true,
                    closable: true,
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
    	console.log($('#classes').combobox('getValue'));
        grid.datagrid("load", {
        	classes: $('#classes').combobox('getValue'),
        	target: $('#target').combobox('getValue'),
        	tremState: $('#tremState').combobox('getValue')
        });
    }

    function drawGrowStagesGrid(rowId) {
        var target = studentWin;
        var path = "<%=basePath%>student/viewStudent/"+ rowId;
        $('#studentFrame').attr('src', path);
        target &&  target.window('open');
    }
    
    
</script>
</body>
</html>