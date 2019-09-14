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
		<title>就业方向图</title>
		<link href="<%=basePath%>css/main_base.css" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="<%=basePath%>easyui/themes/icon.css">
		<link rel="stylesheet" type="text/css" href="<%=basePath%>easyui/themes/color.css">
		<link rel="stylesheet" type="text/css" href="<%=basePath%>easyui/themes/default/easyui.css">
		<link rel="stylesheet" type="text/css" href="<%=basePath%>easyui/texteditor.css">
		<script type="text/javascript" src="<%=basePath%>easyui/jquery.min.js"></script>
		<script type="text/javascript" src="<%=basePath%>easyui/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="<%=basePath%>easyui/plugins/jquery.edatagrid.js"></script>
		<script type="text/javascript" src="<%=basePath%>easyui/locale/easyui-lang-zh_CN.js"></script>
		<script type="text/javascript" src="<%=basePath%>easyui/jquery.texteditor.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/echarts-all-3.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/echarts.min.js"></script>
	</head>
	<style>
		.column {
			position: relative;
			height: 23px;
			border-bottom: 1px solid #d4d4d4;
			margin-bottom: 10px
		}
		
		.column span.current {
			position: relative;
			top: 0px;
			display: inline-block;
			color: #1da02b;
			font-size: 12px;
			font-weight: bold;
			height: 22px;
			line-height: 22px;
			border-bottom: 2px solid #ff9d02
		}
	</style>

	<body>
		<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
		<div id="main" style="float:left;width: 600px;height:400px;"></div>
		<div id="main01" style="float:left;width: 600px;height:400px;"></div>

		<script type="text/javascript">
			// 基于准备好的dom，初始化echarts实例
			var myChart = echarts.init(document.getElementById('main'));
			var basePath = '<%=basePath%>';
			var json;
			$(document).ready(function () {
				var DataGraph = $.ajax({
					url : basePath+"manage/findAllEmployment",
					type : "post",
					async : false
				});
			json = DataGraph.responseJSON;
			// 指定图表的配置项和数据
			var option = {
				title: {
					text: '各年级目标分布情况',
					subtext: '',
					left: 'center'
				},
				tooltip: {
					trigger: 'item',
					formatter: "{a} <br/>{b} : {c} ({d}%)"
				},
				legend: {
					bottom: 10,
					left: 'center',
					data: ['考研', '考公务员', '签约就业','创业','出国留学','其它就业']
				},
				xAxis: {
					data: ["2016级", "2017级", "2018级"]
				},
				yAxis: {},
				series: [{
					name: '考研',
					type: 'bar',
					data: [json[0][0][1],json[1][0][1], json[2][0][1]]
				}, {
					name: '考公务员',
					type: 'bar',
					data: [json[0][1][1],json[1][1][1], json[2][1][1]]
				}, {
					name: '出国留学',
					type: 'bar',
					data: [json[0][2][1],json[1][2][1], json[2][2][1]]
				}, {
					name: '创业',
					type: 'bar',
					data: [json[0][3][1],json[1][3][1], json[2][3][1]]
				}, {
					name: '签约就业',
					type: 'bar',
					data: [json[0][4][1],json[1][4][1], json[2][4][1]]
				}, {
					name: '其它就业',
					type: 'bar',
					data: [json[0][5][1],json[1][5][1], json[2][5][1]]
				}]
			};
			myChart.setOption(option);
			
		});

			// 使用刚指定的配置项和数据显示图表。
			
		</script>
		<script type="text/javascript">
			var myChart01 = echarts.init(document.getElementById('main01'));
			var basePath = '<%=basePath%>';
			var json;
			$(document).ready(function () {
				var DataGraph = $.ajax({
					url : basePath+"manage/selectEmployment",
					type : "post",
					async : false
				});//得到某个学生当前学期的学期规划
				json = DataGraph.responseJSON;
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
							data: [json[0][0],json[1][0],json[2][0],json[3][0],json[4][0],json[5][0],json[6][0]]
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
								},
								{
									value:json[6][1],
									name: json[6][0]
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
				
			});
				
			
		</script>
	</body>

</html>