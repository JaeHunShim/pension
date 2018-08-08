<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<style>
.carousel-inner img {
	width: 100%;
	height: 100%;
}

</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/resources/boot/css/bootstrap.min.css">
<script src="/resources/boot/js/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="/resources/boot/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function(){
		$('.dropdown-item').hover(function(){
			$(this).addClass('active');
		},function(){
			$(this).removeClass('active');
		});
	});
</script>
<title>이루펜션</title>
</head>
<body>
<div class="container-fulid">
	<div class="navbar navbar-expand-sm bg-dark navbar-dark">
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#menubar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="menubar">
		<ul class="navbar-nav ml-auto">
			<li class="navbar-item">
				<a class="nav-link" href="#">Home</a>
			</li>
			<li class="navbar-item">
				<a class="nav-link" href="#">Contact Us</a>
			</li>
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle text-primary" data-toggle="dropdown" href="#">Menu</a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="#">Join</a>
					<a class="dropdown-item" href="#">Login</a>
				</div>
			</li>
		</ul>
		</div>
	</div>
	<div class="navbar navbar-expand-sm navbar-dark" style="position:absolute; z-index:10;">
		<a class="navbar-brand" href="#">
			<img class="rounded" src="/resources/img/main/logo.png" alt="iru-logo" style="width:137; height:101;">
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#menubar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="menubar">
		<ul class="navbar-nav ml-auto">
			<li class="navbar-item">
				<a class="nav-link" href="#">Home</a>
			</li>
			<li class="navbar-item">
				<a class="nav-link" href="#">Contact Us</a>
			</li>
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle text-primary" data-toggle="dropdown" href="#">Menu</a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="#">Join</a>
					<a class="dropdown-item" href="#">Login</a>
				</div>
			</li>
		</ul>
		</div>
	</div>
	<div id="main_slide" class="carousel slide" data-ride="carousel" data-pause="hovor">
		<ul class="carousel-indicators">
			<li data-target="#main_slide" data-slide-to="0" class="active">
			<li data-target="#main_slide" data-slide-to="1" >
			<li data-target="#main_slide" data-slide-to="2" >
			<li data-target="#main_slide" data-slide-to="3" >
		</ul>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="/resources/img/main/main_img.jpg">
			</div>
			<div class="carousel-item">
				<img src="/resources/img/main/main_img1.jpg">
			</div>
			<div class="carousel-item">
				<img src="/resources/img/main/main_img2.jpg">
			</div>
			<div class="carousel-item">
				<img src="/resources/img/main/main_img3.jpg">
			</div>
			<div class="carousel-item">
				<img src="/resources/img/main/main_img4.jpg">
			</div>
		</div>
		<a class="carousel-control-prev" href="#main-slide" data-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true" style="width:30px; height:40px;"></span>
		</a>
		<a class="carousel-control-next" href="#main-slide" data-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true" style="width:30px; height:40px;"></span>
		</a>
	</div>
</div>
</body>
</html>