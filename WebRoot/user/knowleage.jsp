<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>答题</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/knowledgeAnswer.css"/>
	<script src="${pageContext.request.contextPath }/js/jquery-3.2.1.js" type="text/javascript" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath }/js/knowledgeAnswer.js" type="text/javascript" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath }/js/vue.js" type="text/javascript" charset="utf-8"></script>
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
		<div class="catalog">
			<ul>
				<li><a href="${pageContext.request.contextPath }/user/index.jsp">首页</a></li>
				<li>位置：大学>>java ${param.typeno}</li>
			</ul>
		</div>
		<div class="user">
			<span >用户名:&nbsp;${sessionScope.user.username } &nbsp;<a href="${pageContext.request.contextPath }/user/sigeout">[退出]</a></span>
		</div>
	</nav>
	<section>
		<div class="condition" id="condition">
			<ul>
				<li>科目：{{title}}</li>
				<li>答对：{{right}} 道</li>
				<li>答错：{{error}} 道</li>
			</ul>
		</div>
		
		<div class="content">
			<div class="question" id="question">
				<h4>题目</h4>
				<ul>
					<li v-if="flag == 1">{{datas}}</li>
					<li v-if="flag == 2">图片</li>
					<li v-if="flag == 3">视频</li>
					<li v-if="flag == 4">音乐</li>
				</ul>
			</div>
			<div class="selection" id="selection">
				<h4>回答</h4>
				<ul>
					<li style="display: block;" v-for="op in datas" v-if="flag == 1">   <!-- 单选时 -->
						<div class="">
							<input type="radio" name="radio" id="radio" :value="op.status" />
							<span>{{op.content}}</span>
						</div>
					</li>
					
					<li>  <!-- 多选时 -->
						<div v-for="op in datas" v-if="flag == 2">
							<input type="checkbox" name="checkbox" id="checkbox" :value="op.status" />
							<span>{{op.content}}</span>
						</div>
					</li>
				</ul>
			</div>
			<hr />
			<div class="answer" id="answer">
				<h4>答案</h4>					
				<div class="">
					<span v-if="flag == 1">{{rightanswer}}<br/>{{datas}}</span>
					<span v-if="flag == 2">图片</span>
				</div>
			</div>
			<div class="button">
				<button id="submit">提交</button>
				<button style="display: none;" id="next">下一题</button>
			</div>
			<div class="clear">  <!--清除浮动-->
					
			</div>
		</div>
	</section>
	<footer>
		<p>地址: 岭南师范学院 &nbsp;| &nbsp; 联系邮箱: <a href="#">chongyuan1997@qq.com</a></p>
	</footer>
</body>
<script type="text/javascript">
var questiondata;	//题目内容
var questionNumber = 0;	//当前题号
var maxNumber;	//最大题目数

$(function(){
	
	init();
	showQuestion(questionNumber);
	console.log(questiondata);
	
	/*点击提交按钮时*/
	$('#submit').click(function(){
			$(this).hide();  /* 提交按钮消失 */
			$('.answer').fadeIn(); /*答案显示*/
			$('#next').show();/*下一题按钮显示*/
			if(selection.rightnumber == 1) {	//单选
				if($('input:radio:checked').val() == 1)
					condition.subimtAnswer(1);
				else
					condition.subimtAnswer(0);
			} else {	//多选
				var len = $("input[type='checkbox']:checked").length;
				if(len != selection.rightnumber)
					condition.subimtAnswer(0);
				else {
					var i = 0;
					$('input:checkbox:checked').each(function(){
						if($(this).val() == 0)
							i++;
					});
					if (i == 0)
						condition.subimtAnswer(1);
					else
						condition.subimtAnswer(0);
				}
			}
	});
	
	/*点击下一题按钮时*/
	$('#next').click(function(){
		questionNumber += 1;
		if(questionNumber < maxNumber)
			showQuestion(questionNumber);
		else 
			alert("题目已做完");
		$(this).hide();  /* 下一题按钮消失 */
		$('.answer').hide(); /*答案消失*/
		$('#submit').show();/*提交按钮显示*/
		$('input:radio').prop('checked',false);
		$('input:checkbox').prop('checked',false);
	});
	
	//禁止使用F5页面刷新
	/*
	$(document).ready(function(){
		$(document).bind("keydown",function(e){
			e = window.event || e;
			if(e.keyCode == 116) {
				e.keyCode = 0;
				return false;
			}
		});
	});*/
	
});

//页面加载初始化
function init() {
	$.ajax({
		url: "${pageContext.request.contextPath}/user/getQuestion/${param.typeno}",
		async:false,
		success: function(data){
			questiondata = data.question;
			if (data.question.length == data.maxnumber)
				maxNumber = data.maxnumber;
			else 
				maxNumber = data.question.length;
			condition.title = data.title;
		}
	});
}

//对题目，选项等重新显示
function showQuestion(number){
	var q = questiondata[number];
	question.load(q.question);
	selection.load(q.option);
}

//显示题目
var question = new Vue({
	el: "#question",
	data: {
		datas: null,
		flag: null
	},
	methods: {
		load: function(data) {
			question.datas = data.content;
			question.flag = data.constatus;
			answer.datas = data.description;
			answer.flag = data.desstatus;
		}
	}
});
//显示选项
var selection = new Vue({
	el: "#selection",
	data: {
		datas: [],
		falg: null,
		rightnumber: 0
	},
	methods: {
		load: function(data) {
			selection.datas = data;
			var confirm = 0;
			var myop = new Array("A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R",
				"S","T","U","V","W","X","Y","Z");
			answer.rightanswer = "答案是：";
			for (var i=0; i<data.length; i++) {
				selection.datas[i].content = myop[i] + ". " + selection.datas[i].content;
				if(data[i].status == 1){
					confirm += 1;
					answer.rightanswer += myop[i];				
				}
			}
			selection.rightnumber = confirm;
			if(confirm == 1)
				selection.flag = 1;	//单选
			else
				selection.flag = 2;	//多选
		}
	}
});
//显示答案
var answer = new Vue({
	el: "#answer",
	data: {
		datas: [],
		flag: null,
		rightanswer: ""
	}
});
//统计部分
var condition = new Vue({
	el: "#condition",
	data: {
		title: null, 
		right: 0,
		error: 0
	},
	methods: {
		subimtAnswer: function(status){
			if (status == 1)
				condition.right++;
			else
				condition.error++;
			$.ajax({
				url: "${pageContext.request.contextPath}/user/refreshRecord/${param.typeno}/"+status ,
			});
		
		}
	}
});
</script>
</html>