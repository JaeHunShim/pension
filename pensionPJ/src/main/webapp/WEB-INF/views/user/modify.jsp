<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<link rel="stylesheet" type="text/css" href="/resources/css/bootstrap/bootstrap.min.css" />
<script src="/resources/js/basic/jQuery-2.1.4.min.js"></script>
<script>
	var idcheck= 0; //아이디 체크했는지 안했는지 판별 
	$(document).ready(function(){
		//가입 취소 누를때 입력했던 데이터 지워버리기 
		$('#cancel').on('click',function(){
			var user_id = $('#user_id').val();
			var user_password=$('#user_password').val();
			var user_password1=$('#user_password1').val();
			var user_address=$('#user_address').val();
			var user_name=$('#user_name').val();
			var user_phone=$('#user_phone').val();
			var user_email=$('#user_email').val();
			var idcheck=$('font[name=usercheck]').text();
			var passwordcheck=$('font[name=check]').text();
			
			resetData(user_id,user_password,user_password1,user_address,user_name,user_phone,user_email,idcheck,passwordcheck);
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
						 $('#user_id').focus();

					}else{
						 //alert('사용가능');
						 $('font[name=usercheck]').text('');
						 $('font[name=usercheck]').html('사용할수 있는 아이디 입니다.');
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
				$('font[name=check]').html('암호가 일치하지 않흡니다.');
			}else{
				$('font[name=check]').text('');
				$('font[name=check]').html('암호가 일치 합니다.');
			}
		});
		//회원가입 
		$('#modify').on('click',function(){
			var user_id = $('#user_id').val();
			var user_password=$('#user_password').val();
			var user_password1=$('#user_password1').val();
			var user_address=$('#user_address').val();
			var user_name=$('#user_name').val();
			var user_phone=$('#user_phone').val();
			var user_email=$('#user_email').val();
			var idcheck=$('font[name=usercheck]').text();
			var passwordcheck=$('font[name=check]').text();
			
			if($.trim(user_password).length == 0){
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
				if(confirm("이대로 수정하시겠습니까?")){
					$('form[name="modify"]').submit();
				}
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
	function joinPost(user_id,user_password,user_address,user_name,user_phone,user_email){
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
	function resetData(user_id,user_password,user_password1,user_address,user_name,user_phone,user_email,idcheck,passwordcheck){
		
		var user_id = $('#user_id').val('');
		var user_password=$('#user_password').val('');
		var user_password1 =$('#user_password1').val('');
		var user_address=$('#user_address').val('');
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
		}else{
			alert('인증되었습니다.');
			return true;
		}
	}
</script>
<!-- session 값 (회원가입할때 인증코드 검사하기 위해서 사용 -->
<input type ="hidden" id="key" value='${sessionScope.key}'>
 <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close" aria-hidden="true">×</button>
</div>
<form name="modify" method='post' action="/user/modify">
<div class="modal-body">
	<article class="container">
        <div class="page-header">
          <h1>회원정보 수정</h1>
         </div>
        <div class="col-md-6 col-md-offset-3">
            <div class="form-group">
              <label for="InputPassword1">아이디</label>
              <input type="text" class="form-control" name="user_id" id= "user_id" value="${login.user_id}" readonly/>
            </div>
            <div class="form-group">
              <label for="InputPassword1">비밀번호</label>
              <input type="password" class="form-control" name="user_password" id= "user_password" value="${login.user_password}" placeholder="8자이상 ,문자, 숫자,특수문자 포함">
            </div>
            <div class="form-group">
              <label for="InputPassword2">비밀번호 확인</label>
              <input type="password" class="form-control" name="user_password1" id="user_password1" placeholder="비밀번호 확인">
              <font name='check' size='3' color='red'></font>
            </div>
            <div class="form-group">
              <label for="InputPassword2">주소</label>
              <input type="text" class="form-control" id="user_address" name="user_address" value="${login.user_address}">
            </div>
            <div class="form-group">
              <label for="username">이름</label>
              <input type="text" class="form-control" name="user_name" id="user_name" value="${login.user_name}" readonly>
            </div>
            <div class="form-group">
              <label for="InputEmail">E-Mail</label>        	
              		<input type="email" class="form-control" name="user_email" id="user_email" value="${login.user_email}" placeholder="email">
                <font name='emailCheck' size='3' color='red'></font>
            </div>
            <div class="form-group">
              <label for="InputPassword2">휴대폰 번호</label>
              <input type="text" class="form-control" id="user_phone" name="user_phone" value="${login.user_phone}"placeholder="- 포함해서 넣어주세요 ex)010-3333-4444">
            </div>
		</div>
       </article>
 </div>
 <div class="modal-footer">
  <div class="form-group text-center">
	<button type="button" class="btn btn-info" id="modify">수정완료<i class="fa fa-check spaceLeft"></i></button>
	<button type="button" class="btn btn-danger" data-dismiss="modal" id='cancel'>수정취소<i class="fa fa-times spaceLeft"></i></button>
  </div>
</div>
</form>