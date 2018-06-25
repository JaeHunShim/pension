<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<script src="/resources/js/basic/jQuery-2.1.4.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/reservation/style.css" />
<script>
$(document).ready(function(){
	// 전개월
	$('.prev').on('click',function(){
		var prm = document.prm;
		var currentYear = '${calender.year}';
		var currentMonth = '${calender.month}';
		
		$('input[name="year"]').val(currentYear);
		$('input[name="month"]').val(currentMonth-1);
		
		$('#prm').attr('action','/reservation/calender');

		prm.submit();
		
	});
	// 다음개월
	$('.next').on('click',function(){
		
		var prm = document.prm;
		var cYear = '${calender.year}';
		var cMonth = '${calender.month}';
		
		$('input[name="year"]').val(cYear);
		$('input[name="month"]').val(Number(cMonth)+1);
		
		$('#prm').attr('action','/reservation/calender');
		prm.submit();
	});
	//로그인 해야 에약할수 있게 처리 , 예약된 방을 클릭시 예약되어있다고 알림 
	$('li a').on('click',function(event){
		var user_id =$('input[name="user_id"]').val();
		if($('input[name="user_id"]').val().length<1){
			alert('로그인을 해야 이용하실수 있습니다.');
			window.top.location.href = "/user/login";
		}
		if($(this).children().attr('alt')=="예약완료"){
			alert("예약이 완료된 방입니다.");
			event.preventDefault();
			return false;
		}
	});
	//예약된 방에 대해서 css바꿈 처리
	$('input[name="reserNo"]').each(function(){
		var reserNo = $(this).val();
		$('li img').each(function(){
			var b = $(this).attr('id');
			if(reserNo == b ){
				$(this).attr('src','/resources/img/reservation/ico_end.gif');
				$(this).attr('alt','예약완료');
			}
		});
	});
});

</script>
</head>
<body>
<div class="header wRap">
   <h1>이루펜션</h1>
   <div class="Right">
     <a href="/reservation/reservation_main"><img src="/resources/img/reservation/top1on.gif" alt="예약하기"></a> <!-- //이미지파일이름...on.gif -->
     <a href="/reservation/reservation_guide"><img src="/resources/img/reservation/top2.gif" alt="예약안내"></a> <!-- /pen/img/top2on.gif -->
     <a href="/reservation/confirm"><img src="/resources/img/reservation/top3.gif" alt="예약확인"></a> <!-- /pen/img/top3on.gif -->
   </div>
</div>
<div class="sTitle wRap">
   <div class="Left">
      <em>Reservation</em>
      <h2>실시간예약</h2>
   </div>

   <div class="tab1 Right">
      <ol>
          <li><img src="/resources/img/reservation/proc1_01.gif" alt="일자선택"></li>
          <li>객실선택</li>
          <li>정보입력</li>
          <li>예약완료</li>
      </ol>
   </div>
