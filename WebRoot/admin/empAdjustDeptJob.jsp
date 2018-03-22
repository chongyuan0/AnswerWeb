<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
<meta charset="utf-8" />
<title>User Account - Bootstrap Admin</title>

<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="apple-mobile-web-app-capable" content="yes" />

<link href="./css/bootstrap.min.css" rel="stylesheet" />
<link href="./css/bootstrap-responsive.min.css" rel="stylesheet" />
<link href="./css/bootstrap-responsive.css" rel="stylesheet" />

<link
	href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600"
	rel="stylesheet" />
<link href="./css/font-awesome.css" rel="stylesheet" />

<link href="./css/adminia.css" rel="stylesheet" />
<link href="./css/adminia-responsive.css" rel="stylesheet" />


<link href="./css/pages/plans.css" rel="stylesheet" />

<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>

<body>

	<div class="navbar navbar-fixed-top">

		<div class="navbar-inner">

			<div class="container">

				<a class="btn btn-navbar" data-toggle="collapse"
					data-target=".nav-collapse"> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
				</a> <a class="brand" href="./">Adminia Admin</a>

				<div class="nav-collapse">

					<ul class="nav pull-right">
						<li><a href="#"><span class="badge badge-warning">7</span></a>
						</li>

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

				</div>
				<!-- /nav-collapse -->

			</div>
			<!-- /container -->

		</div>
		<!-- /navbar-inner -->

	</div>
	<!-- /navbar -->




	<div id="content">

		<div class="container">

			<div class="row">

				<div class="span3">

					<div class="account-container">

						<div class="account-avatar">
							<img src="./img/headshot.png" alt="" class="thumbnail" />
						</div>
						<!-- /account-avatar -->

						<div class="account-details">

							<span class="account-name">${sessionemp.ename}</span> <span
								class="account-role"><c:choose>
									<c:when test="${isadmin}">管理员</c:when>
									<c:otherwise>普通员工</c:otherwise>
								</c:choose></span> <span class="account-actions"> <a
								href="tosingeinfo?empid=${sessionemp.empid}">我的资料</a>
							</span>

						</div>
						<!-- /account-details -->

					</div>
					<!-- /account-container -->

					<hr />

					<ul id="main-nav" class="nav nav-tabs nav-stacked">

						<li class="active"><a href="${pageContext.request.contextPath}/queryallemp">
								<i class="icon-home"></i> 员工管理
						</a></li>

						<li><a href="${pageContext.request.contextPath}/loadAllDeptByPage"> <i class="icon-th-list"></i>
								部门管理
						</a></li>

						<li><a href="${pageContext.request.contextPath}/showAllJob"> <i class="icon-th-large"></i>
								岗位管理
						</a></li>

						<li><a href="${pageContext.request.contextPath}/getAllTestInfoByPage"> <i class="icon-signal"></i>
								试用管理
						</a></li>

						<li><a
							href="${pageContext.request.contextPath}/tohumanlist"> <i
								class="icon-user"></i> 人才库
						</a></li>

						<li><a href="${pageContext.request.contextPath}/getalladjustinfo">
							<i class="icon-pushpin"></i>
							调动信息
						</a></li>

					</ul>

					<hr />

					<br />

				</div>
				<!-- /span3 -->



				<div class="span9">



					<div class="row">

						<div class="span9">



							<div class="widget-header">
								<i class="icon-th-list"></i>
								<h3>员工管理</h3>
							</div>
							<!-- /widget-header -->
							<div class="widget-content">



								<div class="tabbable">
									<ul class="nav nav-tabs">
										<li <c:if test="${adjustid == 1 }">class="active"</c:if>><a href="#1" data-toggle="tab">部门调动</a>
										</li>
										<li <c:if test="${adjustid == 2 }">class="active"</c:if>><a href="#2" data-toggle="tab">岗位调动</a></li>
									</ul>

									<br />

									<div class="tab-content">
										<div class="tab-pane <c:if test="${adjustid == 1 }"> active</c:if>" id="1">
											<form id="edit-profile" class="form-horizontal"
												action="${pageContext.request.contextPath}/deptAdjust" method="post">
												<fieldset>


													<div class="control-group">
														<label class="control-label" for="username">用户名：</label>
														<div class="controls">
															<input type="text" class="input-medium disabled"
																id="username" value="${emp.ename}" disabled="" /> <input
																type="hidden" id="username" name="empId"
																value="${emp.empid }" />
														</div>
														<!-- /controls -->
													</div>
													<!-- /control-group -->


													<div class="control-group">
														<label class="control-label">现任部门</label>
														<div class="controls">
															<input type="text" class="input-medium disabled" id="input_deptId"
																value="${emp.dept.dname}" disabled="" />
														</div>
														<!-- /controls -->
													</div>
													<!-- /control-group -->

													<div class="control-group">
														<label class="control-label">调转类型：</label>
														<div class="controls">
															<select name="deptAdjust.type">
																<option value="true">主动调动</option>
																<option value="false">被动调动</option>
															</select>
														</div>
														<!-- /controls -->
													</div>
													<!-- /control-group -->

													<div class="control-group">
														<label class="control-label">要调转的部门</label>
														<div class="controls">
															<s:select list="deptList1" name="deptId" listValue="dname"
																listKey="deptid" id="select_deptId"></s:select>
														</div>
														<!-- /controls -->
													</div>
													<!-- /control-group -->


													<div class="control-group">
														<label class="control-label">调转原因：</label>
														<div class="controls">
															<textarea type="text" name="deptAdjust.reason"
																class="input-medium"></textarea>

														</div>
														<!-- /controls -->
													</div>
													<!-- /control-group -->


													<br />
													<input type="hidden" name="pageNo1" value="${pageNo1 }">


													<div class="form-actions">
														<button type="submit" class="btn btn-primary" onclick="return valid_dept()"
														data-toggle="popover" data-trigger="focus" data-placement="top" data-content="部门未修改，不需保存"
														id="save_dept_btn"
														>保存</button>
														<button class="btn" onclick="jump()">返回上一层</button>
													</div>
													<!-- /form-actions -->
												</fieldset>
											</form>
										</div>

										<div class="tab-pane <c:if test="${adjustid == 2 }">active</c:if>" id="2">
											<form id="edit-profile2" class="form-horizontal" action="${pageContext.request.contextPath }/adjustEmpJob" method="post">
												<fieldset>
													<div class="control-group">
														<label class="control-label" for="username">用户名：</label>
														<div class="controls">
															<input type="text" class="input-medium disabled"
																id="username" value="${emp.ename }" disabled="" /> <input
																type="hidden" id="username" name="empid"
																value="${emp.empid }" />
														</div>
														<!-- /controls -->
													</div>
													<!-- /control-group -->


													<div class="control-group">
														<label class="control-label">现任岗位</label>
														<div class="controls">
															<input type="text" class="input-medium disabled" id="input_jobId"
																value="${emp.job.jname}" disabled="" />
														</div>
														<!-- /controls -->
													</div>
													<!-- /control-group -->

													<div class="control-group">
														<label class="control-label">调转类型：</label>
														<div class="controls">
															<select name="jobAdjust.type">
																<option value="升职">升职</option>
																<option value="降职">降职</option>
															</select>
														</div>
														<!-- /controls -->
													</div>
													<!-- /control-group -->

													<div class="control-group">
														<label class="control-label">要调转的部门</label>
														<div class="controls">
															<s:select list="jobList1" name="jobAdjust.jobid" listValue="jname"
																listKey="jobid" id="select_jobId"></s:select>
														</div>
														<!-- /controls -->
													</div>
													<!-- /control-group -->


													<div class="control-group">
														<label class="control-label">备注：</label>
														<div class="controls">
															<textarea type="text" name="jobAdjust.descr"
																class="input-medium"></textarea>

														</div>
														<!-- /controls -->
													</div>
													<!-- /control-group -->
													<input type="hidden" name="pageNo1" value="${pageNo1 }">
													<br />


													<div class="form-actions">
														<button type="submit" class="btn btn-primary " onclick="return valid_job()"
															 data-toggle="popover" data-trigger="focus" data-placement="top" data-content="岗位未修改，不需保存"
														id="save_job_btn">保存</button>
														<button class="btn" onclick="jump()"> 返回上一层</button>
													</div>
												</fieldset>
											</form>
										</div>

									</div>


								</div>

							</div>
							<!-- /widget-content -->

						</div>
						<!-- /widget -->

					</div>
					<!-- /span9 -->

				</div>
				<!-- /row -->

			</div>
			<!-- /span9 -->


		</div>
		<!-- /row -->

	</div>
	<!-- /container -->

	</div>
	<!-- /content -->


	<div id="footer">

		<div class="container">
			<hr />
			<p>&copy; 2012 Go Ideate.</p>
		</div>
		<!-- /container -->

	</div>
	<!-- /footer -->




	<!-- Le javascript
