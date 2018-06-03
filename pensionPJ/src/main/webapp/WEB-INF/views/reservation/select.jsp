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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script>
// 룸체크 버튼 
function check(room_check){
	var room_check = $("input[name='room_check']").val();
	if(room_check == 1){
		$('input[name="daisy"]').prop('checked',true);
	}else if(room_check==2){
		$('input[name="lily"]').prop('checked',true);
	}else if(room_check==3){
		$('input[name="ivy"]').prop('checked',true);
	}else{
		$('input[name="magaret"]').prop('checked',true);
	}
}

$(document).ready(function(){
	var room_check = $("input[name='room_check']").val();
	check(room_check);
	
	//선택 한날짜의  css바꿈 
	var select_date = $("input[name='select_date']").val();
	console.log(select_date);
	/* $('.b4_day').find('strong').eq(select_date-1).css('background-color','orange'); */
	
 	$('strong:contains('+select_date+')').each(function(){
 		
 		console.log($(this).text().trim()== select_date.trim());
		if($(this).text().trim()== select_date.trim()){

   			$(this).parent().css('background-color', 'orange');
   			
   			return;
	}});
	//select 전송하기위해서 
	var chkvalue = $('select[name="chk_day"]').val();
	//var chktext = $('select[name="chk_day"] option:selected').text();
	$("input[name='check_day']").val(chkvalue);
	//$("input[name='check_text']").val(chktext);
	
	

});
</script>
<body>
<!--  sub title -->
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
          <li>일자선택</li>
          <li><img src="/resources/img/reservation/proc1_02.gif" alt="객실선택"></li>
          <li>정보입력</li>
          <li>예약완료</li>
      </ol>
   </div>
