<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>个人信息</title>
<meta name="description"
	content="MSUI: Build mobile apps with simple HTML, CSS, and JS components.">
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<link rel="shortcut icon" href="/favicon.ico">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no">

<!-- Google Web Fonts -->

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/sm.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/sm-extend.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/pages/demos.css">

<link rel="apple-touch-icon-precomposed"
	href="/assets/img/apple-touch-icon-114x114.png">
<script src="${pageContext.request.contextPath }/js/zepto.js"></script>
<script src="${pageContext.request.contextPath }/js/config.js"></script>


</head>
<body>
	<div class="page-group">
		<div id="page-icon-input" class="page">
			<header class="bar bar-nav">
				<a class="button button-link button-nav pull-left back"
					href="/demos/form"> <span class="icon icon-left"></span> 返回
				</a>
				<h1 class="title">个人信息</h1>
			</header>
			<div class="content">
				<div class="list-block">
					<ul>
						<!-- Text inputs -->
						<li>
							<div class="item-content">
								<div class="item-media">
									<i class="icon icon-form-name"></i>
								</div>
								<div class="item-inner">
									<div class="item-input">
										<input type="text" placeholder="Your name"
											value="${weChatUser.nickname}">
									</div>
								</div>
							</div>
						</li>
						<!-- 	<li>
							<div class="item-content">
								<div class="item-media">
									<i class="icon icon-form-email"></i>
								</div>
								<div class="item-inner">
									<div class="item-input">
										<input type="email" placeholder="E-mail">
									</div>
								</div>
							</div>
						</li> -->

						<li>
							<div class="item-content">
								<div class="item-media">
									<i class="icon icon-form-gender"></i>
								</div>
								<div class="item-inner">
									<div class="item-input">
										<select>

											<option
												<c:if test="${weChatUser.sex == '男' }">selected</c:if>>Male</option>
											<option
												<c:if test="${weChatUser.sex == '女' }">selected</c:if>>Female</option>
										</select>
									</div>
								</div>
							</div>
						</li>
						<!-- Date -->
						<li>
							<div class="item-content">
								<div class="item-media">
									<i class="icon icon-form-calendar"></i>
								</div>
								<div class="item-inner">
									<div class="item-input">
										<input type="text" id='city-picker' value="广东 湛江 赤坎区" />
										<!-- <input type="date" placeholder="Birth day" value="2014-04-30"> -->
									</div>
								</div>
							</div>
						</li>


					</ul>
				</div>
				<div class="content-block" style="text-align: center;">
					<div class="row">
						<div class="col-50">
							<a href="javascript:history.back();"
								class="button button-big button-fill button-danger">取消</a>
						</div>
						<div class="col-50">
							<a href="#" class="button button-big button-fill button-success">提交</a>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
	<script src="${pageContext.request.contextPath }/js/sm.js"></script>
	<script src="${pageContext.request.contextPath }/js/sm-extend.js"></script>
	<script src="${pageContext.request.contextPath }/js/sm-city-picker.js"></script>
	<script src="${pageContext.request.contextPath }/js/demos.js"></script>
	<script type="text/javascript">
		$("#city-picker").cityPicker({
			toolbarTemplate : '<header class="bar bar-nav">\
	    <button class="button button-link pull-right close-picker">确定</button>\
	    <h1 class="title">选择居住地址</h1>\
	    </header>'
		});
	</script>

</body>
</html>
