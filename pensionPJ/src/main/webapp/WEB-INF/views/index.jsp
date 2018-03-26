<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/resources/css/style.css" rel="stylesheet" type="text/css">
<title>Insert title here</title>
</head>
<div class="header wRap">
   <h1>이루펜션</h1>
   <div class="Right">
     <a href="#"><img src="/resources/img/top1on.gif" alt="예약하기"></a> <!-- //이미지파일이름...on.gif -->
     <a href="#"><img src="/resources/img/top2.gif" alt="예약안내"></a> <!-- /pen/img/top2on.gif -->
     <a href="#"><img src="/resources/img/top3.gif" alt="예약확인"></a> <!-- /pen/img/top3on.gif -->
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
				<li><img src="/resources/img/proc1_01.gif"
					alt="일자선택"></li>
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
		<form name="frm" method="post" action="">
			<input type="hidden" name="year" value="2018"> <input
				type="hidden" name="month" value="3"> <input type="hidden"
				name="day" value="26">
			<div class="yms wRap">
				<a href="javascript:reserDaySel('prev','2018','2','26');"
					class="prev">이전</a>
				<p>
					<b>2018</b>년 <b>3</b>월
				</p>
				<a href="javascript:reserDaySel('next','2018','4','26');"
					class="next">다음</a>
			</div>
		</form>
		<!-- //Year & Month -->

		<p>
			<span><img src="/resources/img/ico_2day.gif"
				alt="To Day" align="absmiddle"> 오늘</span> <span><img
				src="/resources/img/ico_ye.gif" alt="예"
				align="absmiddle"> 예약가능</span> <span><img
				src="/resources/img/ico_end.gif" alt="완" align="absmiddle"> 예약완료</span> <span><img
				src="/resources/img/ico_wait.gif" alt="대" align="absmiddle"> 예약대기</span><br>
			* 원하시는 날짜의 객실명을 선택하시면 실시간 예약이 가능합니다.
		</p>


		<table border='0' cellspacing='1' cellpadding='0' class='wideT caren'>
			<caption>실시간예약 - 2018년 3월 일자별 예약현황</caption>
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
				<tr>
					<td class='red b4_day'>&nbsp;</td>
					<td class='b4_day'>&nbsp;</td>
					<td class='b4_day'>&nbsp;</td>
					<td class='b4_day'>&nbsp;</td>
					<td class='b4_day'><strong>1 </strong>
						<ul class='reList'>예약완료
						</ul></td>
					<td class='b4_day'><strong>2 </strong>
						<ul class='reList'>예약완료
						</ul></td>
					<td class='blue b4_day'><strong>3 </strong>
						<ul class='reList'>예약완료
						</ul></td>
				</tr>
				<tr>
					<td class='red b4_day'><strong>4 </strong>
					<ul class='reList'>예약완료
						</ul></td>
					<td class='b4_day'><strong>5 </strong>
					<ul class='reList'>예약완료
						</ul></td>
					<td class='b4_day'><strong>6 </strong>
					<ul class='reList'>예약완료
						</ul></td>
					<td class='b4_day'><strong>7 </strong>
					<ul class='reList'>예약완료
						</ul></td>
					<td class='b4_day'><strong>8 </strong>
					<ul class='reList'>예약완료
						</ul></td>
					<td class='b4_day'><strong>9 </strong>
					<ul class='reList'>예약완료
						</ul></td>
					<td class='blue b4_day'><strong>10 </strong>
					<ul class='reList'>예약완료
						</ul></td>
				</tr>
				<tr>
					<td class='red b4_day'><strong>11 </strong>
					<ul class='reList'>예약완료
						</ul></td>
					<td class='b4_day'><strong>12 </strong>
					<ul class='reList'>예약완료
						</ul></td>
					<td class='b4_day'><strong>13 </strong>
					<ul class='reList'>예약완료
						</ul></td>
					<td class='b4_day'><strong>14 </strong>
					<ul class='reList'>예약완료
						</ul></td>
					<td class='b4_day'><strong>15 </strong>
					<ul class='reList'>예약완료
						</ul></td>
					<td class='b4_day'><strong>16 </strong>
					<ul class='reList'>예약완료
						</ul></td>
					<td class='blue b4_day'><strong>17 </strong>
					<ul class='reList'>예약완료
						</ul></td>
				</tr>
				<tr>
					<td class='red b4_day'><strong>18 </strong>
					<ul class='reList'>예약완료
						</ul></td>
					<td class='b4_day'><strong>19 </strong>
					<ul class='reList'>예약완료
						</ul></td>
					<td class='b4_day'><strong>20 </strong>
					<ul class='reList'>예약완료
						</ul></td>
					<td class='b4_day'><strong>21 </strong>
					<ul class='reList'>예약완료
						</ul></td>
					<td class='b4_day'><strong>22 </strong>
					<ul class='reList'>예약완료
						</ul></td>
					<td class='b4_day'><strong>23 </strong>
					<ul class='reList'>예약완료
						</ul></td>
					<td class='blue b4_day'><strong>24 </strong>
					<ul class='reList'>예약완료
						</ul></td>
				</tr>
				<tr>
					<td class='red b4_day'><strong>25 </strong>
					<ul class='reList'>예약완료
						</ul></td>
					<td class='b4_day'><strong>26 <img
							src='/resources/img/ico_2day.gif' alt=""></strong>
					<ul class='reList'>
							<li><a
								href='/pension/index.html?step=reserV&amp;code=1471309602&amp;year=2018&amp;month=3&amp;day=26&amp;selDay=2018-3-26'><img
									src='/resources/img/ico_ye.gif' alt='예' align='absmiddle'><span
									style='color: #6a6a6a'>데이지(복층)</span></a></li>
							<li><a
								href='/pension/index.html?step=reserV&amp;code=1471309564&amp;year=2018&amp;month=3&amp;day=26&amp;selDay=2018-3-26'><img
									src='/resources/img/ico_ye.gif' alt='예' align='absmiddle'><span
									style='color: #6a6a6a'>릴리(복층)</span></a></li>
							<li><a
								href='/pension/index.html?step=reserV&amp;code=1471309372&amp;year=2018&amp;month=3&amp;day=26&amp;selDay=2018-3-26'><img
									src='/resources/img/ico_ye.gif' alt='예' align='absmiddle'><span
									style='color: #6a6a6a'>아이비</span></a></li>
							<li><a
								href='/pension/index.html?step=reserV&amp;code=1464661788&amp;year=2018&amp;month=3&amp;day=26&amp;selDay=2018-3-26'><img
									src='/resources/img/ico_ye.gif' alt='예' align='absmiddle'><span
									style='color: #6a6a6a'>마가렛</span></a></li>
						</ul></td>
					<td class='b4_day'><strong>27 </strong>
					<ul class='reList'>
							<li><a
								href='/pension/index.html?step=reserV&amp;code=1471309602&amp;year=2018&amp;month=3&amp;day=27&amp;selDay=2018-3-27'><img
									src='/resources/img/ico_ye.gif' alt='예' align='absmiddle'><span
									style='color: #6a6a6a'>데이지(복층)</span></a></li>
							<li><a
								href='/pension/index.html?step=reserV&amp;code=1471309564&amp;year=2018&amp;month=3&amp;day=27&amp;selDay=2018-3-27'><img
									src='/resources/img/ico_ye.gif' alt='예' align='absmiddle'><span
									style='color: #6a6a6a'>릴리(복층)</span></a></li>
							<li><a
								href='/pension/index.html?step=reserV&amp;code=1471309372&amp;year=2018&amp;month=3&amp;day=27&amp;selDay=2018-3-27'><img
									src='/resources/img/ico_ye.gif' alt='예' align='absmiddle'><span
									style='color: #6a6a6a'>아이비</span></a></li>
							<li><a
								href='/pension/index.html?step=reserV&amp;code=1464661788&amp;year=2018&amp;month=3&amp;day=27&amp;selDay=2018-3-27'><img
									src='/resources/img/ico_ye.gif' alt='예' align='absmiddle'><span
									style='color: #6a6a6a'>마가렛</span></a></li>
						</ul></td>
					<td class='b4_day'><strong>28 </strong>
					<ul class='reList'>
							<li><a
								href='/pension/index.html?step=reserV&amp;code=1471309602&amp;year=2018&amp;month=3&amp;day=28&amp;selDay=2018-3-28'><img
									src='/resources/img/ico_ye.gif' alt='예' align='absmiddle'><span
									style='color: #6a6a6a'>데이지(복층)</span></a></li>
							<li><a
								href='/pension/index.html?step=reserV&amp;code=1471309564&amp;year=2018&amp;month=3&amp;day=28&amp;selDay=2018-3-28'><img
									src='/resources/img/ico_ye.gif' alt='예' align='absmiddle'><span
									style='color: #6a6a6a'>릴리(복층)</span></a></li>
							<li><a
								href='/pension/index.html?step=reserV&amp;code=1471309372&amp;year=2018&amp;month=3&amp;day=28&amp;selDay=2018-3-28'><img
									src='/resources/img/ico_ye.gif' alt='예' align='absmiddle'><span
									style='color: #6a6a6a'>아이비</span></a></li>
							<li><a
								href='/pension/index.html?step=reserV&amp;code=1464661788&amp;year=2018&amp;month=3&amp;day=28&amp;selDay=2018-3-28'><img
									src='/resources/img/ico_ye.gif' alt='예' align='absmiddle'><span
									style='color: #6a6a6a'>마가렛</span></a></li>
						</ul></td>
					<td class='b4_day'><strong>29 </strong>
					<ul class='reList'>
							<li><a
								href='/pension/index.html?step=reserV&amp;code=1471309602&amp;year=2018&amp;month=3&amp;day=29&amp;selDay=2018-3-29'><img
									src='/resources/img/ico_ye.gif' alt='예' align='absmiddle'><span
									style='color: #6a6a6a'>데이지(복층)</span></a></li>
							<li><a
								href='/pension/index.html?step=reserV&amp;code=1471309564&amp;year=2018&amp;month=3&amp;day=29&amp;selDay=2018-3-29'><img
									src='/resources/img/ico_ye.gif' alt='예' align='absmiddle'><span
									style='color: #6a6a6a'>릴리(복층)</span></a></li>
							<li><a
								href='/pension/index.html?step=reserV&amp;code=1471309372&amp;year=2018&amp;month=3&amp;day=29&amp;selDay=2018-3-29'><img
									src='/resources/img/ico_ye.gif' alt='예' align='absmiddle'><span
									style='color: #6a6a6a'>아이비</span></a></li>
							<li><a
								href='/pension/index.html?step=reserV&amp;code=1464661788&amp;year=2018&amp;month=3&amp;day=29&amp;selDay=2018-3-29'><img
									src='/resources/img/ico_ye.gif' alt='예' align='absmiddle'><span
									style='color: #6a6a6a'>마가렛</span></a></li>
						</ul></td>
					<td class='b4_day'><strong>30 </strong>
					<ul class='reList'>
							<li><a
								href='/pension/index.html?step=reserV&amp;code=1471309602&amp;year=2018&amp;month=3&amp;day=30&amp;selDay=2018-3-30'><img
									src='/resources/img/ico_ye.gif' alt='예' align='absmiddle'><span
									style='color: #6a6a6a'>데이지(복층)</span></a></li>
							<li><a
								href='/pension/index.html?step=reserV&amp;code=1471309564&amp;year=2018&amp;month=3&amp;day=30&amp;selDay=2018-3-30'><img
									src='/resources/img/ico_ye.gif' alt='예' align='absmiddle'><span
									style='color: #6a6a6a'>릴리(복층)</span></a></li>
							<li><a
								href='/pension/index.html?step=reserV&amp;code=1471309372&amp;year=2018&amp;month=3&amp;day=30&amp;selDay=2018-3-30'><img
									src='/resources/img/ico_ye.gif' alt='예' align='absmiddle'><span
									style='color: #6a6a6a'>아이비</span></a></li>
							<li><a
								href='/pension/index.html?step=reserV&amp;code=1464661788&amp;year=2018&amp;month=3&amp;day=30&amp;selDay=2018-3-30'><img
									src='/resources/img/ico_ye.gif' alt='예' align='absmiddle'><span
									style='color: #6a6a6a'>마가렛</span></a></li>
						</ul></td>
					<td class='blue b4_day'><strong>31 </strong>
					<ul class='reList'>
							<li><a
								href='/pension/index.html?step=reserV&amp;code=1471309602&amp;year=2018&amp;month=3&amp;day=31&amp;selDay=2018-3-31'><img
									src='/resources/img/ico_ye.gif' alt='예' align='absmiddle'><span
									style='color: #6a6a6a'>데이지(복층)</span></a></li>
							<li><a
								href='/pension/index.html?step=reserV&amp;code=1471309564&amp;year=2018&amp;month=3&amp;day=31&amp;selDay=2018-3-31'><img
									src='/resources/img/ico_ye.gif' alt='예' align='absmiddle'><span
									style='color: #6a6a6a'>릴리(복층)</span></a></li>
							<li><a href='#'><img src='/resources/img/ico_end.gif' alt='완'
									align='absmiddle'><span style='color: #6a6a6a'>아이비</span></a></li>
							<li><a
								href='/pension/index.html?step=reserV&amp;code=1464661788&amp;year=2018&amp;month=3&amp;day=31&amp;selDay=2018-3-31'><img
									src='/resources/img/ico_ye.gif' alt='예' align='absmiddle'><span
									style='color: #6a6a6a'>마가렛</span></a></li>
						</ul></td>
				</tr>
			</tbody>
		</table>

	</div>
	<!-- //Contents --> 
</body></html>