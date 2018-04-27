<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../include/header.jsp" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js" type="text/javascript"></script>
<!-- 댓글 입력처리 ajax -->
<script>
	$(document).ready(function(){
		$("#replyAddBtn").on('click',function(){
			var qno =$('#qno').val();
			var replyerObj = $("#newReplyWriter");
			var replytextObj = $("#newReplyText");
			var replyer = replyerObj.val();
			var replytext =replytextObj.val();
			
			console.log("게시판번호: " + qno);
			console.log("작성자: " + replyer);
			console.log("작성 글: " + replytext);
			// $.post가 아니라  $.ajax로 보낸이유는 컨트롤러에서 @RequestBody 데이터를 받는데  $post로 하면 제대로 처리가 되질 못하기 때문이다. 
			$.ajax({
				type:'post',
				url:'/reply/',
				headers:{
					"Content-Type":"application/json",
			
				},
				dataType:'text',
				data:JSON.stringify({
					qno:qno,
					replyer:replyer,
					replytext:replytext
				}),
				success:function(result){
					console.log("result:" + result);
					if(result=='success'){
						alert('댓글이 등록되었습니다.');
						replyPage=1;
						getPage("/reply/"+qno+"/"+replyPage);
						replyerObj.val("");
						replytextObj.val("");
					}
				}
			});
		});
		Handlebars.registerHelper("prettifyDate", function(timeValue) {
			var dateObj = new Date(timeValue);
			var year = dateObj.getFullYear();
			var month = dateObj.getMonth() + 1;
			var date = dateObj.getDate();
			return year + "/" + month + "/" + date;
		});

		var printData = function(replyArr, target, templateObject) {
			var template = Handlebars.compile(templateObject.html());
			var html = template(replyArr);
			$(".replyLi").remove();
			target.after(html);

		}

		var qno = ${questionVO.qno};
		var replyPage = 1;
		//페이징 처리 (게시물 목록 #modifyModal 부분을 클릭하면 댓글이 보이게 처리 )
		function getPage(pageInfo) {
			$.getJSON(pageInfo, function(data) {
				printData(data.list, $("#repliesDiv"), $('#template'));
				printPaging(data.pageMaker, $(".pagination"));

				$("#modifyModal").modal('hide');
				//댓글이 보여지는것은 board에서 가지고 오지만 댓글을 삭제 했을때는 ajax를 통한 처리를 했기때문에 totalCount에 대한 정보를 가지고 와야한다
				/* $("#replycntStrong").html("["+data.pageMaker.totalCount+"]"); */

			});
		}
		// 페이징처리 (하단 버튼 부분처리)
		var printPaging = function(pageMaker, target) {

			var str = "";
			if (pageMaker.prev) {
				str += "<li><a href='" + (pageMaker.startPage - 1)
						+ "'> << </a></li>";
			}
			for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
				var strClass = pageMaker.cri.page == i ? 'class=active' : '';
				str += "<li "+strClass+"><a href='"+i+"'>" + i + "</a></li>";
			}

			if (pageMaker.next) {
				str += "<li><a href='" + (pageMaker.endPage + 1)
						+ "'> >> </a></li>";
			}
			target.html(str);
		};
		//페이징 처리 글 번호에 맞는 댓글 가지고 오는 부분 
		$("#repliesDiv").on("click", function() {

		if ($(".timeline li").size() > 1) {
			return;
		}
		getPage("/reply/" + qno + "/1");

		});

		//페이징 처리(하단부)
		$(".pagination").on("click", "li a", function(event){

		event.preventDefault();

		replyPage = $(this).attr("href");	

		getPage("/reply/"+qno+"/"+replyPage);

		});
	});
</script>
<!-- handlebars 를 이용해서 날짜 포맷하는 부분  -->
<script>

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
	<!-- 댓글 들어오는 부분 -->
	<ul	class="timeline">
			<li class="time-label" id="repliesDiv"><span class="bg-green">댓글 목록
			<!-- 댓글 갯수 가지고 오는 부분 -->
			<strong id="replycntStrong">[${replyVO.replycnt}]</strong></span></li>
	</ul>
		<!-- 댓글 하단부분(버튼)-->
		<div class="text-center">
			<ul id="pagination" class="pagination pagination-sm no-margin">
			
			</ul>
		</div>
	<div class="zz_new_view comment">
					<!--  댓글 작성 부분 -->
					<ul class="com_tt">
						<li>
							<p class="left">성명</p>
							<p class="right">
								<input type='text' id='newReplyWriter' />
							</p>
						</li>
						<div class="comment_box">
							<textarea id='newReplyText' class="comment_txt"
								cols="" rows=""></textarea>
							<button type="submit" id="replyAddBtn"
								style="width: 100px; height: 102px; background-color: pink">댓글
								입력</button>
						</div>
					</ul>
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
			</ul>
		</div>
 

    </div>	

</section>   
<script id="template" type="text/x-handlebars-template">
{{#each .}}
<li class="replyLi" data-rno={{rno}}>
<i class="fa fa-comments bg-blue"></i>
 <div class="timeline-item" >
  <span class="time">
    <i class="fa fa-clock-o"></i>{{prettifyDate regdate}}</span>
  <h3 class="timeline-header"><strong>{{rno}}</strong> -{{replyer}}</h3>
  <div class="timeline-body">{{replytext}} </div>
    <div class="timeline-footer">
		
     	<a class="btn btn-primary btn-xs" 
	    	data-toggle="modal" data-target="#modifyModal">Modify</a>

    </div>
  </div>			
</li>
{{/each}}

</script>	
 <%@ include file="../include/footer.jsp" %>
