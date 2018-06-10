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

//가격에 콤마찍는 부분
function numberWithCommas(x) {
	$('td b').each(function(){
		var x = $(this).text();
		var y = x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		$(this).text(y);
	});
	
}
//controller pay가는 부분  
function insert(){
	//숙박 선택에 대한 값
	var chkvalue = $('select[name="chk_day"]').val();
		$("input[name='select']").val(chkvalue);
		var prm = document.prm;
		$('#prm').attr('action','/reservation/pay');
		prm.submit();	
}

//insertController로 form 전송할 값을 라디오 버튼으로 클릭한 값으로 변동해서 전송함 
function changeInsertValue(){
	var first_value = $('input[name="pay"]').val();
	var select = $('input[name="select"]').val();
	var m =$("select[name='inwon_select_m']").val();
	var i =$("select[name='inwon_select_i']").val();
	var l =$("select[name='inwon_select_l']").val();
	var d =$("select[name='inwon_select_d']").val();
	$('#hkBox:checked').each(function(){
		if(this.value ==1){
			$('input[name="room_name"]').val("데이지(복층)");
			$('input[name="room_width"]').val("25평형");
			$('input[name="inwon_check"]').val(d);
			$('input[name="middle_pay"]').val(first_value);
		}else if(this.value==2){
			$('input[name="room_name"]').val("릴리(복층)");
			$('input[name="room_width"]').val("25평형");
			$('input[name="inwon_check"]').val(l);
			$('input[name="middle_pay"]').val(first_value);
		}else if(this.value==3){
			$('input[name="room_name"]').val("아이비");
			$('input[name="room_width"]').val("20평형");
			$('input[name="inwon_check"]').val(i);
			$('input[name="middle_pay"]').val(first_value-select*20000);
		}else{
			$('input[name="room_name"]').val("마가렛");
			$('input[name="room_width"]').val("25평형");
			$('input[name="inwon_check"]').val(m);
			$('input[name="middle_pay"]').val(first_value);
		}
		return true;
	});
}
// 룸체크 버튼 
function check(room_check){
	var room_check = $("input[name='room_check']").val();
	if(room_check == 1){
		$('input:checkbox[name="daisy"]').prop('checked',true);
		$('input[name="room_name"]').val("데이지(복층)");
	}else if(room_check==2){
		$('input:checkbox[name="lily"]').prop('checked',true);
		$('input[name="room_name"]').val("릴리(복층)");
	}else if(room_check==3){
		$('input:checkbox[name="ivy"]').prop('checked',true);
		$('input[name="room_name"]').val("아이비");
	}else{
		$('input:checkbox[name="magaret"]').prop('checked',true);
		$('input[name="room_name"]').val("마가렛");
	}
	return;
}
$(document).ready(function(){
	//check박스 선택
	var room_check = $("input[name='room_check']").val();
	check(room_check);
	//선택 한날짜의  css바꿈 
	var select_date = $("input[name='dNum']").val();
	console.log(select_date);
	/* $('.b4_day').find('strong').eq(select_date-1).css('background-color','orange'); */
	
 	$('strong:contains('+select_date+')').each(function(){
 		
 		/* console.log($(this).text().trim()== select_date.trim()); */
		if($(this).text().trim()== select_date.trim()){

   			$(this).parent().css('background-color', 'orange');
   				
   			return;
	}});
	
	//숙박 option에 대한 정보유지
	var select_name =$("input[name='select']").val()
	$('#chk_day option').each(function(){
		/* console.log($(this).val()); */
		if($(this).val() == select_name){
			$(this).attr('selected',true);
		}
	});
	//contoller insert로 가는 부분 (하나라도 체크를 안하면 submit안되게함 )
	$('input[type="image"]').on('click',function(event){
		var checkvalue= $('#hkBox:checked').length; 
		if(checkvalue==0){
			alert('객실을 하나라도 선택 하셔야 합니다.');
			event.preventDefault();
		}else{
			changeInsertValue();
			var prm = document.prm;
			$('#prm').attr('action','/reservation/insert');
			prm.submit();
		}
	});	
	//숫자 string으로 바꿔서 ,찍기 
	$('td b').each(function(){
		var x = $(this).text();
		numberWithCommas(x);
	});
	
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
<form name ="prm" id='prm' method='post'>
	<input type='hidden' name ='year' value='${calender.year}'>	<!--  해당년도  -->
	<input type='hidden' name ='month' value='${calender.month}'>	<!-- 해당월 -->
	<input type='hidden' name ='week' value='${calender.week}'>	<!-- 해당주 -->
	<input type='hidden' name ='lastDate' value='${calender.lastDate}'><!--  금일 마지막 날 -->
	<input type='hidden' name ='date' value='${calender.date}'>	<!-- 금일 -->
	<input type='hidden' name='room_check' value='${calender.room_check}'> <!-- 방체크정보 -->
	<input type='hidden' name ='dNum' value='${date.dNum}'><!-- 예약일 -->
	<input type='hidden' name='select' value='${calender.select}'> <!-- 숙박기간의 value값  -->
	<input type="hidden" name ='fullDate' value='${calender.fullDate}'> <!-- 예약한 날짜 full -->
	<input type="hidden" name='room_name' value ='${calender.room_name}'><!--  방이름 -->
	<input type="hidden" name="inwon_check" value="${calender.inwon_check}"><!-- 숙박인원 -->
	<input type="hidden" name="pay" value="${calender.pay}"><!--  가격 -->
	<input type="hidden" name="room_width" value="${calender.room_width}"><!--방마다 방크기 -->
	<input type="hidden" name="middle_pay" value="${calender.middle_pay}"><!--숙박기간에 다른 가격에 대해 지불할값  -->
	<!-- content -->
    <!-- 숙박 기간 선택 -->
	<div class="yms dayS wRap">
		<p><b>${calender.year}</b>년 <b>${calender.month+1}</b>월 <b>${date.dNum}</b>일</p>
		<select name="chk_day" id="chk_day" onchange="insert();">
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
					<input type='checkbox' id ='hkBox' name='magaret' value='4'>
				</td>
				<td><span class='bgBlu'>예약가능</span></td>
				<td class='txt'>마가렛</td>
				<td>25평형</td>
				<td>4/8</td>
				<td>
					<select name='inwon_select_m'>
						<option value='4'>4</option>
						<option value='5'>5</option>
						<option value='6'>6</option>							
						<option value='7'>7</option>
						<option value='8'>8</option>
					</select>
				</td>
				<td><b>￦${calender.pay}</b></td>    
			</tr>
			
			<tr>
				<td><input type='checkbox' id='hkBox' name ='ivy' value='3'>
					
				</td>
				<td><span class='bgBlu'>예약가능</span></td>
				<td class='txt'>아이비</td>
				<td>20평형</td>
				<td>4/6</td>
				<td>
					<select name='inwon_select_i'>
						<option value='4'>4</option>
						<option value='5'>5</option>
						<option value='6'>6</option>
					</select>
				</td>    
				<td><b>￦${calender.pay-(calender.select*20000)}</b></td>
			</tr>
			<tr>
				<td>
					<input type='checkbox' id='hkBox' name='lily' value='2'>
				
				</td>
				<td><span class='bgBlu'>예약가능</span></td>
				<td class='txt'>릴리(복층)</td>
				
				<td>25평형</td>
				<td>4/8</td>
				<td>
					<select name='inwon_select_l'>
						<option value='4'>4</option>
						<option value='5'>5</option>
						<option value='6'>6</option>
						<option value='7'>7</option>
						<option value='8'>8</option>
					</select>
				</td>    
				<td><b>￦${calender.pay}</b></td>
			</tr>		
			<tr>
				<td>
					<input type='checkbox' id='hkBox' name='daisy' value='1'>
				
				</td>
				<td><span class='bgBlu'>예약가능</span></td>
				<td class='txt'>데이지(복층)</td>
				<td>25평형</td>
				<td>4/8</td>
				<td>
					<select name='inwon_select_d'>
						<option value='4'>4</option>
						<option value='5'>5</option>
						<option value='6'>6</option>
						<option value='7'>7</option>
						<option value='8'>8</option>
					</select>
				</td>    
				<td><b>￦${calender.pay}</b></td>
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