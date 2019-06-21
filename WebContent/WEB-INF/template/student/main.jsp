<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
    <link rel="icon" href="<%=basePath%>/images/school.png"
	type="image/x-icon" />
    <title>学生学习规划系统</title> 
	<link href="<%=basePath%>css/main_base.css" rel="stylesheet">
	<link href="<%=basePath%>css/platform.css" rel="stylesheet">
	<script type="text/javascript" src="<%=basePath%>js/main.js"></script>
	<script type="text/javascript" src="<%=basePath%>easyui/jquery.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>easyui/plugins/jquery.edatagrid.js"></script>
	<script type="text/javascript" src="<%=basePath%>easyui/locale/easyui-lang-zh_CN.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>easyui/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>easyui/themes/color.css">
</head>

<style>
#pf-hd {
    background: url('<%=basePath%>images/main/xg_left.png?1464005190') left center no-repeat, url('<%=basePath%>images/main/xg_right.png?1464005212') right center no-repeat, url('<%=basePath%>images/main/top_bottombg.png?1464006836') left bottom repeat-x;
}
#pf-hd .pf-user:hover {
    background: url('<%=basePath%>images/main/top_userbg.png?1464007598');
}
#pf-bd #pf-sider .pf-model-name .toggle-icon {
    background: url(<%=basePath%>images/main/sider-toggle.png) no-repeat;
}
#pf-bd #pf-sider .sider-nav > li .sider-nav-s a {
    background: url('<%=basePath%>images/main/left_list.png?1463555463') no-repeat 30px center;
}
#pf-bd #pf-page .easyui-tabs1 .tabs li a.tabs-close {
    background: url('<%=basePath%>images/main/tabs_close_pf.png?1464531592')
}

#pf-bd #pf-page .easyui-tabs1 .tabs li:hover a.tabs-close {
    background: url('<%=basePath%>images/main/tabs_close_hover.png?1464355659')
}

</style>

<body>
    <div class="container">
        <div id="pf-hd">
			<div class="pf-term">
				<i class="iconfont term-icon">&#xe653;</i>
                <span class="pf-term-name">当前为第&nbsp;6&nbsp;学期</span>
			</div>
			
            <div class="pf-user">
                <div class="pf-user-photo">
                    <img src="<%=basePath%>images/user.png" alt="me">
                </div>
                <h4 class="pf-user-name ellipsis">${curUser.name }</h4>
                <i class="iconfont xiala">&#xe607;</i>

                <div class="pf-user-panel">
                    <ul class="pf-user-opt">
                        <li class="pf-info-item">
                            <a onclick="addTab('用户信息','person_info.html')">
                                <i class="iconfont">&#xe60d;</i>
                                <span class="pf-opt-name">用户信息</span>
                            </a>
                        </li>
                        <li class="pf-modify-pwd">
                            <a onclick="addTab('修改密码','modify.html')">
                                <i class="iconfont">&#xe634;</i>
                                <span class="pf-opt-name">修改密码</span>
                            </a>
                        </li>
                        <li class="pf-logout">
                            <a href="logoutAction">
                                <i class="iconfont">&#xe680;</i>
                                <span class="pf-opt-name">退出</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

        <div id="pf-bd">
            <div id="pf-sider">
                <h2 class="pf-model-name">
                    <span class="iconfont">&#xe65e;</span>
                    <span class="pf-name">菜单管理</span>
                    <span class="toggle-icon"></span>
                </h2>

                <ul class="sider-nav">
                     <li class="current">
                        <a onclick="addTab('学生信息录入','basic_info.jsp?${curUser.account}')">
                            <span class="iconfont sider-nav-icon">&#xe620;</span>
                            <span class="sider-nav-title" style="cursor:pointer;">学生信息录入</span>
                            <i class="iconfont">&#xe642;</i>
                        </a>
                     </li>
                     <li>
                        <a onclick="addTab('学习规划录入','http://jquery.com/')">
                            <span class="iconfont sider-nav-icon">&#xe6db;</span>
                            <span class="sider-nav-title" style="cursor:pointer;">学习规划录入</span>
                            <i class="iconfont">&#xe642;</i>
                        </a>
                     </li>
                     <li>
                        <a onclick="addTab('评语查看','http://jquery.com/')">
                            <span class="iconfont sider-nav-icon">&#xe6c2;</span>
                            <span class="sider-nav-title" style="cursor:pointer;">评语查看</span>
                            <i class="iconfont">&#xe642;</i>
                        </a>
                     </li>
                     <li>
                        <a>
                            <span class="iconfont sider-nav-icon">&#xe651;</span>
                            <span class="sider-nav-title" style="cursor:pointer;">信息打印</span>
                            <i class="iconfont">&#xe642;</i>
                        </a>
                        <ul class="sider-nav-s">
                           <li class="active"><a style="cursor:pointer;" onclick="addTab('学生基本信息打印','basic_info.html')">学生基本信息打印</a></li>
                           <li class="active"><a style="cursor:pointer;" onclick="addTab('学生学期规划打印','basic_info.html')">学生学期规划打印</a></li>
                        </ul>
                     </li>
                     <li>
                        <a href="javascript:;">
                            <span class="iconfont sider-nav-icon">&#xe635;</span>
                            <span class="sider-nav-title">待开发</span>
                            <i class="iconfont">&#xe642;</i>
                        </a>
                     </li>
                 </ul> 
            </div>


            <div id="pf-page">
                <div id="menuTabs" class="easyui-tabs" style="width:100%;height:100%;">
                  <div title="首页" style="padding:10px 5px 5px 10px;">
                    <iframe class="page-iframe" src="workbench.jsp" frameborder="no"   border="no" height="100%" width="100%" scrolling="auto"></iframe>
                  </div>
                </div>
				
            </div>
			
        </div>

        <div id="pf-ft">
            <div class="system-name">
              <i class="iconfont">&#xe6fe;</i>
              <span>学生学习规划系统&nbsp;v2.0</span>
            </div>
            <div class="copyright-name">
              <span>CopyRight&nbsp;2018&nbsp;&nbsp;XXX工作室&nbsp;版权所有</span>
              <i class="iconfont" >&#xe6ff;</i>
            </div>
        </div>
		
		
    </div> 
    <script type="text/javascript">
    var mainPlatform = {

    		init: function(){

    			this.bindEvent();
    		},

    		bindEvent: function(){
    			
    			//加载UR下拉菜单
    	        $(document).on('click', '.sider-nav li', function() {
    	            $('.sider-nav li').removeClass('current');
    	            $(this).addClass('current');
    	            $('iframe').attr('src', $(this).data('src'));
    	        });
    	        //左侧菜单收起
    	        $(document).on('click', '.toggle-icon', function() {
    	            $(this).closest("#pf-bd").toggleClass("toggle");
    	            setTimeout(function(){
    	            	$(window).resize();
    	            },300)
    	        });
    		}

    	};

    mainPlatform.init();
    
	function addTab(title, url){
		if ($('#menuTabs').tabs('exists', title)){
			$('#menuTabs').tabs('select', title);
		} else {
			var content = '<iframe scrolling="auto" frameborder="0"  src="'+url+'" style="width:100%;height:100%;"></iframe>';
			$('#menuTabs').tabs('add',{
				title:title,
				content:content,
				closable:true
			});
		}
	}
    </script>
</body> 
</html>
