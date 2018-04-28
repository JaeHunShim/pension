<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../include/header.jsp" %>
<style>
button{
	width: 100px; 
	height: 102px; 
	background-color: pink"
}
</style>
<script>
$(document).ready(function(){
	
	// 댓글 버튼 클릭시  ajax처리 하고 데이터 분해하는 부분 
	$('[name=commentInsertBtn]').on('click',function(){
		var replyer = $('#replyer').val();
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
			$.each(data,function(key,value){
				 a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
	             a += '<div class="commentInfo'+value.rno+'">'+'댓글번호 : '+value.rno+' / 작성자 : '+value.replyer;
	             a += '<a onclick="commentUpdate('+value.rno+',\''+value.replytext+'\');"> 수정 </a>';
	             a += '<a onclick="commentDelete('+value.rno+');"> 삭제 </a> </div>';
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
	var rno = $('#rno').val();
	console.log(replytext);
	console.log(rno);
	
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
				commentList(rno);
			}
		}
	});
}
</script>
<section class="sub_con sub02" id="scene1">
<div class="title">
        <h2>community</h2>
        <h3>질문과답변</h3>
        <h4>무창포 이루펜션의 바다의 향기를 느껴보세요. </h4>
        <p class="tit_line"></p>
</div>
    <div class="sub_txt box">
		<script src='/resources/js/writeJs/HuskyEZCreator.js' charset='utf-8' type="text/javascript"></script>
<!-- 		<script src='/resources/js/module/common2.js' type="text/javascript"></script>
		<script src='/resources/js/module/board.js' type="text/javascript"></script>
		<script src='/resources/js/module/ajax.js' type="text/javascript"></script> -->
		<link rel='stylesheet' href='/resources/css/question/default.css'/>
		
		<div class="zz_new_view">
    <ul class="date">
    	<!-- 삭제와 수정 처리 완료후 페이지 유지하기 위해서 사용 qno, cri 정보 유지   -->
    	<li><input type="hidden" name="qno" id="qno" value="${questionVO.qno}"></li>
    	<li><input type="hidden" name="page" value="${cri.page}"></li>
    	<li><input type="hidden" name="perPageNum" value="${cri.perPageNum}"></li>
    	<li><input type="hidden" name="searchType" value="${cri.searchType}"></li>
    	<li><input type="hidden" name="keyword" value="${cri.keyword}"></li>
    	
    	<li>작성자:${questionVO.writer}</li>
    	<li><fmt:formatDate pattern="yyyy-MM-dd" value="${questionVO.regdate}"/></li>
        <li>조회수 :${questionVO.viewcnt}</li>
    </ul>
    
	<div class="zz_new_view_header">
        <h3 class="zz_view_title">${questionVO.title}</h3>
        <div class="file">
			<ul>
                <li>비밀글</li>
                <li>y</li>
            </ul>
           	<div class="zz_new_view contenter">
           		<div class='zzbbs_view_content'>${questionVO.content}
           			<p>&nbsp;</p>
           		</div>
           	</div>
        </div>
    </div>
    <!-- 댓글 등록하는 부분  -->
    <form name="commentInsertForm">
		<div class="zz_new_view comment">
			<ul class="com_tt">
				<li>
					<p class="left">성명</p>
					<p class="right">
						<input type='text' id= 'replyer' name='replyer'/>
						<input type="hidden" name="qno" id="qno" value="${questionVO.qno}">
					</p>
				</li>
				<div class="comment_box">
					<textarea name='relytext' id= 'replytext' class="comment_txt" cols="" rows=""></textarea>
						<button type="button" name="commentInsertBtn">댓글입력</button>
				</div>
			</ul>
		</div>
	</form>
	<!-- 댓글 보여지는 부분 -->
	<div class="container">
        <div class="commentList">
        
        </div>
    </div>
				<div class="zz_new_view bottom">
					<ul>
						<li>
							<p class="left">이전글</p>
							<p class="right">
								<a
									href='/HOME/index.php?_zidx=1464662100^1^1464662121&amp;bmode=view&amp;bnum=7&amp;skey=&amp;sword=&amp;page=&amp;set=&amp;viewMode='>질문</a>
							</p>
						</li>
						<li>
							<p class="left">다음글</p>
							<p class="right">다음 데이터가 없습니다</p>
						</li>
					</ul>
				</div>
				<div class="zz_new_view but">
					<a
						href="/question/searchListPage?page=${cri.page}&amp;perPageNum=${cri.perPageNum}&amp;searchType=${cri.searchType}&amp;keyword=${cri.keyword}"
						class="list">리스트</a>
					<ul>
						<li><a
							href="/question/modifyPage?qno=${questionVO.qno}&amp;page=${cri.page}&amp;perPageNum=${cri.perPageNum}&amp;searchType=${cri.searchType}&amp;keyword=${cri.keyword}"
							class='modify'>수정</a></li>
						<li><a
							href="/question/deletePage?qno=${questionVO.qno}&amp;page=${cri.page}&amp;perPageNum=${cri.perPageNum}&amp;searchType=${cri.searchType}&amp;keyword=${cri.keyword}"
							class='delete'>삭제</a></li>
					</ul>
				</div>
		</div>
    </div>	

 <%@ include file="../include/footer.jsp" %>
