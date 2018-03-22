<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>部门列表</title>
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <link href="./css/bootstrap.min.css" rel="stylesheet" />
    <link href="./css/bootstrap-responsive.min.css" rel="stylesheet" />
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600" rel="stylesheet" />
    <link href="./css/font-awesome.css" rel="stylesheet" />
    <link href="./css/adminia.css" rel="stylesheet" /> 
    <link href="./css/adminia-responsive.css" rel="stylesheet" />
    <link href="./css/pages/dashboard.css" rel="stylesheet" />
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  
<script>
function deleteDeptById(deptid) {
	//弹删除确认框:  确认，取消
	if(window.confirm("确认要删除该部门吗？")){
		//提交删除的请求        toUpdate?auctionId=105
		window.location = "${pageContext.request.contextPath}/deleteDeptById?deptid="+deptid;
	}
}
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
	return true;
}
</script>
</head>

<body>
	
<div class="navbar navbar-fixed-top">
	<div class="navbar-inner">
		<div class="container">
			<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"> 
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span>
			</a>
			<a class="brand" href="./">管理部门</a>
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
					<li>
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
					<li class="active">
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
						<ul class="nav nav-tabs">
						  <li <s:if test="toid==0">class="active"</s:if>><a href="#1" data-toggle="tab">部门调动记录</a></li>
						  <li <s:if test="toid==1">class="active"</s:if>><a href="#2" data-toggle="tab">岗位调动记录</a></li>
						</ul>
						<br />
							<div class="tab-content">
								<div class="tab-pane <s:if test="toid==0">active</s:if>" id="1">
						<form action="getalladjustinfo?toid=0" method="post" id="form_tabledept">
									<div class="widget-content">
					
						<table class="table table-striped table-bordered">
							<thead>
								<tr>
									<th>调动编号</th>
									<th>员工姓名</th>
									<th>调转部门</th>
									<th>调转类型</th>
									<th>调转原因</th>
									<th>调转日期</th>
								</tr>
							</thead>
							
							<tbody>
							  <s:iterator value="listAdjustdept" status="state">
								<tr>
									<td><s:property value="adjustid"/></td>
									<td><s:property value="emp.ename"/></td>
									<td><s:property value="dept.dname"/></td>
									<td><s:if test="%{type}">主动调动</s:if><s:else>被动调动</s:else></td>
									<td><s:property value="reason"/></td>
									<td><s:property value="adjustdate"/></td>
								</tr>
							  </s:iterator>
							</tbody>
							
						</table>
						<!-- 分页信息 -->
						<%-- <div class="pagination pagination-centered">
							<ul>
								<li><a href="#" onclick="form_submitdept(1)">首页</a></li>
								<li><a href="#" onclick="form_submitdept(${prev1})">上一页</a></li>
								<c:choose>
									<c:when test="${allPages <=5}">
										<li><a href="#" onclick="form_submitdept(1)">1</a></li>
										<li><a href="#" onclick="form_submitdept(2)">2</a></li>
										<li><a href="#" onclick="form_submitdept(3)">3</a></li>
										<li><a href="#" onclick="form_submitdept(4)">4</a></li>
										<li><a href="#" onclick="form_submitdept(5)">5</a></li>
									</c:when>
									<c:otherwise>
										<li><a href="#" onclick="form_submitdept(1)">1</a></li>
										<li><a href="#" onclick="form_submitdept(2)">2</a></li>
										<li><a href="#" onclick="form_submitdept(3)">3</a></li>
										<li><a href="#" onclick="form_submitdept(4)">4</a></li>
										<li><a href="#" onclick="form_submitdept(5)">5</a></li>
									</c:otherwise>
								</c:choose>
								<li><a href="#" onclick="form_submitdept(${next})">下一页</a></li>
								<li><a href="#" onclick="form_submitdept(${allPages})">尾页</a></li>
							</ul>
						</div> --%>
						
						<div class="pagination pagination-centered">
								<ul>
									<li><a href="#" onclick="form_submitdept(1)">首页</a></li>
									<li><a href="#" onclick="form_submitdept(${pageNo-1})">&laquo;</a></li>
									<c:choose>
									<c:when test="${allPages <=5}">
									<c:forEach begin="1" end="${allPages }" varStatus="status">
													<li><a <c:if test="${pageNo == status.index  }">style="color:black"</c:if> href="#" onclick="form_submitdept(${status.index})">${status.index }</a></li>
									</c:forEach>
									</c:when>
									<c:otherwise>
										<c:choose>
											<c:when test="${pageNo < 4 }">
												<c:forEach begin="1" end="5" varStatus="status">
													<li><a <c:if test="${pageNo == status.index  }">style="color:black"</c:if> href="#" onclick="form_submitdept(${status.index})">${status.index }</a></li>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<c:choose>
													<c:when test="${pageNo+2 >=allPages }">
														<c:forEach begin="${allPages-4 }" end="${allPages }" varStatus="status">
															<li><a <c:if test="${pageNo == status.index  }">style="color:black"</c:if> href="#" onclick="form_submitdept(${status.index})">${status.index }</a></li>
														</c:forEach>
													</c:when>
													<c:otherwise>
														<c:forEach begin="${pageNo-2 }" end="${pageNo+2 }" varStatus="status">
															<li><a <c:if test="${pageNo == status.index  }">style="color:black"</c:if>href="#" onclick="form_submitdept(${status.index})">${status.index }</a></li>
														</c:forEach>
													</c:otherwise>
												</c:choose>
											</c:otherwise>
										</c:choose>
									</c:otherwise>
									</c:choose>
									<li><a href="#" onclick="form_submitdept(${pageNo+1})">&raquo;</a></li>
									<li><a href="#" onclick="form_submitdept(${allPages})">末页</a></li>
								</ul>
							</div>
						
					
					</div> <!-- /widget-content -->
					</form>
								</div>
						
								<div class="tab-pane <s:if test="toid==1">active</s:if>" id="2">
						<form action="getalladjustinfo?toid=0" method="post" id="form_tablejob">
									<div class="widget-content">
					
						<table class="table table-striped table-bordered">
							<thead>
								<tr>
									<th>调动编号</th>
									<th>员工姓名</th>
									<th>调转部门</th>
									<th>调转类型</th>
									<th>备注</th>
									<th>调转日期</th>
								</tr>
							</thead>
							
							<tbody>
							  <s:iterator value="list1" status="state">
								<tr>
									<td><s:property value="adjustid"/></td>
									<td><s:property value="emp.ename"/></td>
									<td><s:property value="jobid"/></td>
									<td><s:property value="type"/></td>
									<td><s:property value="descr"/></td>
									<td><s:property value="adjustdate"/></td>
								</tr>
							  </s:iterator>
							</tbody>
						</table>
						<!-- 分页信息 -->
						<%-- <div class="pagination pagination-centered">
							<ul>
								<li><a href="#" onclick="form_submitjob(1)">首页</a></li>
								<li><a href="#" onclick="form_submitjob(${prev1})">上一页</a></li>
								<c:choose>
									<c:when test="${allPages1 <=5}">
										<li><a href="#" onclick="form_submitjob(1)">1</a></li>
										<li><a href="#" onclick="form_submitjob(2)">2</a></li>
										<li><a href="#" onclick="form_submitjob(3)">3</a></li>
										<li><a href="#" onclick="form_submitjob(4)">4</a></li>
										<li><a href="#" onclick="form_submitjob(5)">5</a></li>
									</c:when>
									<c:otherwise>
										<li><a href="#" onclick="form_submitjob(1)">1</a></li>
										<li><a href="#" onclick="form_submitjob(2)">2</a></li>
										<li><a href="#" onclick="form_submitjob(3)">3</a></li>
										<li><a href="#" onclick="form_submitjob(4)">4</a></li>
										<li><a href="#" onclick="form_submitjob(5)">5</a></li>
									</c:otherwise>
								</c:choose>
								<li><a href="#" onclick="form_submitjob(${next1})">下一页</a></li>
								<li><a href="#" onclick="form_submitjob(${allPages1})">尾页</a></li>
							</ul>
							</div> --%>
							
							<div class="pagination pagination-centered">
								<ul>
									<li><a href="#" onclick="form_submitjob(1)">首页</a></li>
									<li><a href="#" onclick="form_submitjob(${prev1})">&laquo;</a></li>
									<c:choose>
									<c:when test="${allPages1 <=5}">
									<c:forEach begin="1" end="${allPages1 }" varStatus="status">
													<li><a <c:if test="${pageNo1 == status.index  }">style="color:black"</c:if> href="#" onclick="form_submitjob(${status.index})">${status.index }</a></li>
									</c:forEach>
									</c:when>
									<c:otherwise>
										<c:choose>
											<c:when test="${pageNo1 < 4 }">
												<c:forEach begin="1" end="5" varStatus="status">
													<li><a <c:if test="${pageNo1 == status.index  }">style="color:black"</c:if> href="#" onclick="form_submitjob(${status.index})">${status.index }</a></li>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<c:choose>
													<c:when test="${pageNo1+2 >=allPages1 }">
														<c:forEach begin="${allPages1-4 }" end="${allPages1 }" varStatus="status">
															<li><a <c:if test="${pageNo1 == status.index  }">style="color:black"</c:if> href="#" onclick="form_submitjob(${status.index})">${status.index }</a></li>
														</c:forEach>
													</c:when>
													<c:otherwise>
														<c:forEach begin="${pageNo1-2 }" end="${pageNo1+2 }" varStatus="status">
															<li><a <c:if test="${pageNo1 == status.index  }">style="color:black"</c:if>href="#" onclick="form_submitjob(${status.index})">${status.index }</a></li>
														</c:forEach>
													</c:otherwise>
												</c:choose>
											</c:otherwise>
										</c:choose>
									</c:otherwise>
									</c:choose>
									<li><a href="#" onclick="form_submitjob(${next1})">&raquo;</a></li>
									<li><a href="#" onclick="form_submitjob(${allPages1})">末页</a></li>
								</ul>
							</div>
							
							
							</div>
							</form>
						</div>
						
					</div> <!-- /widget-content -->
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
<!-- Placed at the end of the document so the pages load faster -->
<script src="./js/jquery-1.7.2.min.js"></script>
<script src="./js/excanvas.min.js"></script>
<script src="./js/bootstrap.js"></script>
<script src="./js/charts/bar.js"></script>
<script type="text/javascript">
		function form_submitdept(pageNo){
	  		$("#form_tabledept").attr("action","${pageContext.request.contextPath}/getalladjustinfo?pageNo="+pageNo+"&toid=0");
	  		$("#form_tabledept").submit();
		}
		
		function form_submitjob(pageNo){
	  		$("#form_tablejob").attr("action","${pageContext.request.contextPath}/getalladjustinfo?pageNo1="+pageNo+"&toid=1");
	  		$("#form_tablejob").submit();
		}
		
</script>
  </body>
</html>