<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>题目</title>
<script src="${pageContext.request.contextPath}/js/vue.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.js"></script>
</head>
<body>
${param.typeno }
<button onclick="sys()">ss</button>


</body>



<script type="text/javascript">
	$(function(){
		$.ajax({
			url: "${pageContext.request.contextPath}/user/getQuestion/" + ${param.typeno},
			success: function(data){
				console.log(data.question);
				console.log(data.question[0].question.constatus);
			}
		});
	});
</script>

</html>