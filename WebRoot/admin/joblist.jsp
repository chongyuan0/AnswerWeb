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
<script>

function deleteJob() {
	{ 
		var msg = "您真的确定要删除吗？"; 
		if (confirm(msg)==true)
			{ return true; }
		else
			{ return false; } 
	} 
}

function job_validate(){ 
	var jname = document.getElementById('jname').value;
	if(jname==null||jname=="")
	{
		alert("岗位名称不能为空，请重新填写并确认！\n");
		return false;
	}
	var type = document.getElementById('type').value;
	if(type==null||type=="")
	{
		alert("岗位类型不能为空，请重新填写并确认！\n");
		return false;
	}
	var count = document.getElementById('count').value;
	if(count==null||count=="")
	{
		alert("岗位编制不能为空，请重新填写并确认！\n");
		return false;
	}
}
</script>

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

						<li><a href="${pageContext.request.contextPath}/queryallemp">
								<i class="icon-home"></i> 员工管理
						</a></li>

						<li><a
							href="${pageContext.request.contextPath}/loadAllDeptByPage">
								<i class="icon-th-list"></i> 部门管理
						</a></li>

						<li class="active"><a
							href="${pageContext.request.contextPath}/showAllJob"> <i
								class="icon-th-large"></i> 岗位管理
						</a></li>

						<li><a
							href="${pageContext.request.contextPath}/getAllTestInfoByPage">
								<i class="icon-signal"></i> 试用管理
						</a></li>

						<li><a href="${pageContext.request.contextPath}/tohumanlist">
								<i class="icon-user"></i> 人才库
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
								<h3>岗位管理</h3>
							</div>
							<!-- /widget-header -->
							<div class="widget-content">



								<div class="tabbable">
									<ul class="nav nav-tabs">
										<li class="active"><a href="#1" data-toggle="tab">岗位信息</a>
										</li>
										<li><a href="#2" data-toggle="tab">添加岗位</a></li>

									</ul>

									<br />

									<div class="tab-content">
										<div class="tab-pane active" id="1">
											<form id="form_table" class="form-horizontal form-inline"
												action="${pageContext.request.contextPath}/showAllJob?pageNo1=${pageNo}&toid=2"
												method="post">

												<div class="form-group controls-row">
													<label>岗位编号</label> <input type="text" name="job.jobid"
														value="${job.jobid}" id="job_id" class="span2 "
														style="height:25px" /> <label>岗位名称</label> <input
														type="text" name="job.jname" class="input-medium"
														id="job_name" value="${job.jname}" style="height:25px" />

													<label>岗位类型</label> <select class="input-medium"
														name="job.type" id="job_type">
														<option <s:if test='job.type==""'>selected</s:if>></option>
														<option value="管理"
															<s:if test='job.type=="管理"'>selected</s:if>>管理</option>
														<option value="技术"
															<s:if test='job.type=="技术"'>selected</s:if>>技术</option>
														<option value="营销"
															<s:if test='job.type=="营销"'>selected</s:if>>营销</option>
														<option value="市场"
															<s:if test='job.type=="市场"'>selected</s:if>>市场</option>
														<option value="其他"
															<s:if test='job.type=="其他"'>selected</s:if>>其他</option>
													</select>

													<button type="submit" class="btn btn-info"
														onclick="form_submit(1)">查询</button>
													<button type="button" class="btn btn-success"
														onclick="reset_form()">重置</button>
												</div>

												<table class="table table-striped table-bordered">
													<thead>
														<tr>
															<th>岗位编号</th>
															<th>岗位名称</th>
															<th>岗位类型</th>
															<th>编制</th>
															<th style="width:100px">操作</th>
														</tr>
													</thead>

													<tbody>
														<s:iterator value="jobList" status="state">
															<tr>
																<td><s:property value="jobid" /></td>
																<td><s:property value="jname" /></td>
																<td><s:property value="type" /></td>
																<td><s:property value="count" /></td>
																<td class="action-td"><%-- <a
																	href="${pageContext.request.contextPath}/updatejob?jobid=<s:property value="jobid"/>"
																	class="btn btn-small btn-warning"> <i
																		class="icon-ok"></i>
																</a> <a
																	href="${pageContext.request.contextPath}/deletejob?jobid=<s:property value="jobid"/>"
																	onclick="javascript:return deleteJob()"
																	class="btn btn-small"> <i class="icon-remove"></i>
																</a> --%>
																<a class="btn btn-default btn-small" href="${pageContext.request.contextPath}/updatejob?jobid=<s:property value="jobid"/>">修改</a>
																<a class="btn btn-danger btn-small" href="${pageContext.request.contextPath}/deletejob?jobid=<s:property value="jobid"/>">删除</a>
																</td>
															</tr>
														</s:iterator>
													</tbody>
												</table>
												<p style="color:red;font-size:16px;">${message}</p>
												<!-- 分页信息 -->
												<%-- <div class="pagination pagination-centered">
													<ul>
														<li><a href="#" onclick="form_submit(1)">首页</a></li>
														<li><a href="#" onclick="form_submit(${prev})">上一页</a></li>
														<c:choose>
															<c:when test="${allPages1 <=5}">
																<li><a href="#" onclick="form_submit(1)">1</a></li>
																<li><a href="#" onclick="form_submit(2)">2</a></li>
																<li><a href="#" onclick="form_submit(3)">3</a></li>
																<li><a href="#" onclick="form_submit(4)">4</a></li>
																<li><a href="#" onclick="form_submit(5)">5</a></li>
															</c:when>
															<c:otherwise>
																<li><a href="#" onclick="form_submit(1)">1</a></li>
																<li><a href="#" onclick="form_submit(2)">2</a></li>
																<li><a href="#" onclick="form_submit(3)">3</a></li>
																<li><a href="#" onclick="form_submit(4)">4</a></li>
																<li><a href="#" onclick="form_submit(5)">5</a></li>
															</c:otherwise>
														</c:choose>
														<li><a href="#" onclick="form_submit(${next})">下一页</a></li>
														<li><a href="#" onclick="form_submit(${allPages})">尾页</a></li>
													</ul>
												</div> --%>
												<div class="pagination pagination-centered">
								<ul>
									<li><a href="#" onclick="form_submit(1)">首页</a></li>
									<li><a href="#" onclick="form_submit(${prev})">&laquo;</a></li>
									<c:choose>
									<c:when test="${allPages <=5}">
									<c:forEach begin="1" end="${allPages }" varStatus="status">
													<li><a <c:if test="${pageNo == status.index  }">style="color:black"</c:if> href="#" onclick="form_submit(${status.index})">${status.index }</a></li>
									</c:forEach>
									</c:when>
									<c:otherwise>
										<c:choose>
											<c:when test="${pageNo < 4 }">
												<c:forEach begin="1" end="5" varStatus="status">
													<li><a <c:if test="${pageNo == status.index  }">style="color:black"</c:if> href="#" onclick="form_submit(${status.index})">${status.index }</a></li>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<c:choose>
													<c:when test="${pageNo+2 >=allPages }">
														<c:forEach begin="${allPages-4 }" end="${allPages }" varStatus="status">
															<li><a <c:if test="${pageNo == status.index  }">style="color:black"</c:if> href="#" onclick="form_submit(${status.index})">${status.index }</a></li>
														</c:forEach>
													</c:when>
													<c:otherwise>
														<c:forEach begin="${pageNo-2 }" end="${pageNo+2 }" varStatus="status">
															<li><a <c:if test="${pageNo == status.index  }">style="color:black"</c:if>href="#" onclick="form_submit(${status.index})">${status.index }</a></li>
														</c:forEach>
													</c:otherwise>
												</c:choose>
											</c:otherwise>
										</c:choose>
									</c:otherwise>
									</c:choose>
									<li><a href="#" onclick="form_submit(${next})">&raquo;</a></li>
									<li><a href="#" onclick="form_submit(${allPages})">末页</a></li>
								</ul>
							</div>
										</div>
										</form>
										<!-- /widget -->
										
										<div class="tab-pane" id="2">
											<form action="addjob" id="edit-profile2"
												onsubmit="return job_validate()" class="form-horizontal"
												method="post" />
											<fieldset>
												<div class="control-group">
													<label class="control-label" for="accountusername">岗位名称</label>
													<div class="controls">
														<input type="text" name="job.jname" class="input-large"
															id="jname" value="${job.jname}" />
													</div>
												</div>
												<div class="control-group">
													<label class="control-label" for="emailserver">岗位类型</label>
													<div class="controls">
														<select name="job.type">
															<option value="管理">管理</option>
															<option value="技术">技术</option>
															<option value="营销">营销</option>
															<option value="市场">市场</option>
															<option value="其他">其他</option>
														</select>
													</div>
												</div>
												<div class="control-group">
													<label class="control-label" for="accountpassword">编制人数</label>
													<div class="controls">
														<input type="text" name="job.count" class="input-large"
															id="count" value="${job.count}" />
													</div>
												</div>
												<br />
												<div class="form-actions">
													<button type="submit" class="btn btn-primary">确认添加</button>
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
	<script type="text/javascript">
		function form_submit(pageNo){
	  		$("#form_table").attr("action","${pageContext.request.contextPath}/showAllJob?pageNo="+pageNo);
	  		$("#form_table").submit();
		}
		/* 重置调动表单中多条件清空输入框内容 */
		function reset_form(){
			$("#job_id").val("");
			$("#job_name").val("");
			$("#job_type").val("");
		}
		
</script>

	<script src="./js/bootstrap.js"></script>

</body>
</html>
