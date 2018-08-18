<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>	
<meta name="naver-site-verification" content="4be275fbcf12fb470711cb98c210da2e3861002e" />
<meta name="description" content="충남 보령 무창포펜션, 무창포 해수욕장, 가족펜션, 객실개별바베큐, 수영장">
<meta name="keywords" content="충남 보령 무창포펜션, 무창포 해수욕장, 가족펜션, 객실개별바베큐, 수영장">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>메인 화면</title>
<link rel="stylesheet" type="text/css" href="/resources/css/reservation/sub_layout.css">
<link rel="stylesheet" type="text/css" href="/resources/css/top/layout.css" />
<!-- <link rel="stylesheet" type="text/css" href="/resources/css/bootstrap/bootstrap.min.css" /> -->
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/resources/css/bootstrap/font-awesome.min.css"/>
<!-- <link rel="stylesheet" type="text/css" href="/resources/css/bootstrap/style.css"/> -->
<!--<![endif]-->
<script src="/resources/js/basic/jQuery-2.1.4.min.js"></script>
<script src="/resources/js/basic/gnb1.js"></script>
<script src="/resources/js/reservation/jquery.scrollmagic.min.js"></script>
<script src="/resources/js/reservation/sub.txt.js"></script>
<!-- 메인 이미지 롤링 -->
<script src="/resources/js/rolling/common.js"></script>
<script src="/resources/js/rolling/jquery.slides.min.js"></script>
<script src="/resources/js/rolling/TweenMax.min.js"></script>
<script src="/resources/js/rolling/main.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<!-- bootstrap -->
<!--<script src="/resources/js/bootstrap/bootstrap.min.js"></script>-->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="/resources/js/bootstrap/npm.js"></script>
</head>
<body>
	<div class="header">
	<div class="top_box">
        <ul>
        	<!-- Join Start-->
        <c:set var="user_id" value="${login.user_id}"/>
        	<c:choose>
        		<c:when test="${empty user_id}">
        		<li>
					<a data-toggle="modal" href="/user/join" data-target="#joinForm" role="button" data-backdrop="static">
						<span class="btn btn-xs btn-success">Join</span>
					</a>
 					    <div id="joinForm" class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-sm" style="width:1200px;height:700px">

        					<div class="modal-content">
        					<!-- modal내용 들어오는 부분 -->
        					</div>
    					</div>
					</div>
				</li>
			<!-- Join End -->
			<!-- Login Start -->
        		<li>
        			<a href="/user/login" data-toggle="modal" data-target="#login-modal">
 						<span class="btn btn-xs btn-success">login</span>
					</a>
 					<div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    					<div class="modal-dialog">
        					<div class="modal-content">
        					<!-- modal내용 들어오는 부분 -->
        					</div>
    					</div>
					</div>
				</li>
        		</c:when>
        		<c:when test="${user_id eq 'admin'}">
        		<li>
					<a href="/reservation/managementPaging" data-toggle="modal">
 						<span class="btn btn-xs btn-success">예약현황 보기</span>
					</a>
				</li>
				<li>
        			<a href="/user/logout"><span class="btn btn-xs btn-success">sign out</span></a>
        		</li>
        		<li>
        			<span style="color:pink" id="user_id">${login.user_id}</span>
        		</li>
				</c:when>
				<c:when test="${!empty user_id}">
				<li>
        			<a href="/user/logout"><span class="btn btn-xs btn-success">sign out</span></a>
        		</li>
        		<li>
      				<a href="/user/info?user_id=${login.user_id}"><span style="color:pink" id="user_id">${login.user_id}</span></a>
        		</li>
        		</c:when>	
			</c:choose>	

			<!-- Login Out -->
            <li><a href="/main/directions">contact us</a></li>
            <li><a href="/main/index">HOME</a></li>
        </ul>
    </div>
    <div class="modal fade">
  		<div class="modal-dialog">
    		<div class="modal-content">

    		</div>
		</div>
	</div>
	<div class="Web navi">
        <div class="navi_box">
            <h1><a href="/main/index"><img src="/resources/img/main/logo.png" alt="이루펜션" /></a></h1>  
                <div class="nav">
                    <div class="gnb">
                        <div class="gnb_wrap">
                                <ul class="depth1">
                                    <li class="gnb_1"><a href="/main/index">이루펜션</a>
                                    <div class="sub_menu">
                                        <ul class="depth2">
                                            <li class="first"><a href="/main/intro">인사말</a></li>
                                            <li><a href="/main/directions">오시는 길</a></li>
                                        </ul>
                                    </div>
                                </li>
                                <li class="gnb_2"><a href="/sub2/sub1.htm">객실안내</a>
                                    <div class="sub_menu">
                                        <ul class="depth2">
                                            <li class="first"><a href="/room/daisy">데이지</a></li>
                                            <li><a href="/room/lily">릴리</a></li>
                                            <li><a href="/room/ivy">아이비</a></li>
                                            <li><a href="/room/margaret">마가렛</a></li>
                                        </ul>
                                    </div>
                                </li>                                                                
                                <li class="gnb_3"><a href="/reservation/reservation_guide">예약안내</a>
                                    <div class="sub_menu">
                                        <ul class="depth2">
                                            <li class="first"><a href="/reservation/reservation_guide">예약종합안내</a></li>
                                            <li><a href="/reservation/reservation_main">실시간예약</a></li>
                                        </ul>
                                    </div>
                                </li>
                                
                                <li class="gnb_4"><a href="/main/tourist">주변관광지</a>
                                    <div class="sub_menu">
                                        <ul class="depth2">
                                            <li class="first"><a href="/main/tourist">대천해수욕장</a></li>
                                            <li><a href="/main/tourist">무창포해수욕장</a></li>
                                            <li><a href="/main/tourist">어촌체험마을</a></li>
                                            <li><a href="/main/tourist">무창포타워</a></li>
                                            <li><a href="/main/tourist">신비의 바닷길 축제</a></li>
                                            <li><a href="/main/tourist">대하, 전어 축제</a></li>
                                        </ul>
                                    </div> 
                                </li>                                                                
                                <li class="gnb_5"><a href="/question/searchListpage">커뮤니티</a>
                                    <div class="sub_menu">
                                        <ul class="depth2">
                                            <li class="first"><a href="/notice/searchList">공지사항</a></li>
                                            <li><a href="/question/searchListPage">질문과답변</a></li>
                                            <li><a href="#">포토갤러리</a></li>
                                        </ul>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
        </div>
    </div>
