<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<section class="sub_con sub02" id="scene1">

<div class="title">
        <h2>community</h2>
        <h3>질문과답변</h3>
        <h4>무창포 이루펜션의 바다의 향기를 느껴보세요. </h4>
        <p class="tit_line"></p>
    </div>
    <div class="sub_txt box">
		<script src='/resources/smartEditor/js/HuskyEZCreator.js' charset='utf-8'></script>
		<!-- <script src='/resources/js/module/common2.js'></script>
		<script src='/resources/js/module/board.js'></script>
		<script src='/resources/js/module/ajax.js'></script> -->
		<link rel='stylesheet' href='/resources/css/question/default.css'/>
		
	<form method='post' name='writeF'id="writeF" action="/question/modifyPage">
		<style type="text/css">
			.zz_new_write{margin:0 auto; position:relative; padding-bottom:90px; width:100%}
		</style>
<div class="zz_new_write">  
    <div class="zz_new_write contenter">
    	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="zz_write_table">
			
		<tr>
            <th scope="row">제목</th>
            <td><input type='text' name="title" value="${questionVO.title}" style='width:300px'></td>
         </tr>
		  <tr>
            <th scope="row">비밀글</th>
            <td><input type='radio' name='privacy' id='privacy' value='y'  in_lng='1' in_ttl='비밀글'  in_mode='y' in_type='02' class='iptborder'  style='border:0'> y<input type='radio' name='privacy' id='privacy' value='n' checked in_lng='2' in_ttl='비밀글'  in_mode='y' in_type='02' class='iptborder'  style='border:0'> n</td>
          </tr>
									 <tr>
            <th scope="row">성명</th>
            <td><input type='text' name="writer" value="${questionVO.writer}" readonly ></td>
          </tr>
									 <tr>
            <th scope="row">비밀번호</th>
            <td><input type='password' name="password" value="${questionVO.password}"></td>
          </tr>
				          <tr>
            <th scope="row">내용</th>
            <td>
		<textarea name='content' id='content' style='width:800px;; height:470px;;dispaly:none;'>${questionVO.content}</textarea>
		<script type='text/javascript'>
			if(oEditors == undefined){
				var oEditors = [];
			}	
			nhn.husky.EZCreator.createInIFrame({
			oAppRef: oEditors,
			elPlaceHolder: 'content',
			sSkinURI: '/question/SmartEditor2Skin',
			htParams : {bUseToolbar : true,
				fOnBeforeUnload : function(){}
			}, 
			fCreator: 'createSEditor2'
		});
		</script>
		<script>
			$(document).ready(function(){
				$("#insertBoard").click(function(){
		            //id가 smarteditor인 textarea에 에디터에서 대입
		            oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
		            //폼 submit
		            $("#writeF").submit();
		        });
			});
		</script>
		</td>
          </tr>
                  <tr>
            <th scope="row">첨부파일</th>
            <td><input type='file' name='upfile1' id='upfile1' class='iptboarder'>            <br /><p class="stxt">* 파일크기는 2MB 이하, JPG, PNG 또는 GIF 형식의 파일만 가능합니다.</p>
            </td>
          </tr>
				        </table>
    </div>
    <div class="zz_new_write but">
		
    	<button type="submit" id="insertBoard" class="ok">확인</button> 
    	<a href="/question/listPage?page=${cri.page}&perPageNum=${cri.perPageNum}" class="list">리스트</a>
    </div>
</div>

</form>
 

    </div>	

</section>    
<%@ include file="../include/footer.jsp" %>