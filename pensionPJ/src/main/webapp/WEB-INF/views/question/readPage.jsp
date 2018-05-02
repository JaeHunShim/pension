<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/reply.jsp" %>
<section class="sub_con sub02" id="scene1">
<div class="title">
        <h2>community</h2>
        <h3>질문과답변</h3>
        <h4>무창포 이루펜션의 바다의 향기를 느껴보세요. </h4>
        <p class="tit_line"></p>
</div>
    <div class="sub_txt box">
		<script src='/resources/editor/js/HuskyEZCreator.js' charset='utf-8' type="text/javascript"></script>
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
						<button type="button" name="commentInsertBtn" style="width: 100px; height: 102px;background-color: pink">댓글입력</button>
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
</section>
 <%@ include file="../include/footer.jsp" %>
