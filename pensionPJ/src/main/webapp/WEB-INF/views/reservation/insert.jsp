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
<script>
//숫자에 콤마찍는 함수
function numberWithCommas(x) {
	$('#info').children('td').each(function(){
		var x = $(this).text();
		var y = x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		$(this).text(y);

	});
}
//이전단계로 가는 부분 
function backPage(){
	var frm = document.prm;
	$('#frm').attr('method','get');
	$('#frm').attr('action','/reservation/select');
	frm.submit();
}
$(document).ready(function(){
	//입실시간
	var entance_time =$('select[name="entance_time"]').val();
	$('input[name="entance_time"]').val(entance_time);
	
	//전달사항
	var reser_content =$('textarea[name="reser_content"]').text();
	$('input[name="entance_time"]').val(reser_content);
	
	//숫자에 콤마 직는 부분
	$('#info').children('td').each(function(){
		var x = $(this).text();
		numberWithCommas(x)
		return x;
	});
	//동의버튼 안눌렀을때  다음단계로 넘어가지 못하게 하는 부분 
	$('.btn').on('click',function(){
 		var checkconfirm =$('input:checkbox').prop('checked');
		if(checkconfirm == false){
			alert('약관에 동의 하셔야 합니다.');
			return false;
		}else{
		var frm = document.frm;
		$('#frm').attr('action','/reservation/confirm');
		frm.submit();
		}
	});
});

</script>
</head>
<body>
<div class="header wRap">
   <h1>J.P펜션</h1>
   <div class="Right">
     <a href="/reservation/reservation_main"><img src="/resources/img/reservation/top1on.gif" alt="예약하기"></a> <!-- //이미지파일이름...on.gif -->
     <a href="/reservation/reservation_guide"><img src="/resources/img/reservation/top2.gif" alt="예약안내"></a> <!-- /pen/img/top2on.gif -->
     <a href="/reservation/confirm"><img src="/resources/img/reservation/top3.gif" alt="예약확인"></a> <!-- /pen/img/top3on.gif -->
   </div>
</div>
<!-- Sub Title -->
<div class="sTitle wRap">
	<div class="Left">
		<em>Reservation</em>
		<h2>실시간예약</h2>
	</div>
	<div class="tab1 Right">
		<ol>
			<li>일자선택</li>
			<li>객실선택</li>
			<li><img src="/resources/img/reservation/proc1_03.gif" alt="정보입력"></li>
			<li>예약완료</li>
		</ol>
	</div>
</div>
<!-- //Sub Title -->
<form name="frm" id="frm" method="post">

	<input type='hidden' name='room_check' value='${calender.room_check}'> <!-- 방체크정보 -->
	<input type='hidden' name='select' value='${calender.select}'> <!-- 숙박기간의 value값  -->
	<input type='hidden' name ='fullDate' value='${calender.fullDate}'> <!-- 예약한 날짜 full -->
	<input type='hidden' name='room_name' value ='${calender.room_name}'><!--  방이름 -->
	<input type='hidden' name="inwon_check" value="${calender.inwon_check}"><!-- 숙박인원 -->
	<input type='hidden' name="pay" value="${calender.pay}"><!--  가격 -->
	<input type='hidden' name="middle_pay" value="${calender.middle_pay}"><!--숙박기간에 다른 가격에 대해 지불할값  -->
	<input type='hidden' name="room_max" value="${calender.room_max}"><!--방의 최대 인원  -->
	<input type='hidden' name ='year' value='${calender.year}'>	<!--  해당년도  -->
	<input type='hidden' name ='month' value='${calender.month}'>	<!-- 해당월 -->
	<input type='hidden' name ='dNum' value='${calender.dNum}'><!-- 예약일 -->
	<input type="hidden" name="total_pay" value="${calender.total_pay}">
	<input type="hidden" name="fullDate" value="${calender.fullDate}">
	<input type="hidden" name ="total_pay" value="${calender.total_pay}">
<%-- 	<input type='hidden' name="entance_time" value="${calender.entance_time}"><!-- 입실 예정시간 -->
	<input type="hidden" name="reser_content" value="${calender.reser_content}"><!-- 내용  --> --%>
