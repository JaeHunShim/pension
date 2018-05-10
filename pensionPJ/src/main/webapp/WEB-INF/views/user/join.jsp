<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	$(document).ready(function(){
		//회원 중복 검사
		$('#idCheck').on('click',function(){
			var user_id = $('#user_id').val();
			userIdCheck(user_id);
			console.log(user_id);
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
		$('#join').on('click',function(){
			var user_id = $('#user_id').val();
			var user_password=$('#user_password').val();
			var user_address=$('#user_address').val();
			var user_name=$('#user_name').val();
			var user_phone=$('#user_phone').val();
			var user_email=$('#user_email').val();
			
			joinPost(user_id,user_password,user_address,user_name,user_phone,user_email);
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
					self.location="/main/index";
				}
			}
		});
	}
	//중복 아이디 체크
	function userIdCheck(user_id){
		$.ajax({
			url:'/user/idCheck',
			type:'post',
			data:{user_id:user_id},
			success:function(data){
				if($.trim(data)==0){
					 $('#checkMsg').html('<p style="color:blue">사용가능</p>');

				}else{
					 $('#checkMsg').html('<p style="color:blue">사용가능</p>');
				}
			}
		});
	}
</script>
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
                    	<button class="btn btn-success" id="idCheck">회원중복검사<i class="fa fa-mail-forward spaceLeft"></i></button>
                  </span>
                  <sapn id = 'chkMsg'></sapn>
                </div>
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
              <input type="text" class="form-control" id="user_address" placeholder="주소 입력해주세요">
            </div>
            <div class="form-group">
              <label for="username">이름</label>
              <input type="text" class="form-control" name="user_name" id="user_name"placeholder="이름 입력해주세요">
            </div>
            <div class="form-group">
              <label for="InputEmail">E-Mail</label>
              <input type="email" class="form-control" name="user_email" id="user_email" placeholder="이메일을 입력해주세요">
            </div>
            <div class="form-group">
              <label for="InputPassword2">전화번호</label>
              <input type="text" class="form-control" id="user_phone" id="user_phone" placeholder="- 포함해서 입력해주세요 ex)010-000-0000">
            </div>
        <!--   </form> -->
		</div>
       </article>
 </div>
 <div class="modal-footer">
  <div class="form-group text-center">
              <button type="button" class="btn btn-info" id="join">회원가입<i class="fa fa-check spaceLeft"></i></button>
              <button type="button" class="btn btn-warning">가입취소<i class="fa fa-times spaceLeft"></i></button>
  </div>
</div>