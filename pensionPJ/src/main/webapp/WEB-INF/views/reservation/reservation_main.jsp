<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../include/header.jsp" %>
<section class="sub_con sub02" id="scene1">
	<div class="title">
        <h2><b>reservation</b></h2>
        <h3>실시간예약</h3>
        <h4>무창포 J.P펜션의 바다의 향기를 느껴보세요.</h4>
        <p class="tit_line"></p>
    </div>
    <div class="sub_txt box">
			<iframe name='iframe' src="/reservation/calendar" frameBorder="no" width="100%" height="900px"  scrolling="auto">
			</iframe>
    </div>	
</section> 
<%@ include file="../include/footer.jsp" %>
</body>
</html>