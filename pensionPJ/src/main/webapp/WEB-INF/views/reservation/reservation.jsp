<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="/resources/css/reservation/style.css" rel="stylesheet" type="text/css">
<script src="/resources/js/reservation/pension.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<div class="header wRap">
   <h1>이루펜션</h1>
   <div class="Right">
     <a href="/pension/index.html"><img src="/resources/img/reservation/top1on.gif" alt="예약하기"></a> <!-- //이미지파일이름...on.gif -->
     <a href="/pension/index.html?step=info&flag=02"><img src="/resources/img/reservation/top2.gif" alt="예약안내"></a> <!-- /pen//resources/img/reservation/top2on.gif -->
     <a href="/pension/index.html?step=conf&flag=03"><img src="/resources/img/reservation/top3.gif" alt="예약확인"></a> <!-- /pen//resources/img/reservation/top3on.gif -->
   </div>
</div>
<body>
<!-- Sub Title -->
<div class="sTitle wRap">
   <div class="Left">
      <em>Reservation</em>
      <h2>실시간예약</h2>
   </div>
   
   <!-- -->
   <div class="tab1 Right">
      <ol>
          <li><img src="/resources/img/reservation/proc1_01.gif" alt="일자선택"></li>
          <li>객실선택</li>
          <li>정보입력</li>
          <li>예약완료</li>
      </ol>
   </div>
   <!-- // -->
</div>
<!-- //Sub Title -->
<script type="text/javascript">
<!--
	function reserDaySel(flag,y,m,d){
		var frm = document.frm;
		var year = y;
		var month = m;
		var day = d;

		if (flag == 'prev')
		{
			if (m == 0)
			{
				year = y-1;
				month = 12;
				day = 1;
			}
			frm.year.value = year;
			frm.month.value = month;
			frm.day.value = day;
			frm.action = "/pension/index.html?year=" + year + "&month=" + month + "&day=" + day;
			frm.submit();
		
		} else if (flag == 'next')
		{
			if (m == 13)
			{
				monthOne = 1
				year = Number(y) + 1;
				month = 1;
				day = 1;
			}
			
			frm.year.value = year;
			frm.month.value = month;
			frm.day.value = day;
			frm.action = "/pension/index.html?year=" + year + "&month=" + month + "&day=" + day;
			frm.submit();
			
		}
	}
//-->
</script>
<!-- Contents -->   

