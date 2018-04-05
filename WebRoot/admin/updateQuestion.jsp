<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>更新试题信息</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/bootstrap-responsive.min.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/font-awesome.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/adminia.css" rel="stylesheet" /> 
    <link href="${pageContext.request.contextPath}/css/adminia-responsive.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/pages/plans.css" rel="stylesheet" />
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
			<a class="brand" href="./">更改试题信息</a>
			<div class="nav-collapse">
				<ul class="nav pull-right">
					<li class="divider-vertical"></li>
					<li class="dropdown">
						<a data-toggle="dropdown" class="dropdown-toggle " href="#">
							${admins.adminname} <b class="caret"></b>							
						</a>
						
						<ul class="dropdown-menu">
							
							<li>
								<a href="${pageContext.request.contextPath}/admin/changepassword.jsp"><i class="icon-lock"></i> 修改密码</a>
							</li>
							
							<li class="divider"></li>
							
							<li>
								<a href="${pageContext.request.contextPath}/logout"><i class="icon-off"></i> 注销</a>
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
						<img src="${pageContext.request.contextPath}/img/headshot.png" alt="" class="thumbnail" />
					</div>
					<div class="account-details">
						<span class="account-name">${admins.adminname}</span>
						
						<span class="account-role"><c:choose><c:when test="${admins.adminflag == 1}">普通管理员</c:when><c:otherwise>超级管理员</c:otherwise></c:choose></span>
						
						<span class="account-actions">
							<a href="#">我的资料</a> 
						</span>
					</div>
				</div>
				<hr />
				<ul id="main-nav" class="nav nav-tabs nav-stacked">
					<li ><a
							href="${pageContext.request.contextPath}/selectUserByExample"> <i
								class="icon-home"></i> 用户管理
						</a></li>

						<li class="active"><a
							href="${pageContext.request.contextPath}/selectQuestion">
								<i class="icon-th-list"></i> 试题库管理
						</a></li>

						<li><a href="${pageContext.request.contextPath}/selectQuestionType">
								<i class="icon-th-large"></i> 目录管理
						</a></li>

						<li><a
							href="${pageContext.request.contextPath}/logout">
								<i class="icon-signal"></i> 注销
						</a></li>
				</ul>
			</div>

			<div class="span9">
				<div class="row">
					<div class="span9">
						<div class="widget">
							<div class="widget-header">
								<h3>试题基本信息</h3>
							</div>
							<div class="widget-content">
								<div class="tabbable">
							<div class="tab-content">
								<div class="tab-pane active" id="1">
								
								<!-- 下面是表单提交 -->
								
								<form id="edit-profile" class="form-horizontal" action="${pageContext.request.contextPath}/updateQuestionSecond?pn=${pn}" method="post" />
									<fieldset>
										
										<input type="hidden" name="questionno" value="${question.questionno}" />
									
									<div class="control-group">											
											<label class="control-label">题目内容：</label>
											<div class="controls">
											<textarea id="question_content" name="content">
													${question.content }
												</textarea>
											</div>
										</div>
									
										
										<div class="control-group">											
											<label class="control-label">答案详解：</label>
											<div class="controls">
											<textarea id="description" name="description">
													${question.description }
												</textarea>
											</div>
										</div>										
										<div class="control-group">											
											<label class="control-label">试题类型：</label>
											<div class="controls">
											<select id="typeno" 
														class="input-small " name="typeno">
														<option <c:if test="${question.typeno==NULL}">selected</c:if>></option>
														<c:forEach items="${questionTypeList}" var="questionType">
												        <option value="${questionType.typeno }" <c:if test="${question.typeno == questionType.typeno}">selected</c:if>>${questionType.typename}</option>
														</c:forEach>
												</select>
											</div>
										</div>
										<div class="control-group">											
											<label class="control-label">内容类型：</label>
											<div class="controls">
												<select id="constatus"
														class="input-small " name="constatus">
														<option <c:if test="${question.constatus==NULL}">selected</c:if>></option>
												        <option value="1" <c:if test="${question.constatus == 1}">selected</c:if>>文本</option>
												        <option value="2" <c:if test="${question.constatus == 2}">selected</c:if>>图片</option>
												        <option value="3" <c:if test="${question.constatus == 3}">selected</c:if>>视频</option>
												        <option value="4" <c:if test="${question.constatus == 4}">selected</c:if>>语音</option>
												</select>
											</div>
										</div>
										
										<div class="control-group">											
											<label class="control-label">描述类型：</label>
											<div class="controls">
												<select
														id="desstatus" class="input-mini disabled"
														name="desstatus">
														<option <c:if test="${question.desstatus==null}">selected</c:if>></option>
												        <option value="1" <c:if test="${question.desstatus == 1}">selected</c:if>>文本</option>
												        <option value="2" <c:if test="${question.desstatus == 2}">selected</c:if>>图片</option>
												    
												</select> 
											</div>
										</div>	
										
										
									<!-- 候选答案 -->
									<c:forEach items="${optionsList}" var="options" varStatus="status">
										<div class="control-group">											
											<label class="control-label">候选答案${status.count}：</label>
											<div class="controls">
												<input name="optionsList[${status.count-1}].optionsno" value="${options.optionsno }" type="hidden"/>
												<input name="optionsList[${status.count-1}].questionno" value="${options.questionno }" type="hidden"/>
												<textarea name="optionsList[${status.count-1}].content">
													${options.content }
												</textarea>
												<select
														id="" class="input-mini disabled"
														name="optionsList[${status.count-1}].status">
														<option <c:if test="${options.status==null}">selected</c:if>></option>
												        <option value="1" <c:if test="${options.status == 1}">selected</c:if>>正确</option>
												        <option value="0" <c:if test="${options.status == 0}">selected</c:if>>错误</option>
												</select> 
											</div>
										</div>		
									</c:forEach>
										
										</div>									
										<div class="form-actions">
											<input type="submit" class="btn btn-primary" value="提交修改" onclick="return validEmpty()"/>
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
		<p>&copy; 2018 答题系统.</p>
	</div>
</div>
<!-- javascript================================================== -->
<script type="text/javascript">
function validEmpty(){
	//  获取输入框的值
	var name = document.getElementById('question_content').value;
	if(name == null || name == '' ){
		alert("不能为空！");
		return false;
	}
	var tel = document.getElementById('description').value;
	if(tel == null || tel == '' ){
		alert("不能为空！");
		return false;
	}
	var fax = document.getElementById('constatus').value;
	if(fax == null || fax == '' ){
		alert("不能为空！");
		return false;
	}
	var fax = document.getElementById('desstatus').value;
	if(fax == null || fax == '' ){
		alert("不能为空！");
		return false;
	}
	var fax = document.getElementById('typeno').value;
	if(fax == null || fax == '' ){
		alert("不能为空！");
		return false;
	}
	
	return true;
}
</script>

<script src="${pageContext.request.contextPath}/js/jquery-1.7.2.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/js/WebCalendar.js" type="text/javascript"></script>
  </body>
</html>
