<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>找回密码</title>
    
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
	<div class="box">
		<div class="text1">
			找回密码
		</div>
		<div class="text2">
			请输入你的注册邮箱，系统将发出一封验证邮件，通过验证邮件就可以重新设置密码了
		</div>
		<div class="form">
			<form action="#" method="post">
				<div class="input">
					<input  type="email" name="email" placeholder="邮箱" required />
				</div>
				<div class="input">
					<input type="submit" name="submit" value="提交" />
				</div>
			</form>
		</div>
	</div>
</body>
</html>
