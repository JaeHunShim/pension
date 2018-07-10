<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>    
<%@ include file="../include/header.jsp" %>

<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<style>
@media (min-width: 1200px) {
  .container {
    width:1500px;
  }
}  
table{
	text-align:center;
}
</style>
<script>
//가격에 콤마찍는 부분
function numberWithCommas(x) {
	$('tr').children('#total_pay').each(function(){
		var x = $(this).text();
		var y = x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		$(this).text(y);
	});
	
}
//삭제에 관한 메세지 
var result='${msg}';

if(result='${sucess}'){
	alert('삭제되었습니다.');
}else if(result="${complate}"){
	alert('다운로드가 완료되엇습니다.');
}
</script>
<script>
$(document).ready(function(){
	//텍스트 center
	$('th').each(function(){
		$(this).attr('class',"text-center");	
	});
	//금액에 콤마찍는 부분 
	$('tr').children('#total_pay').each(function(){
		var x = $(this).text();
		numberWithCommas(x);
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
     
  	//선택한 게시물 삭제 하는 부분
  	
    $('.btn-danger').on('click',function(){
    	if($('input[type=checkbox]').is(':checked')==false){
    		alert("삭제할것을 선택해주세요");
    		return false;
    	}else if(confirm("정말로 삭제 하시겠습니까?")){
    		self.location ="/reservation/delete?reserNo="+$('input[type=checkbox]:checked').val()
    	}
    	
    });
  	//입금 여부 바꾸는 부분 (deposit이 1이면 미입금, deposit이 2이면 입금)
  	$('.btn-primary').on('click',function(){
  		if($('input[type=checkbox]').is(':checked')==false){
    		alert("변경하실 입금현황을 선택해주세요");
    		return false;
    	}else if(confirm("입급완료!!")){
    		self.location = "/reservation/modifyDeposit?reserNo="+$('input[type=checkbox]:checked').val()
    
    	}		
  	});
  	$('#deModify').on('click',function(){
  		if($('input[type=checkbox]').is(':checked')==false){
    		alert("변경하실 입금현황을 선택해주세요");
    		return false;
    	}else if(confirm("미입금으로 수정!!")){
    		self.location = "/reservation/modifyDeposit?reserNo="+$('input[type=checkbox]:checked').val()	
    	}		
  	});
  	//엑셀로 출력하는 부분 
  	$('.btn-warning').on('click',function(){
  		if(confirm("엑셀로 다운로드 하시겠습니까?")){
  			var user_id= '${login.user_id}'
  			self.location ="/excel";
  		}
  	});
	//전페이지나 다음페이지가 없으면 밑에 페이징 처리 막아버리기 
	$('.disabled').children('a').on('click',function(event){
		event.preventDefault();
	});
});

</script>
<div class="room_box">
	<h2>Management</h2>
	<div class="owl_box">
        <div id="owl-demo" class="owl-carousel">
            <div class="item">
            	<p class="room_img"><img src="/resources/img/main/room_img.jpg" /></p>
                <p class="room_name">데이지</p>
                <p class="room_txt">무창포 이루펜션</p>
                <p class="room_view"><a href="/sub2/sub1.htm">객실보기</a></p>
            </div>
            <div class="item">
            	<p class="room_img"><img src="/resources/img/main/room_img1.jpg" /></p>
                <p class="room_name">릴리</p>
                <p class="room_txt">무창포 이루펜션</p>
                <p class="room_view"><a href="/sub2/sub2.htm">객실보기</a></p>
            </div>
            <div class="item">
            	<p class="room_img"><img src="/resources/img/main/room_img2.jpg" /></p>
                <p class="room_name">아이비</p>
                <p class="room_txt">무창포 이루펜션</p>
                <p class="room_view"><a href="/sub2/sub3.htm">객실보기</a></p>
            </div>
            <div class="item">
            	<p class="room_img"><img src="/resources/img/main/room_img3.jpg" /></p>
                <p class="room_name">마가렛</p>
                <p class="room_txt">무창포 이루펜션</p>
                <p class="room_view"><a href="/sub2/sub4.htm">객실보기</a></p>
            </div>
        </div>
    </div>
</div>
<section>
	<div class="container">
	<ul>
		<li><h3>Reservation Infromation</h3></li>
		<li><button class="btn btn-warning btn pull-right"><span class="glyphicon glyphicon-download-alt"></span></button></li>
	</ul>
		<div class="row">
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
								<th>아이디</th>
								<th>이메일</th>
								<th>이름</th>
								<th>휴대폰 번호</th>
								<th>방이름</th>
								<th>숙박 인원</th>
								<th>금액</th>
								<th>입금여부</th>
								<th>Delete</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${list}" var="management">
							<tr>
								<td><input type="checkbox" value="${management.reserNo}"class="checkthis" /></td>
								<td>${management.reserNo}</td>
								<td>${management.r_fullDate}</td>
								<td>${management.r_lastfullDate}</td>
								<td>${management.reser_select}박${management.reser_select+1}일 </td>
								<td>${management.user_id}</td>
								<td>${management.user_email}</td>
								<td>${management.user_name}</td>
								<td>${management.user_phone}</td>
								<td>${management.room_name}</td>
								<td>${management.inwon_check}명</td>
								<td id="total_pay">${management.total_pay}원</td>
								<c:choose>
								<c:when test="${management.deposit == '입금전'}">
									<td><p data-placement="top" data-toggle="tooltip" title="Edit"><button class="btn btn-primary btn-xs" data-title="Edit"><span class="glyphicon glyphicon-remove" ></span></button></p></td>								
								</c:when>
								<c:otherwise>
									<td><p data-placement="top" data-toggle="tooltip" title="Edit"><button id="deModify" class="btn btn-success btn-xs" data-title="Edit"><span class="glyphicon glyphicon-ok"></span></button></p></td>
								</c:otherwise>
								</c:choose>
								<td><p data-placement="top" data-toggle="tooltip" title="Delete"><button class="btn btn-danger btn-xs" data-title="Delete"\><span class="glyphicon glyphicon-trash"></span></button></p></td>
							</tr>
						</c:forEach>
						</tbody>        
					</table>
						<div class="clearfix"></div>
							<ul class="pagination pull-right">
								<li <c:out value="${pageMaker.prev == false?'class=disabled':''}"/>>
									<a href="/reservation/managementPaging${pageMaker.makeQuery(pageMaker.startPage-1)}"><span class="glyphicon glyphicon-chevron-left"></span></a>
								</li>
								<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage }" var="idx">
								<li <c:out value="${pageMaker.cri.page == idx?'class=active':''}"/>>
									<a href="/reservation/managementPaging${pageMaker.makeQuery(idx)}">${idx}</a>
								</li>
								</c:forEach>
								<li <c:out value="${pageMaker.next == false?'class=disabled':''}"/>>
									<a href="/reservation/managementPaging${pageMaker.makeQuery(pageMaker.endPage+1)}"><span class="glyphicon glyphicon-chevron-right"></span></a>
								</li>
							</ul>
				</div>
			</div>
		</div>
	</div>
</section>
<%@ include file="../include/footer.jsp" %>
