function openPW(url, w, h,name) {
	 var T = (screen.availHeight-h)/2;
	 var L = (screen.availWidth-w)/2;
	 var name = name;
	 var opt = 'toolbar=0,scrollbars=0,location=0,statusbar=0,menubar=0,resizable=0';
	 if(!name){
		 name = 'popWindow';
	 }
	 window.open(url,name, opt+',width='+w+',height='+h+',top='+T+',left='+L);
}
jQuery(function($){
	//gnb
	var $snb =$('.gnb>.gnb_wrap>ul>li');
	var $snbTop = $('.gnb ul div ul').css('top');
	$snbTop = $snbTop.replace(/[^0-9]/g,"");
	$('.gnb ul li').not('.active').find('div').css({
		top:$snbTop-10,
		opacity:0
	});

		$('.gnb').mouseleave(function(){
			$gnbClose();
		});
	
	$('.gnb>.gnb_wrap>ul>li>a').mouseover(function(){
		$gnbClose();
		$(this).parent().addClass('active');
		$(this).next().stop().css({display:'inline','z-index':999}).animate({
			top:$snbTop,
			opacity:1
		});
	});
	function $gnbClose(){
			$snb.each(function(){
				if($(this).hasClass('active')){
					var $cur_elobj = $(this);
					$(this).find('div').stop().clearQueue();
					$(this).removeClass('active');
					$(this).find('div').animate({
						top:$snbTop-10,
						opacity:0
					},300,function(){
						$cur_elobj.find('div').css({'opacity':1, display:'none'});
						$cur_elobj.find('div').css('z-index','');
					});
				}
			});
	}




$('.gnb>.gnb_wrap>ul>li>a').focus(function(){
		$gnbClose();
		$(this).parent().addClass('active');
		$(this).next().stop().css({display:'inline','z-index':999}).animate({
			top:$snbTop,
			opacity:1
		});
	});
	function $gnbClose(){
			$snb.each(function(){
				if($(this).hasClass('active')){
					var $cur_elobj = $(this);
					$(this).find('div').stop().clearQueue();
					$(this).removeClass('active');
					$(this).find('div').animate({
						top:$snbTop-10,
						opacity:0
					},300,function(){
						$cur_elobj.find('div').css({'opacity':1, display:'none'});
						$cur_elobj.find('div').css('z-index','');
					});
				}
			});
	}

	/*퀵메뉴.
	var $quickObj = $('.quick_bar');
	var quickTop = $quickObj.css('top').replace(/[^-\d\.]/g, '');
	
	$(window).scroll(function(){
		var position = $(window).scrollTop();
		if(position <= quickTop){
			position = quickTop;
		}
		$quickObj.stop().animate({"top":position+"px"},1000);
	});
    */
});