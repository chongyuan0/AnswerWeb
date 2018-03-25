$(function(){
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
	
	
})