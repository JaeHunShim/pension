
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=utf-8">
<title>비밀번호 확인 폼</title>
<link rel="STYLEsheet" HREF="https://global.interpark.com/renewPark/css/us_common_ssl.css" type="text/css">
<link rel="stylesheet" href="https://global.interpark.com/renewPark/css/us_pop_ssl.css" type="text/css" media='all'>
<script src="/resources/js/basic/jQuery-2.1.4.min.js"></script>
<script>
//회원탈퇴 처리 
$(document).ready(function(){
	$('#secession').on('click',function(){
			var user_password = $('#user_password').val();
			var user_id =$('#user_id').val();
		$.ajax({
			url:'/user/secession',
			type:'post',
			headers:{
				'Content-Type':'application/json',
			},
			data:JSON.stringify({
				user_password:user_password,
				user_id:user_id
			}),
			success:function(result){
				if(result == 'success'){
					window.close();
					alert('탈퇴되었습니다.');
					window.opener.top.location.href="/user/logout";
				}
			}			
		});
	});
});
</script>
</head>
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<input type="hidden" id="user_id" value="${login.user_id}"/>
<div id="SearchForm1">
	<div id="POP">
		<!--lognWrap -->
		<div class="lognWrap">	
			<h1>
				<a href="javaScript:self.close();" title="닫기" class="btn"><img src="https://sslgimage.interpark.com/renewPark/us_img/pop/btn_x.gif" alt="닫기">비밀번호 입력</a></h1>		
			<!--conWrap -->	
			<div class="conWrap">	
				<!--비밀번호찾기 -->
				<table class="id_findT">
					<tr>
						<th><b class="Farrow">password</b></th>
						<td><input class="login_off" name="user_password" id="user_password"></td>
					</tr>
				</table>	
				<div class="line"></div>			
				<div class="space10"></div>			
				<p class="Fdot mt10">회원가입 시 입력하신 비밀번호를 입력해주세요</p>
				<p class="txt_radio" style="display: none;"><input type="radio" class="radio" name="pwdSearchType" value="B"> 가입 시 등록한 질문/답변으로 비밀번호 찾기</p>
				<p class="txt_radio" style="display: none;"><input type="radio" class="radio" name="pwdSearchType" value="C" checked></p>							
				<div class="btn_b"><a href="#" id="secession"><img src="https://sslgimage.interpark.com/renewPark/us_img/pop/btn_confirm.gif"></a></div>
				<!--//비밀번호찾기 -->
			</div>
			<!--//conWrap-->		
		</div>
		<!--//lognWrap -->
	</div>
</div>
</body>
</html>