<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="/resources/css/bootstrap/login.css"/>
<script>
	/* $(document).ready(function(){
		$('input[name="login"]').on('click',function(){
			var user_id= $('#user_id').val();
			var user_password=$('#user_password').val();

			$.ajax({
				url:'/user/login',
				type:'post',
				headers:{
					'Content-Type':'application/json'	
				},
				data:JSON.stringify({
					user_id:user_id,
					user_password:user_password,
				}),
				success:function(data){
					console.log(data.vo);
					if(data.vo ==null){
						alert('비밀번호나 아이디가잘못되었습니다.');
					}else{
						alert('로그인되었습니다.');
						self.location="/main/index";
					}
				}
			});
		});
		
	}); */
</script>
	<div class="modal-header">
    	<!-- <button type="button" class="close" data-dismiss="modal" aria-label="Close" aria-hidden="true">×</button> -->
	</div>
	<div class="modal-body">
    	  <div class="modal-dialog">
				<div class="loginmodal-container">
					<h1>Login</h1><br>
				  <form id ="login" action ="/user/loginPost" method="post">
					<input type="text" name="user_id" id ="user_id" placeholder="User_ID">
					<input type="password" name="user_password" id ="user_password" placeholder="Password">
					<input type="submit" name="login" class="login loginmodal-submit" value="Login">
				  </form>
				  <div class="login-help">
					<a href="#" style="color:red;">Register</a>
					<a href="#" style="color:red;">Forgot Password</a>
				  </div>
				</div>
			</div>
	</div>
	 <div class="modal-footer">				
	</div>