<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
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

<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet" />
<link href="<%=basePath%>css/bootstrap-responsive.min.css"
	rel="stylesheet" />


<link href="<%=basePath%>css/font-awesome.css" rel="stylesheet" />

<link href="<%=basePath%>css/adminia.css" rel="stylesheet" />
<link href="<%=basePath%>css/adminia-responsive.css" rel="stylesheet" />


<link href="<%=basePath%>css/pages/plans.css" rel="stylesheet" />

<style type="text/css">
table{
 table-layout:fixed;
}
.table tbody tr td{
   overflow: hidden; 
   text-overflow:ellipsis; 
   white-space: nowrap; 
 }
</style>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<script type="text/javascript">
	function validEmpty() {
		//  获取输入框的值
		var content = $("#addQuestion_content").val();
		if(content == null || content == ""){
			alert("content不能为空");
			return false;
		}
		var description = $('#addQuestion_description').val();
		if(description==null||description==''){
			alert('description不能为空');
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

				<a class="btn btn-navbar" data-toggle="collapse"
					data-target=".nav-collapse"> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
				</a> <a class="brand" href="#">答题系统后台管理</a>

				<div class="nav-collapse">

					<ul class="nav pull-right">
						<li><a href="#"></a>
						</li>

						<li class="divider-vertical"></li>

						<li class="dropdown"><a data-toggle="dropdown"
							class="dropdown-toggle " href="#"> ${admins.adminname} <b
								class="caret"></b>
						</a>

							<ul class="dropdown-menu">

								<li><a
									href="${pageContext.request.contextPath}/admin/changepassword.jsp"><i
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

							<span class="account-name">${admins.adminname}</span> <span
								class="account-role"><c:choose>
									<c:when test="${admin.adminflag==1}">普通管理员</c:when>
									<c:otherwise>超级管理员</c:otherwise>
								</c:choose></span> <span class="account-actions"> <a
								href="tosingeinfo?empid=${sessionemp.empid}">我的资料</a>
							</span>

						</div>
						<!-- /account-details -->

					</div>
					<!-- /account-container -->

					<hr />

					<ul id="main-nav" class="nav nav-tabs nav-stacked">

						<li ><a
							href="${pageContext.request.contextPath}/selectUserByExample"> <i
								class="icon-home"></i> 用户管理
						</a></li>

						<li class="active"><a
							href="${pageContext.request.contextPath}/selectQuestion?toid=1">
								<i class="icon-th-list"></i> 试题库管理
						</a></li>

						<li><a href="${pageContext.request.contextPath}/selectQuestionType">
								<i class="icon-th-large"></i> 目录管理
						</a></li>

						<li><a
							href="${pageContext.request.contextPath}/selectRecords">
								<i class="icon-signal"></i> 用户记录管理
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
								<h3>试题库管理</h3>
							</div>
							<!-- /widget-header -->
							<div class="widget-content">

								<div class="tabbable">
									<ul class="nav nav-tabs">
										<li <c:if test="${toid==1}">class="active"</c:if>><a
											href="#1" data-toggle="tab">试题信息</a></li>
										<li <c:if test="${toid==2}">class="active"</c:if>><a
											href="#2" data-toggle="tab">添加试题</a></li>
									</ul>

									<div class="tab-content" id="all">
										<div class="tab-pane <c:if test="${toid == 1}">active</c:if>" 
											id="1">
											<form id="exampleForm" class="form-horizontal form-inline"
												method="post" action="${pageContext.request.contextPath}/selectQuestion?toid=1">
											<div class="form-group controls-row">
													<label>编号：</label> <input id="exampleForm_questionno"
														type="text" name="questionno" value="${question.questionno }"
														class="input-mini" style="height:25px" /> <label>内容类型：</label>
													<select id="exampleForm_constatus" class="input-small" name="constatus">
														<option <c:if test="${question.constatus==null}">selected</c:if>ion>
														<option value="1">文本</option>
														<option value="2">图片</option>
														<option value="4">语音</option>
														<option value="3">视频</option>
													</select>
														
													<label>题目类型：</label> 
												<select id="exampleForm_typeno"  
														class="input-medium " name="typeno">
														<option <c:if test="${question.typeno==NULL}">selected</c:if>></option>
														<c:forEach items="${questionTypeList }" var="questionType">
												        <option value="${questionType.typeno }" <c:if test="${questionType.typeno == question.typeno}">selected</c:if>>${questionType.typename}</option>
														</c:forEach>
												</select>
												
												<button type="submit" class="btn btn-info">查询</button>
												<button type="button" class="btn btn-success"  onclick="reset_exampleForm()">重置</button>
									</div>
									<table class="table table-striped table-bordered">
							<thead>
								<tr>
									<th style="width:6%">编号</th>
									<th style="width:22%">题目内容</th>
									<th style="width:21%">题目描述</th>
									<th style="whdth:8%">内容类型</th>
									<th style="width:21%">答案详解</th>
									<th style="width:10%">题目类别</th>
									<th style="width:12%">操作</th>
								</tr>
							</thead>
							
							<tbody>
							  <c:forEach items="${pageInfo.list}" var="question">
							    <tr>
									<td>${question.questionno}</td>
									<td>${question.content}</td>
									<td>
										${question.description }
									</td>
									<td>
										<c:if test="${question.constatus == 1}">文本</c:if>
										<c:if test="${question.constatus == 2}">图片</c:if>
										<c:if test="${question.constatus == 3}">视频</c:if>
										<c:if test="${question.constatus == 4}">语音</c:if>
									</td>
									<td>
										<c:if test="${question.desstatus == 1}">文本</c:if>
										<c:if test="${question.desstatus == 2}">图片</c:if>
									</td>
									<td>
										<c:forEach items="${questionTypeList}" var="questionType">
											<c:if test="${question.typeno == questionType.typeno }">${questionType.typename}</c:if>
										</c:forEach>
									</td>
									<td class="action-td">
										  <div>
											<a class="btn btn-default btn-small" href="${pageContext.request.contextPath}/updateQuestionFirst?questionno=${question.questionno}&pn=${pageInfo.pageNum}">更新</a>
											<a class="btn btn-danger btn-small" href="${pageContext.request.contextPath}/deleteQuestion?questionno=${question.questionno}&pn=${pageInfo.pageNum}">删除</a>
										  </div>
										
										
									</td>
								</tr>
							  </c:forEach>
										</tbody>
									</table>
					
					</form>
					<!-- 分页信息 --> 
						<div class="pagination pagination-centered">
					<ul>
						<li><a href="#" onclick="form_pagination(1)">首页</a></li>
						<li><a href="#" onclick="form_pagination(${pageInfo.prePage})">&laquo;</a></li>
						<c:choose>
						<c:when test="${pageInfo.pages <=5}">
						<c:forEach begin="1" end="${pageInfo.pages }" varStatus="status">
										<li><a <c:if test="${pageInfo.pageNum == status.index  }">style="color:black"</c:if> href="#" onclick="form_pagination(${status.index})">${status.index }</a></li>
						</c:forEach>
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${pageInfo.pageNum < 4 }">
									<c:forEach begin="1" end="5" varStatus="status">
										<li><a <c:if test="${pageInfo.pageNum == status.index  }">style="color:black"</c:if> href="#" onclick="form_pagination(${status.index})">${status.index }</a></li>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<c:choose>
										<c:when test="${pageInfo.pageNum+2 >=pageInfo.total }">
											<c:forEach begin="${pageInfo.total-4 }" end="${userListPageInfo.total }" varStatus="status">
												<li><a <c:if test="${pageInfo.total == status.index  }">style="color:black"</c:if> href="#" onclick="form_pagination(${status.index})">${status.index }</a></li>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<c:forEach begin="${pageInfo.pageNum-2 }" end="${pageInfo.pageNum+2 }" varStatus="status">
												<li><a <c:if test="${pageInfo.pageNum == status.index  }">style="color:black"</c:if>href="#" onclick="form_pagination(${status.index})">${status.index }</a></li>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</c:otherwise>
							</c:choose>
						</c:otherwise>
						</c:choose>
						
						<li><a href="#" 
						
							<c:if test="${pageInfo.hasNextPage}">onclick="form_pagination(${pageInfo.nextPage})"</c:if>
						<c:if test="${pageInfo.hasNextPage}">onclick="form_pagination(${pageInfo.pages})"</c:if>
						
						>&raquo;</a></li>
						<li><a href="#" onclick="form_pagination(${pageInfo.pages})">末页</a></li>
					</ul>
				</div>		
				
							</div> <!-- /widget -->
							
								<div class="tab-pane <c:if test="${toid==2}">active</c:if>" id="2">
									<!-- 下面是表单提交 -->
								
								<form id="edit-profile" class="form-horizontal" action="${pageContext.request.contextPath}/addQuestion?pn=${pageInfo.pageNum}" method="post" />
									<fieldset>
										
									
									<div class="control-group">											
											<label class="control-label">题目内容：</label>
											<div class="controls">
											<textarea style="overflow-x:hidden" id="addQuestion_content" name="content"></textarea>
											</div>
										</div>
									
										
										<div class="control-group">											
											<label class="control-label">答案详解：</label>
											<div class="controls">
											<textarea style="overflow-x:hidden" id="addQuestion_description" name="description"></textarea>
											</div>
										</div>										
										<div class="control-group">											
											<label class="control-label">试题类型：</label>
											<div class="controls">
											<select id="typeno" 
														class="input-small " name="typeno">
														<c:forEach items="${questionTypeList}" var="questionType">
												        <option value="${questionType.typeno }">${questionType.typename}</option>
														</c:forEach>
												</select>
											</div>
										</div>
										<div class="control-group">											
											<label class="control-label">内容类型：</label>
											<div class="controls">
												<select id="constatus"
														class="input-small " name="constatus">
												        <option value="1" >文本</option>
												        <option value="2" >图片</option>
												        <option value="3" >视频</option>
												        <option value="4" >语音</option>
												</select>
											</div>
										</div>
										
										<div class="control-group">											
											<label class="control-label">描述类型：</label>
											<div class="controls">
												<select
														id="desstatus" class="input-mini disabled"
														name="desstatus">
												        <option value="1" >文本</option>
												        <option value="2" >图片</option>
												    
												</select> 
											</div>
										</div>	
										
										
									<!-- 候选答案 -->
									<c:forEach begin="0" end="3" varStatus="status">
										<div class="control-group">											
											<label class="control-label">候选答案${status.count}：</label>
											<div class="controls">
												<input name="optionsList[${status.count-1}].questionno" value="" type="hidden"/>
												<textarea style="overflow-x:hidden" name="optionsList[${status.count-1}].content">
												
												</textarea>
												<select
														id="" class="input-mini disabled"
														name="optionsList[${status.count-1}].status">
												        <option value="1" >正确</option>
												        <option value="0" >错误</option>
												</select> 
											</div>
										</div>		
									</c:forEach>
										
										<div class="form-actions">
											<input type="submit" class="btn btn-primary" value="添加" onclick="return validEmpty()"/>
										</div>
										</div>									
									</fieldset>
								</form>
								</div>
								
							</div>
						  
						  
						</div>	<!-- tabltable-->
								
							</div> <!-- /widget-content -->
							
						<!--   </div>  /widget -->
						
					</div> <!-- /span9 -->
					
				</div> <!-- /row -->
				
			</div> <!-- /span9 -->
			
			
		</div> <!-- /row -->
		
	</div> <!-- /container -->
	
</div> <!-- /content -->
					
	
<div id="footer">
	
	<div class="container">				
		<hr />
		<p>&copy; 2018  答题系统.</p>
	</div> <!-- /container -->
	
</div> <!-- /footer -->


    


<script src="<%=basePath%>js/jquery-1.7.2.min.js"></script>


<script src="<%=basePath%>js/bootstrap.js"></script>
	<script src="<%=basePath%>js/excanvas.min.js"></script>
	<script src="<%=basePath%>js/jquery.flot.js"></script>
	<script src="<%=basePath%>js/jquery.flot.pie.js"></script>
	<script src="<%=basePath%>js/jquery.flot.orderBars.js"></script>
	<script src="<%=basePath%>js/jquery.flot.resize.js"></script>
	<script src="<%=basePath%>js/bootstrap.js"></script>
	<script src="<%=basePath%>js/charts/bar.js"></script>
	<script src="<%=basePath%>js/jquery-1.7.2.min.js"></script>
	<script src="<%=basePath%>js/excanvas.min.js"></script>
	<script src="<%=basePath%>js/jquery.flot.js"></script>
	<script src="<%=basePath%>js/jquery.flot.pie.js"></script>
	<script src="<%=basePath%>js/jquery.flot.orderBars.js"></script>
	<script src="<%=basePath%>js/jquery.flot.resize.js"></script>
	<script src="<%=basePath%>js/bootstrap.js"></script>
	<script src="<%=basePath%>js/charts/bar.js"></script>
	
	<script type="text/javascript">
		function form_pagination(pageNo){
	  		$("#exampleForm").attr("action","${pageContext.request.contextPath}/selectQuestion?pn="+pageNo+"&toid=1");
	  		$("#exampleForm").submit();
		}
		/* 重置调动表单中多条件清空输入框内容 */
		function reset_form(){
			$("#empid").val("");
			$("#empName").val("");
			$("#deptName").val("");
			$("#jobName").val("");
		}
		function form_submitemp(pageNo){
	  		$("#empform").attr("action","${pageContext.request.contextPath}/queryallemp?pageNo="+pageNo+"&toid=0");
	  		$("#empform").submit();
		}
		/* 重置多条件输入框内容*/
		function reset_exampleForm(){
			$("#exampleForm_questionno").val("");
			$("#exampleForm_constatus").val("");
			$("#exampleForm_typeno option:first").attr("selected","selected"); 
		}
		
	</script>
  </body>
</html>
