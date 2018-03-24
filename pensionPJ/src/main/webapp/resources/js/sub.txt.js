/*sub txt*/
$(function(){

	//animation생성
	controller = new ScrollMagic();
	
	
	//section 높이설정
	setSectionHeight();
	

	
});


//section 높이설정
function setSectionHeight(){
	winH = $(window).height();
	winW = $(window).width();
	if(winW>900){
		if(winH<=750){
				winH = 750;
		}

	}
}

//slide높이설정
function setSlideHeight(){
	if(winW<=1023 && winW>768){
	}
}//sub txt end


$(function() {
	if(winW>900){
    var tween =  new TimelineMax ()
            .add([
					 TweenMax.from("#scene1 .title", 0.4, {opacity:0, paddingTop:"80px", ease:"easeOutCubic", delay: 0.4}),
					 TweenMax.from("#scene1 .sub_txt.box", 0.8, {opacity:0, paddingTop:"100px", ease:"easeOutCubic", delay: 0.7})
            ]);

    // build scene1
    new ScrollScene({triggerElement: "#scene1 .title", triggerHook : '1'})
                    .setTween(tween)
                    .addTo(controller);
	
	var tween =  new TimelineMax ()
            .add([
					 TweenMax.from("#scene2 .title", 0.4, {opacity:0, paddingTop:"80px", ease:"easeOutCubic", delay: 0.4}),
					 TweenMax.from("#scene2 .sub_txt.box", 0.8, {opacity:0, paddingTop:"100px", ease:"easeOutCubic", delay: 0.7})
            ]);

    // build scene2
    new ScrollScene({triggerElement: "#scene2 .title", triggerHook : '1'})
                    .setTween(tween)
                    .addTo(controller);
	
	// build scene3
	var tween =  new TimelineMax ()
            .add([
					 TweenMax.from("#scene3 .title", 0.4, {opacity:0, paddingTop:"80px", ease:"easeOutCubic", delay: 0.4}),
					 TweenMax.from("#scene3 .sub_txt.box", 0.8, {opacity:0, paddingTop:"100px", ease:"easeOutCubic", delay: 0.7})
            ]);

    // build scene1
    new ScrollScene({triggerElement: "#scene3 .title", triggerHook : '1'})
                    .setTween(tween)
                    .addTo(controller);

	}
});