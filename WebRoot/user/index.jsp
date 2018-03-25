<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/index.css"/>
<script src="${pageContext.request.contextPath }/js/jquery-3.2.1.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath }/js/index.js" type="text/javascript" charset="utf-8"></script>
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
			<span >用户名:&nbsp;aaa &nbsp;<a href="#">[退出]</a></span>
		</div>
	</nav>
	<section>
		<div class="menu">
			<ul class="first" id="first">
				<li class="topic">阶段</li>
				<li id="11">
					<p class="active">小学</p>
					<ul class="second">
						
					</ul>
				</li>
			</ul>
		</div>
			
			
			<div class="">
				<!-- 小学  -->
				<div class="content content_11" style="display: block;">
					<div class="content_topic">
						<p>小学</p>
					</div>
					<a href="#" class="class">
						<b id="b11"></b>
						<span >[语文]</span>
						<p>小学语文基础知识</p>
					</a>
					<a href="#" class="class">
						<b id="b12"></b>
						<span >[数学]</span>
						<p>小学数学基础知识</p>
					</a>
					<a href="#" class="class">
						<b id="b13"></b>
						<span >[英语]</span>
						<p>小学英语基础知识</p>
					</a>
					
					
					<div class="clear">	
						
					</div>
					
				</div>
				
				<!-- 初中  -->
				<div class="content content_21">
					<div class="content_topic">
						<p>初中</p>
					</div>
					<a href="#" class="class">
						<b id="b11"></b>
						<span >[语文]</span>
						<p>初中语文基础知识</p>
					</a>
					<a href="#" class="class">
						<b id="b12"></b>
						<span >[数学]</span>
						<p>初中数学基础知识</p>
					</a>
					<a href="#" class="class">
						<b id="b13"></b>
						<span >[英语]</span>
						<p>初中英语基础知识</p>
					</a>
					<a href="#" class="class">
						<b id="b14"></b>
						<span >[政治]</span>
						<p>初中政治基础知识</p>
					</a>
					<a href="#" class="class">
						<b id="b15"></b>
						<span >[历史]</span>
						<p>初中历史基础知识</p>
					</a>
					<a href="#" class="class">
						<b id="b16"></b>
						<span >[地理]</span>
						<p>初中地理基础知识</p>
					</a>
					<a href="#" class="class">
						<b id="b17"></b>
						<span >[物理]</span>
						<p>初中物理基础知识</p>
					</a>
					<a href="#" class="class">
						<b id="b18"></b>
						<span >[化学]</span>
						<p>初中化学基础知识</p>
					</a>
					<a href="#" class="class">
						<b id="b19"></b>
						<span >[生物]</span>
						<p>初中生物基础知识</p>
					</a>
					
					<div class="clear">	
						
					</div>
				</div>
				
				<!-- 高中  -->
				<div class="content content_31">
					<div class="content_topic">
						<p>高中>>文科</p>
					</div>	
					<a href="#" class="class">
						<b id="b11"></b>
						<span >[语文]</span>
						<p>高中文科语文基础知识</p>
					</a>
					<a href="#" class="class">
						<b id="b12"></b>
						<span >[数学]</span>
						<p>高中文科数学基础知识</p>
					</a>
					<a href="#" class="class">
						<b id="b13"></b>
						<span >[英语]</span>
						<p>高中文科英语基础知识</p>
					</a>
					<a href="#" class="class">
						<b id="b14"></b>
						<span >[政治]</span>
						<p>高中文科政治基础知识</p>
					</a>
					<a href="#" class="class">
						<b id="b15"></b>
						<span >[历史]</span>
						<p>高中文科历史基础知识</p>
					</a>
					<a href="#" class="class">
						<b id="b16"></b>
						<span >[地理]</span>
						<p>高中文科地理基础知识</p>
					</a>
					
					<div class="clear">	
						
					</div>
				</div>
				<div class="content content_32">
					<div class="content_topic">
						<p>高中>>理科</p>
					</div>	
					<a href="#" class="class">
						<b id="b11"></b>
						<span >[语文]</span>
						<p>高中理科语文基础知识</p>
					</a>
					<a href="#" class="class">
						<b id="b12"></b>
						<span >[数学]</span>
						<p>高中理科数学基础知识</p>
					</a>
					<a href="#" class="class">
						<b id="b13"></b>
						<span >[英语]</span>
						<p>高中理科英语基础知识</p>
					</a>	
					<a href="#" class="class">
						<b id="b17"></b>
						<span >[物理]</span>
						<p>高中理科物理基础知识</p>
					</a>
					<a href="#" class="class">
						<b id="b18"></b>
						<span >[化学]</span>
						<p>高中理科化学基础知识</p>
					</a>
					<a href="#" class="class">
						<b id="b19"></b>
						<span >[生物]</span>
						<p>高中理科生物基础知识</p>
					</a>
					
					<div class="clear">	
						
					</div>
				</div>
				
				<!-- 大学  -->
				<div class="content content_41">
					<div class="content_topic">
						<p>大学>>计算机系</p>
					</div>	
					<a href="#" class="class">
						<b id="b20"></b>
						<span >[C语言]</span>
						<p>大学C语言基础知识</p>
					</a>
					<a href="#" class="class">
						<b id="b20"></b>
						<span >[C++]</span>
						<p>大学C++基础知识</p>
					</a>
					<a href="#" class="class">
						<b id="b20"></b>
						<span >[数据结构]</span>
						<p>大学数据结构基础知识</p>
					</a>
					<a href="#" class="class">
						<b id="b20"></b>
						<span >[java]</span>
						<p>大学java基础知识</p>
					</a>
					
					<a href="#" class="class">
						<b id="b20"></b>
						<span >[计算机网络]</span>
						<p>大学计算机网络基础知识</p>
					</a>
					<a href="#" class="class">
						<b id="b20"></b>
						<span >[计算机操作系统]</span>
						<p>大学计算机操作系统基础知识</p>
					</a>
					<a href="#" class="class">
						<b id="b20"></b>
						<span >[设计模式]</span>
						<p>大学设计模式基础知识</p>
					</a>
					<a href="#" class="class">
						<b id="b20"></b>
						<span >[数据挖掘]</span>
						<p>大学数据挖掘基础知识</p>
					</a>
					<a href="#" class="class">
						<b id="b20"></b>
						<span >[大数据]</span>
						<p>大学大数据基础知识</p>
					</a>
					<div class="clear">	
						
					</div>
					
				</div>
				<div class="content content_42">
					<div class="content_topic">
						<p>大学>>数学系</p>
					</div>	
					<a href="#" class="class">
						<b id="b20"></b>
						<span >[解析几何]</span>
						<p>大学解析几何基础知识</p>
					</a>
					<a href="#" class="class">
						<b id="b20"></b>
						<span >[数学分析]</span>
						<p>大学数学分析基础知识</p>
					</a>
					<a href="#" class="class">
						<b id="b20"></b>
						<span >[高等代数]</span>
						<p>大学高等代数基础知识</p>
					</a>
					<a href="#" class="class">
						<b id="b20"></b>
						<span >[常微分方程]</span>
						<p>大学常微分方程基础知识</p>
					</a>
					
					<a href="#" class="class">
						<b id="b20"></b>
						<span >[抽象代数]</span>
						<p>大学抽象代数基础知识</p>
					</a>
					<a href="#" class="class">
						<b id="b20"></b>
						<span >[概率论基础]</span>
						<p>大学概率论基础基础知识</p>
					</a>
					<a href="#" class="class">
						<b id="b20"></b>
						<span >[复变函数]</span>
						<p>大学复变函数基础知识</p>
					</a>
					<a href="#" class="class">
						<b id="b20"></b>
						<span >[近世代数]</span>
						<p>大学近世代数基础知识</p>
					</a>
					<a href="#" class="class">
						<b id="b20"></b>
						<span >[实变函数]</span>
						<p>大学实变函数基础知识</p>
					</a>
					<a href="#" class="class">
						<b id="b20"></b>
						<span >[偏微分方程]</span>
						<p>大学偏微分方程基础知识</p>
					</a>
					<a href="#" class="class">
						<b id="b20"></b>
						<span >[概率论 ]</span>
						<p>大学概率论基础知识</p>
					</a>
					<a href="#" class="class">
						<b id="b20"></b>
						<span >[微分几何]</span>
						<p>大学微分几何基础知识</p>
					</a>
					<div class="clear">	
						
					</div>
				</div>
				<div class="content content_43">
					<div class="content_topic">
						<p>大学>>经济系</p>
					</div>	
					<a href="#" class="class">
						<b id="b20"></b>
						<span >[宏观经济学]</span>
						<p>大学宏观经济学基础知识</p>
					</a>
					<a href="#" class="class">
						<b id="b20"></b>
						<span >[微观经济学]</span>
						<p>大学微观经济学基础知识</p>
					</a>
					<a href="#" class="class">
						<b id="b20"></b>
						<span >[财务会计]</span>
						<p>大学财务会计基础知识</p>
					</a>
					<a href="#" class="class">
						<b id="b20"></b>
						<span >[管理学]</span>
						<p>大学管理学基础知识</p>
					</a>
					
					<a href="#" class="class">
						<b id="b20"></b>
						<span >[政治经济学]</span>
						<p>大学政治经济学基础知识</p>
					</a>
					<a href="#" class="class">
						<b id="b20"></b>
						<span >[货币银行学]</span>
						<p>大学货币银行学基础知识</p>
					</a>
					<a href="#" class="class">
						<b id="b20"></b>
						<span >[金融学]</span>
						<p>大学金融学基础知识</p>
					</a>
					<a href="#" class="class">
						<b id="b20"></b>
						<span >[投资学]</span>
						<p>大学投资学基础知识</p>
					</a>
					<a href="#" class="class">
						<b id="b20"></b>
						<span >[信息经济学]</span>
						<p>大学信息经济学基础知识</p>
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
		
		},
		methods: {
		
		}
	});
</script>
</html>