</div>
<!--  subTitle end -->
<div class="conT carnSet">
<form name='prm' method='post' action='/reservation/insert'>
	<input type='hidden' name ='year' value='${calender.year}'>	<!--  해당년도  -->
	<input type='hidden' name ='month' value='${calender.month}'>	<!-- 해당월 -->
	<input type='hidden' name ='week' value='${calender.week}'>	<!-- 해당주 -->
	<input type='hidden' name ='lastDate' value='${calender.lastDate}'><!--  금일 마지막 날 -->
	<input type='hidden' name ='date' value='${calender.date}'>	<!-- 금일 -->
	<input type='hidden' name='room_check' value='${calender.room_check}'> <!-- 방체크정보 -->
	<input type='hidden' name ='select_date' value='${date.dNum}'>	<!-- 예약일 -->
	<input type ='hidden' name='check_day' value='${reVO.chk_day}'> <!-- 숙박기간의 value값  -->
	<input type ="hidden" name ='fullDate' value='${calender.fullDate}'> <!-- 예약한 날짜 full -->
	<!-- content -->

    <!-- 숙박 기간 선택 -->
	<div class="yms dayS wRap">
		<p><b>${calender.year}</b>년 <b>${calender.month+1}</b>월 <b>${date.dNum}</b>일</p>
		<select name="chk_day">
			<option value="1">1박 2일 </option>
			<option value="2">2박 3일 </option>
			<option value="3">3박 4일 </option>
			<option value="4">4박 5일 </option>
			<option value="5">5박 6일 </option>
			<option value="6">6박 7일 </option>
			<option value="7">7박 8일 </option>
			<option value="8">8박 9일 </option>
			<option value="9">9박 10일 </option>
			<option value="10">10박 11일 </option>
			<option value="11">11박 12일 </option>
			<option value="12">12박 13일 </option>
			<option value="13">13박 14일 </option>
			<option value="14">14박 15일 </option>
			<option value="15">15박 16일 </option>
			<option value="16">16박 17일 </option>
			<option value="17">17박 18일 </option>
			<option value="18">18박 19일 </option>
			<option value="19">19박 20일 </option>
			<option value="20">20박 21일 </option>
			<option value="21">21박 22일 </option>
			<option value="22">22박 23일 </option>
			<option value="23">23박 24일 </option>
			<option value="24">24박 25일 </option>
			<option value="25">25박 26일 </option>
			<option value="26">26박 27일 </option>
			<option value="27">27박 28일 </option>
			<option value="29">29박 30일 </option>
			<option value="30">30박 31일 </option>
			<option value="31">31박 32일 </option>
		</select>
	</div>	
    <!-- //선택일/숙박기간 -->
    
	<table border='0' cellpadding='0' cellspacing='1' class='wideT num'>
		<caption>실시간예약 - 2015년 1월 30일 객실/인원수 선택</caption>
		<thead>
			<tr>
				<th width='7%' scope='col'>선택</th>
				<th width='12%' scope='col'>예약</th>
				<th rowspan='2' scope='col'>객실명</th>
				<th width='10%' scope='col'>크기</th>
				<th width='10%' scope='col'>기준/최대</th>
				<th scope='col' width='10%'>인원선택</th>
				<th width='22%' scope='col'>객실요금</th>
			</tr>
		</thead> 
		<tbody>
			<tr>
				<td>
					<input type='checkbox' name='magaret' value='${room_check}' class='bnone' >
				</td>
				<td><span class='bgBlu'>예약가능</span></td>
				<td class='txt'>마가렛</td>
				<td>25평형</td>
				<td>4/8</td>
				<td>
					<select name='inwon_1464661788'>
						<option value='4'>4</option>
						<option value='5'>5</option>
						<option value='6'>6</option>							
						<option value='7'>7</option>
						<option value='8'>8</option>
					</select>
				</td>
				<td><b>￦120,000</b></td>    
			</tr>
			
			<tr>
				<td><input type='checkbox' name ='ivy' value='${room_check}' class='bnone' ></td>
				<td><span class='bgBlu'>예약가능</span></td>
				<td class='txt'>아이비</td>
				<td>20평형</td>
				<td>4/6</td>
				<td>
					<select name='inwon_1471309372'>
						<option value='4'>4</option>
						<option value='5'>5</option>
						<option value='6'>6</option>
					</select>
				</td>    
				<td><b>￦100,000</b></td>
			</tr>
			<tr>
				<td>
					<input type='checkbox' name='lily' value='${room_check}' class='bnone' >
					<input type='hidden' name='room_price_1471309564' value='120000'>
					<input type='hidden' name='basic_price_1471309564' value=''>
				</td>
				<td><span class='bgBlu'>예약가능</span></td>
				<td class='txt'>릴리(복층)</td>
				<td>25평형</td>
				<td>4/8</td>
				<td>
					<select name='inwon_1471309564'>
						<option value='4'>4</option>
						<option value='5'>5</option>
						<option value='6'>6</option>
						<option value='7'>7</option>
						<option value='8'>8</option>
					</select>
				</td>    
				<td><b>￦120,000</b></td>
			</tr>		
			<tr>
				<td>
					<input type='checkbox' name='daisy' value='${room_check}' class='bnone' >
					<input type='hidden' name='room_price_1471309602' value='120000'>
					<input type='hidden' name='basic_price_1471309602' value=''>
				</td>
				<td><span class='bgBlu'>예약가능</span></td>
				<td class='txt'>데이지(복층)</td>
				<td>25평형</td>
				<td>4/8</td>
				<td>
					<select name='inwon_1471309602'>
						<option value='4'>4</option>
						<option value='5'>5</option>
						<option value='6'>6</option>
						<option value='7'>7</option>
						<option value='8'>8</option>
					</select>
				</td>    
				<td><b>￦120,000</b></td>
			</tr>
		</tbody>
	</table>
	 

    <p class="btn"><input type="image" src="/resources/img/reservation/btn.png" alt="예약하기"></p>
    </form>
   <!-- //객실예약 --> 
    
    <p class="line">&nbsp;</p> <!-- 구분선 -->
    
        <p><span><img src="/resources/img/reservation/ico_2day.gif" alt="To Day" align="absmiddle"> 오늘</span> 
    	<span><img src="/resources/img/reservation/ico_ye.gif" alt="예" align="absmiddle"> 예약가능</span> 
    	<span><img src="/resources/img/reservation/ico_end.gif" alt="완" align="absmiddle"> 예약완료</span> 
    	<span><img src="/resources/img/reservation/ico_wait.gif" alt="대" align="absmiddle"> 예약대기</span><br>
    * 원하시는 날짜의 객실명을 선택하시면 실시간 예약이 가능합니다.</p>
      
	<!--  달력시작  -->
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
											<li><a href='/reservation/select?year=${calender.year}&month=${calender.month}&date=${calender.date}&week=${calender.week}&lastDate=${calender.lastDate}&dNum=${dNum}&room_check=1'><img src='/resources/img/reservation/ico_ye.gif' alt='예' align='absmiddle'><span name='daisy' style='color:#6a6a6a'>데이지(복층)</span></a></li>
											<li><a href='/reservation/select?year=${calender.year}&month=${calender.month}&date=${calender.date}&week=${calender.week}&lastDate=${calender.lastDate}&dNum=${dNum}&room_check=2'><img src='/resources/img/reservation/ico_ye.gif' alt='예' align='absmiddle'><span name='lily' style='color:#6a6a6a'>릴리(복층)</span></a></li>
											<li><a href='/reservation/select?year=${calender.year}&month=${calender.month}&date=${calender.date}&week=${calender.week}&lastDate=${calender.lastDate}&dNum=${dNum}&room_check=3'><img src='/resources/img/reservation/ico_ye.gif' alt='예' align='absmiddle'><span name= 'ivy'style='color:#6a6a6a'>아이비</span></a></li>
											<li><a href='/reservation/select?year=${calender.year}&month=${calender.month}&date=${calender.date}&week=${calender.week}&lastDate=${calender.lastDate}&dNum=${dNum}&room_check=4'><img src='/resources/img/reservat	ion/ico_ye.gif' alt='예' align='absmiddle'><span name= 'magaret' style='color:#6a6a6a'>마가렛</span></a></li>
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