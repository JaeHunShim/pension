<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>    
<%@ include file="../include/header.jsp" %>

<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<!-- 아래쪽 슬라이 js -->
<style>
body{background:lightgray}
.panel-table .panel-body{
  padding:0;
}

.panel-table .panel-body .table-bordered{
  border-style: none;
  margin:0;
}

.panel-table .panel-body .table-bordered > thead > tr > th:first-of-type {
    text-align:center;
    width: 100px;
}

.panel-table .panel-body .table-bordered > thead > tr > th:last-of-type,
.panel-table .panel-body .table-bordered > tbody > tr > td:last-of-type {
  border-right: 0px;
}

.panel-table .panel-body .table-bordered > thead > tr > th:first-of-type,
.panel-table .panel-body .table-bordered > tbody > tr > td:first-of-type {
  border-left: 0px;
}

.panel-table .panel-body .table-bordered > tbody > tr:first-of-type > td{
  border-bottom: 0px;
}

.panel-table .panel-body .table-bordered > thead > tr:first-of-type > th{
  border-top: 0px;
}

.panel-table .panel-footer .pagination{
  margin:0; 
}

/*
used to vertically center elements, may need modification if you're not using default sizes.
*/
.panel-table .panel-footer .col{
 line-height: 34px;
 height: 34px;
}

.panel-table .panel-heading .col h3{
 line-height: 30px;
 height: 30px;
}

.panel-table .panel-body .table-bordered > tbody > tr > td{
  line-height: 34px;
}
@media (min-width: 1200px) {
  .container {
    width:1500px;
  }
</style>
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
		<h3>Reservation Information</h3>
		<div class="col-md-10 col-md-offset-1">
			<div class="panel panel-default panel-table">
				<div class="panel-body">
					<table class="table table-striped table-bordered table-list">
						<thead>
							<tr>
								<th><em class="glyphicon glyphicon-cog"></em></th>
								<th>예약날짜</th>
								<th>퇴실날짜</th>
								<th>숙박기간</th>
								<th>아이디</th>
								<th>이름</th>
								<th>이메일</th>
								<th>휴대폰 번호</th>
								<th>방이름</th>
								<th>숙박 인원</th>
								<th>금액</th>
								<th>입금여부</th>
							</tr> 
						</thead>
						<tbody>
						<c:forEach items="${list}" var="management">
							<tr>
								<td align="center">
									<a class="btn btn-default"><em class="glyphicon glyphicon-pencil"></em></a>
									<a class="btn btn-danger"><em class="glyphicon glyphicon-trash"></em></a>
								</td>
								<td>${management.r_fullDate}</td>
								<td>${management.r_lastfullDate}</td>
								<td>${management.reser_select}</td>
								<td>${management.user_id}</td>
								<td>${management.user_email}</td>
								<td>${management.user_name}</td>
								<td>${management.user_phone}</td>
								<td>${management.room_name}</td>
								<td>${management.inwon_check}</td>
								<td>${management.total_pay}</td>
								<td></td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
            
              </div>
              <div class="panel-footer">
                <div class="row">
                  <div class="col col-xs-7">
                    <ul class="pagination hidden-xs pull-right">
                      <li><a href="#">1</a></li>
                      <li><a href="#">2</a></li>
                      <li><a href="#">3</a></li>
                      <li><a href="#">4</a></li>
                      <li><a href="#">5</a></li>
                    </ul>
                    <ul class="pagination visible-xs pull-right">
                        <li><a href="#">«</a></li>
                        <li><a href="#">»</a></li>
                    </ul>
                  </div>
                </div>
              </div>
            </div>

</div></div>
</div>
</section>
<%@ include file="../include/footer.jsp" %>
