// 브라우저 체크
var Browser = {a : navigator.userAgent.toLowerCase()};
Browser = {
	ie : /*@cc_on true || @*/ false,
	ie6 : Browser.a.indexOf('msie 6') != -1,
	ie7 : Browser.a.indexOf('msie 7') != -1,
	ie8 : Browser.a.indexOf('msie 8') != -1,
	opera : !!window.opera,
	safari : Browser.a.indexOf('safari') != -1,
	safari3 : Browser.a.indexOf('applewebkit/5') != -1,
	mac : Browser.a.indexOf('mac') != -1,
	chrome : Browser.a.indexOf('chrome') != -1,
	firefox : Browser.a.indexOf('firefox') != -1
};

// GNB관련 모바일 기기로 웹 접근시 상단메뉴 오버 액션에서 클릭 액션으로 변경
var tmpUser = navigator.userAgent;
if (tmpUser.indexOf("iPhone") > 0 || tmpUser.indexOf("iPad") > 0 || tmpUser.indexOf("Android ") > 0 ){
	$(function(){
		$("#gnbArea > ul > li:eq(0) > a, #gnbArea > ul > li:eq(1) > a, #gnbArea > ul > li:eq(3) > a").attr("href" , "#none");
		
		$(".gnb > ul > li").click(function(){
			if(!$(this).find("> a").hasClass("on")){
				$(this).siblings().find("> a").removeClass("on").css("color" , "#2c2c2c");;
				$(this).siblings().find(".dep2").css({"top":"-1000px"});
				
				$(this).find("> a").addClass("on").css("color" , "#a96119");
				$(this).find(".dep2").css({"top":"57px"});
			}else{
				$(this).find("a").removeClass("on").css("color" , "#2c2c2c");
				$(this).find(".dep2").css({"top":"-1000px"});
			}
		});
	});
}else{
	$(function(){
		$(".gnb > ul > li").bind("focusin mouseenter",function(){
			$(this).find("> a").addClass("on");
			$(this).find(".dep2").css({"top":"57px"});
		});
		
		$(".gnb > ul > li").bind("focusout mouseleave",function(){
			$(this).find("a").removeClass("on");
			$(this).find(".dep2").css({"top":"-1000px"});
		});
		
		$(".gnb .dep2").bind("focusout mouseleave",function(){
			$(this).prev("a").removeClass("on");
			$(this).css({"top":"-1000px"});
			$(this).find("ul li a").removeClass("on");
		});
		
		$(".gnb .dep2 ul li").bind("focusin mouseenter",function(){
			$(this).children("a").addClass("on");
		});
		
		$(".gnb .dep2 ul li").bind("focusout mouseleave",function(){
			$(this).children("a").removeClass("on");
		});
	});
}

$("#sec0, #sec1, #sec2").attr("tabindex" , "1"); // 접근성 포커스 이동관련

$(window).load(function(){
	var header_ht, titArea_ht, top_ht, attr, top, target;
	size = $("#cts .sec").size();
	idx = 0;


	target = $("#cts").attr("class");

	switch(target) {
		case "essence" : 
			for(var i=0; i<size; i++){
				$(".sub_nav ul").append("<li></li>");
				$(".sub_nav ul li").eq(idx).append('<a href=#sec'+idx+' title="Product Essence '+idx+'번 내용보기">'+ idx +'</a>');
				$(".sub_nav ul li").eq(0).addClass("on").siblings().removeClass("on");
				idx++;
			}
		break;
		case "about" : 
			for(var i=0; i<size; i++){
				$(".sub_nav ul").append("<li></li>");
				$(".sub_nav ul li").eq(idx).append('<a href=#sec'+idx+' title="Brand Story '+idx+'번 내용보기">'+ idx +'</a>');
				$(".sub_nav ul li").eq(0).addClass("on").siblings().removeClass("on");
				idx++;
			}
		break;
		case "prdList" : 
			for(var i=0; i<size; i++){
				$(".sub_nav ul").append("<li></li>");
				$(".sub_nav ul li").eq(idx).append('<a href=#sec'+idx+' title="Product Line '+idx+'번 내용보기">'+ idx +'</a>');
				$(".sub_nav ul li").eq(0).addClass("on").siblings().removeClass("on");
				idx++;
			}
		break;
		case "silicon" : 
			for(var i=0; i<size; i++){
				$(".sub_nav ul").append("<li></li>");
				$(".sub_nav ul li").eq(idx).append('<a href=#sec'+idx+' title="Product Line '+idx+'번 내용보기">'+ idx +'</a>');
				$(".sub_nav ul li").eq(0).addClass("on").siblings().removeClass("on");
				idx++;
			}
		break;
		case "treat" : 
			for(var i=0; i<size; i++){
				$(".sub_nav ul").append("<li></li>");
				$(".sub_nav ul li").eq(idx).append('<a href=#sec'+idx+' title="Product Line '+idx+'번 내용보기">'+ idx +'</a>');
				$(".sub_nav ul li").eq(0).addClass("on").siblings().removeClass("on");
				idx++;
			}
		break;
		case "premium" : 
			for(var i=0; i<size; i++){
				$(".sub_nav ul").append("<li></li>");
				$(".sub_nav ul li").eq(idx).append('<a href=#sec'+idx+' title="Product Line '+idx+'번 내용보기">'+ idx +'</a>');
				$(".sub_nav ul li").eq(0).addClass("on").siblings().removeClass("on");
				idx++;
			}
		break;
	}

	li_wd = $(".sub_nav ul li").outerWidth();
	ul_wd = (li_wd*size)/2;
	
	$(".sub_nav").css("margin-left",-ul_wd);
	
	$(".sub_nav ul li").click(function(){
		$(this).addClass("on").siblings().removeClass("on");
		header_ht =$("header").outerHeight();
		titArea_ht =$(".titArea").outerHeight();
		
		top_ht = header_ht + titArea_ht;
		
		attr = $(this).find("a").attr("href");
		top = $(attr).offset().top - top_ht;

		$("html, body").stop().animate({"scrollTop" : top}, 1000, "easeOutQuint");
		$(attr).focus();
		return false;
	});
	
	$(window).scroll(function(){
		var winTop = $(this).scrollTop();
		$("#cts > div").each(function(){
			var top2 = $(this).offset().top-163;
			var index = $(this).index();
			
			if(winTop > top2){
				$(".sub_nav ul li").eq(index).addClass("on").siblings().removeClass("on");
			}else {
			//	$(".sub_nav ul li").eq(0).addClass("on").siblings().removeClass("on");
			}
		});
	});

});


