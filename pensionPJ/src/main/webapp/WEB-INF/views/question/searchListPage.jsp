<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script>
	var result='${msg}';
	
	if(result='success'){
		alert('입력이 정사적으로 처리 되었습니다.');
	}
</script>
<section class="sub_con sub02" id="scene1">

<div class="title">
        <h2>community</h2>
        <h3>질문과답변</h3>
        <h4>무창포 이루펜션의 바다의 향기를 느껴보세요. </h4>
        <p class="tit_line"></p>
    </div>
    <div class="sub_txt box"><script language="javascript" src="/resources/js/module/ajax.js"></script>
<script src="/resources/js/module/common2.js"></script>
<script src="/resources/js/module/board.js"></script>
<link rel="stylesheet" href="/resources/css/question/default.css"/>	
<div class="zz_new_list">
<form name="search" method="get" action="/question/searchListPage">
	<input type="hidden" name="page" value="${cri.page}">
	<input type="hidden" name="perPageNum" value="${cri.perPageNum}">
	<input type="hidden" name="searchType" value="${cri.searchType}">
	<input type="hidden" name="keyword" value="${cri.keyword}">
	<div class="zz_new_list_header">
    	<ul class="zz_search_box">
        	<li>
            	<select name="searchType">
                    <option value="n"
                    	<c:out value ="${cri.searchType == null?'selected':''}"/>>---
                    </option>
                    <option value="t"
                    	<c:out value ="${cri.searchType eq 't'?'selected':''}"/>>제목
                    </option>
                    <option value="c"
                    	<c:out value ="${cri.searchType eq 'c'?'selected':''}"/>>내용
                     </option>
                    <option value="w"
                    	<c:out value ="${cri.searchType eq 'w'?'selected':''}"/>>작성자
                    </option>
                    <option value="tc"
                    	<c:out value ="${cri.searchType eq 'tc'?'selected':''}"/>>제목 또는 내용
                     </option>
                    <option value="cw"
                    	<c:out value ="${cri.searchType eq 'cw'?'selected':''}"/>>내용 또는 작성자
                    </option>
                    <option value="tcw"
                    	<c:out value ="${cri.searchType eq 'tcw'?'selected':''}"/>>모든조건
                    </option>
                </select>
            </li>
            <!-- <li><input type="text" name="sword" id="textfield"></li> -->
            <li><input type="text" name="keyword" id="keywordInput" value="${cri.keyword}"></li>
            <li><img src="/resources/img/question/search.gif" onClick="javascript:search.submit();"  style="cursor:pointer"></li>
        </ul>
    </div>
</form>
	<input type="hidden" name= "page" id="page" value="${pageMaker.cri.page}">
	<input type="hidden" name="perPageNum" id="perPageNum" value="${pageMaker.cri.perPageNum}">
    
    <div class="zz_new_list contenter">
    	<table border="0" cellspacing="0" cellpadding="0" width="100%" class="zz_new_d table">
          <tr>
            <th scope="col" width="60">번호</th>
            <th scope="col">제목</th>
            <th scope="col" width="100">답변여부</th>
            <th scope="col" width="100">작성자</th>
            <th scope="col" width="100">작성일</th>
            <th scope="col" width="100">조회수</th>
          </tr>
          <c:forEach items="${list}" var="questionVO">
          <tr>
            <td>${questionVO.qno}</td>
            <!-- uri에 페이지 정보를 유지할수 있도록 함  -->
            <td><a href="/question/passwordCheck${pageMaker.makeSearchQuery(pageMaker.cri.page)}&qno=${questionVO.qno}">							
            ${questionVO.title}</a><font color='red'><img src='/resources/img/question/icon_secret.gif' border='0' align='absmiddle'></font></td>
            <td><p class='flag_but'>대기중</p></td>
            <td>${questionVO.writer}</td>
            <td><fmt:formatDate pattern="yyyy-MM-dd" value="${questionVO.regdate}"/></td>
            <td>${questionVO.viewcnt}</td>
           </tr>
         </c:forEach>
        
    </table>
    </div>
    <div class="zz_new_list bottom">
        <div class="zz_new_list pageing">

				 <table cellpadding="0" cellspacing="0" border="0" align="center">
                <tr>
                    <td>
                    	<c:if test="${pageMaker.prev}">
                    		<a href ="listPage${pageMaker.makeSearchQuery(pageMaker.startPage-1)}"><img src=/resources/img/question/prev.gif class='prev'></a>
                    	</c:if>
                    	<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage }" var="idx">
                     		<ul>
                     			<li 
                     				<c:out value="${pageMaker.cri.page == idx?'class=on':''}"/>>
                     				<a href="listPage${pageMaker.makeSearchQuery(idx)}">${idx}</a>
                     			</li>
                     		</ul>
                     		</c:forEach>
                     		
                     	<c:if test="${pageMaker.next && pageMaker.endPage >0}">
                     		<a href="searchListPage${pageMaker.makeSearchQuery(pageMaker.endPage+1)}"><img src=/resources/img/question/next.gif class='next'></a>
                     	</c:if>	
                     	
              		</td>
                </tr>
            </table>
            
                        
        </div>
        <div class="zz_new_list but"><a href='/question/register' class='write'>글쓰기</a></div>
    </div>
    
</div>
</div>	

</section>
<%@ include file="../include/footer.jsp" %>