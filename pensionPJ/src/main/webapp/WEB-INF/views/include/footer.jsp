<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/footer.jsp" %>
<div class="ban_box">
	<div class="ban_con">
        <h2>무창포 이루펜션<br>소개 및 예약안내, 실시간예약</h2>
        <h3>신비의 바닷길과 추억을 무창포 이루펜션에서 만나보실수 있습니다.  고품격의 여유로움 속으로 당신을 초대합니다.</h3>
        <ul>
            <li><a href="/sub1/sub1.htm" class="ban01">이루펜션소개</a></li>
            <li><a href="/main/sub2" class="ban02">실시간예약</a></li>
            <li><a href="/sub3/sub1.htm" class="ban03">예약안내</a></li>
            <li><a href="/sub1/sub2.htm" class="ban04">오시는길</a></li>
        </ul>
    </div>
</div>
<div class="footer">
	<div class="bottom">
    	<h1><img src="/resources/img/f_logo.png" alt="이루펜션" onClick="window.open('/zzAppModule/admin','','');"></h1>
       <p class="address">충청남도 보령시 웅천읍 간드리큰길 104-3 (관당리 165)<span></span>전화: 010-8598-4075, 010-9270-4073<span></span>대표: 염인선<span></span>사업자등록번호: 299-11-00402<span></span><br>계좌번호: <b>농협(염인선) 203027-51-050385</b><br />
<span class="copy">Copyright 2016 © 이루펜션  All rights reserved.</span></p>
    </div>

</div>
<script>
   $(document).ready(function(){
   $(window).scroll(function () {
 
	   var position = $(window).scrollTop();
		if (position > 112) {  // 탑버튼 보여줄 스크롤 위치지정
			$('#back2top').slideDown("slow");
	   } else {
			$('#back2top').slideUp("slow");
	   }
});
 

   $('#back2top').click(function () {
        $('body,html').animate({scrollTop: 0}, 200);   // 클릭시 스크롤 탑으로 이동
    });
});
</script>
   <div id="back2top" title="상단으로 가기"><img src="/resources/img/top_but.gif" alt="↑"></div>
</body>
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
