<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0,viewport-fit=cover">
<title>首页</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/weui.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/jquery-weui.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/example.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/myindex.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/demos.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.2.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-weui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/vue.js"></script>
</head>
<body>
<!-- 下拉刷新 -->
<div class="weui-pull-to-refresh__layer">
    <div class='weui-pull-to-refresh__arrow'></div>
    <div class='weui-pull-to-refresh__preloader'></div>
    <div class="down">下拉刷新</div>
    <div class="up">释放刷新</div>
    <div class="refresh">正在刷新</div>
</div>

<!-- 页面显示 -->
<div class="page__bd" style="height: 100%;">
    <div class="weui-tab">
        <div class="weui-tab__panel">
            <div id="answer" class="weui-tab__bd-item">
                <div class="firsttab">
                    <img src="${pageContext.request.contextPath }/resource/images/logo.jpg" class=my_img>
                </div>
	            <div class="weui-grids" id="type">
	                <a href="javascript:;" class="weui-grid" v-for="data in datas" v-on:click="redirectSecond(data.typeno)">
	                    <div class="weui-grid__icon">
	                        <img :src="data.imageurl" alt="">
	                    </div>
	                    <p class="weui-grid__label">{{data.typename}}</p>
	                </a>
	            </div>
            </div>
            <div id="user" class="weui-tab__bd-item" style="display: none">
                <h1>页面二</h1>
            </div>
        </div>
        <div class="weui-tabbar">
            <a href="#answer" class="weui-tabbar__item weui-bar__item_on">
                <img src="${pageContext.request.contextPath }/resource/images/icon_nav_answer.png" alt="" class="weui-tabbar__icon">
                <p class="weui-tabbar__label">答题</p>
            </a>
            <a href="#user" class="weui-tabbar__item">
                <img src="${pageContext.request.contextPath }/resource/images/icon_nav_people.png" alt="" class="weui-tabbar__icon">
                <p class="weui-tabbar__label">我</p>
            </a>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">

$(function () {
    $(".weui-tabbar__item").click(function () {
        $(this).addClass('weui-bar__item_on').siblings('.weui-bar__item_on').removeClass('weui-bar__item_on');
        var tab = $(this).attr("href");
        $(tab).css("display","block");
        $(tab).siblings().css("display","none");
    });
    questiontype.loadtype();
    
    $(document.body).pullToRefresh(function () {
		// 下拉刷新触发时执行的操作放这里。
		// 从 v1.1.2 版本才支持回调函数，之前的版本只能通过事件监听
		setTimeout(function() {
			questiontype.loadtype();
			$(document.body).pullToRefreshDone();
		}, 2000);
	});

});

var path = "${pageContext.request.contextPath}/resource/images/type/"; 

var questiontype = new Vue({
	el: "#type",
	data: {
		datas: []
	},
	methods: {
		loadtype: function() {
			$.ajax({
				url:"${pageContext.request.contextPath}/user/getType",
				type:"POST",
				success: function(data){
					questiontype.datas = data.firstlist;
					for (var i=0; i<questiontype.datas.length; i++) {
						questiontype.datas[i].imageurl = path + questiontype.datas[i].imageurl;
					}
				}					
			});
		},
		redirectSecond: function(typeno) {
			window.location = "${pageContext.request.contextPath}/wechatuser/index2.jsp?typeno=" + typeno;
		}
	}
});


</script>
</html>