</div>
<div class="main_vi">
<div id="wrap" class="main">		
		<div class="cts" id="main_cts">
			<div id="slides">
				<div class="data-1">
                        <div class="opa water01"></div>
                        <div class="opa water0102"></div>
                        <div class="opa water02">신비의 바닷길과 추억을 무창포 이루펜션에서 만나보실 수 있습니다. <br />고품격의 여유로움속으로 당신을 초대합니다.</div>
                        <div class="opa water03"><a href="/reservation/reservation_main">실시간예약</a></div>
                    <div class="opa prd"></div>
				</div>
                <div class="data-2">
                        <div class="opa water01"></div>
                        <div class="opa water0102"></div>
                        <div class="opa water02">신비의 바닷길과 추억을 무창포 이루펜션에서 만나보실 수 있습니다. <br />고품격의 여유로움속으로 당신을 초대합니다.</div>
                        <div class="opa water03"><a href="/reservation/reservation_main">실시간예약</a></div>
                    <div class="opa prd"></div>
				</div>
                <div class="data-3">
                        <div class="opa water01"></div>
                        <div class="opa water0102"></div>
                        <div class="opa water02">신비의 바닷길과 추억을 무창포 이루펜션에서 만나보실 수 있습니다. <br />고품격의 여유로움속으로 당신을 초대합니다.</div>
                        <div class="opa water03"><a href="/reservation/reservation_main">실시간예약</a></div>
                    <div class="opa prd"></div>
				</div>
                <div class="data-4">
                        <div class="opa water01"></div>
                        <div class="opa water0102"></div>
                        <div class="opa water02">신비의 바닷길과 추억을 무창포 이루펜션에서 만나보실 수 있습니다. <br />고품격의 여유로움속으로 당신을 초대합니다.</div>
                        <div class="opa water03"><a href="/reservation/reservation_main">실시간예약</a></div>
                    <div class="opa prd"></div>
				</div>
                <div class="data-5">
                        <div class="opa water01"></div>
                        <div class="opa water0102"></div>
                        <div class="opa water02">신비의 바닷길과 추억을 무창포 이루펜션에서 만나보실 수 있습니다. <br />고품격의 여유로움속으로 당신을 초대합니다.</div>
                        <div class="opa water03"><a href="/reservation/reservation_main">실시간예약</a></div>
                    <div class="opa prd"></div>
				</div>
			</div>
		</div>
	</div>
</div>