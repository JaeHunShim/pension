<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<!-- 아래쪽 슬라이 js -->
<script src="/resources/js/rolling/owl.carousel.js"></script>
<div class="room_box">
	<h2><b>Room</b> Information</h2>
    <h3>무창포 이루펜션의 바다의 향기를 느껴보세요.</h3>
	<div class="owl_box">
        <div id="owl-demo" class="owl-carousel">
            <div class="item">
            	<p class="room_img"><img src="/resources/img/main/room_img.jpg" /></p>
                <p class="room_name">데이지</p>
                <p class="room_txt">무창포 이루펜션</p>
                <p class="room_view"><a href="/room/daisy">객실보기</a></p>
            </div>
            <div class="item">
            	<p class="room_img"><img src="/resources/img/main/room_img1.jpg" /></p>
                <p class="room_name">릴리</p>
                <p class="room_txt">무창포 이루펜션</p>
                <p class="room_view"><a href="/room/lily">객실보기</a></p>
            </div>
            <div class="item">
            	<p class="room_img"><img src="/resources/img/main/room_img2.jpg" /></p>
                <p class="room_name">아이비</p>
                <p class="room_txt">무창포 이루펜션</p>
                <p class="room_view"><a href="/room/ivy">객실보기</a></p>
            </div>
            <div class="item">
            	<p class="room_img"><img src="/resources/img/main/room_img3.jpg" /></p>
                <p class="room_name">마가렛</p>
                <p class="room_txt">무창포 이루펜션</p>
                <p class="room_view"><a href="/room/margaret">객실보기</a></p>
            </div>
        </div>
    </div>
</div>
<%@ include file="../include/footer.jsp" %>
<script>
    $(document).ready(function() {
      $("#owl-demo").owlCarousel({
        autoPlay: 3000,
        items : 3,
		navigation : true,
		pagination:false,
        itemsDesktop : [1199,3],
        itemsDesktopSmall : [979,3]
      });

    });
</script>
<script src="/resources/js/module/common2.js"></script>
<script src="/resources/js/module/board.js"></script>
<script src="/resources/js/module/ajax.js"></script> 