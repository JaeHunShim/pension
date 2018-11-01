<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../include/header.jsp" %>
<section class="sub_con sub02" id="scene1">
	<div class="title">
        <h2><b>Room</b> Information</h2>
        <h3>데이지</h3>
        <h4>무창포 J.P펜션의 바다의 향기를 느껴보세요.</h4>
        <p class="tit_line"></p>
    </div>
    <div class="sub_txt box">
		<link rel="stylesheet" type="text/css" href="/resources/css/intro/gall.css">
        <style>
			div.jq_gallery{width:1252px; height:890px; position:relative; margin:0 auto; background:none; padding:0px; border:none;}
		</style>
		  <!-- gallery -->
		  
<div class="jq_gallery">
					<div class="navigation-container">
						<div id="thumbs" class="navigation">
							<ul class="thumbs noscript">
								
								<li><a class="thumb" name="1" href="/resources/img/room/daisy/1.jpg"><img src="/resources/img/room/daisy/1.jpg" /></a></li>
                                <li><a class="thumb" name="2" href="/resources/img/room/daisy/2.jpg"><img src="/resources/img/room/daisy/2.jpg" /></a></li>
                                <li><a class="thumb" name="3" href="/resources/img/room/daisy/3.jpg"><img src="/resources/img/room/daisy/3.jpg" /></a></li>
                                <li><a class="thumb" name="4" href="/resources/img/room/daisy/4.jpg"><img src="/resources/img/room/daisy/4.jpg" /></a></li>
                                <li><a class="thumb" name="5" href="/resources/img/room/daisy/5.jpg"><img src="/resources/img/room/daisy/5.jpg" /></a></li>
                                <li><a class="thumb" name="6" href="/resources/img/room/daisy/6.jpg"><img src="/resources/img/room/daisy/6.jpg" /></a></li>
                                <li><a class="thumb" name="7" href="/resources/img/room/daisy/7.jpg"><img src="/resources/img/room/daisy/7.jpg" /></a></li>
                                <li><a class="thumb" name="8" href="/resources/img/room/daisy/8.jpg"><img src="/resources/img/room/daisy/8.jpg" /></a></li>
                                <li><a class="thumb" name="9" href="/resources/img/room/daisy/9.jpg"><img src="/resources/img/room/daisy/9.jpg" /></a></li>
                                <li><a class="thumb" name="8" href="/resources/img/room/daisy/10.jpg"><img src="/resources/img/room/daisy/10.jpg" /></a></li>
                                <li><a class="thumb" name="9" href="/resources/img/room/daisy/11.jpg"><img src="/resources/img/room/daisy/11.jpg" /></a></li>

							</ul>
							<a class="pageLink prev" style="visibility: hidden;" href="#" title="Previous Page">이전</a>
							<a class="pageLink next" style="visibility: hidden;" href="#" title="Next Page">다음</a>
						</div>
					</div>

					<div class="gallery_content">
						<div class="slideshow-container">
							<div id="controls" class="controls"></div>
							<div id="loading" class="loader"></div>
							<div id="slideshow" class="slideshow">
						  </div>
						</div>
						<div id="caption" class="caption-container">
							<div class="photo-index"></div>
						</div>
					</div>
		  </div>
          
          <!-- 이미지 롤링-->
<script type="text/javascript">
jQuery(document).ready(function($) {
// We only want these styles applied when javascript is enabled
//$('div.navigation').css({'width' : '200px'});
$('div.gallery_content').css('display', 'block');

// Initially set opacity on thumbs and add
// additional styling for hover effect on thumbs
var onMouseOutOpacity = 0.37;
$('#thumbs ul.thumbs li, div.navigation a.pageLink').opacityrollover({
	mouseOutOpacity:   onMouseOutOpacity,
	mouseOverOpacity:  1.0,
	fadeSpeed:         'fast',
	exemptionSelector: '.selected'
});

// Initialize Advanced Galleriffic Gallery
var gallery = $('#thumbs').galleriffic({
	delay:                     2500,
	numThumbs:                 13, //리스트 출력갯수설정
	preloadAhead:              10,
	enableTopPager:            false,
	enableBottomPager:         false,
	imageContainerSel:         '#slideshow',
	controlsContainerSel:      '#controls',
	captionContainerSel:       '#caption',
	loadingContainerSel:       '#loading',
	renderSSControls:          false,  // 슬라이드 재생설정
	renderNavControls:         true, // 사진 한장씩 넘기는 버튼
	playLinkText:              'Play Slideshow', // 슬라이드 재생 텍스트설정
	pauseLinkText:             'Pause Slideshow',
	prevLinkText:              '&lsaquo; 이전사진',
	nextLinkText:              '다음사진 &rsaquo;',
	nextPageLinkText:          'Next &rsaquo;',
	prevPageLinkText:          '&lsaquo; Prev',
	enableHistory:             true,
	autoStart:                 false,
	syncTransitions:           true,
	defaultTransitionDuration: 300, //넘어가는 속도
	onSlideChange:             function(prevIndex, nextIndex) {
		// 'this' refers to the gallery, which is an extension of $('#thumbs')
		this.find('ul.thumbs').children()
			.eq(prevIndex).fadeTo('fast', onMouseOutOpacity).end()
			.eq(nextIndex).fadeTo('fast', 1.0);

		// Update the photo index display
		/*this.$captionContainer.find('div.photo-index')
			.html('Photo '+ (nextIndex+1) +' of '+ this.data.length);*/
	},
	onPageTransitionOut:       function(callback) {
		this.fadeTo('fast', 0.0, callback);
	},
	onPageTransitionIn:        function() {
		var prevPageLink = this.find('a.prev').css('visibility', '');
		var nextPageLink = this.find('a.next').css('visibility', '');
		
		// Show appropriate next / prev page links
		if (this.displayedPage > 0)
			prevPageLink.css('visibility', 'visible');

		var lastPage = this.getNumPages() - 1;
		if (this.displayedPage < lastPage)
			nextPageLink.css('visibility', 'visible');

		this.fadeTo('fast', 1.0);
	}
});

/**************** Event handlers for custom next / prev page links **********************/

gallery.find('a.prev').click(function(e) {
	gallery.previousPage();
	e.preventDefault();
});

gallery.find('a.next').click(function(e) {
	gallery.nextPage();
	e.preventDefault();
});

/****************************************************************************************/

/**** Functions to support integration of galleriffic with the jquery.history plugin ****/

// PageLoad function
// This function is called when:
// 1. after calling $.historyInit();
// 2. after calling $.historyLoad();
// 3. after pushing "Go Back" button of a browser
function pageload(hash) {
	// alert("pageload: " + hash);
	// hash doesn't contain the first # character.
	if(hash) {
		$.galleriffic.gotoImage(hash);
	} else {
		gallery.gotoIndex(0);
	}

}

// Initialize history plugin.
// The callback is called at once by present location.hash. 
//$.historyInit(pageload, "advanced.html");


});
</script>
<script src="/resources/js/intro/jquery.opacityrollover.js"></script>
<script src="/resources/js/intro/jquery.galleriffic.js"></script>
<!-- 이미지 롤링 end-->
    </div>	
</section>
<%@ include file ="../include/footer.jsp" %>