<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>答题</title>
<script src="${pageContext.request.contextPath}/js/vue.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.js"></script>

</head>
<body>
	<div id="div1">
		<ul>
			<li v-for="site in datas">
				<div>
					<button v-on:click="reloadType(site.typeno)">{{site.typename}}</button>
				</div>
			</li>
		</ul>
	</div>
	<div id="div2">
		<ul>
			<li v-for="ss in datas">
				<div>{{ss.typename}}</div>
			</li>
		</ul>
	</div>
</body>

<script type="text/javascript">
	var v2 = new Vue({
		el: '#div2',
		data: {
			datas: []
		},
		methods: {
			reload: function(id) {
				$.ajax({
					url: "${pageContext.request.contextPath}/user/getType/"+id,
					type: "POST",
					success: function(data) {
						v2.datas = data.secondlist;
					} 
				});
			}
		}
	});
	var v = new Vue({
		el: '#div1',
		data: {
			datas: []
		},
		mounted(){ //加载页面运行方法
			this.init1();
		},
		methods: {
			reloadType: function(id) {
				v2.reload(id);
			},
			init1: function(){
				$.ajax({
					url:"${pageContext.request.contextPath}/user/getType",
					type:"POST",
					success: function(data1){
							v.datas = data1.firstlist;
							v.reloadType(data1.firstlist[0].typeno);						
					}					
				});
			}
		}
	});
</script>

</html>