<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

 <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close" aria-hidden="true">×</button>
    <h3 class="smaller lighter blue no-margin modal-title">회원 가입</h3>
</div>
<div class="modal-body">
	<article class="container">
        <div class="page-header">
          <h1>회원가입 <small>basic form</small></h1>
         </div>
        <div class="col-md-6 col-md-offset-3">
          <form role="form" method="post" action="/user/join">
            <div class="form-group">
              <label for="InputEmail">회원 아이디</label>
              <input type="text" class="form-control" name="uid" placeholder="아이디를 입력해주세요">
            </div>
            <div class="form-group">
              <label for="InputPassword1">비밀번호</label>
              <input type="password" class="form-control" name="upw" id= "upw" placeholder="비밀번호 입력해주세요">
            </div>
            <div class="form-group">
              <label for="InputPassword2">비밀번호 확인</label>
              <input type="password" class="form-control" id="upw2" placeholder="비밀번호 확인">
              <font name='check' size='3' color='red'></font>
            </div>
            <div class="form-group">
              <label for="username">이름</label>
              <input type="text" class="form-control" name="uname" placeholder="이름을 입력해 주세요">
            </div>
            <div class="form-group">
              <label for="InputEmail">E-Mail</label>
              <input type="email" class="form-control" name="email" placeholder="이메일을 입력해주세요">
            </div>
           
          </form>
		</div>
       </article>
 </div>
 <div class="modal-footer">
  <div class="form-group text-center">
              <button type="submit" class="btn btn-info">회원가입<i class="fa fa-check spaceLeft"></i></button>
              <button type="submit" class="btn btn-warning">가입취소<i class="fa fa-times spaceLeft"></i></button>
            </div>
</div>