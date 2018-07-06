<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/css/bootstrap/bootstrap.min.css" />
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
<script src="/resources/js/basic/jQuery-2.1.4.min.js"></script>
<script src="/resources/js/bootstrap/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<form name="modify">
<div class="container-fluid">   
</div>
<div class="container">
	<div class="row">
		<div class="col-sm-12">
			<div class="col-sm-2"></div>
				<div class="col-sm-9">
					<h2 class="text-center">회원 정보 보기</h2>
					<table class="table table-striped">
						<tr>
							<td>아이디</td>
							<td></td>
						</tr>
					  
						<tr>
							<td>이름</td>
							<td></td>
						</tr>
					  
						<tr>
							<td>이메일</td>
							<td></td>
					  	</tr>
					  
						<tr>
							<td>핸드폰 번호</td>
							<td></td>
						</tr>
					  
						<tr>
							<td>주소</td>
							<td></td>
						</tr>
					  
						<tr>
							<td class="text-center" colspan="2">
								<button onclick="location.href='MemberUpdateForm.jsp?id='" class="btn btn-primary">수정하기</button>
								<button onclick="location.href='MemberDeleteForm.jsp?id='" class="btn btn-danger">탈퇴하기</button>
								<button onclick="location.href='MemberList.jsp'" class="btn btn-warning">예약하러가기</button>
						 	</td>	
						</tr>	
					</table>
				</div>
			</div> <!-- col-sm-12 -->
		</div><!-- row -->
</div> <!-- container end-->
<div class="container">
	<div class="row">
		<div class="col-sm-12">
			<div class="col-sm-2"></div>
				<div class="col-sm-9">
					<h2 class="text-center">예약 현황</h2>
					<table class="table table-striped">
					  <tr>
						<td>아이디</td>
						<td></td>
					  </tr>
					  
					  <tr>
						<td>이름</td>
						<td></td>
					  </tr>
					  
					  <tr>
						<td>이메일</td>
						<td></td>
					  </tr>
					  
					  <tr>
						<td>핸드폰 번호</td>
						<td></td>
					  </tr>
					  
					  <tr>
						<td>주소</td>
						<td></td>
					  </tr>
					  
					<tr>
						 <td class="text-center" colspan="2">
<button onclick="location.href='MemberUpdateForm.jsp?id='" class="btn btn-danger">예약취소하기</button>


						 
						 </td>	
					</tr>	
				
					  
					</table>
				</div>
		</div> <!-- col-sm-12 -->
	</div><!-- row -->
</div> <!-- container end-->
</form>	
</body>
</html>