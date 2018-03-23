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
						<ul class="nav nav-tabs">
						  <li class="active"><a href="#1" data-toggle="tab">部门列表</a></li>
						  <li><a href="#2" data-toggle="tab">添加部门</a></li>
						</ul>
						<br />
							<div class="tab-content">
								<div class="tab-pane active" id="1">
								
									<form action="loadAllDeptByPage" method="post">
										<input class="input-medium " type="text"
														style="height:25px" name="deptExemple.dname"
														value="${deptExemple.dname }" /> <input
														class="btn btn-info " type="submit" value="按名称查询" />
									</form>
								<form action="" id="form_table" method="post">
									<table class="table table-striped table-bordered">
										<tr>
											<th>部门编号</th>
											<th>部门名称</th>
											<th>部门电话</th>
											<th>部门传真</th>
											<th>部门描述</th>
											<th>创建时间</th>
											<th>部门操作</th>
										</tr>
										<s:iterator value="deptList">
											<tr>
												<td><s:property value="deptid"/></td>
												<td><s:property value="dname"/></td>
												<td><s:property value="tel"/></td>
												<td><s:property value="fax"/></td>
												<td><s:property value="descr"/></td>
												<td>
													<s:date name="builddate" format="yyyy-MM-dd"/>
												</td>
												<td><a class="btn btn-default"
																href="${pageContext.request.contextPath}/updateDeptById.action?deptid=<s:property value="deptid"/>">更新</a>
																<a class="btn btn-danger"
																href="javascript:deleteDeptById(<s:property value="deptid"/>)">删除</a>
															</td>
											</tr>
										</s:iterator>
									</table>
									<div>
										<p style="color:red;font-size:16px;">${message }</p>
									</div>
									<%-- <div>
										【当前第<s:property value="pageNo" />页，共<s:property value="allPages" />页】
										<a href="${pageContext.request.contextPath}/loadAllDeptByPage?pageNo=1">首页</a>
										<a href="${pageContext.request.contextPath}/loadAllDeptByPage?pageNo=<s:property value="prev" />">上页</a>
										<a href="${pageContext.request.contextPath}/loadAllDeptByPage?pageNo=<s:property value="next" />">下页</a>
										<a href="${pageContext.request.contextPath}/loadAllDeptByPage?pageNo=<s:property value="allPages" />">尾页</a>
									</div> --%>
									
									<%-- <div class="pagination pagination-centered" >
																<ul>
																	<li><a href="${pageContext.request.contextPath}/loadAllDeptByPage?pageNo=1">首页</a></li>
																	<li><a href="${pageContext.request.contextPath}/loadAllDeptByPage?pageNo=${prev}">上一页</a></li>
																	<li><a href="${pageContext.request.contextPath}/loadAllDeptByPage?pageNo=1">1</a></li>
																	<li><a href="${pageContext.request.contextPath}/loadAllDeptByPage?pageNo=2">2</a></li>
																	<li><a href="${pageContext.request.contextPath}/loadAllDeptByPage?pageNo=3">3</a></li>
																	<li><a href="${pageContext.request.contextPath}/loadAllDeptByPage?pageNo=4">4</a></li>
																	<li><a href="${pageContext.request.contextPath}/loadAllDeptByPage?pageNo=5">5</a></li>
																	<li><a href="${pageContext.request.contextPath}/loadAllDeptByPage?pageNo=${next}">下一页</a></li>
																	<li><a href="${pageContext.request.contextPath}/loadAllDeptByPage?pageNo=${allPages}">尾页</a></li>
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
								</form>	
								</div>
								<div class="tab-pane" id="2">
									<form id="edit-profile" class="form-horizontal" action="addDept" method="post" />
									<fieldset>
										<div class="control-group">
											<label class="control-label">部门名称</label>
											<div class="controls">
												<input type="text" class="input-medium disabled" id="deptname" name="aldept.dname"/>
											</div>
										</div>
										<div class="control-group">
											<label class="control-label">部门电话</label>
											<div class="controls">
												<input type="text" class="input-medium" id="depttel" name="aldept.tel" />									
											</div>
										</div>
										<div class="control-group">
											<label class="control-label">部门传真</label>
											<div class="controls">
												<input type="text" class="input-medium" id="deptfax" name="aldept.fax" />
											</div>
										</div>
										<div class="control-group">
											<label class="control-label">部门描述</label>
											<div class="controls">
												<textarea  style="height:150px; width:200px" name="aldept.descr" id="deptdescr"></textarea>
											</div>
										</div>
										<div class="form-actions">
											<input type="submit" class="btn btn-primary" value="确认添加" onclick="return validEmpty()" />
										</div>
									</fieldset>
									</form>

									<!-- 表单提交结束 -->
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
		function form_submit(pageNo){
	  		$("#form_table").attr("action","${pageContext.request.contextPath}/loadAllDeptByPage?pageNo="+pageNo);
	  		$("#form_table").submit();
		}
</script>
  </body>
</html>