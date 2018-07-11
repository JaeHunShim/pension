<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
<script src="/resources/js/basic/jQuery-2.1.4.min.js"></script>
<script src="/resources/js/bootstrap/bootstrap.min.js"></script>
<script>
//입려기한 비밀번호가 맞는지확인 하는 부분 (session에 등록된것과 일치하는지 검사 )
	$(document).ready(function(){
		$('input[type="button"]').on('click',function(){
			var user_id='${login.user_id}';
			var user_password =$('input[name="user_password"]').val();
			$.ajax({
				url:'/user/confirm',
				type:'post',
				headers:{
					'Content-Type':'application/json'
				},
				data:JSON.stringify({
					user_id:user_id,
					user_password:user_password
				}),
				success:function(result){
					console.log(result);
					if(result=='fail'){
						$('font[name="check"]').text('비밀번호가 일치하지 않습니다.');
						return false;
					}else if(result=='success'){
						window.close();
						window.opener.top.location.href="/user/modify";
					}
				}
			});
		});
	});
</script>
<title>비밀번호 확인 </title>
</head>
  <body>
    <div class="container">
      <div class="row">
      
        <div class="col-md-4">
        </div>  
        <div class="col-md-4">
              <div class="page-header">
                  <h2><a href="/">Password-Confirm</a></h2>
                </div>
          <div class="login-box well">   
            <div class="form-group">
                <label for="password">password(비밀번호)</label>
                <input type="password" name="user_password" placeholder="password" class="form-control" />
                <font name='check' size='3' color='red'></font>
            </div>
            <div class="form-group">
                <input type="button" class="btn btn-info btn-login-submit btn-block m-t-md" value="전송" />
            </div>
          </div>
          <div class="col-md-4">
         </div> 
        </div>
      </div>
    </div>
  </body>

</body>
</html>