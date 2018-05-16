<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/css/reservation/style.css" />
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
var g4_bbs_skin_path = "";
</script>
<form id="write" name="fwrite" method="post" action="<?php echo $g4['bbs_path']; ?>/write_update.php" enctype="multipart/form-data" onsubmit="return checkWrite(this);" style="width: <?php echo $width; ?>;">
	<p>
		<input type="hidden" name="w" value="<?php echo $w; ?>" />
		<input type="hidden" name="bo_table" value="<?php echo $bo_table; ?>" />
	</p>
	<p><img src="/resources/img/reservation//t_title02.gif" alt="이용안내" /></p>
	<p class="explain">
		1. 인터넷예약이 가능한 기간은 <span><?php echo $date['min']; ?>부터 <?php echo $date['max']; ?>까지</span>이며, 그 외의 기간은 전화로 문의해주세요.<br />
		2. 1회 예약시 숙박이 가능한 기간은 <span>최대 <?php echo $board['bo_5']; ?>박 <?php echo $board['bo_5'] + 1; ?>일</span>이며, 그 이상의 기간은 전화로 문의해주세요.<br />
		3. 선택한 숙박일자에 이용할 수 없는 객실은 선택할 수 없거나 숙박기간이 조정되어 보여질 수 있습니다.<br />
		4. 예약신청이 완료된 후 <span><?php echo $board['bo_6']; ?>일 이내에 입금</span>이 확인되지 않으면 별도의 확인절차없이 예약은 취소됩니다.<br />
		5. 무통장입금 계좌번호안내 : <?php echo $board['bo_10']; ?>
	</p>
	<p class="space"></p>
	<p class="float"><img src="/resources/img/reservation/t_title03.gif" alt="객실선택" /></p>
	<p class="select"><select name="select" onchange="document.location.replace('?bo_table=<?php echo $bo_table; ?>&select=' + this.options[this.selectedIndex].value);"><?php optionDate($select); ?></select></p>
	<p class="clear"></p>
	<table class="room">
		<col class="col01"></col>
		<col class="col02"></col>
		<col class="col03"></col>
		<col class="col04"></col>
		<col class="col05"></col>
		<col class="col06"></col>
		<col class="col07"></col>
		<tr class="section">
			<td>객실정보</td>
			<td>기준/최대</td>
			<td>숙박일자</td>
			<td>숙박기간</td>
			<td>인원선택</td>
			<td>이용금액</td>
			<td>선택</td>
		</tr>
		<?php for($i = 0;$i < $max; $i++){ ?>
		<tr>
			<td class="left">
				<input type="hidden" name="use[<?php echo $ROOM[$i]['wr_id']; ?>]" value="<?php echo $ROOM[$i]['disabled']; ?>" />
				<a href="#none" onclick="window.open('<?php echo $ROOM[$i]['link']; ?>');" onfocus="this.blur();"><img src="/resources/img/reservation/b_room.gif" alt="상세정보" /></a>
				[<?php if($ROOM[$i]['ca_name']){ echo $ROOM[$i]['ca_name'] . '/'; } ?><?php echo $ROOM[$i]['wr_1']; ?>평형] <?php echo $ROOM[$i]['wr_subject']; ?>
			</td>
			<td><?php echo $ROOM[$i]['wr_2']; ?>명/<?php echo $ROOM[$i]['wr_3']; ?>명</td>
			<td><?php echo $select; ?></td>
			<td><select name="stay[<?php echo $ROOM[$i]['wr_id']; ?>]" onchange="checkPrice('<?php echo $ROOM[$i]['wr_id']; ?>');" <?php echo $ROOM[$i]['disabled']; ?>><?php optionStay($ROOM[$i]['stay']); ?></select></td>
			<td><select name="person[<?php echo $ROOM[$i]['wr_id']; ?>]" onchange="checkPrice('<?php echo $ROOM[$i]['wr_id']; ?>');" <?php echo $ROOM[$i]['disabled']; ?>><?php optionPerson($ROOM[$i]['wr_2'], $ROOM[$i]['wr_3']); ?></select></td>
			<td><span id="price[<?php echo $ROOM[$i]['wr_id']; ?>]"><?php echo number_format($ROOM[$i]['price']); ?></span>원</td>
			<td>
				<?php if(isset($ROOM[$i]['inquiry']) == true){ ?>
				<a href="<?php echo $ROOM[$i]['inquiry']; ?>" onfocus="this.blur();"><img src="/resources/img/reservation/b_inquiry.gif" alt="예약확인" /></a>
				<?php } else{ ?>
				<input type="checkbox" name="room[]" value="<?php echo $ROOM[$i]['wr_id']; ?>" onclick="checkTotal();" onfocus="this.blur();" <?php echo $ROOM[$i]['disabled']; ?> />
				<?php } ?>
			</td>
		</tr>
		<?php } ?>
		<tr class="section">
			<td colspan="5">총 결제금액</td>
			<td class="red" colspan="2"><span id="total">0</span>원</td>
		</tr>
	</table>
	<p class="space"></p>
	<p><img src="/resources/img/reservation//t_title04.gif" alt="예약자정보" /></p>
	<table class="infomation">
		<col class="col01"></col>
		<col class="col02"></col>
		<col class="col01"></col>
		<col class="col02"></col>
		<tr>
			<td class="section">이름</td>
			<td><input type="text" name="wr_name" value="<?php echo $name; ?>" itemname="이름" required="required" <?php echo $readonly; ?> /></td>
			<td class="section">비밀번호</td>
			<td><input type="password" name="wr_password" value="<?php echo $password; ?>" itemname="비밀번호" <?php echo $password_required; ?> <?php echo $readonly; ?> /></td>
		</tr>
		<tr>
			<td class="section">연락처</td>
			<td colspan="3">
				<input type="text" name="wr_homepage" value="<?php echo $homepage; ?>" itemname="연락처" required="required" />&nbsp;
				<span>(반드시 010-3456-7890과 같은 형식으로 입력해주세요)</span>
			</td>
		</tr>
		<tr>
			<td class="section">메모</td>
			<td colspan="3"><textarea name="wr_content" cols="10" rows="5" itemname="메모"><?php echo $content; ?></textarea></td>
		</tr>
	</table>
	<?php if($guide){ ?>
	<p class="space"></p>
	<p><img src="/resources/img/reservation//t_title05.gif" alt="준수사항" /></p>
	<p class="explain"><?php echo get_text($guide, 1); ?></p>
	<?php } ?>
	<p class="button">
		<input type="image" src="/resources/img/reservation//b_write.gif" alt="예약하기" onfocus="this.blur();" />
		<a href="<?php echo $g4['bbs_path']; ?>/board.php?bo_table=<?php echo $bo_table; ?>&select=<?php echo $select; ?>" onfocus="this.blur();"><?php echo $BUTTON; ?></a>
	</p>
</form>
<script type="text/javascript" src="<?php echo $g4['bbs_path']; ?>/js/board.js"></script>
</body>
</html>