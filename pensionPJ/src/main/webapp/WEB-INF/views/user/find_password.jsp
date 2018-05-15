
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=EUC-KR">
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
<!-- 2번째 폼 -->
<!-- <div id="SearchForm2" style="display:none;">
	<div id="POP">
		lognWrap
		<div class="lognWrap">	
			<h1><img src="https://sslgimage.interpark.com/renewPark/us_img/pop/h1_passfind_result.gif" alt="" class="tit"> <a href="javaScript:self.close();" title="닫기" class="btn"><img src="https://sslgimage.interpark.com/renewPark/us_img/pop/btn_x.gif" alt="닫기"></a></h1>		
			conWrap	
			<div class="conWrap">	
				비밀번호찾기						
				<div class="box_gray">
					<p>회원가입시 입력한 본인확인용 답변을 적어주세요.</p>
				</div>
				
				<table class="id_find_qaT">
					<tr>
						<th><b class="Fdot">Question</b></th>
						<td class="txt" id="questionMsg"></td>
					</tr>
					<tr>
						<th><b class="Fdot">Answer</b></th>
						<td><input class="input" name="pwdChkAns" id="pwdChkAns"></td>
					</tr>
				</table>
				<div class="space10"></div>
				<div class="line"></div>			
				<div class="tc pt10 pb10">
					<a href="javaScript:fncQuestionSearchPwd();"><img src="https://sslgimage.interpark.com/renewPark/us_img/pop/btn_confirm.gif" alt=""></a>
				</div>
				<h2 class="mt5">위의 방법으로 비밀번호 찾기가 어려우실 경우, <br>아래의 방법을 이용해 주세요.</h2>
				<div class="box_gray">
					<p><a href="javaScript:fncSwitchPopup('C');" class="u">등록한 e-mail 로 비밀번호 찾기</a> <img src="https://sslgimage.interpark.com/renewPark/us_img/pop/arrow_red.gif" alt=""></p>
				</div>			
				//비밀번호찾기
			</div>
			//conWrap		
		</div>
		//lognWrap
	</div>
</div> -->
<!-- 3번째 폼 -->
<!-- <div id="SearchForm3" style="display:none;">
	<div id="POP">
		lognWrap
		<div class="lognWrap">	
			<h1><img src="https://sslgimage.interpark.com/renewPark/us_img/pop/h1_passfind_result.gif" alt="" class="tit"> <a href="javaScript:self.close();" title="닫기" class="btn"><img src="https://sslgimage.interpark.com/renewPark/us_img/pop/btn_x.gif" alt="닫기"></a></h1>		
			conWrap	
			<div class="conWrap">	
				비밀번호찾기			
				<div class="box_gray">
					<p>회원가입시 입력한 eMail을 입력하시면 <br>해당 e-mail로 비밀번호를 발송해 드립니다</p>
				</div>			
				<table class="id_find_qaT">
					<tr>
						<th><b class="Fdot">E-mail</b></th>
						<td><input class="input" name="sendMailAddr" id="sendMailAddr" style="text-transform: lowercase;"></td>
					</tr>
				</table>
				<div class="space10"></div>
				<div class="line"></div>			
				<div class="tc pt10 pb10">
					<a href="javaScript:getAjaxSendMail();"><img src="https://sslgimage.interpark.com/renewPark/us_img/pop/btn_confirm.gif" alt=""></a>
				</div>			
				<h2 class="mt5" style="display: none;">위의 방법으로 비밀번호 찾기가 어려우실 경우, <br>아래의 방법을 이용해 주세요.</h2>			
				<div class="box_gray" style="display: none;">
					<p><a href="javaScript:fncSwitchPopup('B');" class="u">가입 시 등록한 질문/답변으로  비밀번호 찾기</a> <img src="https://sslgimage.interpark.com/renewPark/us_img/pop/arrow_red.gif" alt=""></p>
				</div>			
				//비밀번호찾기
			</div>
			//conWrap		
		</div>
		//lognWrap
	</div>
</div> -->
<!-- 4번째폼 -->
<!-- <div id="SearchForm4" style="display:none;">
	<div id="POP">
		lognWrap
		<div class="lognWrap">	
			<h1><img src="https://sslgimage.interpark.com/renewPark/us_img/pop/h1_passfind_result.gif" alt="" class="tit"> <a href="javaScript:self.close();" title="닫기" class="btn"><img src="https://sslgimage.interpark.com/renewPark/us_img/pop/btn_x.gif" alt="닫기"></a></h1>		
			conWrap	
			<div class="conWrap">	
				비밀번호찾기				
				<div class="box_gray">
					<p id="questionPwddSearchMsg"></p>
				</div>	
				<div class="tc pt10 pb10">
					<a href="javaScript:self.close();"><img src="https://sslgimage.interpark.com/renewPark/us_img/pop/btn_s_login.gif" alt=""></a>
				</div>			
				//비밀번호찾기
			</div>
			//conWrap		
		</div>
		//lognWrap
	</div>
</div>
 -->
<!-- 5번째폼 -->
<!-- <div id="SearchForm5" style="display:none;">
	<div id="POP">
		lognWrap
		<div class="lognWrap">	
			<h1><img src="https://sslgimage.interpark.com/renewPark/us_img/pop/h1_passfind.gif" alt="" class="tit">
				<a href="javaScript:self.close();" title="닫기" class="btn"><img src="https://sslgimage.interpark.com/renewPark/us_img/pop/btn_x.gif" alt="닫기"></a></h1>		
			conWrap	
			<div class="conWrap">	
				아이디찾기			
				<div class="box_gray">
					<p class="Fdot" id="sendMailMsg"></p>
					<p class="Fdot">로그인 후 비밀번호를 반드시 변경하여 사용하시기 
				바랍니다.</p>
				</div>	
				<div class="tc pt10 pb10">
					<a href="javaScript:self.close();"><img src="https://sslgimage.interpark.com/renewPark/us_img/pop/btn_confirm.gif" alt=""></a>
				</div>			
				<div class="line"></div>
				<p class="Fdot F11 mt20">이메일은 고객님의 아이디 정보 문의에 대해 시스템에서 자동 <br>
				발송되는 e-mail입니다. 요청 후 5~10분 뒤 발송될 수 있습니다</p>			
			</div>
				
		</div>
		
	</div>
</div> -->
</body>
</html>