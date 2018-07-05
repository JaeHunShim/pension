<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<section class="sub_con sub02" id="scene1">
	<div class="title">
        <h2>location</h2>
        <h3>오시는 길</h3>
        <h4>무창포 이루펜션의 바다의 향기를 느껴보세요.</h4>
        <p class="tit_line"></p>
    </div>
    <div class="sub_txt box">
    	<p class="add"><b>주소</b> : 경기도 수원시 영통구 원천동</p>
        <p class="tel">예약문의 <span></span> <b>010-8653-4447</b></p>
	<div id="map" style="width:1250px;height:550px;"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5206f413b86cd2bf52436f6077891259"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new daum.maps.LatLng(37.2664619, 127.06763590000003),
			level: 3
		};

		var map = new daum.maps.Map(container, options);
		var markerPosition  = new daum.maps.LatLng(37.2664619, 127.06763590000003); 
	
		var marker = new daum.maps.Marker({
			position:markerPosition,
			draggable: true
		});
		marker.setMap(map);
</script>
</div>
</section>
<%@ include file="../include/footer.jsp" %>