<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../include/header.jsp" %>

<section class="sub_con sub02" id="scene1">
<div class="title">
        <h2>community</h2>
        <h3>질문과답변</h3>
        <h4>무창포 이루펜션의 바다의 향기를 느껴보세요. </h4>
        <p class="tit_line"></p>
</div>
    <div class="sub_txt box">
		<script src='/resources/js/writeJs/HuskyEZCreator.js' charset='utf-8'></script>
		<script src='/resources/js/module/common2.js'></script>
		<script src='/resources/js/module/board.js'></script>
		<script src='/resources/js/module/ajax.js'></script>
		<link rel='stylesheet' href='/resources/css/question/default.css'/>
		<div class="zz_new_view">
    <ul class="date">
    	<li><input type="hidden" name="qno" value="${questionVO.qno}"></li>
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



    <div class="zz_new_view comment">
    	<div class="comment con">
            <div class="comment_but">
						        </div>
				<div id="writeFrm" style="display:none">
				<form method="post" name="_commentModF" id="_commentModF" >
					<input type='hidden' name='ref_board' id='ref_board' value="bbs2">					<input type='hidden' name='ref_no' id='ref_no' value="8">					<input type='hidden' name='wMode' id='wMode' value="9">					<input type='hidden' name='accessFlag' id='accessFlag' value="login">					<input type='hidden' name='act' id='act' value="/zzAppModule/process/board_comment_ok.php">					<input type='hidden' name='pmode' id='pmode' value="">					<input type='hidden' name='pno' id='pno' value="">
							<div class="Cmodify_box" >
								<input type="hidden" name="name" id="name" value="">
								<p class="right"></p><p class="left"><input type='password' name='pwd' id='pwd' value=""/></p><p class="left">비밀번호</p>
								<div class="comment_box">
										<textarea name='com_content' id='com_content' class="comment_txt"></textarea>
										<a href="javascript:chkBoardCommentForm(this._commentModF)" class="comment_ok" id="Cmodify_ok">댓글입력</a>
								</div>
							</div>

				</form>
					</div>
				<div id="deleteFrm" style="display:none">
				<form method="post" name="_commentDelF" id="_commentDelF" >
					<input type='hidden' name='ref_board' id='ref_board' value="bbs2">	
					<input type='hidden' name='ref_no' id='ref_no' value="8">				
					<input type='hidden' name='wMode' id='wMode' value="9">					
					<input type='hidden' name='accessFlag' id='accessFlag' value="login">					
					<input type='hidden' name='act' id='act' value="/zzAppModule/process/board_comment_ok.php">					
					<input type='hidden' name='pmode' id='pmode' value="">					
					<input type='hidden' name='pno' id='pno' value="">				
					<div class="Cdelete_box">
						<p class="right"><a href="javascript:chkBoardCommentForm(this._commentDelF);" class="Cdelete_ok">확인</a></p>
						<p class="left"><input type='password' name='pwd' id='pwd' /></p><p class="left">비밀번호</p>
					</div>
				</form>
				</div>
		</div>
    	<ul class="com_tt">
		<form method="post" name="_commentF">
			<input type='hidden' name='ref_board' id='ref_board' value="bbs2">			
			<input type='hidden' name='ref_no' id='ref_no' value="8">			
			<input type='hidden' name='wMode' id='wMode' value="9">			
			<input type='hidden' name='pmode' id='pmode' value="">			
			<input type='hidden' name='accessFlag' id='accessFlag' value="login">			
			<input type='hidden' name='act' id='act' value="/zzAppModule/process/board_comment_ok.php">			
        	<li>
        		<p class="left">성명</p>
        		<p class="right">
        			<input type='text' name='name' id='name' value=""/>
        		</p>
        	</li>
			<li><p class="left"></p>
				<p class="right">
					<input type='hidden' name='pwd' id='pwd' value="1523788929"/>
				</p>
			</li>

		
        <div class="comment_box">
        	<textarea name='com_content' id='com_content' class="comment_txt"></textarea>
            <a href="javascript:chkBoardCommentForm(this._commentF);" class="comment_ok">댓글입력</a>
						
        </div>
        </form>
        </ul> 
    </div>

   
    
    
    <div class="zz_new_view bottom">
    	<ul>
        	<li>
            	<p class="left">이전글</p><p class="right"><a href='/HOME/index.php?_zidx=1464662100^1^1464662121&bmode=view&bnum=7&skey=&sword=&page=&set=&viewMode='>질문</a></p>
            </li>
            <li>
            	<p class="left">다음글</p><p class="right">다음 데이터가 없습니다</p>
            </li>
        </ul>
    </div>
    <div class="zz_new_view but">
    	<a href="/question/listAll" class="list">리스트</a>
        <ul>
        	<li>
        		<a href="/question/modify?qno=${questionVO.qno}" class='modify'>수정</a>
        	</li>
        	<li>
        		<a href="/question/delete?qno=${questionVO.qno}" class='delete'>삭제</a>
        	</li>
       </ul>
    </div>
</div>
 

    </div>	

</section>    

 <%@ include file="../include/footer.jsp" %>