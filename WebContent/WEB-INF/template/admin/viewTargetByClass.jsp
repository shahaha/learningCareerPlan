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
<link rel="stylesheet" type="text/css" href="<%=basePath%>easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>easyui/themes/color.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>easyui/themes/default/easyui.css">
<script type="text/javascript" src="<%=basePath%>easyui/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/main.js"></script>
<script type="text/javascript" src="<%=basePath%>easyui/plugins/jquery.edatagrid.js"></script>
<script type="text/javascript" src="<%=basePath%>easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=basePath%>easyui/plugins/jquery.edatagrid.js"></script>
<script type="text/javascript" src="<%=basePath%>easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=basePath%>easyui/jquery.texteditor.js"></script>
<script type="text/javascript" src="<%=basePath%>js/echarts-all-3.js"></script>
<script type="text/javascript" src="<%=basePath%>js/echarts.min.js"></script>


<style type="text/css">

.search
{
	margin: 30px 30px 30px 90px;
}
</style>
</head>
<body>
<div  class="search" >选择要查看的班级: <span style="margin:0px 5px 0px 5px">
			<input id="curClass" class="easyui-combobox" name="curClass" 
											data-options="
											width:200,
											editable:false,
											required:true,
											url:'<%=basePath%>/classes/fdAll',
		                                    valueField:'id',
		                                    textField:'name',
		                                    panelHeight:'auto',
		                                    panelMaxHeight:200,
		                                    value: '电信161',
		                                    onSelect: changeClass" /></span></div>
			
		     <div id="main01" style="float:left;width: 600px;height:400px;"></div>       
		    
<script  type="text/javascript">
	var myChart01 = echarts.init(document.getElementById('main01'));
	var basePath = '<%=basePath%>';
	$(document).ready(function () {
		var requestParam = {
			"findClass": '软件171'
		};
		request("POST",basePath+"manage/selectEmploymentByClass",requestParam,showChart,serverError,true);
	});
	function changeClass(rec){
		//console.log(rec);
		var requestParam = {
				"findClass": rec.name
			};
		
		request("POST",basePath+"manage/selectEmploymentByClass",requestParam,showChart,serverError,true);
	}
	
	function showChart(json) {
		var option01 = {
				title: {
					text: '全学院目标分布情况',
					subtext: '',
					left: 'center'
				},
				tooltip: {
					trigger: 'item',
					formatter: "{a} <br/>{b} : {c} ({d}%)"
				},
				legend: {
					// orient: 'vertical',
					// top: 'middle',
					bottom: 10,
					left: 'center',
					data: [json[0][0],json[1][0],json[2][0],json[3][0],json[4][0],json[5][0]]
				},
				series: [{
					name: '占比',
					type: 'pie',
					radius: '65%',
					center: ['50%', '50%'],
					selectedMode: 'single',
					data: [{
							value: json[0][1],
							name: json[0][0]
						},
						{
							value: json[1][1],
							name: json[1][0]
						},
						{
							value: json[2][1],
							name: json[2][0]
						},
						{
							value: json[3][1],
							name: json[3][0]
						},
						{
							value: json[4][1],
							name: json[4][0]
						},
						{
							value: json[5][1],
							name: json[5][0]
						}
					],
					itemStyle: {
						emphasis: {
							shadowBlur: 10,
							shadowOffsetX: 0,
							shadowColor: 'rgba(0, 0, 0, 0.5)'
						}
					}
				}]
			};
		myChart01.setOption(option01);
	}
</script>

</body>
</html>

