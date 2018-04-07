$(function(){
	
	//个人信息和用户名之间的间隙~动态变化
	var distance=110;   //
	var width=$('.user').width(); //获取宽度
	$('.info').css('right',distance+(width-115));
	
	var box_height;		
	var time=null;
	function height_change(){
		time=setInterval(function(){
			box_height=$(document).outerHeight(true);
			$('.box').css('height',box_height);	
			$('.box .box1').css('height',$(window).height());
		},100)
	}
	height_change();
	
	
	//菜单栏
	$('.menu p').click(function(){
		$(this).parent().find('.second').slideToggle();
		$(this).parent().siblings().find('.second').slideUp();
		$(this).addClass('active');
		$(this).parent().siblings().find('p').removeClass('active');
	})
	
	//点击菜单，显示右边内容
	$('.menu li').click(function(){
		var id= $(this).attr("id");//获取属性为id的值
		if(id!=undefined){
			var str=".content_"+id;
			$(str).show().siblings().hide();
			
		}
	})
	
	//用户信息
	$('.info ul li:nth-of-type(1)').click(function(e){
		e.stopPropagation();
		$('.alter').fadeToggle();
			
	})
	
	$('div.info ul li.alter').click(function(e){
		e.stopPropagation();
	})
	
	$('#alterInfo').click(function(e){
		e.stopPropagation();
		$('.box').show();
		$('.box_alterInfo').show();
	})
	$('#alterPsw').click(function(e){
		e.stopPropagation();
		$('.box').show();
		$('.box_alterPsw').show();
	})
	
	$(document).click(function(e){ 
		var name=e.target.className;
		if(name!="box" && name!="box1" &&name!="x_p" && name!="box_alterInfo" && name!="box_alterPsw"){
			$('.alter').fadeOut(); //点击其他地方，个人信息菜单收起来
		}
		if(name=="box"||name=="box1"){
			$('.box').hide();
			$('.box_alterInfo').hide();
			$('.box_alterPsw').hide();
		}
	})
	
	$('.x p').click(function(){
		$('.box').hide();
		$('.box_alterInfo').hide();
		$('.box_alterPsw').hide();
		
	})
	
})