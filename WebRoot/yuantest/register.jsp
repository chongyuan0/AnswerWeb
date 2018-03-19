<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册</title>
</head>
<body>

	<form action="${pageContext.request.contextPath}/user/register" method="post">
		用户名：<input type="text" name="username" value=""><br/>
		密码：<input type="password" name="password" value=""><br/>
		确认密码：<input type="password" name="confirmpass"><br/>
		邮箱：<input type="text" name="email"><br/>
		<input type="submit" value="注册"> 
	</form>

</body>
</html>