/* 팝업띄우기 함수 */
function openPop(url){ // 레이어팝업 열기
	$url = url;
	
	var popSizeW = $(window).width();
	var popSizeH = $(window).height();
	var targetW = $('.'+$url).width();
	var targetH = $('.'+$url).height();
	
	$("body").find('.'+$url).show();
	$("#layerZone").focus().attr("tabindex","0");
	
	if($("body").find('.'+$url).css("display") == "block"){
		$('#layerZone').css("position","absolute");
		$('#layerZone').css("top",(($(window).height() - $('.layer').outerHeight())/2) + $(window).scrollTop());
		$('#layerZone').css("left",(($(window).width() - $('.layer').outerWidth())/2) + $(window).scrollLeft());
		
	}
}

function closePop(url){ // 레이어팝업 닫기
	var $url = url;
	$('.layer.'+$url).hide();
}

$(window).load(function(){ // 레이어팝업 닫기
	$(".layer .layerClose").click(function(){
		$(this).parent(".layer").hide();
		
		$('.layer').css({
			left : "0",
			top : "0"
		});
		
		if($("#layerZone").hasClass("buy")){
			$("." + btn_active).focus();
			$("." + btn_prd_name).focus();
			$("." + btn_active).removeClass("active");
			$("." + btn_prd_name).removeClass("active");
		}
		
		return false;
	});
});


var btn_active;
var btn_active2, btn_prd2;
var btn_prd_name;
$(function(){
	$(".btn_buy a").click(function(){
		$(this).addClass("active");
		btn_active = $(this).attr("class");
	});
	
	$(".btn_prdBuy").click(function(){
		$(this).addClass("active");
		btn_active2 = $(this).attr("class")
		btn_prd2 = btn_active2.split(" ");
		btn_prd_name = btn_prd2[1];
	});
});



$(function(){
	$(".privacy .btn_center a").click(function(){
		$("#layerZone.personal").addClass("on");
	});
});

$(window).load(function(){
	var h_ht = $("header").outerHeight();
	var titA_ht = $(".titArea").outerHeight();
	
	var top_ht2 = h_ht + titA_ht;
	
	$("#cts").css({"margin-top" : top_ht2});
});
	

$(window).load(function(){
	$(".tab_cnt:gt(0)").hide();
	$(".tab_cnt:eq(0)").show();
	
	if($(".tabArea ul li").hasClass("on")){
		$(this).find(" > a > img").css("margin-top","-36px");
	}else {
		$(this).find(" > a > img").css("margin-top","0");
	}
			
	$(".tabArea ul li").click(function(){
		if($(this).find("a").attr("href").indexOf("php") != -1){
			location.replace($(this).find("a").attr("href"));
		} else {
			var lstIdx = $(this).index();
			$(".tabArea ul li").removeClass("on");
			$(".tabArea ul li:eq(" + lstIdx + ")").addClass("on");
			
			$(".tab_cnt").hide();
			$(".tab_cnt:eq(" + lstIdx + ")").show();
	
			return false;
		}
	});
});



/*

$(function(){
	$(".quick ul li").eq(1).addClass("middle");
});

*/




