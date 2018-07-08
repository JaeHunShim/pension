
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=utf-8">
<title>비밀번호 확인 폼</title>
<link rel="STYLEsheet" HREF="https://global.interpark.com/renewPark/css/us_common_ssl.css" type="text/css">
<link rel="stylesheet" href="https://global.interpark.com/renewPark/css/us_pop_ssl.css" type="text/css" media='all'>

</head>
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<script type="text/javascript" src="https://global.interpark.com/static/js/jquery-1.6.1.js"></script>
<script>
	$(document).ready(function(){
		$('#findpassword').on('click',function(){
			var user_id = $('#user_id').val();
			console.log(user_id);
			console.log(typeof(user_id));
			$.ajax({
				url:'/user/find_password',
				type:'post',
				headers:{
					'Content-Type':'application/json'
				},
				data:JSON.stringify({
					user_id:user_id
				}),
				success:function(data){
					if(data.result == true){
						console.log(data);
						alert('가입하신 email로 비밀번호를 보냈습니다.');
					}else{
						alert("입력하신 email이 잘못되었습니다.");
						
					}
					
				}
			});
		});
	});
</script>
<input type="hidden" name="hiddenPwdChkAns" id="hiddenPwdChkAns">
<input type="hidden" name="hiddenPwdAstar" id="hiddenPwdAstar">
<input type="hidden" name="hiddenMemEmail" id="hiddenMemEmail">
<input type="hidden" name="hiddenMemNo" id="hiddenMemNo">
<div id="SearchForm1">
	<div id="POP">
		<!--lognWrap -->
		<div class="lognWrap">	
			<h1><img src="https://sslgimage.interpark.com/renewPark/us_img/pop/h1_passfind.gif" alt="" class="tit"> 
				<a href="javaScript:self.close();" title="닫기" class="btn"><img src="https://sslgimage.interpark.com/renewPark/us_img/pop/btn_x.gif" alt="닫기"></a></h1>		
			<!--conWrap -->	
			<div class="conWrap">	
				<!--비밀번호찾기 -->
				<table class="id_findT">
					<tr>
						<th><b class="Farrow">ID</b></th>
						<td><input class="login_off" name="user_id" id="user_id"></td>
					</tr>
					<!-- <tr>
						<th><b class="Farrow">E-mail</b></th>
						<td><input class="login_off" name="user_email" id="user_email"></td>
					</tr> -->
				</table>	
				<div class="line"></div>			
				<div class="space10"></div>			
				<p class="Fdot mt10">회원가입 시 입력한 e-mail주소로 임시 비밀번호를 발송해 드립니다.</p>
			        <p class="Fdot mt5"><a href=# style="color:red"> 아이디 찾기</a></p>
				<p class="txt_radio" style="display: none;"><input type="radio" class="radio" name="pwdSearchType" value="B"> 가입 시 등록한 질문/답변으로 비밀번호 찾기</p>
				<p class="txt_radio" style="display: none;"><input type="radio" class="radio" name="pwdSearchType" value="C" checked></p>							
				<div class="btn_b"><a href="#" id="findpassword"><img src="https://sslgimage.interpark.com/renewPark/us_img/pop/btn_confirm.gif"></a></div>
				<!--//비밀번호찾기 -->
			</div>
			<!--//conWrap-->		
		</div>
		<!--//lognWrap -->
	</div>
</div>
</body>
</html>