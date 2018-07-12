<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
<script src="/resources/js/basic/jQuery-2.1.4.min.js"></script>
<script src="/resources/js/bootstrap/bootstrap.min.js"></script>
<title>Insert title here</title>
<script>
//콤마직는 부분 
function numberWithCommas(x) {
	$('tr').children('#total_pay').each(function(){
		var x = $(this).text();
		var y = x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		$(this).text(y);
	});	
}

//처음 나올때 팝업창 띄우기 
function passInputOpen(){

	var popUrl = "/user/passInput";	//팝업창에 출력될 페이지 URL

	var popOption = "width=400, height=300, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)

		window.open(popUrl,"",popOption);
}	

$(document).ready(function(){
	var msg='${msg}';
	if(msg=="success"){
		alert('삭제되었습니다.');
	}
	//금액에 콤마찍는 부분 
	$('tr').children('#total_pay').each(function(){
		var x = $(this).text();
		numberWithCommas(x);
	});
	//전페이지나 다음페이지가 없으면 밑에 페이징 처리 막아버리기 
	$('.disabled').children('a').on('click',function(event){
		event.preventDefault();
	});
	//전체 선택하는 부분 
	$("#mytable #checkall").click(function () {
        if ($("#mytable #checkall").is(':checked')) {
            $("#mytable input[type=checkbox]").each(function () {
                $(this).prop("checked", true);
            });

        } else {
            $("#mytable input[type=checkbox]").each(function () {
                $(this).prop("checked", false);
            });
        }
    });
    
    $("[data-toggle=tooltip]").tooltip();
    //자신이 선택한 것 예약취소하기 
    $('button[name="cancel"]').on('click',function(){
    	
    	if($('input[type=checkbox]').is(':checked')==false){
    		alert("삭제할것을 선택해주세요");
    		return false;
    	}else if(confirm("예약 취소하시겠습니까")){
    		self.location ="/user/deleteRes?reserNo="+$('input[type=checkbox]:checked').val()
    	}
    });
});
</script>
</head>
<body>
<div class="container-fluid">   
</div>
<div class="container" align="center">
	<div class="row">
		<div class="col-sm-12">
			<div class="col-sm-2"></div>
				<div class="col-sm-9">
					<h2 class="text-center">회원 정보 보기</h2>
					<table class="table table-striped">
						<tr>
							<td>아이디</td>
							<td>${userVO.user_id}</td>
						</tr>
					  
						<tr>
							<td>이름</td>
							<td>${userVO.user_name}</td>
						</tr>
					  
						<tr>
							<td>이메일</td>
							<td>${userVO.user_email}</td>
					  	</tr>
					  
						<tr>
							<td>핸드폰 번호</td>
							<td>${userVO.user_phone}</td>
						</tr>
					  
						<tr>
							<td>주소</td>
							<td>${userVO.user_address}</td>
						</tr>
						<tr>
							<td class="text-center" colspan="2">
								<button class="btn btn-primary" onclick="passInputOpen()">수정하기</button>
								<button class="btn btn-danger"  onclick = "window.open('/user/secession','','width=400,height=300'); return false;" target="_blank">탈퇴하기</button>
								<button class="btn btn-warning" onclick ="window.top.location.href='/reservation/reservation_main'">예약하러가기</button>
						 	</td>	
						</tr>	
					</table>
				</div>
			</div> 
		</div>
</div>
<div class="container">
	<div class="row">
	<h2 class="text-center">예약 현황</h2>
			<div class="col-md-12">
				<div class="table-responsive">
					<table id="mytable" class="table table-bordred table-striped">
						<thead>
							<tr>
								<th><input type="checkbox" id="checkall" /></th>
								<th>예약번호</th>
								<th>예약날짜</th>
								<th>퇴실날짜</th>
								<th>숙박기간</th>
								<th>방이름</th>
								<th>숙박 인원</th>
								<th>금액</th>
								<th>입금여부</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${list}" var="reserVO">
							<tr>
								<td><input type="checkbox" value="${reserVO.reserNo}"class="checkthis" /></td>
								<td>${reserVO.reserNo}</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd" value="${reserVO.r_fullDate}"/></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd" value="${reserVO.r_lastFullDate}"/></td>
								<td>${reserVO.reser_select}박${reserVO.reser_select+1}일 </td>
								<td>${reserVO.room_name}</td>
								<td>${reserVO.inwon_check}명</td>
								<td id="total_pay">${reserVO.total_pay}원</td>
								<td>${reserVO.deposit}</td>
							</tr>
						</c:forEach>
						</tbody>
						<tr>
							<td class="text-center" colspan="9">
								<button name="cancel" class="btn btn-danger">예약취소</button>
								
						 	</td>	
						</tr>	        
					</table>
						<div class="clearfix"></div>
							<ul class="pagination pull-right">
								<li <c:out value="${pageMaker.prev == false?'class=disabled':''}"/>>
									<a href="/user/info${pageMaker.makeQuery(pageMaker.startPage-1)}&user_id=${login.user_id}"><span class="glyphicon glyphicon-chevron-left"></span></a>
								</li>
								<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage }" var="idx">
								<li <c:out value="${pageMaker.cri.page == idx?'class=active':''}"/>>
									<a href="/user/info${pageMaker.makeQuery(idx)}&user_id=${login.user_id}">${idx}</a>
								</li>
								</c:forEach>
								<li <c:out value="${pageMaker.next == false?'class=disabled':''}"/>>
									<a href="/user/info${pageMaker.makeQuery(pageMaker.endPage+1)}&user_id=${login.user_id}"><span class="glyphicon glyphicon-chevron-right"></span></a>
								</li>
							</ul>
				</div>
			</div>
		</div>
</div> <!-- container end-->
</body>
</html>