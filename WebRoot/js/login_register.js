$(function(){
	var num=1;
	var time=null;
	function change(){ //背景图片切换
		time=setInterval(function(){
			num++;
			if(num>2) num=1;
			var str=".bg"+num;
           $(str).fadeIn().siblings().fadeOut();
		},3000)
	}
	change();
	


})