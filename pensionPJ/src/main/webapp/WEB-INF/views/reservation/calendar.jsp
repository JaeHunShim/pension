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
<script>
	var date = new Date();
	var toY = date.getFullYear(); //현재 년도 가져오기
	var toM = date.getMonth(); //현재 달가지고오기
	var toD = date.getDate(); //현재 날짜 가지고오기 	
	var lastArr =[31,28,31,30,31,30,31,31,30,31,30,31]; // 월마다 마지막 일자
	
	var y; 
	var m;
	var d ;
	/* 이제 달력 만드는 곳*/
	function getCalendar(m,y,x){

		var currentDate = new Date(y,m,x); // 현재 년, 현재 달의  1일의 요일을 구함
			console.log("y와 m을 받아와서 현재 시간뽑기"+ currentDate);
			console.log('m과 y의 값:' + m,y);
		var theWeek = currentDate.getDay(); // 월화수목금토일 구하기 (1,2,3,4,5,6,7로 출력됨)

		if(y%4 && y%100 !=0 || y%400 ==0){ //윤년계산
			var lastDate =lastArr[1]=29;
		}else{
			var lastDate = lastArr[1]=28;
		}
		var lastDate= lastArr[m]; //현재 월의 마지막 일
	    
		var row = Math.ceil((theWeek+lastDate)/7); //달력에 필요한 행의 갯수 

		var calendar ="";

		dNum =1; //달력에 표기되는 일 초기값
		var array = new Array(dNum); //sNum증가할때 마다 그값을 배열에 넣어서 값을 비교해서 현재 날짜와 비교해서 출력함 배열에 안하고 그냥 sNum이랑 비교해도 됨
		for(var i =1; i<=row; i++){ // 행만들기
			calendar +="<tr>";
			for(var k=1;k<=7; k++){ //열만들기
				//월 1일 이전과 월 마지막일 이휴는 모두 빈칸처리 
				if(i===1 && k <= theWeek || dNum>lastDate){
				calendar += "<td class='red b4_day'>&nbsp;</td>";
				}else {
				calendar += "<td class='b4_day'>"
							+ "<strong class ='date"+dNum+"'>" + dNum + "</strong>"
							+ "<ul class='reList'>"
							if(toD > dNum || toY > y || toM > m){
								calendar+= "예약완료";	
							}else{
								calendar+= "<li><a href='/reservation/select'><img src='/resources/img/reservation/ico_ye.gif' alt='예' align='absmiddle'><span name='daisy' style='color:#6a6a6a'>데이지(복층)</span></a></li>"
									+ "<li><a href='/reservation/select'><img src='/resources/img/reservation/ico_ye.gif' alt='예' align='absmiddle'><span name='lily' style='color:#6a6a6a'>릴리(복층)</span></a></li>"
									+ "<li><a href='/reservation/select'><img src='/resources/img/reservation/ico_ye.gif' alt='예' align='absmiddle'><span name= 'ivy'style='color:#6a6a6a'>아이비</span></a></li>"
									+ "<li><a href='/reservation/select'><img src='/resources/img/reservation/ico_ye.gif' alt='예' align='absmiddle'><span name= 'magaret' style='color:#6a6a6a'>마가렛</span></a></li>"
							}
							
							calendar+= "</ul>"
							+ "</td>"
							dNum++;
								
				}	
					
			}
			calendar +="</tr>";
		}
	$("tbody").append(calendar);
	}
$(document).ready(function(){
		var m = toM;
		var y = toY;
		var d = toD;
		var month = $('#year').text(y);
		var year =$('#month').text(m+1);
		var x= 1;
		getCalendar(m,y,x);
		//오늘 날짜 출력
		var today="<img src='/resources/img/reservation/ico_2day.gif' alt='To Day' align='absmiddle'>"
		var find =$('.date'+toD+'').text();
		if(find == toD){
			$('.date'+toD+'').append(today);
		}

	//전 개월로 가는 부분 
		$('#prev').on('click',function(){
			$("tbody").empty();
			var cm =$('#month').text();
			var cy =$('#year').text();
		
			m= cm-2;
			y = cy;
			x=1;
			$('#month').text(m+1);
			$('#year').text(y);
			getCalendar(m,y,x);
		});
	//다음 개월로 가는 부분 
		$('#next').on('click',function(){
			$('tbody').empty();
			var cm =$('#month').text();
			var cy =$('#year').text();
			m =Number(cm);
			y= cy;
			console.log("다음 눌렸을때 m"+ m)
			$('#month').text(m+1);
			$('#year').text(y);
			getCalendar(m,y,x);
		});
		//방이름,년도,월, 일자를  변수에 담아놓음 (다음 페이지로 갈때 정보 유지하기 위해서 )
		var cyear = $('#year').text();
		var cmonth =$('#month').text();
		var cdate =$('.date'+toD+'').text();
		console.log(cyear,cmonth,cdate);
});
</script>
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
    	<div class="yms wRap">
			<a class="prev" id="prev"style="cursor: pointer;">이전 </a>
 				<p><b id ="year"></b>년<b id ="month"></b>월</p>
       		<a class="next" id="next" style="cursor: pointer;">다음</a>
    	</div>
    <!-- //Year & Month -->
    
    <p><span><img src="/resources/img/reservation/ico_2day.gif" alt="To Day" align="absmiddle"> 오늘</span> 
    	<span><img src="/resources/img/reservation/ico_ye.gif" alt="예" align="absmiddle"> 예약가능</span> 
    	<span><img src="/resources/img/reservation/ico_end.gif" alt="완" align="absmiddle"> 예약완료</span> 
    	<span><img src="/resources/img/reservation/ico_wait.gif" alt="대" align="absmiddle"> 예약대기</span><br>
    * 원하시는 날짜의 객실명을 선택하시면 실시간 예약이 가능합니다.</p>
      

	<table border='0' cellspacing='1' cellpadding='0' class='wideT caren'>
       <caption>실시간예약 - 2018년 5월 일자별 예약현황</caption>
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
			
		</tbody>
	</table>
			
</div>

</body>
</html>
<div class="footer">본 실시간 예약프로그램은 <a href="http://www.ebom.co.kr" target="_blank">DesignBom</a>에서 제공합니다.</div>