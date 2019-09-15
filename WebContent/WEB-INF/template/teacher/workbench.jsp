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
		<title>工作台</title>
		<link href="<%=basePath%>css/main_base.css" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="<%=basePath%>easyui/themes/default/easyui.css">
		<link rel="stylesheet" href="<%=basePath%>css/workbench.css">
		<script type="text/javascript" src="<%=basePath%>easyui/jquery.min.js"></script>
		<script type="text/javascript" src="<%=basePath%>easyui/jquery.easyui.min.js"></script>
		<!-- <script type="text/javascript" src="js/menu.js"></script> -->
		<script type="text/javascript" src="<%=basePath%>easyui/echarts-all.js"></script>
	</head>

	<body>
		<div class="container">
			<div id="hd">

			</div>

			<div id="bd">
				<div class="bd-content">
					<div class="right-zone">
						<div class="inform item-box">
							<div class="inform-hd">
								<label>通知公告</label>
								<a href="javascript:;">更多<span>&gt;</span></a>
							</div>
							<ul>
								<li>
									<span></span>
									<a href="javascript:;" class="ellipsis">版本发布<i></i></a>
									<label>09-13</label>
								</li>
								<li>
									<span></span>
									<a href="javascript:;" class="ellipsis">版本更新<i></i></a>
									<label>09-12</label>
								</li>
								<li>
									<span></span>
									<a href="javascript:;" class="ellipsis">bug修复</a>
									<label>09-11</label>
								</li>
								<li>
									<span></span>
									<a href="javascript:;" class="ellipsis">UAT更新</a>
									<label>09-10</label>
								</li>
							</ul>
						</div>

						<div class="attached item-box">
							<div class="inform-hd">
								<label>常用附件下载</label>
								<a href="javascript:;">更多<span>&gt;</span></a>
							</div>
							<div class="attached-tab">
								<a href="javascript:;" class="current item-left" attached="public-attached">公开附件</a>
								<a href="javascript:;" class="item-right" attached="inner-attached">内部附件</a>
							</div>
							<ul class="public-attached">
								<li>
									<span></span>
									<a href="javascript:;" class="ellipsis">日常模板下载</a>
								</li>
								<li>
									<span></span>
									<a href="javascript:;" class="ellipsis">填写规范</a>
								</li>
								<li>
									<span></span>
									<a href="javascript:;" class="ellipsis">操作手册</a>
								</li>
								<li>
									<span></span>
									<a href="javascript:;" class="ellipsis">特殊说明</a>
								</li>
							</ul>
							<ul class="inner-attached hide">
								<li>
									<span></span>
									<a href="javascript:;" class="ellipsis">意见建议反馈内容模版</a>
								</li>
								<li>
									<span></span>
									<a href="javascript:;" class="ellipsis">成绩说明</a>
								</li>
								<li>
									<span></span>
									<a href="javascript:;" class="ellipsis">学院职业规划分布情况</a>
								</li>
							</ul>
						</div>
					</div>
					<div class="center-part">
						<div class="center-items todo">
							<div class="calendar-part">
								<div class="easyui-calendar" style="width:205px;height:231px;"></div>
							</div>
							<ul class="work-items clearfix">
								<li>
									<div class="work-inner">
										<div class="work-item green">
											<i class="iconfont">&#xe61f;</i>
											<span class="num">&nbsp;<span class="unit"></span></span>
											<label></label>
										</div>
									</div>
								</li>
								<li>
									<div class="work-inner">
										<div class="work-item red">
											<i class="iconfont">&#xe622;</i>
											<span class="num">&nbsp;<span class="unit"></span></span>
											<label></label>
										</div>
									</div>
								</li>
								<li>
                                <div class="work-inner">
                                    <div class="work-item yellow">
                                         <i class="iconfont">&#xe61d;</i>
                                        <span class="num">&nbsp;<span class="unit"></span></span>
                                        <label></label>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="work-inner">
                                    <div class="work-item blue">
                                         <i class="iconfont">&#xe621;</i>
                                        <span title="2000,00万" class="num">&nbsp;<span class="unit"></span></span>
                                        <label></label>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="work-inner">
                                    <div class="work-item purple">
                                         <i class="iconfont">&#xe61e;</i>
                                        <span title="2000,00万" class="num">&nbsp;<span class="unit"></span></span>
                                        <label></label>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="work-inner">
                                    <div class="work-item gray">
                                         <i class="iconfont">&#xe620;</i>
                                        <span class="num">&nbsp;<span class="unit"></span></span>
                                        <label></label>
                                    </div>
                                </div>
                            </li>
							</ul>
						</div>
						<div class="center-items chart1">
							<div class="chart1-inner">
								<div class="item-hd">班内目标趋势</div>
								<div class="chart1-chart" id="chart3"></div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div id="ft"></div>
		</div>
		<div class="todo-panel">
			<div class="todo-title">
				<i class="iconfont">&#xe61f;</i>
				<span class="num">14&nbsp;<span class="unit">个</span></span>
				<label>待办未处理</label>
			</div>
			<div class="todo-items">
				<ul>
					<li>
						<span></span>
						<a href="javascript:;" class="ellipsis">您有<span>2条</span>供应商开发申请未处理<i></i></a>
						<label>04-13</label>
					</li>
					<li>
						<span></span>
						<a href="javascript:;" class="ellipsis">您有<span>10条</span>供应商开发申请未处理<i></i></a>
						</a>
						<label>04-13</label>
					</li>
					<li>
						<span></span>
						<a href="javascript:;" class="ellipsis">您有<span>0条</span>供应商开发申请未处理，请及时审批<i></i></a>
						</a>
						<label>04-13</label>
					</li>
					<li>
						<span></span>
						<a href="javascript:;" class="ellipsis">您有<span>1条</span>供应商开发申请未处理，请及时审批</a>
						</a>
						<label>04-13</label>
					</li>
					<li>
						<span></span>
						<a href="javascript:;" class="ellipsis">您有<span>4条</span>供应商开发申请未处理，请及时审批</a>
						</a>
						<label>04-13</label>
					</li>
					<li>
						<span></span>
						<a href="javascript:;" class="ellipsis">您有<span>6条</span>供应商开发申请未处理，请及时审批，未处理会导致失效</a>
						</a>
						<label>04-13</label>
					</li>
					<li>
						<span></span>
						<a href="javascript:;" class="ellipsis">您有<span>2条</span>供应商开发申请未处理，请及时审批，未处理会导致失效</a>
						</a>
						<label>04-13</label>
					</li>
					<li>
						<span></span>
						<a href="javascript:;" class="ellipsis">您有<span>2条</span>供应商开发申请未处理，请及时审批，未处理会导致失效</a>
						</a>
						<label>04-13</label>
					</li>
					<li>
						<span></span>
						<a href="javascript:;" class="ellipsis">您有<span>2条</span>供应商开发申请未处理，请及时审批，未处理</a>
						</a>
						<label>04-13</label>
					</li>
					<li>
						<span></span>
						<a href="javascript:;" class="ellipsis">您有<span>2条</span>供应商开发申请未处理，请及时审批，未处理会导致失效</a>
						</a>
						<label>04-13</label>
					</li>
					<li>
						<span></span>
						<a href="javascript:;" class="ellipsis">您有<span>2条</span>供应商开发申请未处理，未处理会导致失效</a>
						</a>
						<label>04-13</label>
					</li>
					<li>
						<span></span>
						<a href="javascript:;" class="ellipsis">您有<span>2条</span>开发申请未处理，请及时审批，未处理会导致失效</a>
						</a>
						<label>04-13</label>
					</li>
					<li>
						<span></span>
						<a href="javascript:;" class="ellipsis">您有<span>2条</span>供应商开发申请未处理，请及时审批，未处理会导致失效</a>
						</a>
						<label>04-13</label>
					</li>
					<li>
						<span></span>
						<a href="javascript:;" class="ellipsis">您有<span>2条</span>供应商开发申请未处理，请及时审批，会导致失效</a>
						</a>
						<label>04-13</label>
					</li>
					<li>
						<span></span>
						<a href="javascript:;" class="ellipsis">您有<span>2条</span>供应商开发申请未处理，请及时审批，未处理</a>
						</a>
						<label>04-13</label>
					</li>
					<li>
						<span></span>
						<a href="javascript:;" class="ellipsis">您有<span>2条</span>供应商开发申请未处理，请及时审批</a>
						</a>
						<label>04-13</label>
					</li>
				</ul>
			</div>

		</div>
		

		<script type="text/javascript">
			//chart0

			$(document).ready(function() {
				var option0 = {
					tooltip: {
						trigger: 'item',
						formatter: "{a} <br/>{b} : {c} ({d}%)"
					},
					legend: {
						orient: 'vertical',
						x: 'left',
						data: ['直接访问', '邮件营销', '联盟广告', '视频广告', '搜索引擎'],
						show: false
					},
					toolbox: {
						show: false,
						feature: {
							mark: {
								show: true
							},
							dataView: {
								show: true,
								readOnly: false
							},
							magicType: {
								show: true,
								type: ['pie', 'funnel'],
								option: {
									funnel: {
										x: '25%',
										width: '50%',
										funnelAlign: 'center',
										max: 1548
									}
								}
							},
							restore: {
								show: true
							},
							saveAsImage: {
								show: true
							}
						}
					},
					calculable: true,
					series: [{
						name: '访问来源',
						type: 'pie',
						radius: ['50%', '70%'],
						itemStyle: {
							normal: {
								label: {
									show: false
								},
								labelLine: {
									show: false
								}
							},
							emphasis: {
								label: {
									show: true,
									position: 'center',
									textStyle: {
										fontSize: '30',
										fontWeight: 'bold'
									}
								}
							}
						},
						data: [{
								value: 335,
								name: '直接访问'
							},
							{
								value: 310,
								name: '邮件营销'
							},
							{
								value: 234,
								name: '联盟广告'
							},
							{
								value: 135,
								name: '视频广告'
							},
							{
								value: 1548,
								name: '搜索引擎'
							}
						]
					}]
				};

				var myChart0 = echarts.init(document.getElementById('chart0'));
				myChart0.setOption(option0);

				//chart1
				var option1 = {
					tooltip: {
						trigger: 'axis'
					},
					legend: {
						data: ['邮件营销', '联盟广告', '视频广告', '直接访问', '搜索引擎'],
						show: false
					},
					toolbox: {
						show: false,
						feature: {
							mark: {
								show: true
							},
							dataView: {
								show: true,
								readOnly: false
							},
							magicType: {
								show: true,
								type: ['line', 'bar', 'stack', 'tiled']
							},
							restore: {
								show: true
							},
							saveAsImage: {
								show: true
							}
						}
					},
					calculable: true,
					xAxis: [{
						type: 'category',
						boundaryGap: false,
						data: ['第一周', '第二周', '第三周', '第四周', '第五周', '第六周', '第七周']
					}],
					yAxis: [{
						type: 'value'
					}],
					series: [{
							name: '邮件营销',
							type: 'line',
							stack: '总量',
							data: [120, 132, 101, 134, 90, 230, 210]
						},
						{
							name: '联盟广告',
							type: 'line',
							stack: '总量',
							data: [220, 182, 191, 234, 290, 330, 310]
						},
						{
							name: '视频广告',
							type: 'line',
							stack: '总量',
							data: [150, 232, 201, 154, 190, 330, 410]
						},
						{
							name: '直接访问',
							type: 'line',
							stack: '总量',
							data: [320, 332, 301, 334, 390, 330, 320]
						},
						{
							name: '搜索引擎',
							type: 'line',
							stack: '总量',
							data: [820, 932, 901, 934, 1290, 1330, 1320]
						}
					]
				};
				var myChart1 = echarts.init(document.getElementById('chart1'));
				myChart1.setOption(option1);

				var option3 = {
					tooltip: {
						trigger: 'axis'
					},
					legend: {
						data: ['蒸发量'],
						show: false
					},
					toolbox: {
						show: false,
						feature: {
							mark: {
								show: true
							},
							dataView: {
								show: true,
								readOnly: false
							},
							magicType: {
								show: true,
								type: ['line', 'bar']
							},
							restore: {
								show: true
							},
							saveAsImage: {
								show: true
							}
						}
					},
					calculable: true,
					xAxis: [{
						type: 'category',
						data: ['采购组织', '供应商', '新物料', 'uimaker', '信息管理', '业务系统', '采购商']
					}],
					yAxis: [{
						type: 'value'
					}],
					series: [{
						name: '蒸发量',
						type: 'bar',
						data: [60, 45, 73, 23, 37, 48, 18],
						markPoint: {
							data: [{
									type: 'max',
									name: '最大值'
								},
								{
									type: 'min',
									name: '最小值'
								}
							]
						},
						markLine: {
							data: [{
								type: 'average',
								name: '平均值'
							}]
						}
					}]
				};

				var myChart3 = echarts.init(document.getElementById('chart3'));
				myChart3.setOption(option3);

				//我的待办点击事件
				$(document).on('click', '.work-item.green', function(event) {
					var width = (2 * $(this).width()) + 10;
					$(".todo-panel").width(width - 2).css({
						top: $(this).offset().top,
						left: $(this).offset().left
					}).show();
					event.stopPropagation();
				});
				$(".todo-panel").click(function() {
					event.stopPropagation();
				});
				$(document).click(function() {
					$(".todo-panel").hide();
				});

			});

			//公开附件tab事件处理
			$(".attached-tab").on("click", "a", function() {
				$(this).closest(".attached-tab").find("a").removeClass("current");
				$(this).addClass("current");
				$(this).closest(".attached").find("ul").addClass("hide");
				$(this).closest(".attached").find("ul." + $(this).attr("attached")).removeClass("hide");
			})
		</script>
	</body>

</html>