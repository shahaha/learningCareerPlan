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
		    <input id="classes" id="seedSearch" placeholder="必选"  class="easyui-combobox"
										data-options="editable:false,
											required:true,
		                                    valueField:'id',
		                                    textField:'name',
		                                    panelHeight:'auto',
		                                    url: '<%=basePath%>/classes/mngFdByteacher/${curter.account}'">
	    </td>
	    <td >
			<span>目标:</span>
		    <input id="target" id="seedSearch" placeholder="必选" class="easyui-combobox"
										data-options="editable:false,
											required:true,
		                                    valueField:'id',
		                                    textField:'targetCaption',
		                                    panelHeight:'auto',
		                                    panelMaxHeight:200,
		                                    url: '<%=basePath%>/assist/targetList'">
	    </td>
	    <td >
			<span>状态:</span>
		    <input id="tremState" id="seedSearch" placeholder="必选" class="easyui-combobox"
										data-options="editable:false,
											required:true,
		                                    valueField:'id',
		                                    textField:'stateDes',
		                                    panelHeight:'auto',
		                                    panelMaxHeight:200,
		                                    url: '<%=basePath%>/assist/stateList'">
	    </td> 
	    </tr>
   </table>
   <a style="float:right;margin-right:5%;" class="easyui-linkbutton c1" iconCls="icon-search" onclick="doSearch()">查询</a>
</div>

<hr style="border:1px dotted;width:100%;margin-top:3%;">

<!--种子清单表格  -->
<table id="grid" style="width:100%;margin-top:50px;"></table>
<!-- 成长阶段的编辑窗口 -->
<div id="growStagesWin">
<iframe id="growStagesFrame" width="100%" height="100%" scrolling="no" style="border-width:0px">
</iframe>
</div>

<script>
    var params = {
        id: '',
        mode: 'insert'
    };

    var grid = null;
    var growStagesWin = null;
    $(document).ready(function () {
    	
    	console.log("${curter}");
    	
    	var htmlObj = $.ajax({
			url : "<%=basePath%>/teacher/terQueryStuList",
			type : "post",
			async : false
		});//得到用户背包
		var json = htmlObj.responseJSON;
		//var json = JSON.parse(text);//购买在包袱的所有种子
		
		console.log(json);
    	
        //配置表格
        growStagesWin = $('#growStagesWin');
        grid = $('#grid').edatagrid({
            title: '学生名单',
            height: '640px',
            fitColumns: true,
            method: 'post',
            url: '<%=basePath%>/teacher/terQueryStuList',
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
            pageSize: 10,
            pageList: [1, 5, 10, 15, 20, 25],
            idField: "id",
            columns: [[
                {field: 'account', title: '学号', width: 70, sortable: true, align: 'center', halign: 'center'},
                {field: 'name', title: '姓名', width: 80, align: 'center', halign: 'center'},
                {
                    field: 'stuSex', title: '性别', width: 80, align: 'center', halign: 'center'
                },
                {
                    field: 'collegeId', title: '学校', width: 100, align: 'center', halign: 'center'
                },
                {
                    field: 'classId', title: '班级', width: 80, align: 'center', halign: 'center'
                },
                {field: 'grade', title: '年级', width: 100, align: 'center', halign: 'center'},
                {field: 'profsId', title: '专业', width: 100, align: 'center', halign: 'center'},
                {
                    field: 'opt', title: '操作', width: 100, align: 'center',
                    formatter: function (value, rec) {
                        var btn = '<a name="opera" onclick="drawGrowStagesGrid('+ rec.id+')" class="op-linkbutton"' +
                            ' style="background:#8DB6CD" href="javascript:void(0)">详情</a>';
                        return btn;
                    }
                }
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
            }, 
            onLoadSuccess: function () {
            	var target = growStagesWin;
                target.window({
                    title: "编辑成长阶段",
                    width: '68%',
                    height: 500,
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
    });

    function doSearch() {
        grid.datagrid("load", {
        	classes: $('#classes').val(),
        	target: $('#target').val(),
        	tremState: $('#tremState').val()
        });
    }

    function loadForm() {
        var row = grid.datagrid('getSelected');
        if (row) {
            params.id = row.id;
            params.mode = 'edit';
            $('#seedFormContainer').dialog('open').dialog('setTitle', '编辑数据');
            $('#formSeed').form('load', row);
        } else {
            alert("请先选择一行数据，然后再尝试点击操作按钮！");
        }
    }

    function addForm() {
        $('#formSeed').form('reset');
        $('#seedFormContainer').dialog({
            onClose: function () {grid.datagrid('reload');}
        }).dialog('open').dialog('setTitle', '添加数据');
    }

    function drawGrowStagesGrid(seedId) {
        var target = growStagesWin;
        
        console.log(seedId);
        var path = "<%=basePath%>/growStage?seedId=" + seedId;
        $('#growStagesFrame').attr('src', path);
        target &&  target.window('open');
    }

    function saveForm() {
        $('#formSeed').form('submit', {
            url: '<%=basePath%>/createSeed.do',
            onSubmit: function (param) {
                console.log(param);
                param.mode = params.mode;
                return $(this).form('validate');
            },
            success: function (result) {
            	if(typeof(result) !== "object"){
                 var result = JSON.parse(result);
            	}
                if (result.code == 200) {
                    $('#seedFormContainer').dialog('close');
                    grid.datagrid('reload');
                }
                $.messager.show({
                    title: "消息",
                    msg: result.msg
                });
            }
        });
    }
</script>
</body>
</html>