<!-- Contents -->   
	<div class="conT">
    
		<h3>객실정보</h3>
		<table border="0" cellpadding="0" cellspacing="1" class="wideT num">
			<caption>예약객실 상세 정보</caption>
			<thead>
				<tr>
					<th rowspan="2" scope="col">객실명</th>
					<th width="10%"  scope="col">크기</th>
					<th width="10%"  scope="col">기준/최대</th>
					<th width="10%" scope="col">인원선택</th>
					<th width="11%"  scope="col">객실요금</th>
					<th width="11%"  scope="col">추가금액</th>
					<th width="11%"  scope="col">합계금액</th>
				</tr>
			</thead>
       
			<tbody>
				<tr id="info">
					<td class="txt">${calender.room_name}</td>
					<td>${calender.room_width}</td>
					<td>${calender.room_max}</td>
					<td>${calender.inwon_check}명</td>
					<td>￦${calender.middle_pay}</td>
					<td>￦${calender.add_pay}</td>
					<td>￦${calender.total_pay}</td>
				</tr>
			</tbody>
		</table>
		<h3>예약정보입력</h3>
		<table border="0" cellpadding="0" cellspacing="1" class="wideT sortL">
			<caption>예약정보 확인 및 입력</caption>
			<tr>
				<th width="20%" scope="row">숙박기간</th>
				<td>
					<input type="hidden" name="rDay_txt" value="2018-06-07 ~ 2018-06-08 (1박 2일)"/>
					<fmt:formatDate pattern="yyyy-MM-dd" value="${calender.fullDate}"/>~
					<fmt:formatDate pattern="yyyy-MM-dd" value="${calender.lastFullDate}"/>(${calender.select}박${calender.select+1}일)
				</td>
			</tr>
			<tr id="info">
				<th scope="row">결제금액</th>
				<td class="red"><strong><em id="totalM">￦${calender.total_pay}</em></strong></td>
			</tr>
			<tr>
				<th scope="row">아이디</th>
				<td><input name="user_id"  size="20" value="${login.user_id}" readonly/></td>
			</tr>
			<tr>
				<th scope="row">휴대폰</th>
				<td><input name="user_phone"  size="20" value="${login.user_phone}" readonly></td>
			</tr>
			<tr>
				<th scope="row">이메일</th>
				<td><input name="user_email"  size="30" value="${login.user_email}" readonly></td>
			</tr>
			<tr>
				<th scope="row">입실예정시간</th>
				<td>
					<select name="entance_time">
						<option value="오후 3시">오후 3시</option>
						<option value="오후 4시">오후 4시</option>
						<option value="오후 5시">오후 5시</option>
						<option value="오후 6시">오후 6시</option>
						<option value="오후 7시">오후 7시</option>
						<option value="오후 8시">오후 8시</option>
						<option value="오후 9시">오후 9시</option>
						<option value="오후 10시">오후 10시</option>
						<option value="미정">미정</option>
					</select>
				</td>
			</tr>
			<tr>
				<th scope="row">전달사항</th>
				<td><textarea rows="3" name="reser_content"></textarea></td>
			</tr>
			<tr>
				<th scope="row">결제수단</th>
				<td><input type="radio" class="bnone" name="payment" value="01" checked> 
			        무통장입금</td>
			</tr>
			<tr>
				<th scope="row">입금하실은행</th>
				<td>
					<select name="bank">
						<option value="농협 203027-51-050385 염인선">농협 203027-51-050385 염인선</option>
					</select>
				</td>
			</tr>
			<tr>
				<th scope="row">입금자명</th>
				<td><input name="user_name"  size="20" value="${login.user_name}"></td>
			</tr>
		</table>
    
		<h3>개인정보취급방침</h3>
		<div class="wideT">
			<textarea rows="3" readonly>수집하는 개인정보 항목
			            회사는 상담, 서비스 신청 등등을 위해 아래와 같은 개인정보를 수집하고 있습니다.
			            ο 수집항목 : 이름 , 휴대폰번호 , 이메일 , 서비스 이용기록
			            
			            ο 개인정보 수집방법 : 서비스 신청
			            개인정보의 수집 및 이용목적
			            회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다.
			            ο 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산, 콘텐츠 제공 , 요금 결제
			            
			            ο 회원 관리
			            회원제 서비스 이용에 따른 본인확인 , 개인 식별 , 불량회원의 부정 이용 방지와 비인가 사용 방지 , 연령확인 , 불만처리 등 민원처리 , 고지사항 전달
			            
			            ο 마케팅 및 광고에 활용
			            신규 서비스(제품) 개발 및 특화 , 이벤트 등 광고성 정보 전달 , 인구통계학적 특성에 따른 서비스 제공 및 광고 게재, 접속 빈도 파악 또는 회원의 서비스 이용에 대한 통계
			            개인정보의 보유 및 이용기간
			            원칙적으로, 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다. 단, 관계법령의 규정에 의하여 보존할 필요가 있는 경우 회사는 아래와 같이 관계법령에서 정한 일정한 기간 동안 회원정보를 보관합니다.
			            
			            보존 항목 : 이름 , 자택 전화번호 , 휴대전화번호 , 이메일 , 서비스 이용기록
			            보존 근거 : 전자상거래등에서의 소비자보호에 관한 법률
			            보존 기간 : 5년
			            
			            계약 또는 청약철회 등에 관한 기록 : 5년 (전자상거래등에서의 소비자보호에 관한 법률)
			            대금결제 및 재화 등의 공급에 관한 기록 : 5년 (전자상거래등에서의 소비자보호에 관한 법률)
			            소비자의 불만 또는 분쟁처리에 관한 기록 : 3년 (전자상거래등에서의 소비자보호에 관한 법률)
			            신용정보의 수집/처리 및 이용 등에 관한 기록 : 3년 (신용정보의 이용 및 보호에 관한 법률)
			</textarea>
		</div>
		<p><input type="checkbox" class="bnone" name="cla"> 상기 개인정보 취급정책 및 예약규정에 동의합니다.</p>
	</div>
    
<p class="btn"><input type="image" src="/resources/img/reservation/btn.png" alt="예약하기">&nbsp; 
<img src="/resources/img/reservation/bt_pre.gif" alt="이전단계" onclick="backPage();" style="cursor:pointer"></p>
  <!-- //객실예약 -->
</form>
<!-- //Contents --> 
  
</body>
</html>