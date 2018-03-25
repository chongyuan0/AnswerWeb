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

</head>
<body>
	<header>
		<img src="${pageContext.request.contextPath }/img/logo.jpg"/>
		<div class="find">
			<input type="text" placeholder="搜索..." />
			<button></button>
		</div>
	</header>
	<nav>
		<div class="user">
			<span >用户名:&nbsp;${sessionScope.user.username } &nbsp;<a href="${pageContext.request.contextPath }/user/sigeout">[退出]</a></span>
		</div>
	</nav>
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
				<a href="#" class="class" v-for="data in datas">
					<img v-bind:src="data.imageurl"/>
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
		}
	});
</script>
</html>