</div>
<!-- calendar start -->	
<div class="conT carnSet">
    <!-- Year & Month -->
    <form name='prm' method='post'>
    	<input type='hidden' name ='year' value='${calender.year}'>
		<input type='hidden' name ='month' value='${calender.month}'>
		<input type='hidden' name ='week' value='${calender.week}'>
		<input type='hidden' name ='lastDate' value='${calender.lastDate}'>
		<input type='hidden' name ='date' value='${calender.date}'>
		<input type='hidden' name="user_id" value='${login.user_id}'>
		<c:forEach items="${reserVO}" var="reserVO">
		<input type='hidden' name="reserNo" id='${reserVO.reserNo}' value='${reserVO.reserNo}'>	
		</c:forEach>
    	<div class="yms wRap">
			<a style="cursor:pointer" class='prev'>이전 </a>
 				<p><b>${calender.year}</b>년<b>${calender.month+1}</b>월</p>
       		<a style="cursor:pointer" class='next'>다음</a>
    	</div>
    </form>
    <!-- //Year & Month -->
    
    <p><span><img src="/resources/img/reservation/ico_2day.gif" alt="To Day" align="absmiddle"> 오늘</span> 
    	<span><img src="/resources/img/reservation/ico_ye.gif" alt="예" align="absmiddle"> 예약가능</span> 
    	<span><img src="/resources/img/reservation/ico_end.gif" alt="완" align="absmiddle"> 예약완료</span> 
    	<span><img src="/resources/img/reservation/ico_wait.gif" alt="대" align="absmiddle"> 예약대기</span><br>
    * 원하시는 날짜의 객실명을 선택하시면 실시간 예약이 가능합니다.</p>
      

	<table border='0' cellspacing='1' cellpadding='0' class='wideT caren'>
       <caption>실시간예약 -${calender.year}년 {calender.month}월 일자별 예약현황</caption>
		<thead>
			<tr>
				<th class='red' scope='col'>일</th>
				<th scope='col'>월</th>
				<th scope='col'>화</th>
				<th scope='col'>수</th>
				<th scope='col'>목</th>
				<th scope='col'>금</th>
				<th class='blue' scope='col'>토</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var ='i' begin='1' end ="${calender.row}" step='1'>
				<tr>
				<c:forEach var='k' begin='1' end ='7' step ='1'>
					<c:choose>
						<c:when test="${i eq 1 && k < calender.week ||dNum >= calender.lastDate}">
							<td class='red b4_day'>&nbsp;</td>
						</c:when>
						<c:otherwise>
							<c:set var='dNum' value='${dNum+1}'/>
							<td class='b4_day'>
								<strong>${dNum}
									<c:choose>
										<c:when test='${current.month eq calender.month && current.date eq dNum}'>
											<img src='/resources/img/reservation/ico_2day.gif' alt='To Day' align='absmiddle'>
										</c:when>
									</c:choose>
								</strong>
								<ul class='reList'>
									<c:choose>
										<c:when test="${current.month>calender.month ||current.month eq calender.month && current.date > dNum}">
											<li>예약완료</li>
										</c:when>
										<c:when test="${current.month eq calender.month && current.date <= dNum || current.month <calender.month}">
											<li>${calender.year}${calender.month+1}${dNum}1</li>
											<li>${calender.year}${calender.month+1}${dNum}2</li>
											<li>${calender.year}${calender.month+1}${dNum}3</li>
											<li><a href='/reservation/select?year=${calender.year}&month=${calender.month}&date=${calender.date}&week=${calender.week}&lastDate=${calender.lastDate}&dNum=${dNum}&room_check=1'><img src='/resources/img/reservation/ico_ye.gif' alt='예' align='absmiddle' id='${calender.year}${calender.month+1}${dNum}1'><span  style='color:#6a6a6a'>데이지(복층)</span></a></li>
											<li><a href='/reservation/select?year=${calender.year}&month=${calender.month}&date=${calender.date}&week=${calender.week}&lastDate=${calender.lastDate}&dNum=${dNum}&room_check=2'><img src='/resources/img/reservation/ico_ye.gif' alt='예' align='absmiddle' id='${calender.year}${calender.month+1}${dNum}2'><span style='color:#6a6a6a'>릴리(복층)</span></a></li>
											<li><a href='/reservation/select?year=${calender.year}&month=${calender.month}&date=${calender.date}&week=${calender.week}&lastDate=${calender.lastDate}&dNum=${dNum}&room_check=3'><img src='/resources/img/reservation/ico_ye.gif' alt='예' align='absmiddle' id='${calender.year}${calender.month+1}${dNum}3'><span style='color:#6a6a6a'>아이비</span></a></li>
											<li><a href='/reservation/select?year=${calender.year}&month=${calender.month}&date=${calender.date}&week=${calender.week}&lastDate=${calender.lastDate}&dNum=${dNum}&room_check=4'><img src='/resources/img/reservation/ico_ye.gif' alt='예' align='absmiddle' id='${calender.year}${calender.month+1}${dNum}4'><span style='color:#6a6a6a'>마가렛</span></a></li>
										</c:when>
									</c:choose>
								</ul>
							</td>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</c:forEach>
		</tbody>
	</table>	
</div>
</body>
</html>
<div class="footer">본 실시간 예약프로그램은 <a href="http://www.ebom.co.kr" target="_blank">DesignBom</a>에서 제공합니다.</div>




