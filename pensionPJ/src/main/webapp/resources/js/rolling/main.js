tt = 11;

var interval_ele;

if(Browser.ie7 || Browser.ie8){
	$(function() {
		$('#slides').slidesjs({
			width: 1200,
			height: 558,
			play:{
				active : true,
				effect : "slide",
				interval : 7000,
				auto : true,
				swap : true,
				pauseonHover : false,
				restartDelay : 999
			},
			callback: {
				loaded: function(number) {
					$(".opa").css("opacity","1");
					$(".obj").css("display","block");
				//	$(".light_01, .light_02, .light_03, .light_04, .light_05, .light_06, .data-2 .bg01, .data-3 .bg01, .data-4 .bg01").css("display","none");

					slide01();
					ani1.restart();
				},
				complete: function(number) {
					// if(number == 1){
						// re2(), re3();
					// }else if(number == 2){
						// re1(), re3();
					// }else if(number == 3){
						// re1(), re2();
					// }
					
					if(number == 1){
						re2(), re3();
					}else if(number == 2){
						re1(), re3();
					}else if(number == 3){
						re1(), re2();
					}
					// }else if(number == 4){
						// re1(), re2(), re3();
					// }
					
					tt = 11;
					var ac = $(".slidesjs-pagination li a.active").text();
					var ac2 = ac.substring(0,1);
					if(number == ac2){
						eval("ani" + ac2 + ".restart()");
					}
				}
			}
		});
	});
}else{
	$(function() {
		$('#slides').slidesjs({
			width: 1200,
			height: 558,
			play:{
				active : true,
				effect : "fade",
				interval : 8000,
				auto : true,
				swap : true,
				pauseonHover : false,
				restartDelay : 999
			},
			callback: {
				loaded: function(number) {
					$(".opa").css("opacity","0");
					$(".obj").css("display","none");

					slide01();
					ani1.restart();
				},
				complete: function(number) {
					//$(".data-1 .light").css("opacity" , "0");
					// if(number == 1){
						// re2(), re3();
					// }else if(number == 2){
						// re1(), re3();
					// }else if(number == 3){
						// re1(), re2();
					// }
					
					if(number == 1){
						re2(), re3();
					}else if(number == 2){
						re1(), re3();
					}else if(number == 3){
						re1(), re2();
					}
					
					tt = 11;
					var ac = $(".slidesjs-pagination li a.active").text();
					var ac2 = ac.substring(0,1);
					if(number == ac2){
						eval("ani" + ac2 + ".restart()");
					}
				}
			}
		});
	});
}


var timePlay = (function(){
	nextT = setTimeout(function(){

	clearTimeout(nextT);

		$(".slidesjs-next").trigger('click');
	}, 2000);
});

var timeStop = (function(){
	if(tt==22){
		clearTimeout(nextT);
	}
});

