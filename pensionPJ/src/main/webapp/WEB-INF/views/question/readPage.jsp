<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/reply.jsp" %>
<script>
	var result='${msg}';
	
	if(result='fail'){
		alert('비밀번호가 틀렸습니다.');
		self.location = "/question/passwordCheck?qno="+${qno}
	}
</script>
<script>
//다음글이나 이전글이 비밀글이라면 passwordCheck로 가게끔 처리 
$(document).ready(function(){
	$('p').children('a').on('click',function(event){
		if($(this).attr("id")=='y'){
			$(this).attr('href',"/question/passwordCheck?qno=${list[1].qno}")
		}
		
	});
});
</script>
<section class="sub_con sub02" id="scene1">
<div class="title">
        <h2>community</h2>
        <h3>질문과답변</h3>
        <h4>무창포 이루펜션의 바다의 향기를 느껴보세요. </h4>
        <p class="tit_line"></p>
</div>
    <div class="sub_txt box">
		<script src='/resources/editor/js/HuskyEZCreator.js' charset='utf-8' type="text/javascript"></script>
<!-- 	<script src='/resources/js/module/common2.js' type="text/javascript"></script>
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
    	
    	<li>작성자:${questionVO.user_id}</li>
    	<li><fmt:formatDate pattern="yyyy-MM-dd" value="${questionVO.regdate}"/></li>
        <li>조회수 :${questionVO.viewcnt}</li>
    </ul>
    
	<div class="zz_new_view_header">
        <h3 class="zz_view_title">${questionVO.title}</h3>
        <div class="file">
			<ul>
			<c:choose>
				<c:when test="${questionVO.secret=='y'}">
				<li>비밀글</li>	
				</c:when>
				<c:otherwise>
				<li>공개글</li>
				</c:otherwise>
				</c:choose>
                <li>${questionVO.secret}</li>
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
						<!-- <input type='text' id= 'replyer' name='replyer'/> -->
						<input type="text" name="user_id" value="${login.user_id }" readonly/>
						<input type="hidden" name="qno" id="qno" value="${questionVO.qno}">
					</p>
				</li>
				<div class="comment_box">
					<textarea name='relytext' id= 'replytext' class="comment_txt" cols="" rows=""></textarea>
						<button type="button" name="commentInsertBtn" style="width: 100px; height: 102px;background-color: pink">댓글입력</button>
				</div>
			</ul>
		</div>
	</form>
	<div class="container">
        <div class="commentList">
        
        </div>
    </div>
    			<!-- 이전글과 이후글에 대한 처리부분  -->
				<div class="zz_new_view bottom">
					<ul>
						<c:choose>
							<c:when test="${fn:length(list)==2 and questionVO.qno == list[0].qno }">
								<li>
									<p class="left">이전글</p><p class="right">이전글이 없습니다.</p>
								</li>
								<li>
									<p class="left">다음글</p>
									<p class="right">
									<a id='${list[1].secret}' href="/question/readPage?qno=${list[1].qno}">${list[1].title}</a></p>
								</li>	
							</c:when>
							<c:when test="${fn:length(list) == 2 and questionVO.qno < list[0].qno }">
								<li>
									<p class="left">이전글</p>
									<p class="right">
									<a id='${list[1].secret}' href="/question/readPage?qno=${list[0].qno}">${list[0].title}</a></p>
								</li>
								<li>
									<p class="left">다음글</p><p class="right">다음글이 없습니다.</p>
								</li>	
							</c:when>
							<c:when test="${fn:length(list) == 3 and questionVO.qno < list[0].qno }">
								<li>
									<p class="left">이전글</p>
									<p class="right">
									<a id='${list[1].secret}' href="/question/readPage?qno=${list[0].qno}">${list[0].title}</a></p>
								</li>
								<li>
									<p class="left">다음글</p>
									<p class="right">
									<a  id='${list[1].secret}' href="/question/readPage?qno=${list[2].qno}">${list[2].title}</a></p>
								</li>	
							</c:when>
						</c:choose>
					</ul>
				</div>
				<!--  댓글에 대한 처리 부분  -->
				
				<div class="zz_new_view but">
					<a href="/question/searchListPage?page=${cri.page}&amp;perPageNum=${cri.perPageNum}&amp;searchType=${cri.searchType}&amp;keyword=${cri.keyword}"
						class="list">리스트</a>
				<!-- session 정보가 없을시 댓글달수 없게 함 -->
				<c:choose>
					<c:when test="${not empty login.user_id }">
					<ul>
						<li><a
							href="/question/modifyPage?qno=${questionVO.qno}&amp;page=${cri.page}&amp;perPageNum=${cri.perPageNum}&amp;searchType=${cri.searchType}&amp;keyword=${cri.keyword}"
							class='modify'>수정</a></li>
						<li><a
							href="/question/deletePage?qno=${questionVO.qno}&amp;page=${cri.page}&amp;perPageNum=${cri.perPageNum}&amp;searchType=${cri.searchType}&amp;keyword=${cri.keyword}"
							class='delete'>삭제</a></li>
					</ul>
					</c:when>
				</c:choose>
				</div>
		</div>
    </div>	
</section>
 <%@ include file="../include/footer.jsp" %>
