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
    
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

  <script type="text/javascript">
  function validEmpty(){
		//  获取输入框的值
		var name = document.getElementById('hirename').value;
		if(name == null || name == '' ){
			alert("员工名称不能为空！");
			return false;
		}
		var sex = document.getElementById('sex').value;
		if(sex == null || sex == '' ){
			alert("性别不能为空！");
			return false;
		}
		var birth = document.getElementById('birthdate').value;
		if(birth == null || birth == '' ){
			alert("生日不能为空！");
			return false;
		}
		var idnum = document.getElementById('idnum').value;
		if(idnum == null || idnum == '' ){
			alert("身份证不能为空！");
			return false;
		}
		var deptid = document.getElementById('deptid').value;
		if(deptid == null || deptid == '' ){
			alert("部门不能为空！");
			return false;
		}
		var jobid = document.getElementById('jobid').value;
		if(jobid == null || jobid == '' ){
			alert("岗位不能为空！");
			return false;
		}
		var workdate = document.getElementById('workdate').value;
		if(workdate == null || workdate == '' ){
			alert("工作日期不能为空！");
			return false;
		}
		var worktype = document.getElementById('worktype').value;
		if(worktype == null || worktype == '' ){
			alert("用工形式不能为空！");
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
			
			<a class="brand" href="./">Adminia Admin</a>
			
			<div class="nav-collapse">
			
				<ul class="nav pull-right">
					<li>
						<a href="#"><span class="badge badge-warning">7</span></a>
					</li>
					
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
							<a href="tosingeinfo?empid=${sessionemp.empid}">我的资料</a> 
						</span>
					
					</div> <!-- /account-details -->
				
				</div> <!-- /account-container -->
				
				<hr />
				
				<ul id="main-nav" class="nav nav-tabs nav-stacked">
					
					<li class="active">
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
				

				
				<div class="row">
					
					<div class="span9">
				
						
									
						<div class="widget-header">
							<i class="icon-th-list"></i>
							<h3>员工管理</h3>
						</div> <!-- /widget-header -->
							<div class="widget-content">
								
								
								
								<div class="tabbable">
						<ul class="nav nav-tabs">
						  <li <s:if test="toid==0">class="active"</s:if>>
						    <a href="#1" data-toggle="tab">员工信息</a>
						  </li>
						  <li <s:if test="toid==1">class="active"</s:if>><a href="#2" data-toggle="tab">添加员工</a></li>
						  <li <s:if test="toid==2">class="active"</s:if>><a href="#3" data-toggle="tab">员工调动</a></li>
						</ul>
						
						<br />
						
							<div class="tab-content" id="all">
								<div class="tab-pane <s:if test="toid==0">active</s:if>" id="1">
								<form id="empform" class="form-horizontal form-inline" method="post" action="queryallemp">
								<div class="form-group controls-row">
												<label>员工编号：</label> <input id="emp_form_empid" type="text" name="example.empid"
													value="${example.empid }" class="span1 " style="height:25px">
												<label>员工姓名：</label> <input id="emp_form_empName" type="text" name="example.ename"
													value="${example.ename }" class="span1" style="height:25px">
													<label>员工部门：</label>
												<select  id="emp_form_dept" class="input-small disabled" name="finddeptid">
													<option <c:if test="${finddeptid==0}">selected</c:if>></option>
												    <c:forEach var="dept" items="${deptList}">
												        <option value="${dept.deptid}" <c:if test="${dept.deptid == finddeptid}">selected</c:if>>${dept.dname}</option>
												    </c:forEach>
												</select>
												<label>岗位：</label> 
												<select id="emp_form_job" class="input-small disabled" name="findjobid">
													<option <c:if test="${findjobid==0}">selected</c:if>></option>
												    <c:forEach var="job" items="${jobList}">
												        <option value="${job.jobid}" <c:if test="${job.jobid == findjobid}">selected</c:if>>${job.jname}</option>
												    </c:forEach>
												</select>
												<label>用工形式：</label>
												<select id="emp_form_worktype" class="input-small disabled" name="example.worktype">
													<option <s:if test='example.worktype==""'>selected</s:if>></option>
												    <option value="正式员工" <s:if test='example.worktype== "正式员工"'>selected</s:if>>正式员工</option>
												    <option value="临时员工" <s:if test='example.worktype== "临时员工"'>selected</s:if>>临时员工</option>
												    <option value="离职" <s:if test='example.worktype== "离职"'>selected</s:if>>离职</option>
												</select>
												<button type="submit" class="btn btn-info">查询</button>
												<button type="button" class="btn btn-success" onclick="reset_emp_form()">重置</button>
											</div>
						<table class="table table-striped table-bordered">
							<thead>
								<tr>
									<th>员工编号</th>
									<th>员工姓名</th>
									<th>性别</th>
									<th>部门</th>
									<th>岗位</th>
									<th>状态</th>
									<th style="width:100px">操作</th>
								</tr>
							</thead>
							
							<tbody>
							  <s:iterator value="empList" status="state">
							    <tr>
									<td><s:property value="empid"/></td>
									<td><s:property value="ename"/></td>
									<td><s:property value="sex"/></td>
									<td><s:property value="dept.dname"/></td>
									<td><s:property value="job.jname"/></td>
									<td><s:property value="worktype"/></td>
									<td class="action-td">
										<s:if test="worktype!='离职'">
										  <div>
											<%-- <a href="${pageContext.request.contextPath}/tosingeinfo?empid=<s:property value="empid"/>" class="btn btn-small btn-warning">
												<i class="icon-ok"></i>								
											</a>
											<a href="${pageContext.request.contextPath}/tofireemp?empid=<s:property value="empid"/>" class="btn btn-small">
												<i class="icon-remove"></i>
											</a> --%>
											<a class="btn btn-default btn-small" href="${pageContext.request.contextPath}/tosingeinfo?empid=<s:property value="empid"/>">详细</a>
											<a class="btn btn-danger btn-small" href="${pageContext.request.contextPath}/tofireemp?empid=<s:property value="empid"/>">离职</a>
										  </div>
										</s:if>
										<s:if test="worktype=='离职'">
										  <div style="float :left">
											<a href="${pageContext.request.contextPath}/queryleaveinfo?empid=<s:property value="empid"/>" class="btn btn-default">
											详细
											</a>
									     </div>
										</s:if>
									</td>
								</tr>
							  </s:iterator>
							</tbody>
						</table>
						
					<%-- 
					原分页信息
					<div style="float :right">
					<a href="#" onclick="form_submitemp(${prev})">上一页</a></li>
					<a href="#" onclick="form_submitemp(${next})">下一页</a></li>
					</div> --%>
					</form>
					<!-- 分页信息 -->
									<%-- 				<div class="pagination pagination-centered">
														<ul>
															<li><a href="#" onclick="form_submitemp(1)">首页</a></li>
															<li><a href="#" onclick="form_submitemp(${prev})">上一页</a></li>
															<c:choose>
																<c:when test="${allPages <=5}">
																	<li><a href="#" onclick="form_submitemp(1)">1</a></li>
																	<li><a href="#" onclick="form_submitemp(2)">2</a></li>
																	<li><a href="#" onclick="form_submitemp(3)">3</a></li>
																	<li><a href="#" onclick="form_submitemp(4)">4</a></li>
																	<li><a href="#" onclick="form_submitemp(5)">5</a></li>
																</c:when>
																<c:otherwise>
																	<li><a href="#" onclick="form_submitemp(1)">1</a></li>
																	<li><a href="#" onclick="form_submitemp(2)">2</a></li>
																	<li><a href="#" onclick="form_submitemp(3)">3</a></li>
																	<li><a href="#" onclick="form_submitemp(4)">4</a></li>
																	<li><a href="#" onclick="form_submitemp(5)">5</a></li>
																</c:otherwise>
															</c:choose>
															<li><a href="#" onclick="form_submitemp(${next})">下一页</a></li>
															<li><a href="#" onclick="form_submitemp(${allPages})">尾页</a></li>
														</ul>
													</div> --%>
				
				<div class="pagination pagination-centered">
					<ul>
						<li><a href="#" onclick="form_submitemp(1)">首页</a></li>
						<li><a href="#" onclick="form_submitemp(${pageNo-1})">&laquo;</a></li>
						<c:choose>
						<c:when test="${allPages <=5}">
						<c:forEach begin="1" end="${allPages }" varStatus="status">
										<li><a <c:if test="${pageNo == status.index  }">style="color:black"</c:if> href="#" onclick="form_submitemp(${status.index})">${status.index }</a></li>
						</c:forEach>
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${pageNo < 4 }">
									<c:forEach begin="1" end="5" varStatus="status">
										<li><a <c:if test="${pageNo == status.index  }">style="color:black"</c:if> href="#" onclick="form_submitemp(${status.index})">${status.index }</a></li>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<c:choose>
										<c:when test="${pageNo+2 >=allPages }">
											<c:forEach begin="${allPages-4 }" end="${allPages }" varStatus="status">
												<li><a <c:if test="${pageNo == status.index  }">style="color:black"</c:if> href="#" onclick="form_submitemp(${status.index})">${status.index }</a></li>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<c:forEach begin="${pageNo-2 }" end="${pageNo+2 }" varStatus="status">
												<li><a <c:if test="${pageNo == status.index  }">style="color:black"</c:if>href="#" onclick="form_submitemp(${status.index})">${status.index }</a></li>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</c:otherwise>
							</c:choose>
						</c:otherwise>
						</c:choose>
						<li><a href="#" onclick="form_submitemp(${pageNo+1})">&raquo;</a></li>
						<li><a href="#" onclick="form_submitemp(${allPages})">末页</a></li>
					</ul>
				</div>
				
				
				</div> <!-- /widget -->
							
								<div class="tab-pane <s:if test="toid==1">active</s:if>" id="2">
									<form action="hireemp" class="form-horizontal" method="post" />
									<fieldset>
										<input type="hidden" name="resid" value="<s:property value="humres.resid"/>"/>
										<div class="control-group">
											<label class="control-label">姓名</label>
											<div class="controls">
												<input type="text" name="hireinfo.ename" id="hirename" class="input-medium"  value="<s:property value="humres.ename"/>" style="height:25px"/>
												
												<a href="${pageContext.request.contextPath}/tohumanlist"><input type=button value="从人才库选择"></a>
											</div> <!-- /controls -->
										</div>
										<div class="control-group">
											<label class="control-label">性别</label>
											<div class="controls">
												<select class="input-medium disabled" id="sex" name="hireinfo.sex">
												    <option <s:if test='humres.sex == "男"'>selected</s:if> value="男">男</option>
												    <option <s:if test='humres.sex == "女"'>selected</s:if> value="女">女</option>
												</select>
											</div> <!-- /controls -->				
										</div> <!-- /control-group -->
										
										<div class="control-group">
											<label class="control-label">生日</label>
											<div class="controls">
												<input class="input-medium disabled" id="birthdate" type="date" name="hireinfo.birthdate" value="<s:property value="humres.birthdate"/>"/>
											</div> <!-- /controls -->
										</div> <!-- /control-group -->
										
										<div class="control-group">
											<label class="control-label">身份证</label>
											<div class="controls">
												<input type="text" class="input-medium" id="idnum" name="hireinfo.identnum" value="<s:property value="humres.identnum"/>" style="height:25px"/>
											</div> <!-- /controls -->
										</div>
										
										<div class="control-group">
											<label class="control-label">部门</label>
											<div class="controls">
												<select class="input-medium disabled" id="deptid" name="deptid">
													<option></option>
												    <c:forEach var="dept" items="${deptList}">
												        <option value="${dept.deptid}">${dept.dname}</option>
												    </c:forEach>
												</select>
											</div> <!-- /controls -->
										</div>
										
										<div class="control-group">
											<label class="control-label">岗位</label>
											<div class="controls">
												<select class="input-medium disabled" id="jobid" name="jobid">
													<option></option>
												    <c:forEach var="job" items="${jobList}">
												        <option value="${job.jobid}">${job.jname}</option>
												    </c:forEach>
												</select>
											</div> <!-- /controls -->
										</div>
										
										<div class="control-group">
											<label class="control-label">参加工作日期</label>
											<div class="controls">
												<input class="input-medium disabled" id="workdate" type="date" name="hireinfo.workdate" />
											</div> <!-- /controls -->
										</div>
										
										<div class="control-group">
											<label class="control-label">用工形式</label>
											<div class="controls">
												<select class="input-medium disabled" id="worktype" name="hireinfo.worktype">
													<option></option>
												    <option value="正式员工">正式员工</option>
												    <option value="临时员工">临时员工</option>
												</select>
											</div> <!-- /controls -->
										</div>
										
										<div class="control-group">
											<label class="control-label">人员来源</label>
											<div class="controls">
												<select class="input-medium disabled" name="hireinfo.res">
												    <option value="校园招聘">校园招聘</option>
												    <option value="社会招聘">社会招聘</option>
												    <option value="其他">其他</option>
												</select>
											</div> <!-- /controls -->
										</div>
										
										<div class="control-group">
											<label class="control-label">政治面貌</label>
											<div class="controls">
												<select class="input-medium disabled" name="hireinfo.polstatus">
												    <option <s:if test='humres.polstatus == "党员"'>selected</s:if> value="党员">党员</option>
												    <option <s:if test='humres.polstatus == "预备党员"'>selected</s:if> value="预备党员">预备党员</option>
												    <option <s:if test='humres.polstatus == "团员"'>selected</s:if> value="团员">团员</option>
												    <option <s:if test='humres.polstatus == "其他"'>selected</s:if> value="其他">其他</option>
												</select>
											</div> <!-- /controls -->
										</div> <!-- /control-group -->
										
										<div class="control-group">
											<label class="control-label">民族</label>
											<div class="controls">
												<input type="text" class="input-medium" name="hireinfo.nation" value="<s:property value="humres.nation"/>" style="height:25px"/>
											</div> <!-- /controls -->
										</div> <!-- /control-group -->
										
										<div class="control-group">
											<label class="control-label">籍贯</label>
											<div class="controls">
												<input type="text" class="input-medium" name="hireinfo.navplace" value="<s:property value="humres.navplace"/>" style="height:25px"/>
											</div> <!-- /controls -->
										</div> <!-- /control-group -->
										
										<div class="control-group">
											<label class="control-label">联系电话</label>
											<div class="controls">
												<input type="text" class="input-medium" name="hireinfo.tel" value="<s:property value="humres.tel"/>" style="height:25px"/>
											</div> <!-- /controls -->
										</div> <!-- /control-group -->
										
										<div class="control-group">
											<label class="control-label">电子邮件</label>
											<div class="controls">
												<input type="text" class="input-medium" name="hireinfo.email" value="<s:property value="humres.email"/>" style="height:25px"/>
											</div> <!-- /controls -->
										</div> <!-- /control-group -->
										
										<div class="control-group">
											<label class="control-label">身高</label>
											<div class="controls">
												<input type="text" class="input-medium" name="hireinfo.height" value="<s:property value="humres.height"/>" style="height:25px"/>
											</div> <!-- /controls -->
										</div> <!-- /control-group -->
										
										<div class="control-group">
											<label class="control-label">血型</label>
											<div class="controls">
												<select class="input-medium disabled" name="hireinfo.booldtype">
												    <option <s:if test='humres.booldtype == "A"'>selected</s:if> value="A">A</option>
												    <option <s:if test='humres.booldtype == "B"'>selected</s:if> value="B">B</option>
												    <option <s:if test='humres.booldtype == "AB"'>selected</s:if> value="AB">AB</option>
												    <option <s:if test='humres.booldtype == "O"'>selected</s:if> value="O">O</option>
												    <option <s:if test='humres.booldtype == "other"'>selected</s:if> value="other">other</option>
												</select>
											</div> <!-- /controls -->
										</div> <!-- /control-group -->
										
										<div class="control-group">
											<label class="control-label">婚姻情况</label>
											<div class="controls">
												<select class="input-medium disabled" name="hireinfo.marry">
												    <option <s:if test='humres.marry == "未婚"'>selected</s:if> value="未婚">未婚</option>
												    <option <s:if test='humres.marry == "已婚"'>selected</s:if> value="已婚">已婚</option>
												    <option <s:if test='humres.marry == "丧偶"'>selected</s:if> value="丧偶">丧偶</option>
												    <option <s:if test='humres.marry == "离婚"'>selected</s:if> value="离婚">离婚</option>
												</select>
											</div> <!-- /controls -->
										</div> <!-- /control-group -->
										
										<div class="control-group">
											<label class="control-label">最高学历</label>
											<div class="controls">
												<select class="input-medium disabled" name="hireinfo.recschool">
												    <option <s:if test='humres.recschool == "高中及以下"'>selected</s:if> value="高中及以下">高中及以下</option>
												    <option <s:if test='humres.recschool == "大专"'>selected</s:if> value="大专">大专</option>
												    <option <s:if test='humres.recschool == "本科"'>selected</s:if> value="本科">本科</option>
												    <option <s:if test='humres.recschool == "研究生"'>selected</s:if> value="研究生">研究生</option>
												</select>
											</div> <!-- /controls -->
										</div> <!-- /control-group -->
										
										<div class="control-group">
											<label class="control-label">毕业学校</label>
											<div class="controls">
												<input type="text" class="input-medium" name="hireinfo.school" value="<s:property value="humres.school"/>" style="height:25px"/>
											</div> <!-- /controls -->
										</div> <!-- /control-group -->
										
										<div class="control-group">
											<label class="control-label">所学专业</label>
											<div class="controls">
												<input type="text" class="input-medium" name="hireinfo.major" value="<s:property value="humres.major"/>" style="height:25px"/>
											</div> <!-- /controls -->
										</div> <!-- /control-group -->
										
										<div class="control-group">
											<label class="control-label">毕业日期</label>
											<div class="controls">
												<input class="input-medium disabled" type="date" name="hireinfo.graddate" value="<s:property value="humres.graddate"/>" />
											</div> <!-- /controls -->
											<s:actionerror/><div style="color: red">${msg}</div>
										</div> <!-- /control-group -->
										
										
											
										<div class="form-actions">
											<button type="submit" class="btn btn-primary"  onclick="return validEmpty()">雇用</button> 
											
										</div> <!-- /form-actions -->
									</fieldset>
								</form>
								</div>
								
								<div class="tab-pane <c:if test="${toid == 2}" >active</c:if>"
									id="3">
									<div class="widget widget-table">
										<form id="form_table" class="form-inline"
											action="${pageContext.request.contextPath}/getAllEmpDeptJob"
											method="POST">

											<div class="form-group controls-row">
												<label>员工编号：</label> <input id="empid" type="text" name="empid"
													value="${empid }" class="span1 " style="height:25px">
												<label>姓名：</label> <input id="empName" type="text" name="empName"
													value="${empName }" class="span2" style="height:25px"	>
												
												<label class="control-label">岗位</label>
													<select class="input-small disabled" id="jobName" name="jobName">
														<option></option>
													    <c:forEach var="job" items="${jobList}">
													        <option value="${job.jname}" <c:if test="${job.jname == jobName}">selected</c:if>>${job.jname}</option>
													    </c:forEach>
													</select>

	
												<label class="control-label">部门</label>
												
													<select class="input-small disabled" id="deptName" name="deptName">
														<option></option>
													    <c:forEach var="dept" items="${deptList}">
													        <option value="${dept.dname}" <c:if test="${dept.dname == deptName}">selected</c:if>>${dept.dname}</option>
													    </c:forEach>
													</select>
												

										
											
													
													
												<button type="button" class="btn btn-info" onclick="form_submit(1)">查询</button>
												<button type="button" class="btn btn-success" onclick="reset_form()">重置</button>
											</div>



											<div class="widget-content">
												<table class="table table-striped table-bordered">
													<thead>
														<tr>
															<th>员工编号</th>
															<th>员工姓名</th>
															<th>岗位</th>
															<th>部门</th>
															<th style="text-align: center;">调动</th>
														</tr>
													</thead>

													<tbody>
														<s:iterator value="list1" status="state">
															<tr>
																<td><s:property value="empid" /></td>
																<td><s:property value="ename" /></td>
																<td><s:property value="job.jname" /></td>
																<td><s:property value="dept.dname" /></td>
																<td class="action-td">
																<div class="btn-group">
																				<button type="button"
																					class="btn btn-default  dropdown-toggle"
																					data-toggle="dropdown" aria-haspopup="true"
																					aria-expanded="false">
																					调动 <span class="caret"></span>
																				</button>
																				<ul class="dropdown-menu">
																					<li><a href="${pageContext.request.contextPath}/AdjustEmpDeptJob?empid=<s:property value="empid"/>&pageNo1=${pageNo1}&toid=2&adjustid=1">部门调动</a></li>
																					<li role="separator" class="divider"></li>
																					<li><a href="${pageContext.request.contextPath}/AdjustEmpDeptJob?empid=<s:property value="empid"/>&pageNo1=${pageNo1}&toid=2&adjustid=2">岗位调动</a></li>
																				</ul>
																			</div>
																	</td>
															</tr>
														</s:iterator>
														
														
													</tbody>
												</table>
											</div>
											<!-- /widget-content -->
											<!-- 分页信息 -->
											<%-- <div class="pagination pagination-centered">
												<ul>
													<li><a href="#" onclick="form_submit(1)">首页</a></li>
													<li><a href="#" onclick="form_submit(${prev1})">上一页</a></li>
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
													<li><a href="#" onclick="form_submit(${next1})">下一页</a></li>
													<li><a href="#" onclick="form_submit(${allPages1})">尾页</a></li>
												</ul>
											</div> --%>
											<div class="pagination pagination-centered">
								<ul>
									<li><a href="#" onclick="form_submit(1)">首页</a></li>
									<li><a href="#" onclick="form_submit(${prev1})">&laquo;</a></li>
									<c:choose>
									<c:when test="${allPages1 <=5}">
									<c:forEach begin="1" end="${allPages1 }" varStatus="status">
													<li><a <c:if test="${pageNo1 == status.index  }">style="color:black"</c:if> href="#" onclick="form_submit(${status.index})">${status.index }</a></li>
									</c:forEach>
									</c:when>
									<c:otherwise>
										<c:choose>
											<c:when test="${pageNo1 < 4 }">
												<c:forEach begin="1" end="5" varStatus="status">
													<li><a <c:if test="${pageNo1 == status.index  }">style="color:black"</c:if> href="#" onclick="form_submit(${status.index})">${status.index }</a></li>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<c:choose>
													<c:when test="${pageNo1+2 >=allPages }">
														<c:forEach begin="${allPages-4 }" end="${allPages1 }" varStatus="status">
															<li><a <c:if test="${pageNo == status.index  }">style="color:black"</c:if> href="#" onclick="form_submit(${status.index})">${status.index }</a></li>
														</c:forEach>
													</c:when>
													<c:otherwise>
														<c:forEach begin="${pageNo1-2 }" end="${pageNo1+2 }" varStatus="status">
															<li><a <c:if test="${pageNo1 == status.index  }">style="color:black"</c:if>href="#" onclick="form_submit(${status.index})">${status.index }</a></li>
														</c:forEach>
													</c:otherwise>
												</c:choose>
											</c:otherwise>
										</c:choose>
									</c:otherwise>
									</c:choose>
									<li><a href="#" onclick="form_submit(${next1})">&raquo;</a></li>
									<li><a href="#" onclick="form_submit(${allPages1})">末页</a></li>
								</ul>
							</div>
										</form>
									</div>
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
		<p>&copy; 2012 Go Ideate.</p>
	</div> <!-- /container -->
	
</div> <!-- /footer -->


    

<!-- Le javascript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<!-- 
<script src="./js/jquery-1.7.2.min.js"></script>


<script src="./js/bootstrap.js"></script>
	<script src="./js/excanvas.min.js"></script>
	<script src="./js/jquery.flot.js"></script>
	<script src="./js/jquery.flot.pie.js"></script>
	<script src="./js/jquery.flot.orderBars.js"></script>
	<script src="./js/jquery.flot.resize.js"></script>
	<script src="./js/bootstrap.js"></script>
	<script src="./js/charts/bar.js"></script>
 -->	
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
	  		$("#form_table").attr("action","${pageContext.request.contextPath}/queryallemp?pageNo1="+pageNo+"&toid=2");
	  		$("#form_table").submit();
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
		/* 重置员工表单多条件输入框内容*/
		function reset_emp_form(){
			$("#emp_form_empid").val("");
			$("#emp_form_empName").val("");
			$("#emp_form_dept option:first").attr("selected","selected"); 
			$("#emp_form_job option:first").attr("selected","selected"); 
			$("#emp_form_worktype option:first").attr("selected","selected"); 
		}
		
	</script>
  </body>
</html>