<div class="conT carnSet">
    <!-- Year & Month -->
		<form name="frm" method="post">
		<input type="hidden" name="year" value="2018">
		<input type="hidden" name="month" value="4">
		<input type="hidden" name="day" value="17">
    <div class="yms wRap">
       <a href="javascript:reserDaySel('prev','2018','3','17');" class="prev">이전</a>
       <p><b>2018</b>년 <b>4</b>월</p>
       <a href="javascript:reserDaySel('next','2018','5','17');" class="next">다음</a>
    </div>
		</form>
    <!-- //Year & Month -->
    
    <p><span><img src="/resources/img/reservation/ico_2day.gif" alt="To Day" align="absmiddle"> 오늘</span> <span><img src="/resources/img/reservation/ico_ye.gif" alt="예" align="absmiddle"> 예약가능</span> <span><img src="/resources/img/reservation/ico_end.gif" alt="완" align="absmiddle"> 예약완료</span> <span><img src="/resources/img/reservation/ico_wait.gif" alt="대" align="absmiddle"> 예약대기</span><br>
    * 원하시는 날짜의 객실명을 선택하시면 실시간 예약이 가능합니다.</p>
      

	<table border='0' cellspacing='1' cellpadding='0' class='wideT caren'>
       <caption>실시간예약 - 2018년 4월 일자별 예약현황</caption>
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
	<tr><td class='red b4_day'><strong>1 </strong><ul class='reList'>예약완료</ul></td><td class='b4_day'><strong>2 </strong><ul class='reList'>예약완료</ul></td><td class='b4_day'><strong>3 </strong><ul class='reList'>예약완료</ul></td><td class='b4_day'><strong>4 </strong><ul class='reList'>예약완료</ul></td><td class='b4_day'><strong>5 </strong><ul class='reList'>예약완료</ul></td><td class='b4_day'><strong>6 </strong><ul class='reList'>예약완료</ul></td><td class='blue b4_day'><strong>7 </strong><ul class='reList'>예약완료</ul></td></tr><tr><td class='red b4_day'><strong>8 </strong><ul class='reList'>예약완료</ul></td><td class='b4_day'><strong>9 </strong><ul class='reList'>예약완료</ul></td><td class='b4_day'><strong>10 </strong><ul class='reList'>예약완료</ul></td><td class='b4_day'><strong>11 </strong><ul class='reList'>예약완료</ul></td><td class='b4_day'><strong>12 </strong><ul class='reList'>예약완료</ul></td><td class='b4_day'><strong>13 </strong><ul class='reList'>예약완료</ul></td><td class='blue b4_day'><strong>14 </strong><ul class='reList'>예약완료</ul></td></tr><tr><td class='red b4_day'><strong>15 </strong><ul class='reList'>예약완료</ul></td><td class='b4_day'><strong>16 </strong><ul class='reList'>예약완료</ul></td><td class='b4_day'><strong>17 <img src='/resources/img/reservation/ico_2day.gif'></strong><ul class='reList'><li><a href='/pension/index.html?step=reserV&code=1471309602&year=2018&month=4&day=17&selDay=2018-4-17'><img src='/resources/img/reservation/ico_ye.gif' alt='예' align='absmiddle'><span style='color:#6a6a6a'>데이지(복층)</span></a></li><li><a href='/pension/index.html?step=reserV&code=1471309564&year=2018&month=4&day=17&selDay=2018-4-17'><img src='/resources/img/reservation/ico_ye.gif' alt='예' align='absmiddle'><span style='color:#6a6a6a'>릴리(복층)</span></a></li><li><a href='/pension/index.html?step=reserV&code=1471309372&year=2018&month=4&day=17&selDay=2018-4-17'><img src='/resources/img/reservation/ico_ye.gif' alt='예' align='absmiddle'><span style='color:#6a6a6a'>아이비</span></a></li><li><a href='/pension/index.html?step=reserV&code=1464661788&year=2018&month=4&day=17&selDay=2018-4-17'><img src='/resources/img/reservation/ico_ye.gif' alt='예' align='absmiddle'><span style='color:#6a6a6a'>마가렛</span></a></li></ul></td><td class='b4_day'><strong>18 </strong><ul class='reList'><li><a href='/pension/index.html?step=reserV&code=1471309602&year=2018&month=4&day=18&selDay=2018-4-18'><img src='/resources/img/reservation/ico_ye.gif' alt='예' align='absmiddle'><span style='color:#6a6a6a'>데이지(복층)</span></a></li><li><a href='/pension/index.html?step=reserV&code=1471309564&year=2018&month=4&day=18&selDay=2018-4-18'><img src='/resources/img/reservation/ico_ye.gif' alt='예' align='absmiddle'><span style='color:#6a6a6a'>릴리(복층)</span></a></li><li><a href='/pension/index.html?step=reserV&code=1471309372&year=2018&month=4&day=18&selDay=2018-4-18'><img src='/resources/img/reservation/ico_ye.gif' alt='예' align='absmiddle'><span style='color:#6a6a6a'>아이비</span></a></li><li><a href='/pension/index.html?step=reserV&code=1464661788&year=2018&month=4&day=18&selDay=2018-4-18'><img src='/resources/img/reservation/ico_ye.gif' alt='예' align='absmiddle'><span style='color:#6a6a6a'>마가렛</span></a></li></ul></td><td class='b4_day'><strong>19 </strong><ul class='reList'><li><a href='/pension/index.html?step=reserV&code=1471309602&year=2018&month=4&day=19&selDay=2018-4-19'><img src='/resources/img/reservation/ico_ye.gif' alt='예' align='absmiddle'><span style='color:#6a6a6a'>데이지(복층)</span></a></li><li><a href='/pension/index.html?step=reserV&code=1471309564&year=2018&month=4&day=19&selDay=2018-4-19'><img src='/resources/img/reservation/ico_ye.gif' alt='예' align='absmiddle'><span style='color:#6a6a6a'>릴리(복층)</span></a></li><li><a href='/pension/index.html?step=reserV&code=1471309372&year=2018&month=4&day=19&selDay=2018-4-19'><img src='/resources/img/reservation/ico_ye.gif' alt='예' align='absmiddle'><span style='color:#6a6a6a'>아이비</span></a></li><li><a href='/pension/index.html?step=reserV&code=1464661788&year=2018&month=4&day=19&selDay=2018-4-19'><img src='/resources/img/reservation/ico_ye.gif' alt='예' align='absmiddle'><span style='color:#6a6a6a'>마가렛</span></a></li></ul></td><td class='b4_day'><strong>20 </strong><ul class='reList'><li><a href='/pension/index.html?step=reserV&code=1471309602&year=2018&month=4&day=20&selDay=2018-4-20'><img src='/resources/img/reservation/ico_ye.gif' alt='예' align='absmiddle'><span style='color:#6a6a6a'>데이지(복층)</span></a></li><li><a href='/pension/index.html?step=reserV&code=1471309564&year=2018&month=4&day=20&selDay=2018-4-20'><img src='/resources/img/reservation/ico_ye.gif' alt='예' align='absmiddle'><span style='color:#6a6a6a'>릴리(복층)</span></a></li><li><a href='/pension/index.html?step=reserV&code=1471309372&year=2018&month=4&day=20&selDay=2018-4-20'><img src='/resources/img/reservation/ico_ye.gif' alt='예' align='absmiddle'><span style='color:#6a6a6a'>아이비</span></a></li><li><a href='/pension/index.html?step=reserV&code=1464661788&year=2018&month=4&day=20&selDay=2018-4-20'><img src='/resources/img/reservation/ico_ye.gif' alt='예' align='absmiddle'><span style='color:#6a6a6a'>마가렛</span></a></li></ul></td><td class='blue b4_day'><strong>21 </strong><ul class='reList'><li><a href='/pension/index.html?step=reserV&code=1471309602&year=2018&month=4&day=21&selDay=2018-4-21'><img src='/resources/img/reservation/ico_ye.gif' alt='예' align='absmiddle'><span style='color:#6a6a6a'>데이지(복층)</span></a></li><li><a href='#'><img src='/resources/img/reservation/ico_wait.gif' alt='대' align='absmiddle'><span style='color:#6a6a6a'>릴리(복층)</span></a></li><li><a href='/pension/index.html?step=reserV&code=1471309372&year=2018&month=4&day=21&selDay=2018-4-21'><img src='/resources/img/reservation/ico_ye.gif' alt='예' align='absmiddle'><span style='color:#6a6a6a'>아이비</span></a></li><li><a href='/pension/index.html?step=reserV&code=1464661788&year=2018&month=4&day=21&selDay=2018-4-21'><img src='/resources/img/reservation/ico_ye.gif' alt='예' align='absmiddle'><span style='color:#6a6a6a'>마가렛</span></a></li></ul></td></tr><tr><td class='red b4_day'><strong>22 </strong><ul class='reList'><li><a href='/pension/index.html?step=reserV&code=1471309602&year=2018&month=4&day=22&selDay=2018-4-22'><img src='/resources/img/reservation/ico_ye.gif' alt='예' align='absmiddle'><span style='color:#6a6a6a'>데이지(복층)</span></a></li><li><a href='/pension/index.html?step=reserV&code=1471309564&year=2018&month=4&day=22&selDay=2018-4-22'><img src='/resources/img/reservation/ico_ye.gif' alt='예' align='absmiddle'><span style='color:#6a6a6a'>릴리(복층)</span></a></li><li><a href='/pension/index.html?step=reserV&code=1471309372&year=2018&month=4&day=22&selDay=2018-4-22'><img src='/resources/img/reservation/ico_ye.gif' alt='예' align='absmiddle'><span style='color:#6a6a6a'>아이비</span></a></li><li><a href='/pension/index.html?step=reserV&code=1464661788&year=2018&month=4&day=22&selDay=2018-4-22'><img src='/resources/img/reservation/ico_ye.gif' alt='예' align='absmiddle'><span style='color:#6a6a6a'>마가렛</span></a></li></ul></td><td class='b4_day'><strong>23 </strong><ul class='reList'><li><a href='/pension/index.html?step=reserV&code=1471309602&year=2018&month=4&day=23&selDay=2018-4-23'><img src='/resources/img/reservation/ico_ye.gif' alt='예' align='absmiddle'><span style='color:#6a6a6a'>데이지(복층)</span></a></li><li><a href='/pension/index.html?step=reserV&code=1471309564&year=2018&month=4&day=23&selDay=2018-4-23'><img src='/resources/img/reservation/ico_ye.gif' alt='예' align='absmiddle'><span style='color:#6a6a6a'>릴리(복층)</span></a></li><li><a href='/pension/index.html?step=reserV&code=1471309372&year=2018&month=4&day=23&selDay=2018-4-23'><img src='/resources/img/reservation/ico_ye.gif' alt='예' align='absmiddle'><span style='color:#6a6a6a'>아이비</span></a></li><li><a href='/pension/index.html?step=reserV&code=1464661788&year=2018&month=4&day=23&selDay=2018-4-23'><img src='/resources/img/reservation/ico_ye.gif' alt='예' align='absmiddle'><span style='color:#6a6a6a'>마가렛</span></a></li></ul></td><td class='b4_day'><strong>24 </strong><ul class='reList'><li><a href='/pension/index.html?step=reserV&code=1471309602&year=2018&month=4&day=24&selDay=2018-4-24'><img src='/resources/img/reservation/ico_ye.gif' alt='예' align='absmiddle'><span style='color:#6a6a6a'>데이지(복층)</span></a></li><li><a href='/pension/index.html?step=reserV&code=1471309564&year=2018&month=4&day=24&selDay=2018-4-24'><img src='/resources/img/reservation/ico_ye.gif' alt='예' align='absmiddle'><span style='color:#6a6a6a'>릴리(복층)</span></a></li><li><a href='/pension/index.html?step=reserV&code=1471309372&year=2018&month=4&day=24&selDay=2018-4-24'><img src='/resources/img/reservation/ico_ye.gif' alt='예' align='absmiddle'><span style='color:#6a6a6a'>아이비</span></a></li><li><a href='/pension/index.html?step=reserV&code=1464661788&year=2018&month=4&day=24&selDay=2018-4-24'><img src='/resources/img/reservation/ico_ye.gif' alt='예' align='absmiddle'><span style='color:#6a6a6a'>마가렛</span></a></li></ul></td><td class='b4_day'><strong>25 </strong><ul class='reList'><li><a href='/pension/index.html?step=reserV&code=1471309602&year=2018&month=4&day=25&selDay=2018-4-25'><img src='/resources/img/reservation/ico_ye.gif' alt='예' align='absmiddle'><span style='color:#6a6a6a'>데이지(복층)</span></a></li><li><a href='/pension/index.html?step=reserV&code=1471309564&year=2018&month=4&day=25&selDay=2018-4-25'><img src='/resources/img/reservation/ico_ye.gif' alt='예' align='absmiddle'><span style='color:#6a6a6a'>릴리(복층)</span></a></li><li><a href='/pension/index.html?step=reserV&code=1471309372&year=2018&month=4&day=25&selDay=2018-4-25'><img src='/resources/img/reservation/ico_ye.gif' alt='예' align='absmiddle'><span style='color:#6a6a6a'>아이비</span></a></li><li><a href='/pension/index.html?step=reserV&code=1464661788&year=2018&month=4&day=25&selDay=2018-4-25'><img src='/resources/img/reservation/ico_ye.gif' alt='예' align='absmiddle'><span style='color:#6a6a6a'>마가렛</span></a></li></ul></td><td class='b4_day'><strong>26 </strong><ul class='reList'><li><a href='/pension/index.html?step=reserV&code=1471309602&year=2018&month=4&day=26&selDay=2018-4-26'><img src='/resources/img/reservation/ico_ye.gif' alt='예' align='absmiddle'><span style='color:#6a6a6a'>데이지(복층)</span></a></li><li><a href='/pension/index.html?step=reserV&code=1471309564&year=2018&month=4&day=26&selDay=2018-4-26'><img src='/resources/img/reservation/ico_ye.gif' alt='예' align='absmiddle'><span style='color:#6a6a6a'>릴리(복층)</span></a></li><li><a href='/pension/index.html?step=reserV&code=1471309372&year=2018&month=4&day=26&selDay=2018-4-26'><img src='/resources/img/reservation/ico_ye.gif' alt='예' align='absmiddle'><span style='color:#6a6a6a'>아이비</span></a></li><li><a href='/pension/index.html?step=reserV&code=1464661788&year=2018&month=4&day=26&selDay=2018-4-26'><img src='/resources/img/reservation/ico_ye.gif' alt='예' align='absmiddle'><span style='color:#6a6a6a'>마가렛</span></a></li></ul></td><td class='b4_day'><strong>27 </strong><ul class='reList'><li><a href='/pension/index.html?step=reserV&code=1471309602&year=2018&month=4&day=27&selDay=2018-4-27'><img src='/resources/img/reservation/ico_ye.gif' alt='예' align='absmiddle'><span style='color:#6a6a6a'>데이지(복층)</span></a></li><li><a href='/pension/index.html?step=reserV&code=1471309564&year=2018&month=4&day=27&selDay=2018-4-27'><img src='/resources/img/reservation/ico_ye.gif' alt='예' align='absmiddle'><span style='color:#6a6a6a'>릴리(복층)</span></a></li><li><a href='/pension/index.html?step=reserV&code=1471309372&year=2018&month=4&day=27&selDay=2018-4-27'><img src='/resources/img/reservation/ico_ye.gif' alt='예' align='absmiddle'><span style='color:#6a6a6a'>아이비</span></a></li><li><a href='/pension/index.html?step=reserV&code=1464661788&year=2018&month=4&day=27&selDay=2018-4-27'><img src='/resources/img/reservation/ico_ye.gif' alt='예' align='absmiddle'><span style='color:#6a6a6a'>마가렛</span></a></li></ul></td><td class='blue b4_day'><strong>28 </strong><ul class='reList'><li><a href='/pension/index.html?step=reserV&code=1471309602&year=2018&month=4&day=28&selDay=2018-4-28'><img src='/resources/img/reservation/ico_ye.gif' alt='예' align='absmiddle'><span style='color:#6a6a6a'>데이지(복층)</span></a></li><li><a href='/pension/index.html?step=reserV&code=1471309564&year=2018&month=4&day=28&selDay=2018-4-28'><img src='/resources/img/reservation/ico_ye.gif' alt='예' align='absmiddle'><span style='color:#6a6a6a'>릴리(복층)</span></a></li><li><a href='/pension/index.html?step=reserV&code=1471309372&year=2018&month=4&day=28&selDay=2018-4-28'><img src='/resources/img/reservation/ico_ye.gif' alt='예' align='absmiddle'><span style='color:#6a6a6a'>아이비</span></a></li><li><a href='/pension/index.html?step=reserV&code=1464661788&year=2018&month=4&day=28&selDay=2018-4-28'><img src='/resources/img/reservation/ico_ye.gif' alt='예' align='absmiddle'><span style='color:#6a6a6a'>마가렛</span></a></li></ul></td></tr><tr><td class='red b4_day'><strong>29 </strong><ul class='reList'><li><a href='/pension/index.html?step=reserV&code=1471309602&year=2018&month=4&day=29&selDay=2018-4-29'><img src='/resources/img/reservation/ico_ye.gif' alt='예' align='absmiddle'><span style='color:#6a6a6a'>데이지(복층)</span></a></li><li><a href='/pension/index.html?step=reserV&code=1471309564&year=2018&month=4&day=29&selDay=2018-4-29'><img src='/resources/img/reservation/ico_ye.gif' alt='예' align='absmiddle'><span style='color:#6a6a6a'>릴리(복층)</span></a></li><li><a href='/pension/index.html?step=reserV&code=1471309372&year=2018&month=4&day=29&selDay=2018-4-29'><img src='/resources/img/reservation/ico_ye.gif' alt='예' align='absmiddle'><span style='color:#6a6a6a'>아이비</span></a></li><li><a href='/pension/index.html?step=reserV&code=1464661788&year=2018&month=4&day=29&selDay=2018-4-29'><img src='/resources/img/reservation/ico_ye.gif' alt='예' align='absmiddle'><span style='color:#6a6a6a'>마가렛</span></a></li></ul></td><td class='b4_day'><strong>30 </strong><ul class='reList'><li><a href='/pension/index.html?step=reserV&code=1471309602&year=2018&month=4&day=30&selDay=2018-4-30'><img src='/resources/img/reservation/ico_ye.gif' alt='예' align='absmiddle'><span style='color:#6a6a6a'>데이지(복층)</span></a></li><li><a href='/pension/index.html?step=reserV&code=1471309564&year=2018&month=4&day=30&selDay=2018-4-30'><img src='/resources/img/reservation/ico_ye.gif' alt='예' align='absmiddle'><span style='color:#6a6a6a'>릴리(복층)</span></a></li><li><a href='/pension/index.html?step=reserV&code=1471309372&year=2018&month=4&day=30&selDay=2018-4-30'><img src='/resources/img/reservation/ico_ye.gif' alt='예' align='absmiddle'><span style='color:#6a6a6a'>아이비</span></a></li><li><a href='/pension/index.html?step=reserV&code=1464661788&year=2018&month=4&day=30&selDay=2018-4-30'><img src='/resources/img/reservation/ico_ye.gif' alt='예' align='absmiddle'><span style='color:#6a6a6a'>마가렛</span></a></li></ul></td><td class='b4_day'>&nbsp;</td><td class='b4_day'>&nbsp;</td><td class='b4_day'>&nbsp;</td><td class='b4_day'>&nbsp;</td><td class='blue b4_day'>&nbsp;</td></tr>
			</tbody>
			</table>
			
</div>
<!-- //Contents --> 
</body>
</html>
<div class="footer">본 실시간 예약프로그램은 <a href="http://www.ebom.co.kr" target="_blank">DesignBom</a>에서 제공합니다.</div>