if(Browser.ie7 || Browser.ie8){
	var slide01 = (function(){
		/*
		ani1 =  new TimelineLite({paused:true});
		ani1.to(".data-1 .txt1, .data-1 .txt2, .data-1 .btn, .data-1 .bg01, .data-1 .bg02" , 0, {opacity : 1, delay : 0})
		.to(".data-1 .peo" , 1.5, {opacity : 1, marginLeft : 0, delay : 0});
		*/
		
		ani1 =  new TimelineLite({paused:true});
		ani1.to(".data-1 .prd" , 1, {opacity : 1, marginLeft : 0, delay : 0})
		.to(".data-1 .water01" , 1.5, {opacity : 1, marginLeft : 0, delay : -2.5})
		.to(".data-1 .water0102" , 1.5, {opacity : 1, marginLeft : 0, delay : -2.5})
		.to(".data-1 .water02" , 1.5, {opacity : 1, marginLeft : 0, delay : -2.5})
		.to(".data-1 .water03" , 1.5, {opacity : 1, marginLeft : 0, delay : -2.5})

		
		
		ani2 =  new TimelineLite({paused:true});
		ani2.to(".data-2 .prd" , 1, {opacity : 1, marginLeft : 0, delay : 0})
		.to(".data-2 .water01" , 1.5, {opacity : 1, marginLeft : 0, delay : -2.5})
		.to(".data-2 .water0102" , 1.5, {opacity : 1, marginLeft : 0, delay : -2.5})
		.to(".data-2 .water02" , 1.5, {opacity : 1, marginLeft : 0, delay : -2.5})
		.to(".data-2 .water03" , 1.5, {opacity : 1, marginLeft : 0, delay : -2.5})
		
		
		ani3 =  new TimelineLite({paused:true});
		ani3.to(".data-3 .prd" , 1, {opacity : 1, marginLeft : 0, delay : 0})
		.to(".data-3 .water01" , 1.5, {opacity : 1, marginLeft : 0, delay : -2.5})
		.to(".data-3 .water0102" , 1.5, {opacity : 1, marginLeft : 0, delay : -2.5})
		.to(".data-3 .water02" , 1.5, {opacity : 1, marginLeft : 0, delay : -2.5})
		.to(".data-3 .water03" , 1.5, {opacity : 1, marginLeft : 0, delay : -2.5})
		
		
		
		ani4 =  new TimelineLite({paused:true});
		ani4.to(".data-4 .prd" , 1, {opacity : 1, marginLeft : 0, delay : 0})
		.to(".data-4 .water01" , 1.5, {opacity : 1, marginLeft : 0, delay : -2.5})
		.to(".data-4 .water0102" , 1.5, {opacity : 1, marginLeft : 0, delay : -2.5})
		.to(".data-4 .water02" , 1.5, {opacity : 1, marginLeft : 0, delay : -2.5})
		.to(".data-4 .water03" , 1.5, {opacity : 1, marginLeft : 0, delay : -2.5})
		
		
		
		ani5 =  new TimelineLite({paused:true});
		ani5.to(".data-5 .prd" , 1, {opacity : 1, marginLeft : 0, delay : 0})
		.to(".data-5 .water01" , 1.5, {opacity : 1, marginLeft : 0, delay : -2.5})
		.to(".data-5 .water0102" , 1.5, {opacity : 1, marginLeft : 0, delay : -2.5})
		.to(".data-5 .water02" , 1.5, {opacity : 1, marginLeft : 0, delay : -2.5})
		.to(".data-5 .water03" , 1.5, {opacity : 1, marginLeft : 0, delay : -2.5})
		
		
		ani6 =  new TimelineLite({paused:true});
		ani6.to(".data-6 .prd" , 1, {opacity : 1, marginLeft : 0, delay : 0})
		.to(".data-6 .water01" , 1.5, {opacity : 1, marginLeft : 0, delay : -2.5})
		.to(".data-6 .water0102" , 1.5, {opacity : 1, marginLeft : 0, delay : -2.5})
		.to(".data-6 .water02" , 1.5, {opacity : 1, marginLeft : 0, delay : -2.5})
		
		
		ani7 =  new TimelineLite({paused:true});
		ani7.to(".data-7 .prd" , 1, {opacity : 1, marginLeft : 0, delay : 0})
		.to(".data-7 .water01" , 1.5, {opacity : 1, marginLeft : 0, delay : -2.5})
		.to(".data-7 .water0102" , 1.5, {opacity : 1, marginLeft : 0, delay : -2.5})
		.to(".data-7 .water02" , 1.5, {opacity : 1, marginLeft : 0, delay : -2.5})
		
	});
}else{
	var slide01 = (function(){

		ani1 =  new TimelineLite({paused:true});
		ani1.to(".data-1 .prd" , 1, {opacity : 1, marginLeft : 0, delay : 0})
		.to(".data-1 .water01" , 1, {opacity : 1, marginLeft : 0, delay : -1})
		.to(".data-1 .water0102" , 1, {opacity : 1, marginLeft : 0, delay : -1})
		.to(".data-1 .water02" , 1, {opacity : 1, marginLeft : 0, delay : -1})
		.to(".data-1 .water03" , 1, {opacity : 1, marginLeft : 0, delay : -1})
		
		.to(".data-1 .prd" , 1, {opacity : 1, marginLeft : 0, delay : -2.5})
		.to(".data-1 .water01" , 1, {opacity : 1, marginLeft : 50, delay : -2.5})
		.to(".data-1 .water0102" , 1, {opacity : 1, marginLeft : -80, delay : -2.5})
		.to(".data-1 .water02" , 1, {opacity : 1, marginLeft : 110, delay : -2.5})
		.to(".data-1 .water03" , 1, {opacity : 1, marginLeft : -80, delay : -2.5})

		
		ani2 =  new TimelineLite({paused:true});
		ani2.to(".data-2 .prd" , 1, {opacity : 1, marginLeft : 0, delay : 0})
		.to(".data-2 .water01" , 1, {opacity : 1, marginLeft : 0, delay : -1})
		.to(".data-2 .water0102" , 1, {opacity : 1, marginLeft : 0, delay : -1})
		.to(".data-2 .water02" , 1, {opacity : 1, marginLeft : 0, delay : -1})
		.to(".data-2 .water03" , 1, {opacity : 1, marginLeft : 0, delay : -1})
		
		.to(".data-2 .prd" , 1, {opacity : 1, marginLeft : 0, delay : -2.5})
		.to(".data-2 .water01" , 1, {opacity : 1, marginLeft : 50, delay : -2.5})
		.to(".data-2 .water0102" , 1, {opacity : 1, marginLeft : -80, delay : -2.5})
		.to(".data-2 .water02" , 1, {opacity : 1, marginLeft : 110, delay : -2.5})
		.to(".data-2 .water03" , 1, {opacity : 1, marginLeft : -80, delay : -2.5})
		
		
		ani3 =  new TimelineLite({paused:true});
		ani3.to(".data-3 .prd" , 1, {opacity : 1, marginLeft : 0, delay : 0})
		.to(".data-3 .water01" , 1, {opacity : 1, marginLeft : 0, delay : -1})
		.to(".data-3 .water0102" , 1, {opacity : 1, marginLeft : 0, delay : -1})
		.to(".data-3 .water02" , 1, {opacity : 1, marginLeft : 0, delay : -1})
		.to(".data-3 .water03" , 1, {opacity : 1, marginLeft : 0, delay : -1})
		
		.to(".data-3 .prd" , 1, {opacity : 1, marginLeft : 0, delay : -2.5})
		.to(".data-3 .water01" , 1, {opacity : 1, marginLeft : 50, delay : -2.5})
		.to(".data-3 .water0102" , 1, {opacity : 1, marginLeft : -80, delay : -2.5})
		.to(".data-3 .water02" , 1, {opacity : 1, marginLeft : 110, delay : -2.5})
		.to(".data-3 .water03" , 1, {opacity : 1, marginLeft : -80, delay : -2.5})
		
		
		
		
		ani4 =  new TimelineLite({paused:true});
		ani4.to(".data-4 .prd" , 1, {opacity : 1, marginLeft : 0, delay : 0})
		.to(".data-4 .water01" , 1, {opacity : 1, marginLeft : 0, delay : -1})
		.to(".data-4 .water0102" , 1, {opacity : 1, marginLeft : 0, delay : -1})
		.to(".data-4 .water02" , 1, {opacity : 1, marginLeft : 0, delay : -1})
		.to(".data-4 .water03" , 1, {opacity : 1, marginLeft : 0, delay : -1})
		
		.to(".data-4 .prd" , 1, {opacity : 1, marginLeft : 0, delay : -2.5})
		.to(".data-4 .water01" , 1, {opacity : 1, marginLeft : 50, delay : -2.5})
		.to(".data-4 .water0102" , 1, {opacity : 1, marginLeft : -80, delay : -2.5})
		.to(".data-4 .water02" , 1, {opacity : 1, marginLeft : 110, delay : -2.5})
		.to(".data-4 .water03" , 1, {opacity : 1, marginLeft : -80, delay : -2.5})
		
		
		
		ani5 =  new TimelineLite({paused:true});
		ani5.to(".data-5 .prd" , 1, {opacity : 1, marginLeft : 0, delay : 0})
		.to(".data-5 .water01" , 1, {opacity : 1, marginLeft : 0, delay : -1})
		.to(".data-5 .water0102" , 1, {opacity : 1, marginLeft : 0, delay : -1})
		.to(".data-5 .water02" , 1, {opacity : 1, marginLeft : 0, delay : -1})
		.to(".data-5 .water03" , 1, {opacity : 1, marginLeft : 0, delay : -1})
		
		.to(".data-5 .prd" , 1, {opacity : 1, marginLeft : 0, delay : -2.5})
		.to(".data-5 .water01" , 1, {opacity : 1, marginLeft : 50, delay : -2.5})
		.to(".data-5 .water0102" , 1, {opacity : 1, marginLeft : -80, delay : -2.5})
		.to(".data-5 .water02" , 1, {opacity : 1, marginLeft : 110, delay : -2.5})
		.to(".data-5 .water03" , 1, {opacity : 1, marginLeft : -80, delay : -2.5})
		
		
		
	
		
		
	});
	
	function ani_eventLight(){
		TweenMax.to('.data-4 .light', 2, {opacity : .7, onComplete:function(){
			TweenMax.to('.data-4 .light', 2, {opacity : 1, onComplete:function(){
				ani_eventLight();
			}});
		}});
	}
	
	function ani_MTop1(){ // 상하모션2
		TweenMax.to('.data-2 .trickle_01', 0.9, {top : -147, onComplete:function(){
			TweenMax.to('.data-2 .trickle_01', 0.9, {top : -150, onComplete:function(){ // +5
			//	ani_MTop1();
			}});
		}});
	}
	
	function ani_MTop2(){ // 상하모션2
		TweenMax.to('.data-2 .trickle_02', 0.9, {top : -67, onComplete:function(){
			TweenMax.to('.data-2 .trickle_02', 0.9, {top : -70, onComplete:function(){
			//	ani_MTop2();
			}});
		}});
	}
	
	function ani_MTop3(){ // 상하모션2
		TweenMax.to('.data-2 .trickle_03', 0.9, {top : 693, onComplete:function(){
			TweenMax.to('.data-2 .trickle_03', 0.9, {top : 690, onComplete:function(){
			//	ani_MTop3();
			}});
		}});
	}
	
	function ani_MTop4(){ // 상하모션2
		TweenMax.to('.data-2 .trickle_04', 0.9, {top : 610, onComplete:function(){
			TweenMax.to('.data-2 .trickle_04', 0.9, {top : 607, onComplete:function(){
			//	ani_MTop4();
			}});
		}});

	}
}



function re1(){
	timeStop();
	ani1.pause(0);
	ani1.reverse();
}
function re2(){
	timeStop();
	ani2.pause(0);
	ani2.reverse();
}
function re3(){
	timeStop();
	ani3.pause(0);
	ani3.reverse();
}

 function re4(){
	 timeStop();
	 ani4.pause(0);
	 ani4.reverse();
 }




$(function(){
	$(".slidesjs-play").css("background-position" , "0 -40px");
	$("#slides > a").click(function(){
		if($(".slidesjs-play").hasClass("slidesjs-playing")){
			$(".slidesjs-play").css("background-position" , "0 -40px");
			$(".slidesjs-stop").css("background-position" , "0 0");
		}else{
			$(".slidesjs-play").css("background-position" , "0 0");
			$(".slidesjs-stop").css("background-position" , "0 -40px");
		}
	});
});
