<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <title>Dashboard - Bootstrap Admin</title>
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />    
    
    <link href="./css/bootstrap.min.css" rel="stylesheet" />
    <link href="./css/bootstrap-responsive.min.css" rel="stylesheet" />
    
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600" rel="stylesheet" />
    <link href="./css/font-awesome.css" rel="stylesheet" />
    
    <link href="./css/adminia.css" rel="stylesheet" /> 
    <link href="./css/adminia-responsive.css" rel="stylesheet" /> 
    
    <link href="./css/pages/dashboard.css" rel="stylesheet" /> 
    

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
			
			<a class="brand" href="./">人事管理系统</a>
			
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
					
						<span class="account-name">${sessionemp.ename}</span>
						
						<span class="account-role"><c:choose><c:when test="${isadmin}">管理员</c:when><c:otherwise>普通员工</c:otherwise></c:choose></span>
						
						<span class="account-actions">
							<a href="${pageContext.request.contextPath}/tosingeinfo?empid=${sessionemp.empid}">我的资料</a> 
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
				
				<hr />
				
				<br />
		
			</div> <!-- /span3 -->
	
			<div class="span9">
				
				<h1 class="page-title">
					<i class="icon-home"></i>
					员工部门信息				
				</h1>
		
				<div class="widget widget-table">
										
					<div class="widget-header">
						<i class="icon-th-list"></i>
						<h3>Table</h3>
						<div style="float :right; vertical-align: middle">
						</div>
					</div> <!-- /widget-header -->
					
					<div class="widget-content">
					<form action="" id="form_table" method="post">
						<table class="table table-striped table-bordered">
							<thead>
								<tr>
									<th>员工编号</th>
									<th>员工姓名</th>
									<th>部门</th>
									<th>岗位</th>
									<th style="text-align: center;">
									<span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
									调动
									</th>
								</tr>
							</thead>
							
							<tbody>
							  <s:iterator value="empList" status="state">
								<s:if test="worktype!='离职'">
							    <tr>
									<td><s:property value="empid"/></td>
									<td><s:property value="ename"/></td>
									<td><s:property value="dept.dname"/></td>
									<td><s:property value="job.jname"/></td>
									<td class="action-td">
											<a href="${pageContext.request.contextPath}/AdjustEmpDeptJob?empid=<s:property value="empid"/>" class="btn btn-small">
											调动
											</a>
									</td>
								</tr>
								</s:if>
							  </s:iterator>
							</tbody>
						</table>
						
					</div> <!-- /widget-content -->
					<div style="float :right">
					<%-- <a href="${pageContext.request.contextPath}/empDeptJobInfo?pageNo=${prev}" class="btn btn-small">
						<i>上一页</i>
					</a>
					<a href="${pageContext.request.contextPath}/empDeptJobInfo?pageNo=${next}" class="btn btn-small">
						<i>下一页</i>
					</a> --%>
					</div>
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
				</form>
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
		<p>&copy;人事管理系统</p>
	</div> <!-- /container -->
	
</div> <!-- /footer -->

<!-- Le javascript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="./js/jquery-1.7.2.min.js"></script>
<script src="./js/excanvas.min.js"></script>
<script src="./js/jquery.flot.js"></script>
<script src="./js/jquery.flot.pie.js"></script>
<script src="./js/jquery.flot.orderBars.js"></script>
<script src="./js/jquery.flot.resize.js"></script>


<script src="./js/bootstrap.js"></script>
<script src="./js/charts/bar.js"></script>
<script type="text/javascript">
	function form_submit(pageNo){
			$("#form_table").attr("action","${pageContext.request.contextPath}/empDeptJobInfo?pageNo="+pageNo);
			$("#form_table").submit();
	}
</script>
  </body>
</html>