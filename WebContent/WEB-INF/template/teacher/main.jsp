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
#pf-hd .pf-user:hover{
    background: url('<%=basePath%>images/main/top_userbg.png?1464007598');
}
#pf-bd #pf-sider .pf-model-name .toggle-icon{
    background: url(<%=basePath%>images/main/sider-toggle.png) no-repeat;
}
#pf-bd #pf-sider .sider-nav > li .sider-nav-s a{
    background: url('<%=basePath%>images/main/left_list.png?1463555463') no-repeat 30px center;
}
#pf-bd #pf-page .easyui-tabs1 .tabs li a.tabs-close{
    background: url('<%=basePath%>images/main/tabs_close_pf.png?1464531592')
}

#pf-bd #pf-page .easyui-tabs1 .tabs li:hover a.tabs-close{
    background: url('<%=basePath%>images/main/tabs_close_hover.png?1464355659')
}

</style>

<body>
    <div class="container">
        <div id="pf-hd">
			<div class="pf-term">
				<i class="iconfont term-icon">&#xe653;</i>
                <span class="pf-term-name">学生职业规划系统</span>
			</div>
			
            <div class="pf-user">
                <div class="pf-user-photo">
                    <img src="<%=basePath%>images/user.png" alt="me">
                </div>
                <h4 class="pf-user-name ellipsis">${curUser.name }</h4>
                <i class="iconfont xiala">&#xe607;</i>

                <div class="pf-user-panel">
                    <ul class="pf-user-opt">
                        <li class="pf-modify-pwd">
                            <a onclick='addTab("修改密码","base/changePass","{\"id\": ${curUser.id}}")'>
                                <i class="iconfont">&#xe634;</i>
                                <span class="pf-opt-name">修改密码</span>
                            </a>
                        </li>
                        <li class="pf-logout">
                            <a href="<%=basePath%>base/loginout">
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
                        <a onclick='addTab("学生目标审核","teacher/eStuReviews","{\"terId\": ${curUser.id}}")'>
                            <span class="iconfont sider-nav-icon">&#xe645;</span>
                            <span class="sider-nav-title" style="cursor:pointer;">评审学生</span>
                            <i class="iconfont">&#xe642;</i>
                        </a>
                     </li>
                     <li>
                        <a onclick='#'>
                            <span class="iconfont sider-nav-icon">&#xe6db;</span>
                            <span class="sider-nav-title" style="cursor:pointer;">待开发</span>
                            <i class="iconfont">&#xe642;</i>
                        </a>
                     </li>
                     <li>
                        <a href="javascript:;" >
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
                    <iframe class="page-iframe" src="<%=basePath %>teacher/workbench" frameborder="no"   border="no" height="100%" width="100%" scrolling="auto"></iframe>
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
		<div id="queryresult"></div>
		
    </div> 
    <script type="text/javascript">
    var basePath = '<%=basePath%>';
    
  
    
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
    
    
    /* frame右侧窗口 */
	function addTab(title, url, parameter){
		if ($('#menuTabs').tabs('exists', title)){
			$('#menuTabs').tabs('select', title);
		} else {
			request( "POST",basePath+url,JSON.parse(parameter),addTabSuccess,serverError,true);
			function addTabSuccess(data) {
				var content = $('<iframe></iframe>',{
					srcdoc: data,
					scrolling: "auto",
					frameborder: "0",
					style: "width:100%;height:100%;"
				});
				$('#menuTabs').tabs('add',{
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
