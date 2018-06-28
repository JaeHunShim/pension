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
$(document).ready(function(){
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
		<div class="row">
			<div class="col-md-12">
				<h4>Reservation Infromation</h4>
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
								<th>Edit</th>
								<th>Delete</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${list}" var="management">
							<tr>
								<td><input type="checkbox" class="checkthis" /></td>
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
								<td></td>
								<td><p data-placement="top" data-toggle="tooltip" title="Edit"><button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" ><span class="glyphicon glyphicon-pencil"></span></button></p></td>
								<td><p data-placement="top" data-toggle="tooltip" title="Delete"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon glyphicon-trash"></span></button></p></td>
							</tr>
						</c:forEach>
						</tbody>        
					</table>

<div class="clearfix"></div>
<ul class="pagination pull-right">
<li class="disabled"><a href="#"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
<li class="active"><a href="#">1</a></li>
<li><a href="#">2</a></li>
<li><a href="#">3</a></li>
<li><a href="#">4</a></li>
<li><a href="#">5</a></li>
<li><a href="#"><span class="glyphicon glyphicon-chevron-right"></span></a></li>
</ul>
</div>
</div>
</div>
</div>
</section>
<%@ include file="../include/footer.jsp" %>
