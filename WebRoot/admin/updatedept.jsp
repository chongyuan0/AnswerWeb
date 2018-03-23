<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>部门信息更新</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <link href="./css/bootstrap.min.css" rel="stylesheet" />
    <link href="./css/bootstrap-responsive.min.css" rel="stylesheet" />
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600" rel="stylesheet" />
    <link href="./css/font-awesome.css" rel="stylesheet" />
    <link href="./css/adminia.css" rel="stylesheet" /> 
    <link href="./css/adminia-responsive.css" rel="stylesheet" />
    <link href="./css/pages/plans.css" rel="stylesheet" />
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>

<body>
	
<div class="navbar navbar-fixed-top">
	<div class="navbar-inner">
		<div class="container">
			<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"> 
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span> 				
			</a>
			<a class="brand" href="./">更改部门信息</a>
			<div class="nav-collapse">
				<ul class="nav pull-right">
					<li class="divider-vertical"></li>
					<li class="dropdown">
						<a data-toggle="dropdown" class="dropdown-toggle " href="#">
							${sessionemp.ename} <b class="caret"></b>							
						</a>
						
						<ul class="dropdown-menu">
							
							<li>
								<a href="${pageContext.request.contextPath}/changepassword.jsp"><i class="icon-lock"></i> 修改密码</a>
							</li>
							
							<li class="divider"></li>
							
							<li>
								<a href="logout"><i class="icon-off"></i> 注销</a>
							</li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</div>
</div>

<div id="content">
	<div class="container">
		<div class="row">
			<div class="span3">
				<div class="account-container">
					<div class="account-avatar">
						<img src="./img/headshot.png" alt="" class="thumbnail" />
					</div>
					<div class="account-details">
						<span class="account-name">${sessionemp.ename}</span>
						
						<span class="account-role"><c:choose><c:when test="${isadmin}">管理员</c:when><c:otherwise>普通员工</c:otherwise></c:choose></span>
						
						<span class="account-actions">
							<a href="tosingeinfo?empid=${sessionemp.empid}">我的资料</a> 
						</span>
					</div>
				</div>
				<hr />
				<ul id="main-nav" class="nav nav-tabs nav-stacked">
					<li>
						<a href="${pageContext.request.contextPath}/queryallemp">
							<i class="icon-home"></i>
							员工管理		
						</a>
					</li>
					<li class="active">
						<a href="${pageContext.request.contextPath}/loadAllDeptByPage">
							<i class="icon-th-list"></i>
							部门管理		
						</a>
					</li>
					<li class="">
						<a href="${pageContext.request.contextPath}/showAllJob">
							<i class="icon-th-large"></i>
							岗位管理
						</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/getAllTestInfoByPage">
							<i class="icon-signal"></i>
							试用管理
						</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/tohumanlist">
							<i class="icon-user"></i>
							人才库							
						</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/getalladjustinfo">
							<i class="icon-pushpin"></i>
							调动信息
						</a>
					</li>
				</ul>
			</div>

			<div class="span9">
				<div class="row">
					<div class="span9">
						<div class="widget">
							<div class="widget-header">
								<h3>部门基本信息</h3>
							</div>
							<div class="widget-content">
								<div class="tabbable">
							<div class="tab-content">
								<div class="tab-pane active" id="1">
								
								<!-- 下面是表单提交 -->
								
								<form id="edit-profile" class="form-horizontal" action="updateDeptSubmit" method="post" />
									<fieldset>
										
										<input type="hidden" name="dept.deptid" value="${deptDetail.deptid}" />
									
										<div class="control-group">											
											<label class="control-label">部门名称</label>
											<div class="controls">
												<input type="hidden" name="dept.dname" value="${deptDetail.dname}" />
												<input type="text" class="input-medium disabled" id="deptname"  value="${deptDetail.dname}" disabled="disabled" />
											</div>
										</div>
										<div class="control-group">											
											<label class="control-label">部门电话</label>
											<div class="controls">
												<input type="text" class="input-medium" id="depttel" name="dept.tel" value="${deptDetail.tel}" />
											</div>
										</div>										
										<div class="control-group">											
											<label class="control-label">部门传真</label>
											<div class="controls">
												<input type="text" class="input-medium" id="deptfax" name="dept.fax" value="${deptDetail.fax}" />
											</div>
										</div>										
										<div class="control-group">											
											<label class="control-label">部门描述</label>
											<div class="controls">
												<textarea  style="height:150px; width:200px" id="deptdescr" name="dept.descr" >${deptDetail.descr}</textarea>
											</div>
										</div>		
										<input type="hidden" class="input-medium" id="depttime" name="dept.builddate" value="${deptDetail.builddate}" onclick="selectDate(this,'yyyy-MM-dd')" />
																																				<!-- 	onclick="selectDate(this,'yyyy-MM-dd hh:mm:ss')" -->
										</div>									
										<div class="form-actions">
											<input type="submit" class="btn btn-primary" value="提交修改" />
										</div>
									</fieldset>
								</form>
								</div>
							</div>
						</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
	
<div id="footer">
	<div class="container">				
		<hr />
		<p>&copy; 2012 Go Ideate.</p>
	</div>
</div>
<!-- javascript================================================== -->
<script type="text/javascript">
function validEmpty(){
	//  获取输入框的值
	var name = document.getElementById('deptname').value;
	if(name == null || name == '' ){
		alert("部门名称不能为空！");
		return false;
	}
	var tel = document.getElementById('depttel').value;
	if(tel == null || tel == '' ){
		alert("部门电话不能为空！");
		return false;
	}
	var fax = document.getElementById('deptfax').value;
	if(fax == null || fax == '' ){
		alert("部门传真不能为空！");
		return false;
	}
	var descr = document.getElementById('deptdescr').value;
	if(descr == null || descr == '' ){
		alert("部门描述不能为空！");
		return false;
	}
	var dtime = document.getElementById('depttime').value;
	if(dtime == null || dtime == '' ){
		alert("部门创建日期不能为空！");
		return false;
	}
	return true;
}
</script>

<script src="./js/jquery-1.7.2.min.js"></script>
<script src="./js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/js/WebCalendar.js" type="text/javascript"></script>
  </body>
</html>
