<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body>
    This is my JSP page. <br>
    <a href="test">用于测试是否搭建成功：点击链接查询answerWeb数据库中的test表</a>
    <form action="user/login" method="post">
    	<input name="email" value="" type="text">
    	<input name="password" value="" type="text">
    	<input type="submit" value="提交">
    </form>
    <c:if test="${not empty loginerror}">登录失败</c:if>
	<c:if test="${not empty validationerror}">
		<a href="${userno}/sendValidatorEmail" >未通过验证，请点击获取验证邮件</a>
	</c:if>
	<div>
		<a href="${pageContext.request.contextPath }/yuantest/register.jsp">注册</a>
	</div>
	<div>
		<form action="${pageContext.request.contextPath }/user/findpassword" method="post">
			找回密码：请输入邮箱
			<input type="text" name="email">
			<input type="submit" value="提交">
		</form>
	</div>
		
	<div>
		<a href="${pageContext.request.contextPath}/yuantest/answer.jsp" >获取题目类型</a>
	</div>

  </body>
</html>
