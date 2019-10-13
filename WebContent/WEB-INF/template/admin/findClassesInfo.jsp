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
			<span>专业:</span>
		    <input id="profession" placeholder="必选"  class="easyui-combobox"
										data-options="editable:false,
		                                    valueField:'id',
		                                    textField:'profsName',
		                                    panelHeight:'auto',
		                                    panelMaxHeight:200,
		                                    url: '<%=basePath%>/assist/professionList',
		                                    loadFilter: function (data) {
										        var obj = {};
										        obj.id = 0;
										        obj.profsName = '请选择'
										        //在数组0位置插入obj,不删除原来的元素
										        data.splice(0, 0, obj)
										        return data;
										    },
		
		                                    onSelect: function(rec){
		                                    
		                                          var gradeUrl = '<%=basePath%>/classes/findGrade?profsName=';
										    		$('#grade').combobox({
													    url: gradeUrl+rec.profsName,
													    loadFilter: function (data) {
													        var obj = {};
													        obj.id = 0;
													        obj.grade = '请选择年级'
													        //在数组0位置插入obj,不删除原来的元素
													        data.splice(0, 0, obj)
													        return data;
													    },
													});
											}">
	    </td>
	    <td >
			<span>年级:</span>
		    <input id="grade" id="seedSearch" class="easyui-combobox" placeholder="请选择" 
		    					data-options="editable:false,
		                                    valueField:'id',
		                                    textField:'grade',
		                                    panelHeight:'auto',
		                                    panelMaxHeight:200,
		                                    
		                                    onSelect:function(rec){
		                                       if(rec.id != 0){	
												    var classesUrl = '<%=basePath%>/classes/fdByProfsAdGrade?profsName=';
												    $('#classes').combobox({
													    url: classesUrl+$('#profession').combobox('getText')+'&grade='+rec.grade,
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
										    		$('#classes').combobox({
										    			data: [],
													    loadFilter: function (data) {
													    	var d1 = [];
												    		var classes = {};
												    		classes.id = 0;
												    		classes.name = '请先选择专业或班级';
												    		d1.push(classes);
													        return d1;
													    },
													    value: 0
													});
										    	}
		                                    }">
	    </td>
	    <td >
			<span>班级:</span>
		    <input id="classes" id="seedSearch" class="easyui-combobox"
										data-options="editable:false,
		                                    valueField:'id',
		                                    textField:'name',
		                                    panelHeight:'auto',
		                                    panelMaxHeight:200">
	    </td> 
    </tr>
  </table>
   <a style="float:right;margin-right:5%;" class="easyui-linkbutton c1" iconCls="icon-search" onclick="doSearch()">查询</a>
</div>

<hr style="border:1px dotted;width:100%;margin-top:3%;">

<!--班级名单表格  -->
<table id="grid" style="width:100%;margin-top:50px;"></table>
<!--班级详情编辑窗口 -->
<div id="classesWin">
<iframe id="classesFrame" width="100%" height="95%" style="border-width:0px">
</iframe>
</div>

<script>
    var params = {
        id: '',
        mode: 'insert'
    };

    var grid = null;
    var classesWin = null;
    var basePath = '<%=basePath%>';
    
    
    $(document).ready(function () {
        //配置表格
        classesWin = $('classesWin');
        grid = $('#grid').edatagrid({
            title: '班级名单',
            height: '420px',
            method: 'post',
            url: basePath + 'manage/viewClassesCondition',
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
                {field: 'name', title: '班级名称', width: 70, sortable: true, align: 'center', halign: 'center'}, 
                {
                    field: 'teacher', title: '班主任', width: 80, align: 'center', halign: 'center',
                    formatter: function (obj, row) {
                        return obj.name
                    }
                },
                {
                    field: 'opt', title: '操作', width: 100, align: 'center',
                    formatter: function (value, rec) {
                        var btn =  "<a onclick='addTab(\""+rec.name+"班填写详情\",\"manage/adminQueryTeaInfo\",\"{\\\"classId\\\":"+rec.id+"}\")' " +
                        "class='op-linkbutton' data-options='plain:true' style='background:#8DB6CD;border-radius: 5px;' href='javascript:void(0)'>班级填写详情</a>";
                        return btn;
                    }
                }
            ]],
            queryParams: {
            	profession: 0,
            	grade: 0,
            	classes: 0
        	},
            onSuccess: function (index, result) {
                $("#msgBox").text(result.msg);
                grid.datagrid("load");
            },
            onDestroy: function (index, result) {
                $("#msgBox").text(result.msg);
            }, 
            onLoadSuccess: function () {
            	var target = classesWin;
                target.window({
                    title: "班级详情信息",
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
        	profession: $('#profession').combobox('getValue'),
        	grade: $('#grade').combobox('getText'),
        	classes: $('#classes').combobox('getValue')
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