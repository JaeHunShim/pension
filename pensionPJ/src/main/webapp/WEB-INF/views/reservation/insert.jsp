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
<div class="header wRap">
   <h1>이루펜션</h1>
   <div class="Right">
     <a href="/reservation/reservation_main"><img src="/resources/img/reservation/top1on.gif" alt="예약하기"></a>c..on.gif -->
     <a href="/reservation/reservation_guide"><img src="/resources/img/reservation/top2.gif" alt="예약안내"></a> <!-- /pen/img/top2on.gif -->
     <a href="/reservation/confirm"><img src="/resources/img/reservation/top3.gif" alt="예약확인"></a> <!-- /pen/img/top3on.gif -->
   </div>
</div>
<body>

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
<form name="frm" method="post" action="" onsubmit="return reser_send()">
		
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
				<tr>
					<td class="txt">데이지(복층)</td>
					<td>25평형</td>
					<td>4/8</td>
					<td>4명</td>
					<td>￦120,000</td>
					<td>￦0</td>
					<td>￦120,000</td>
				</tr>
			</tbody>
		</table>
		<h3>예약정보입력</h3>
		<table border="0" cellpadding="0" cellspacing="1" class="wideT sortL">
			<caption>예약정보 확인 및 입력</caption>
			<tr>
				<th width="20%" scope="row">숙박기간</th>
				<td>
						<input type="hidden" name="rDay_txt" value="2018-06-07 ~ 2018-06-08 (1박 2일)">
							<fmt:formatDate pattern="yyyy-MM-dd" value="${calender.fullDate}"/> ~ 2018-06-08 (1박 2일)
				</td>
			</tr>
			<tr>
				<th scope="row">결제금액</th>
				<td class="red"><strong><em id="totalM">￦120,000</em></strong></td>
			</tr>
			<tr>
				<th scope="row">성 명</th>
				<td><input name="name"  size="20"></td>
			</tr>
			<tr>
				<th scope="row">휴대폰</th>
				<td><input name="hp1"  size="6" maxlength="3"> - <input name="hp2"  size="8" maxlength="4"> - <input name="hp3"  size="8" maxlength="4"></td>
			</tr>
			<tr>
				<th scope="row">이메일</th>
				<td><input name="email"  size="30"></td>
			</tr>
			<tr>
				<th scope="row">입실예정시간</th>
				<td>
					<select name="reser_time">
						<option value="오후 3시"  selected>오후 3시</option>
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
				<td><input type="radio" class="bnone" name="method" value="01" checked> 
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
				<td><input name="inName"  size="20"></td>
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
    
<p class="btn"><input type="image" src="/resources/img/reservation/btn.png" alt="예약하기"></a> &nbsp; <img src="/resources/img/reservation/bt_pre.gif" alt="이전단계" onclick="backPage();" style="cursor:pointer"></p>
  <!-- //객실예약 -->
</form>
<!-- //Contents --> 
  
</body>
</html>