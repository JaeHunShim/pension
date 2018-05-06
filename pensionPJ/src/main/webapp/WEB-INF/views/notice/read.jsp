<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../include/header.jsp" %>
<section class="sub_con sub02" id="scene1">
	<div class="title">
        <h2>community</h2>
        <h3>공지사항</h3>
        <h4>무창포 이루펜션의 바다의 향기를 느껴보세요. </h4>
        <p class="tit_line"></p>
	</div>
    <div class="sub_txt box">
		<script src='/resources/editor/js/HuskyEZCreator.js' charset='utf-8' type="text/javascript"></script>
 		<script src='/resources/js/module/common2.js' type="text/javascript"></script>
		<link rel='stylesheet' href='/resources/css/question/default.css'/>
		
		<div class="zz_new_view">
    		<ul class="date">
    			<li>작성자:${noticeVO.writer}</li>
    			<li><fmt:formatDate pattern="yyyy-MM-dd" value="${noticeVO.regdate}"/></li>
        		<li>조회수:${noticeVO.viewcnt}</li>
    		</ul>
			<div class="zz_new_view_header">
       			 <h3 class="zz_view_title">${noticeVO.title}</h3>
        		<div class="file">
					<ul>
                		<li>비밀글</li>
                		<li>y</li>
            		</ul>
           			<div class="zz_new_view contenter">
           				<div class='zzbbs_view_content'>${noticeVO.content}<p>&nbsp;</p></div>
           			</div>
				</div>
    		</div>
			<div class="container">
        		<div class="commentList"></div>
    		</div>
    		<!-- 이전글과 이후글에 대한 처리부분  -->
<%-- 			<div class="zz_new_view bottom">
				<ul>
				<c:choose>
					<c:when test="${fn:length(list)==2 and questionVO.qno == list[0].qno }">
					<li>
						<p class="left">이전글</p><p class="right">이전글이 없습니다.</p>
					</li>
					<li>
						<p class="left">다음글</p>
						<p class="right">
						<a href="/question/readPage?qno=${list[1].qno}&password=1">${list[1].title}</a></p>
					</li>	
					</c:when>
					<c:when test="${fn:length(list) == 2 and questionVO.qno < list[0].qno }">
					<li>
						<p class="left">이전글</p>
						<p class="right">
						<a href="/question/readPage?qno=${list[0].qno}&password=1">${list[0].title}</a></p>
					</li>
					<li>
						<p class="left">다음글</p><p class="right">다음글이 없습니다.</p>
					</li>	
					</c:when>
					<c:when test="${fn:length(list) == 3 and questionVO.qno < list[0].qno }">
					<li>
						<p class="left">이전글</p>
						<p class="right">
						<a href="/question/readPage?qno=${list[0].qno}&password=1">${list[0].title}</a></p>
					</li>
					<li>
						<p class="left">다음글</p>
						<p class="right">
						<a href="/question/readPage?qno=${list[2].qno}&password=1">${list[2].title}</a></p>
					</li>	
					</c:when>
				</c:choose>
				</ul>
			</div> --%>
		</div>
    </div>
    <div class="zz_new_view but">
		<a href="/notice/list" class="list">리스트</a>
			<ul>
				<li><a href="/notice/modify?bno=${noticeVO.bno}" class='modify'>수정</a></li>
				<li><a href="/notice/delete?bno=${noticeVO.bno}" class='delete'>삭제</a></li>
			</ul>
	</div>	
</section>
 <%@ include file="../include/footer.jsp" %>
