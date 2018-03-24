<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <title>userList</title>
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />    
    
    <link href="<%=basePath %>css/bootstrap.min.css" rel="stylesheet" />
    <link href="<%=basePath %>css/bootstrap-responsive.min.css" rel="stylesheet" />
    
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600" rel="stylesheet" />
    <link href="<%=basePath %>css/font-awesome.css" rel="stylesheet" />
    
    <link href="<%=basePath %>css/adminia.css" rel="stylesheet" /> 
    <link href="<%=basePath %>css/adminia-responsive.css" rel="stylesheet" /> 
    
    <link href="<%=basePath %>css/pages/dashboard.css" rel="stylesheet" /> 
    
	
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
			
			<a class="brand" href="./"><c:choose><c:when test="${admins.adminflag ==1}">普通管理员</c:when><c:otherwise>超级管理员</c:otherwise></c:choose></a>
			
			<div class="nav-collapse">
			
				<ul class="nav pull-right">
					<li>
						<a href="#"><span class="badge badge-warning">7</span></a>
					</li>
					
					<li class="divider-vertical"></li>
					
					<li class="dropdown">
						
						<a data-toggle="dropdown" class="dropdown-toggle " href="#">
							${admins.adminname} <b class="caret"></b>							
						</a>
						
						<ul class="dropdown-menu">
							
							<li>
								<a href="${pageContext.request.contextPath}/changeAdminPassword.jsp"><i class="icon-lock"></i> 修改密码</a>
							</li>
							
							<li class="divider"></li>
							
							<li>
								<a href="logout"><i class="icon-off"></i> 注销</a>
							</li>
						</ul>
					</li>
				</ul>
				
			</div> <!-- /nav-collapse -->
			
		</div> <!-- /container -->
		
	</div> <!-- /navbar-inner -->
	
</div> <!-- /navbar -->

<div id="content">
	
	<div class="container">
		
		<div class="row">
			
			<div class="span3">
				
				<div class="account-container">
				
					<div class="account-avatar">
						<img src="./img/headshot.png" alt="" class="thumbnail" />
					</div> <!-- /account-avatar -->
				
					<div class="account-details">
					
						<span class="account-name">${admins.adminname}</span>
						
						<span class="account-role"><c:choose><c:when test="${admins.adminflag == 1}">普通管理员</c:when><c:otherwise>超级管理员</c:otherwise></c:choose></span>
						
						<span class="account-actions">
							<a href="${pageContext.request.contextPath}/tosingeinfo?empid=${sessionemp.empid}">我的资料</a> 
						</span>
					
					</div> <!-- /account-details -->
				
				</div> <!-- /account-container -->
				
				<hr />
				
				<ul id="main-nav" class="nav nav-tabs nav-stacked">
					
					<li class="active">
						<a href="${pageContext.request.contextPath}/selectUserByExample">
							<i class="icon-home"></i>
							用户管理		
						</a>
					</li>
					
					<li>
						<a href="${pageContext.request.contextPath}/loadAllDeptByPage">
							<i class="icon-th-list"></i>
							试题管理		
						</a>
					</li>
					
					<li>
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
				
				<hr />
				
				<br />
		
			</div> <!-- /span3 -->
	
			<div class="span9">
				
				<h1 class="page-title">
					<i class="icon-home"></i>
					Dashboard					
				</h1>
		
				<div class="widget widget-table">
										
					<div class="widget-header">
						<i class="icon-th-list"></i>
						<h3>Table</h3>
						<div style="float :right; vertical-align: middle">
							<a href="${pageContext.request.contextPath}/user/register.jsp" class="btn btn-small">
								<i>添加用户</i>
							</a>
						</div>
					</div> <!-- /widget-header -->
					
					<div class="widget-content">
					
						<table class="table table-striped table-bordered">
							<thead>
								<tr>
									<th>用户编号</th>
									<th>用户姓名</th>
									<th>用户密码</th>
									<th>用户邮箱</th>
									<th>邮箱是否验证</th>
									<th>性别</th>
									<th>更新</th>
									<th>删除</th>
								</tr>
							</thead>
							
							<tbody>
							  <c:forEach items="${userList }" var="user">
							    <tr>
									<td>${user.userno }</td>
									<td>${user.username }</td>
									<td>${user.password }</td>
									<td>${user.email }</td>
									<td>
									<c:if test="${user.status ==0}">
										邮箱未验证
									</c:if>
									<c:if test="${user.status ==1}">
										邮箱已验证
									</c:if>
									</td>
									<td>${user.sex }</td>
								</tr>
							 </c:forEach>
							</tbody>
						</table>
						
					</div> <!-- /widget-content -->
					<div style="float :right">
					<a href="${pageContext.request.contextPath}/queryallemp?pageNo=${prev}" class="btn btn-small">
						<i>上一页</i>
					</a>
					<a href="${pageContext.request.contextPath}/queryallemp?pageNo=${next}" class="btn btn-small">
						<i>下一页</i>
					</a>
					</div>
				</div> <!-- /widget -->
				<div class="row">
					<div class="span5">
									
						<div class="widget">
							
							 <!-- /widget-header -->
																
							 <!-- /widget-content -->
							
						</div> <!-- /widget -->
						
					</div> <!-- /span5 -->
		
					 <!-- /span4 -->
					
				</div> <!-- /row -->
				
			</div> <!-- /span9 -->
			
			
		</div> <!-- /row -->
		
	</div> <!-- /container -->
	
</div> <!-- /content -->
					
	
<div id="footer">
	
	<div class="container">				
		<hr />
		<p>&copy; 2018 答题系统.</p>
	</div> <!-- /container -->
	
</div> <!-- /footer -->

<!-- Le javascript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="<%=basePath %>js/jquery-1.7.2.min.js"></script>
<script src="<%=basePath %>js/excanvas.min.js"></script>
<script src="<%=basePath %>js/jquery.flot.js"></script>
<script src="<%=basePath %>js/jquery.flot.pie.js"></script>
<script src="<%=basePath %>js/jquery.flot.orderBars.js"></script>
<script src="<%=basePath %>js/jquery.flot.resize.js"></script>


<script src="<%=basePath %>js/bootstrap.js"></script>
<script src="<%=basePath %>js/charts/bar.js"></script>

  </body>
</html>