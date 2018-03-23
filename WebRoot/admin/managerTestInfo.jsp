<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <title>User Account - Bootstrap Admin</title>
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />    
    
    <link href="./css/bootstrap.min.css" rel="stylesheet" />
    <link href="./css/bootstrap-responsive.min.css" rel="stylesheet" />
    
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600" rel="stylesheet" />
    <link href="./css/font-awesome.css" rel="stylesheet" />
    
    <link href="./css/adminia.css" rel="stylesheet" /> 
    <link href="./css/adminia-responsive.css" rel="stylesheet" /> 
    
    
    <link href="./css/pages/plans.css" rel="stylesheet" /> 

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
	
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
			
			<a class="brand" href="./">Adminia Admin</a>
			
			<div class="nav-collapse">
			
				<ul class="nav pull-right">

						<li class="divider-vertical"></li>

						<li class="dropdown"><a data-toggle="dropdown"
							class="dropdown-toggle " href="#"> ${sessionemp.ename} <b
								class="caret"></b>
						</a>

							<ul class="dropdown-menu">

								<li><a
									href="${pageContext.request.contextPath}/changepassword.jsp"><i
										class="icon-lock"></i> 修改密码</a></li>

								<li class="divider"></li>

								<li><a href="logout"><i class="icon-off"></i> 注销</a></li>
							</ul></li>
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
					
						<span class="account-name">${sessionemp.ename}</span> <span
								class="account-role"><c:choose>
									<c:when test="${isadmin}">管理员</c:when>
									<c:otherwise>普通员工</c:otherwise>
								</c:choose></span> <span class="account-actions"> <a
								href="${pageContext.request.contextPath}/tosingeinfo?empid=${sessionemp.empid}">我的资料</a>
							</span>
					
					</div> <!-- /account-details -->
				
				</div> <!-- /account-container -->
				
				<hr />
				
				<ul id="main-nav" class="nav nav-tabs nav-stacked">
					
					<li>
						<a href="${pageContext.request.contextPath}/queryallemp">
							<i class="icon-home"></i>
							员工管理		
						</a>
					</li>
					
					<li>
						<a href="${pageContext.request.contextPath}/loadAllDeptByPage">
							<i class="icon-th-list"></i>
							部门管理		
						</a>
					</li>
					
					<li>
						<a href="${pageContext.request.contextPath}/showAllJob">
							<i class="icon-th-large"></i>
							岗位管理
						</a>
					</li>
					
					<li class="active">
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
				
				<div class="sidebar-extra">
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud.</p>
				</div> <!-- .sidebar-extra -->
				
				<br />
		
			</div> <!-- /span3 -->
			<div class="span9">
				
				<h1 class="page-title">
					<i class="icon-th-large"></i>
					User Account					
				</h1>
				
				
				<div class="row">
					
					<div class="span9">
				
						<div class="widget">
							
							<div class="widget-header">
								<h3>Basic Information</h3>
							</div> <!-- /widget-header -->
									
							<div class="widget-content">
								<div class="tabbable">
						<ul class="nav nav-tabs">
						  
						  
						</ul>
						
						<br />
							<div class="tab-content">
								<div class="tab-pane active" id="1">
								<form class="form-horizontal" id="form_toManagerTestInfo" />
									<fieldset>
										<input type="hidden" name="testInfoId" value="<%=request.getParameter("testid") %>"/>
										<input type="hidden" name="pageNo" value="<%=request.getParameter("pageNo") %>"/>
										<div class="control-group">
											<label class="control-label">考核评语：</label>
											<div class="controls">
												<textarea type="text" name="testManager.judge" class="input-medium" ></textarea>
											</div> <!-- /controls -->
										</div>
										
										<%-- <div class="control-group">
											<label class="control-label">岗位</label>
											<div class="controls">
												<s:select list="jobList" name="jobid" listValue="jname" listKey="jobid"></s:select>
											</div> 
										</div> --%>
										
							<!-- 			<div class="control-group">
											<label class="control-label">参加工作日期</label>
											<div class="controls">
												<input type="date" name="example.workdate" />
											</div> /controls
										</div> -->
										
										
										<div class="control-group">
											<label class="control-label">处理结果</label>
											<div class="controls">
												<select name="testManager.result">
												    <option value="1">转正</option>
												    <option value="2">延期</option>
												    <option value="3">不予录用</option>
												</select>
											</div> <!-- /controls -->
										</div>
								
											
										<div class="form-actions">
											<button type="button" id="btn_toManagerTestInfo" class="btn btn-primary">提交</button>
										</div> <!-- /form-actions -->
									</fieldset>
								</form>
								</div>
								
							</div>
						  
						</div>
								
								
							</div> <!-- /widget-content -->
							
						</div> <!-- /widget -->
						
					</div> <!-- /span9 -->
					
				</div> <!-- /row -->
				
				
			</div> <!-- /span9 -->
			
			
		</div> <!-- /row -->
		
	</div> <!-- /container -->
	
</div> <!-- /content -->
					
	
<div id="footer">
	
	<div class="container">				
		<hr />
		<p>&copy; 人事管理系统</p>
	</div> <!-- /container -->
	
</div> <!-- /footer -->


    

<!-- Le javascript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="./js/jquery-1.7.2.min.js"></script>
<script src="./js/bootstrap.js"></script>

<script type="text/javascript">
	$("#btn_toManagerTestInfo").click(function(){
		$.ajax({
			url:"${pageContext.request.contextPath}/toManagerTestInfo",
			type:"POST",
			data:$("#form_toManagerTestInfo").serialize(),
			success:function(result){
				if(result=="successDelay"){
					alert("延期成功");
				}else if(result=="isEmp"){
					alert("已经转正，不需要再操作");
				}else if(result=="successEmp"){
					alert("转正成功");
				}else if(result=="isNotEmp"){
					alert("已经离职，不需操作");
				}else if(result=="success"){
					alert("离职成功");
				}else
					alert("发生错误");
				window.location.href = "${pageContext.request.contextPath}/getAllTestInfoByPage?pageNo=<%=request.getParameter("pageNo") %>";
			}
		});
	});
</script>




  </body>
</html>