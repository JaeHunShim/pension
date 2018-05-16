<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" type="text/css" href="/resources/css/reservation/style.css" />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form id="list" name="fboardlist" method="post" style="width: <?php echo $width; ?>;">
	<p>
		<input type="hidden" name="bo_table" value="<?php echo $bo_table; ?>" />
		<input type="hidden" name="page" value="<?php echo $page; ?>" />
		<input type="hidden" name="sw" value="" />
	</p>
	<table>
		<col class="col01"></col>
		<col class="col02"></col>
		<col class="col03"></col>
		<col class="col04"></col>
		<col class="col05"></col>
		<col class="col06"></col>
		<tr class="section">
			<td><input type="checkbox" onclick="if(this.checked) all_checked(true);else all_checked(false);" onfocus="this.blur();" /></td>
			<td>예약일자</td>
			<td>숙박정보</td>
			<td>숙박일자</td>
			<td>예약자정보</td>
			<td>이용금액</td>
		</tr>
		<?php for($i = 0; $i < count($list); $i++){ ?>
		<tr>
			<td><input type="checkbox" name="chk_wr_id[]" value="<?php echo $list[$i]['wr_id']; ?>" onfocus="this.blur();" /></td>
			<td><?php echo $list[$i]['datetime2']; ?></td>
			<td>
				<a href="<?php echo $list[$i]['href']; ?>" onfocus="this.blur();"><?php echo $list[$i]['subject']; ?></a><br />
				(<?php echo $list[$i]['wr_3']; ?>박 <?php echo $list[$i]['wr_3'] + 1; ?>일, <?php echo $list[$i]['wr_4']; ?>명)
			</td>
			<td><?php echo $list[$i]['wr_1']; ?><br />~<br /><?php echo $list[$i]['wr_2']; ?></td>
			<td><?php echo $list[$i]['name']; ?><br /><?php echo $list[$i]['wr_homepage']; ?></td>
			<td><?php echo number_format($list[$i]['wr_6']); ?>원<br /><?php if($list[$i]['wr_7'] == 'T'){ echo '예약완료'; } else{ echo '예약접수'; } ?></td>
		</tr>
		<? } ?>
	</table>
	<p class="page"><?php echo $write_pages; ?></p>
	<p class="button">
		<a href="#none" onclick="selectFinish();" onfocus="this.blur();"><img src="/resources/img/reservation/b_finish.gif" alt="예약완료" /></a>
		<a href="#none" onclick="select_delete();" onfocus="this.blur();"><img src="/resources/img/reservation/b_delete.gif" alt="예약취소" /></a>
		<a href="#none" onclick="select_copy('copy');" onfocus="this.blur();"><img src="/resources/img/reservation/b_copy.gif" alt="복사하기" /></a>
		<a href="#none" onclick="select_copy('move');" onfocus="this.blur();"><img src="/resources/img/reservation/b_move.gif" alt="이동하기" /></a>
		<a href="<?php echo $g4['bbs_path']; ?>/board.php?bo_table=<?php echo $bo_table; ?>&type=false" onfocus="this.blur();"><img src="/resources/img/reservation/b_calendar.gif" alt="달력보기" /></a>
	</p>
</form>
</body>
</html>