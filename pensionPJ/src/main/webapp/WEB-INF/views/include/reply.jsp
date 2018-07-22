<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<script>
$(document).ready(function(){
	
	// 댓글 버튼 클릭시  ajax처리 하고 데이터 분해하는 부분 
	$('[name=commentInsertBtn]').on('click',function(){
		//var replyer = $('#replyer').val();
		var replyer=$('#replyer').val();
		var replytext= $('#replytext').val();
		var qno =$('#qno').val();
		commentInsert(replyer,replytext,qno);
		
	});
	// 댓글 리스트 불러오기 (밑에 함수처리했음)
	commentList();
});
// 댓글입력 처리
function commentInsert(replyer,replytext,qno){
	$.ajax({
		url:"/reply/",
		type:'post',
		headers:{
			'Content-Type':'application/json'
		},
		data:JSON.stringify({
			qno:qno,
			replyer:replyer,
			replytext:replytext
		}),
		success:function(result){
			if(result=='success'){
				alert('댓글 등록 되었습니다.');
				commentList();
				$('[name=content]').val();
			}
		}	
	});
}
//댓글 리스트
function commentList(){
	var qno= ${questionVO.qno}
	$.ajax({
		url:"/reply/all/"+qno,
		type:"get",
		data:{qno:qno},
		success:function(data){
			var a="";
			var user_id ='${login.user_id}';
			$.each(data,function(key,value){
				
				 a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
	             a += '<div class="commentInfo'+value.rno+'">'+'댓글번호 : '+value.rno+' / 작성자 : '+value.replyer;
	             //로그인 한사람과 글작성한 사람만 수정 삭제 버튼 나오게 수정
	             if(user_id == value.replyer){
	            	 a+= '<a onclick="commentUpdate('+value.rno+',\''+value.replytext+'\');"> 수정 </a>';
		             a+= '<a onclick="commentDelete('+value.rno+');"> 삭제 </a> </div>';	 
	             }
	             a += '<div class="commentContent'+value.rno+'"> <p> 내용 : '+value.replytext +'</p>';
	             a += '</div></div>';
			});
			$(".commentList").html(a);
			
		}
	});		
}
// 댓글 수정 페이지 불러오는 부분 
function commentUpdate(rno,replytext){
	var a="";
	a += '<div class="input-group">';
	a += '<input type="hidden" name = "rno" id= "rno" value="'+rno+'">'
	a += '<input type="text" class="form-control" name="content_'+rno+'" value="'+replytext+'"/>';
	a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdateProc('+rno+');">수정</button> </span>';
	a += '</div>';	    
	  $('.commentContent'+rno).html(a);

}
// 댓글 수정처리하는 부분
function commentUpdateProc(rno){
	
	var replytext = $('[name=content_'+rno+']').val()
	console.log(replytext);
	
	$.ajax({
		url:'/reply/'+rno,
		type:'put',
		headers:{
			'Content-Type':'application/json'
		},
		data:JSON.stringify({replytext:replytext}),
		dataType:'text',
		success:function(result){
			if(result='sucess'){
				alert('수정되었습니다.');
				commentList(qno);
			}
		}
	});
}
//댓글 삭제 하는 부분 
function commentDelete(rno){
	$.ajax({
		url:'/reply/'+rno,
		type:'delete',
		headers:{
			'Content-Type':'application/json'
		},
		dataType:'text',
		success:function(reulst){
			if(result='success'){
				alert('삭제되었습니다.');
				commentList(qno);
			}
		}
		
	});
}
</script>