================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="./js/jquery-1.7.2.min.js"></script>
	<script src="./js/bootstrap.js"></script>
	<script src="./js/bootstrap.min.js"></script>
	<script type="text/javascript">
		function valid_dept(){
			var select_deptId = $("#select_deptId option:selected").text();
			var input_deptId = $("#input_deptId").val();
			if(select_deptId==input_deptId){
				$("#save_dept_btn").popover('show');
				return false;
			}
			return true;
		}
		
		$("#select_deptId").change(function(){
			$("#save_dept_btn").popover('destroy');
		});
		
		
		
		
		
		function valid_job(){
			var select_jobId = $("#select_jobId option:selected").text();
			var input_deptId = $("#input_jobId").val();
			if(select_jobId==input_deptId){
				$("#save_job_btn").popover('show');
				return false;
			}
			return true;
		}
		
		$("#select_jobId").change(function(){
			$("#save_job_btn").popover('destroy');
		});
		
		function jump(){
			/* window.location.href="${pageContext.request.contextPath}/queryallemp?toid=2"; */
			history.go(-1);
		}
		
		//将ajax请求设置为同步处理,默认是异步处理，同步方式，所有的请求均为同步请求，在没有返回值之前，
		//同步请求将锁住浏览器，用户其它操作必须等待请求完成才可以执行。
		$.ajaxSetup({
			async : false
		});
	</script>
	

</body>
</html>
