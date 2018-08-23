<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="/resources/js/basic/jQuery-2.1.4.min.js"></script>
<script>
$(document).ready(function(){
	
	$('h1').on('click',function(event){
		var user_id = '${login.user_id}';
		if(user_id == ""){
			event.preventDefault();
			alert('로그인 해야 이용할수 있습니다.');
			opener.document.location.href="/user/login";
			window.close();
		
		}
	});
	
});

</script>
<title>광고 넣을 팝업창 입니다.</title>
</head>
<body>
	<h1 style="color:red"><a href="/socket">관리자1:1문의</a></h1>
</body>
</html>