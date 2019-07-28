<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>学生基本信息打印</title>
<script type="text/javascript" src="<%=basePath%>js/main.js"></script>
<script type="text/javascript" src="<%=basePath%>easyui/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=basePath%>easyui/plugins/jquery.edatagrid.js"></script>
<script type="text/javascript" src="<%=basePath%>easyui/locale/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet" type="text/css" href="<%=basePath%>easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>easyui/themes/color.css">
		
	
<style type="text/css">

.content{
position:absolute;
top:8%;
left:17%;
}

table.k-table {
    width: 100%
}

table.k-table .k-label {
    padding: 0 10px;
    width: 115px;
    background: #f5f5f5;
    border: 1px solid #cacaca;
     font-size: 14px;
     font-weight:bold;
    border-top: none
}

table.k-table td.k-content{
    height: 29px;
    padding: 5px 0;
    width:180px;
    border-bottom: 1px solid #cacaca;
    font-size: 14px;
    padding-left: 20px
}

table.k-table tr:first-child td.k-content, table.k-table tr:first-child td.k-label {
    border-top: 1px solid #cacaca
}

table.k-table tr td.k-content:last-child {
    border-right: 1px solid #cacaca
}

table.k-table td.t-content{
    height: 80px;
    padding: 5px 0;
    width:180px;
    border-bottom:1px solid #cacaca;
    font-size: 14px;
    padding-left: 20px;
    border-left:1px solid #cacaca;
    border-right:1px solid #cacaca;
}

#print{
  margin-left:300px;
  margin-top:40px;
  margin-bottom:10px; 
}

</style>

 <style media="print">
    @page {
        size: auto;
        margin: 0mm;
    }
  </style>




</head>
<body>
<div class="content">
<div class="container">
<h1 style="margin-left:130px;">${curStu.college.collegeName }学生基本情况表</h1>
<table class="k-table" >
<tr>
<td class="k-content" style="text-align:center;border-left:1px solid #cacaca;font-weight:bold;" colspan="4">基本信息</td>
</tr>

<tr>
<td class="k-label">姓名</td>
<td class="k-content">${curStu.name }</td>
<td class="k-label">学号</td>
<td class="k-content">${curUser.account }</td>
</tr>

<tr>
<td class="k-label">性别</td>
<c:if  test="${curUser.stuSex==true }" >
<td class="k-content">男</td>
</c:if>
<c:if  test="${curUser.stuSex==false }" >
<td class="k-content" >女</td>
</c:if>
<td class="k-label">户籍</td>
<c:if  test="${curUser.registeredResidence==null }" >
<td class="k-content">未填写</td>
</c:if>
<c:if  test="${curUser.registeredResidence==true }" >
<td class="k-content">城镇</td>
</c:if>
<c:if  test="${curUser.registeredResidence==false }" >
<td class="k-content">农村</td>
</c:if>
</tr>

<tr>
<td class="k-label">所在大学</td>
<td class="k-content">${curStu.college.collegeName }</td>
<td class="k-label">所在班级</td>
<td class="k-content">${curStu.classes.name }</td>
</tr>

<tr>
<td class="k-label">家庭经济情况</td>
<td class="k-content">${curStu.economy.economyState }</td>
<td class="k-label">生日</td>
<td class="k-content"><fmt:formatDate value="${curUser.stuBirthday}" pattern="yyyy-mm-dd"/></td>
</tr>

<tr>
<td class="k-label">毕业后目标</td>
<td class="k-content">${curUser.target.targetCaption }</td>
<td class="k-label">毕业后的理想职业</td>
<td class="k-content">${curUser.stuIdeal }</td>
</tr>


<tr>
<td class="k-label">生源地</td>
<td class="k-content" colspan="3">${curUser.stuOrgin }</td>
</tr>

<tr>
<td class="k-content" style="text-align:center;border-left:1px solid #cacaca;font-weight:bold;" colspan="4">亲属信息</td>
</tr>

<c:forEach items="${member}" var="c" varStatus="st">
	<tr> 
	<td class="k-label" >${c.membersRelationship}姓名</td>
	<td class="k-content">${c.membersName}</td>
	<td class="k-label" >${c.membersRelationship}工作</td>
	<td class="k-content">${c.membersJob}</td>
	</tr>
	</c:forEach>
	
	<c:if  test="${member==null}" >
    <tr>
    <td class="t-content"  colspan="4">信息尚未录入</td>
    </tr>
    </c:if>
</table>
</div>
<div id="print">
<hr style="width:362%; margin-left:-800px;"></hr>
<a class="easyui-linkbutton" data-options="iconCls:'icon-print'" style="width:80px">打印</a>
</div>

</div>



<script type="text/javascript">

  

function $(selector){
    return document.querySelector(selector);
}

$(".easyui-linkbutton").onclick =function(){
	
	  if (!!window.ActiveXObject || "ActiveXObject" in window) {

	        remove_ie_header_and_footer();

	    }
	
    var oldHtml = $("body").innerHTML; 
    var printbox = $(".container").innerHTML;
    $("body").innerHTML = printbox;
    
    if (!!window.ActiveXObject || "ActiveXObject" in window) {
        remove_ie_header_and_footer();
    }
    
    window.print();
    $("body").innerHTML = oldHtml;
}

function remove_ie_header_and_footer() {
    var hkey_root, hkey_path, hkey_key;
    hkey_path = "HKEY_CURRENT_USER\\Software\\Microsoft\\Internet Explorer\\PageSetup\\";
    try {
        var RegWsh = new ActiveXObject("WScript.Shell");
        RegWsh.RegWrite(hkey_path + "header", "");
        RegWsh.RegWrite(hkey_path + "footer", "");
    } catch (e) {}
}


</script>


</body>
</html>