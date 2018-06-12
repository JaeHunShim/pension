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
<body>
<div class="header wRap">
   <h1>이루펜션</h1>
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
		<h2>예약확인</h2>
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
<form name="prm" id="prm" method="post">

<!-- Contents -->   
	<div class="conT">
		<h3>예약정보입력</h3>
		<table border="0" cellpadding="0" cellspacing="1" class="wideT sortL">
			<caption>예약정보 확인 및 입력</caption>
			<tr>
				<th width="20%" scope="row">숙박기간</th>
				<td>
					<input type="hidden" name="rDay_txt" value="2018-06-07 ~ 2018-06-08 (1박 2일)"/>
					<fmt:formatDate pattern="yyyy-MM-dd" value="${reserVO.fullDate}"/>~
					<fmt:formatDate pattern="yyyy-MM-dd" value="${reserVO.lastFullDate}"/>(${reserVO.select}박${reserVO.select+1}일)
				</td>
			</tr>
			<tr id="info">
				<th scope="row">결제금액</th>
				<td class="red"><strong><em id="totalM">￦${reserVO.total_pay}</em></strong></td>
			</tr>
			<tr>
				<th scope="row">객실명</th>
				<td>${reserVO.room_name}</td>
			</tr>
			<tr>
				<th scope="row">객실 인원</th>
				<td>${reserVO.inwon_check}명</td>
			</tr>
			<tr>
				<th scope="row">id</th>
				<td><%-- ${user_id} --%></td>
			</tr>
			<tr>
				<th scope="row">휴대폰</th>
				<td><%-- ${user_phone} --%></td>
			</tr>
			<tr>
				<th scope="row">이메일</th>
				<td><%-- ${user_email} --%></td>
			</tr>
			<tr>
				<th scope="row">입실예정시간</th>
				<td><%-- ${calender.entance_time} --%></td>
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
				<td>농협 203027-51-050385 염인선</td>
			</tr>
			<tr>
				<th scope="row">입금자명</th>
				<td><%-- ${user_name} --%></td>
			</tr>
		</table>
	</div>
    
<p class="btn"><input type="image" src="/resources/img/reservation/btn.png" alt="예약하기">&nbsp; 
<img src="/resources/img/reservation/bt_pre.gif" alt="이전단계" onclick="backPage();" style="cursor:pointer"></p>
  <!-- //객실예약 -->
</form>
<!-- //Contents --> 
  
</body>
</html>