<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/index.css"/>
<script src="${pageContext.request.contextPath }/js/jquery-3.2.1.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/vue.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/index.js"></script>

</head>
<body>
	<header>
		<img src="${pageContext.request.contextPath }/resource/images/logo.jpg"/>
		<div class="find">
			<input type="text" placeholder="搜索..." />
			<button></button>
		</div>
	</header>
	<nav>
		<div>
			<div class="">
				<div class="info">
					<ul>
						<li>个人信息</li><b></b>
						<li class="alter" id="alterInfo">信息修改</li>
						<li class="alter" id="alterPsw">密码修改</li>
					</ul>
				</div>				
			</div>
			<div class="user">
				<a href="#">用户名:&nbsp;${sessionScope.user.username }</a>
				<a href="${pageContext.request.contextPath }/user/sigeout" title="退出登录状态">
					<b></b>
					<img src="${pageContext.request.contextPath }/resource/images/Exit.png"/>
				</a>
			</div>
		</div>
	</nav>
	
	<div class="box">
			<div class="box1">
				<div class="box_alterInfo">
					<div class="x">
						<p class="x_p">x</p>
						<div style="clear: both;">
						
						</div>
					</div>
					
					<div class="top">
						个人信息
					</div>
					<form action="#" method="post">
						<div class="form">
							<div class="input">
								<label for="">用户id</label>
								<input type="text" value="" readonly />
							</div>
							<div class="input">
								<label for="">用户名</label>
								<input type="text"  value="" />
							</div>
							<div class="input" id="sex">
								<label for="">性别</label>
								<input type="text"  value="" readonly />
							</div>
							<div class="input">
								<input type="radio" name="sex" value="man" checked/>男
								<input type="radio" name="sex" value="woman" />女
							</div>
							<div class="input" style="clear: both;">
								<label for="">邮箱</label>
								<input type="email"  value="" />
							</div>
							<div class="input">
								<input type="submit" value="修改" />
							</div>
						</div>
					</form>	
				</div>
				<div class="box_alterPsw">
					<div class="x">
						<p class="x_p">x</p>
						<div style="clear: both;">
						
						</div>
					</div>
					<div class="top">
						修改密码
					</div>
					<form action="#" method="post">
						<div class="form">
							<div class="input">
								<label for="">原密码</label>
								<input type="password" placeholder="原密码" />
							</div>
							<div class="input">
								<label for="">新密码</label>
								<input type="password"  placeholder="新密码" />
							</div>
							<div class="input">
								<label for="">确认新密码</label>
								<input type="password"  placeholder="确认新密码" />
							</div>
							<div class="input">
								<input type="submit" value="修改" />
							</div>
						</div>
					</form>	
				</div>
			</div>
			
		</div>
	
	<section>
		<div class="menu">
			<ul class="first" id="first">
				<li class="topic">阶段</li>
				<li v-for="(data,index) in datas">
					<p class="active" v-on:click="loadSecond(data.typeno,index,data.typename)">{{data.typename}}</p>
					<ul class="second" v-if="index == flag">
						<li v-for="second in data1" v-on:click="loadThird(second.typeno,second.typename)">{{second.typename}}</li>
					</ul>
				</li>
			</ul>
		</div>
		<div class="">
			<div class="content" id="content">
				<div class="content_topic">
					<p>{{previous}}</p>
				</div>
				<a href="javascript:;" class="class" v-for="data in datas" v-on:click="toLink(data.typeno)">
					<img v-bind:src="data.imageurl" />
					<span >{{previous}}</span>
					<p>{{data.typename}}</p>
				</a>
				<div class="clear">	
				</div>
			</div>
		</div>
	</section>
	<footer>
		<p>地址: 岭南师范学院 &nbsp;| &nbsp; 联系邮箱: <a href="#">chongyuan1997@qq.com</a></p>
	</footer>
</body>
<script type="text/javascript">
	var path = "${pageContext.request.contextPath}/resource/images/type/";
	var first = new Vue({
		el: '#first',
		data: {
			datas: [],
			data1: [],
			flag: null
		},
		mounted(){
			this.load();
		},
		methods: {
			load: function(){
    			$.ajax({
					url:"${pageContext.request.contextPath}/user/getType",
					type:"POST",
					success: function(data){
							first.datas = data.firstlist;
							first.loadSecond(data.firstlist[0].typeno,0);
					}					
				});
    		},
    		loadSecond: function(id,index,previous) {
				$.ajax({
					url: "${pageContext.request.contextPath}/user/getType/"+id,
					type: "POST",
					success: function(data) {
						if (data.grade == "two") {
							content.datas = data.secondlist;
							for(var i=0; i<content.datas.length; i++)
								content.datas[i].imageurl = path + content.datas[i].imageurl;
							content.previous = previous;
							first.flag = null;
						} else {
							first.data1 = data.secondlist;
							first.loadThird(data.secondlist[0].typeno,data.secondlist[0].typename);
							first.flag = index;
						}
					} 
				});
    		},
    		loadThird: function(id, previous) {
    			$.ajax({
					url: "${pageContext.request.contextPath}/user/getType/"+id,
					type: "POST",
					success: function(data) {
						content.datas = data.secondlist;
						for(var i=0; i<content.datas.length; i++)
								content.datas[i].imageurl = path + content.datas[i].imageurl;
						content.previous = previous;
					} 
				});
    		}
		}
	});
	
	var content = new Vue({
		el: '#content',
		data: {
			datas: [],
			previous: null
		},
		methods: {
			toLink: function(typeno) {
				window.location = "${pageContext.request.contextPath}/user/knowleage.jsp?typeno=" + typeno;
    		}
		}
	});
	
</script>
</html>