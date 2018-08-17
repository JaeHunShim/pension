<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="/resources/js/basic/jQuery-2.1.4.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
//주소 처리 하는 부분
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('ad_search').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('user_address').value = fullRoadAddr;
                document.getElementById('user_address2').value = data.jibunAddress;

                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }
</script>
<script>
	var idcheck= 0; //아이디 체크했는지 안했는지 판별 
	$(document).ready(function(){
		//가입 취소 누를때 입력했던 데이터 지워버리기 
		$('#cancel').on('click',function(){
			var user_id = $('#user_id').val();
			var user_password=$('#user_password').val();
			var user_password1=$('#user_password1').val();
			var user_address=$('#user_address').val();
			var user_address2=$('#user_address2').val();
			var user_name=$('#user_name').val();
			var user_phone=$('#user_phone').val();
			var user_email=$('#user_email').val();
			var idcheck=$('font[name=usercheck]').text();
			var passwordcheck=$('font[name=check]').text();
			
			resetData(user_id,user_password,user_password1,user_address,user_address2,user_name,user_phone,user_email,idcheck,passwordcheck);
		});
		//아이디 중복 유효성 검사
		$('#idCheck').on('click',function(){
			var user_id = $('#user_id').val();
			console.log(key);
			$.ajax({
				url:'/user/idCheck',
				type:'post',
				data:user_id,
				headers:{
					'Content-Type':'application/json'
				},
				success:function(data){
					if(data.cnt>0){
						console.log(data.cnt);
						 //alert('사용불가');
						 $('font[name=usercheck]').text('');
						 $('font[name=usercheck]').html('현재 아이디는 사용중입니다.');
						 $('font[name=usercheck]').css('color','#FF0000')
						 $('#user_id').focus();

					}else{
						 //alert('사용가능');
						 $('font[name=usercheck]').text('');
						 $('font[name=usercheck]').html('사용할수 있는 아이디 입니다.');
						 $('font[name=usercheck]').css('color','#0000FF')
						 $('#password').focus();
						 idcheck=1;
					}
				}
			});
		});
		//비밀번호 일치판명
		$('#user_password').keyup(function(){
			$('font[name=check]').text('');
		});
		$('#user_password1').keyup(function(){
			
			if($('#user_password').val()!=$('#user_password1').val()){
				$('font[name=check]').text('');
				$('font[name=check]').html('암호가 일치하지 않습니다.');
				$('font[name=check]').css('color','#FF0000')
			}else{
				$('font[name=check]').text('');
				$('font[name=check]').html('암호가 일치 합니다.');
				$('font[name=check]').css('color','#0000FF')
			}
		});
		//회원가입 
		$('#join').on('click',function(event){
			event.preventDefault();
			var user_id = $('#user_id').val();
			var user_password=$('#user_password').val();
			var user_password1=$('#user_password1').val();
			var user_address=$('#user_address').val();
			var user_address2=$('#user_address2').val();
			var user_name=$('#user_name').val();
			var user_phone=$('#user_phone').val();
			var user_email=$('#user_email').val();
			var idcheck=$('font[name=usercheck]').text();
			var passwordcheck=$('font[name=check]').text();
			console.log(user_address2);
			
			if(idcheck == 0){
				alert('아이디 중복체크를 해주세요');
				$('#user_id').focus();
			}else if($.trim(user_id).length == 0){
				alert('아이디를 입력해주세요.');
				$('#user_id').focus();
			}else if(checkSpecial(user_id)){
				alert('아이디에는 특수문자가 들어올수 없습니다.');
				$('#user_id').focus();
			}else if($.trim(user_password).length == 0){
				alert('비밀번호를 입력해주세요');
				$('#user_password').focus();
			}else if(!checkPasswordPattern(user_password)){
				alert("비밀번호는 8자리 이상 문자, 숫자, 특수문자로 구성하여야 합니다.");
				$('#user_password').focus();
			}else if($.trim(user_email).length == 0){
				alert('이메일을 입력해주세요');
				$('#user_email').focus();
			}else if(!emailvalidate(user_email)){
				alert('제대로된 이메일 형식을 입력해주세요');
				$('#user_email').focus();
			}else if($.trim(user_phone).length == 0){
				alert('전화번호를 입력해주세요');
				$('#user_phone').focus();
			}else if(!phonevalidate(user_phone)){
				alert('제대로된 핸드폰 번호를 입력해주세요');
				$('#user_phone').focus();
			}else{
				joinPost(user_id,user_password,user_address,user_address2,user_name,user_phone,user_email);
				resetData(user_id,user_password,user_password1,user_address,user_name,user_phone,user_email,idcheck,passwordcheck);
				self.location="/main/index";
			}
		});
		//이메일 인증하기 
		$('#emailCheck').on('click',function(){
			var user_email = $('#user_email').val();
			$.ajax({
				url:'/user/emailCertification',
				type:'post',
				data:user_email,
				headers:{
					'Content-Type':'application/json'
				},
				success:function(data){
					if(data==true){
						alert('인증번호를 발송했습니다.');
					}
				}
			});
		});
		$('#emailCheckInput').on('click',function(){
			var key = $('#key').val();
			var user_cer=$('#user_cer').val();
			console.log(user_cer);
			console.log(key);
			emailAutorization(key,user_cer);
		});
	});
	//회원가입 함수 
	function joinPost(user_id,user_password,user_address,user_address2,user_name,user_phone,user_email){
		$.ajax({
			url:'/user/join',
			type:'post',
			headers:{
				'Content-Type':'application/json'
			},
			data:JSON.stringify({
				user_id:user_id,
				user_password:user_password,
				user_address:user_address,
				user_address2:user_address2,
				user_name:user_name,
				user_phone:user_phone,
				user_email:user_email
		
			}),
			success:function(result){
				if(result=='success'){
					alert('회원가입 되었습니다.');
					$('#joinForm').modal('hide');
				}
			}
		});
	}
	//이메일 유효성 체크 함수
	function emailvalidate(user_email){
		var pattern =/^(("[\w-\s]+")|([\w-]+(?:\.[\w-]+)*)|("[\w-\s]+")([\w-]+(?:\.[\w-]+)*))(@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$)|(@\[?((25[0-5]\.|2[0-4][0-9]\.|1[0-9]{2}\.|[0-9]{1,2}\.))((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\.){2}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\]?$)/i;
		
		return pattern.test(user_email);
	}
	//전화번호 유효성 체크
	function phonevalidate(user_phone){
		
		var pattern1 =  /(01[0|1|6|9|7])[-](\d{3}|\d{4})[-](\d{4}$)/g;
		
		return pattern1.test(user_phone);
	}
	//특수문자 유효성 체크 
	function checkSpecial(user_id){
	var special_pattern = /[`~!@#$%^&*|\\\'\";:\/?]/gi; 
		if(special_pattern.test(user_id) == true) {
			return true; 
		}else{ 
			return false; 
		} 
	}
	//비밀번호 유효성 체크(8자이상 ,문자, 숫자,특수문자 포함여부)
	function checkPasswordPattern(user_password) { 
		var pattern1 = /[0-9]/;	// 숫자 var 
		var pattern2 = /[a-zA-Z]/;	// 문자 var 
		var pattern3 = /[~!@#$%^&*()_+|<>?:{}]/;	// 특수문자 
		
		if(!pattern1.test(user_password) || !pattern2.test(user_password) || !pattern3.test(user_password) || user_password.length < 8) {
			 
			return false; 
		}else{ 
			return true; 
		} 
	}
	//내용 리셋
	function resetData(user_id,user_password,user_password1,user_address,user_address2,user_name,user_phone,user_email,idcheck,passwordcheck,){
		
		var user_id = $('#user_id').val('');
		var user_password=$('#user_password').val('');
		var user_password1 =$('#user_password1').val('');
		var user_address=$('#user_address').val('');
		var user_address2=$('#user_address2').val('');
		var user_name=$('#user_name').val('');
		var user_phone=$('#user_phone').val('');
		var user_email=$('#user_email').val('');
		var idchek=$('font[name=check]').text('');
		var passwordcheck=$('font[name=usercheck]').text('');

	}
	//이메일 인증 번호확인
	function emailAutorization(key,user_cer){
		var key = $('#key').val();
		var user_cer = $('#user_cer').val();
		
		if(key != user_cer){
			alert('인증번호가 일치하지 않습니다.');
			return false;
 		}else if(key ==""){
			alert("인증번호를 입력해주세요");
			return false; 
		}else{
			alert('인증되었습니다.');
			return true;
		}
	}
</script>
<!-- session 값 (회원가입할때 인증코드 검사하기 위해서 사용 -->
<input type="hidden" id="key" value='${sessionScope.key}'>
 <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close" aria-hidden="true">×</button>
</div>
<div class="modal-body">
	<article class="container">
        <div class="page-header">
          <h1>회원가입</h1>
         </div>
        <div class="col-md-6 col-md-offset-3">
            <div class="form-group">
            	<label class="InputPassword" for="user_id">아이디</label>
                	<div class="input-group">
                  	<input type="text" class="form-control" id="user_id" name="user_id" placeholder="아이디를 입력해주세요" />
                  	<span class="input-group-btn">
                    	<button class="btn btn-info" id="idCheck">아이디중복검사<i class="fa fa-mail-forward spaceLeft"></i></button>
                  	</span>
                 	</div>
                 	<font name='usercheck' size='3' color='red'></font>
        	</div>
            <div class="form-group">
              <label for="InputPassword1">비밀번호</label>
              <input type="password" class="form-control" name="user_password" id= "user_password" placeholder="비밀번호 입력해주세요">
            </div>
            <div class="form-group">
              <label for="InputPassword2">비밀번호 확인</label>
              <input type="password" class="form-control" name="user_password1" id="user_password1" placeholder="비밀번호 확인">
              <font name='check' size='3' color='red'></font>
            </div>
            <div class="form-group">
              <label for="InputPassword2">주소</label>
              <div class="input-group" style="margin-bottom:10px">
              	<input type="text" class="form-control" id="ad_search" placeholder="우편번호" style="width:100px" readonly>
              	<input type="button" class="btn btn-info" onclick="sample4_execDaumPostcode()" value="우편변호찾기">
              	<span id="guide" style="color:#999"></span>
              </div>
              <input type="text" class="form-control" id="user_address" placeholder="주소 입력해주세요" readonly><br>
              <input type="text" class="form-control" id="user_address2" placeholder="상세주소입력해주세요">
            </div>
            <div class="form-group">
              <label for="username">이름</label>
              <input type="text" class="form-control" name="user_name" id="user_name"placeholder="이름 입력해주세요">
            </div>
            <div class="form-group">
              <label for="InputEmail">E-Mail</label>
              	<div class="input-group">
              		<input type="email" class="form-control" name="user_email" id="user_email" placeholder="이메일을 입력해주세요">
              			<span class="input-group-btn">
							<button class="btn btn-success" id="emailCheck">인증메일 전송<i class="fa fa-mail-forward spaceLeft"></i></button>
              			</span>
                </div>
                <font name='emailCheck' size='3' color='red'></font>
            </div>
            <div class="form-group">
              <label for="InputEmail">E-Mail Certification</label>
              	<div class="input-group">
              		<input type="email" class="form-control" name="user_cer" id="user_cer" placeholder="인증번호를 입력하세요">
              			<span class="input-group-btn">
							<button class="btn btn-success" id="emailCheckInput">인증번호 입력<i class="fa fa-mail-forward spaceLeft"></i></button>
              			</span>
                </div>
                <font name='emailInputCheck' size='3' color='red'></font>
            </div>
            <div class="form-group">
              <label for="InputPassword2">전화번호</label>
              <input type="text" class="form-control" id="user_phone" id="user_phone" placeholder="- 포함해서 넣어주세요 ex)010-3333-4444">
            </div>
		</div>
       </article>
 </div>
 <div class="modal-footer">
  <div class="form-group text-center">
	<button type="button" class="btn btn-info" id="join">회원가입<i class="fa fa-check spaceLeft"></i></button>
	<button type="button" class="btn btn-danger" data-dismiss="modal" id='cancel'>가입취소<i class="fa fa-times spaceLeft"></i></button>
  </div>
</div>