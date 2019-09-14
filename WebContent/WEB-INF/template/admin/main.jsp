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
    <link rel="icon" href="<%=basePath%>/images/school.png" type="image/x-icon" />
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
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/main_admin.css">
</head>

<body>
    <div class="container">
        <div id="pf-hd">
			<div class="pf-term">
				<i class="iconfont term-icon">&#xe653;</i>
			</div>
			
            <div class="pf-user">
                <div class="pf-user-photo">
                     <img id="avatar" src="<%=basePath%>images/man.png" style="width:30px;margin-left:10px;height:30px;" alt="me" id="img">
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
                        <a onclick=''>
                            <span class="iconfont sider-nav-icon">&#xe620;</span>
                            <span class="sider-nav-title" style="cursor:pointer;">查询年级</span>
                        </a>
                     </li>
                     <li>
                        <a onclick=''>
                            <span class="iconfont sider-nav-icon">&#xe6db;</span>
                            <span class="sider-nav-title" style="cursor:pointer;">查询填写情况</span>
                            <i class="iconfont">&#xe642;</i>
                        </a>
                     </li>
                     <li>
                        <a onclick=''>
                            <span class="iconfont sider-nav-icon">&#xe6c2;</span>
                            <span class="sider-nav-title" style="cursor:pointer;">查询班主任完成情况</span>
                            <i class="iconfont">&#xe642;</i>
                        </a>
                     </li>
                     <li>
                        <a onclick='addTab1("查询分布图","manage/targetChart")'>
                            <span class="iconfont sider-nav-icon">&#xe6c2;</span>
                            <span class="sider-nav-title" style="cursor:pointer;">查询分布图</span>
                            <i class="iconfont">&#xe642;</i>
                        </a>
                     </li>
                            
                     <li>
                        <a onclick=''>
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
                    <iframe class="page-iframe" src="<%=basePath %>assist/workbench" frameborder="no"   border="no" height="100%" width="100%" scrolling="auto"></iframe>
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
    var sex = ${curUser.stuSex};
    
    //页面初始化
    $(document).ready(function () {
    	//console.log("${curStu}");
    	show();
    	
    });
    
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
    
    //根据性别修改头像
    function show(){
		if(sex==true){
   			$("#avatar").attr("src","<%=basePath%>images/man.png");
		}else{
  			$("#avatar").attr("src","<%=basePath%>images/woman.png");
		}
	}
    
    /* frame右侧窗口 */
	function addTab(title, url,parameter){
		if ($('#menuTabs').tabs('exists', title)){
			$('#menuTabs').tabs('select', title);
		} else {
			request( "POST",basePath+url,JSON.parse(parameter),addTabSuccess,serverError,true);
			
			function addTabSuccess() {
				var content = $('<iframe></iframe>',{
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
			
			function serverError(){
				alert("err!");
			}
			
		}
	}
    //重写addTab
	function addTab1(title, url){
		if ($('#menuTabs').tabs('exists', title)){
			$('#menuTabs').tabs('select', title);
		} else {
			
			request1( "POST",basePath+url,addTabSuccess,serverError,true);
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