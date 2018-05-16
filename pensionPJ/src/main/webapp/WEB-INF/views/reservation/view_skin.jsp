<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/script.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/reservation/style.css" />
<title>Insert title here</title>
</head>
<body>

<div id="view" style="width: <?php echo $width; ?>;">
	<p><img src="/resources/img/reservation/t_title01.gif" alt="예약내역" /></p>
	<table>
		<tr>
			<td class="section">객실이름</td>
			<td><?php echo cut_hangul_last(get_text($view[wr_subject])); ?></td>
			<td class="section">예약일자</td>
			<td><?php echo $view['wr_datetime']; ?></td>
		</tr>
		<tr>
			<td class="section">예약자이름</td>
			<td><?php echo $view['name']; ?></td>
			<td class="section">예약자연락처</td>
			<td><?php echo $view['wr_homepage']; ?></td>
		</tr>
		<tr>
			<td class="section">숙박일자</td>
			<td><?php echo $view['wr_1']; ?> ~ <?php echo $view['wr_2']; ?></td>
			<td class="section">숙박기간/인원</td>
			<td><?php echo $view['wr_3']; ?>박 <?php echo $view['wr_3'] + 1; ?>일 / <?php echo $view['wr_4']; ?>명</td>
		</tr>
		<tr>
			<td class="section">이용금액</td>
			<td class="red"><?php echo number_format($view['wr_6']); ?>원</td>
			<td class="section">현재상태</td>
			<td><?php if($view['wr_7'] == 'T'){ echo '예약완료'; } else{ echo '예약접수'; }?></td>
		</tr>
		<tr>
			<td class="section">메모</td>
			<td colspan="3"><?php echo $view['content']; ?></td>
		</tr>
	</table>
	<p class="space"></p>
	<p><img src="/resources/img/reservation/t_title02.gif" alt="이용안내" /></p>
	<p class="explain">
		1. 예약신청이 완료된 후 <span><?php echo $board['bo_6']; ?>일 이내에 입금</span>이 확인되지 않으면 별도의 확인절차없이 예약은 취소됩니다.<br />
		2. 입금 이전에 예약내용을 수정하시려면 기존의 예약을 취소하고 다시 예약해주시기 바랍니다.<br />
		&nbsp;&nbsp; (한번에 여러개의 객실을 예약하였을 경우 객실마다 취소를 해야하며 일부 객실만 취소할 수도 있습니다)<br />
		3. 입금 이후에 예약내용을 수정하시거나 취소하시려면 전화로 문의해주세요.<br />
		4. 무통장입금 계좌번호안내 : <?php echo $board['bo_10']; ?>
	</p>
	<p class="button">
		<?php if($is_admin){ ?>
		<a href="#none" onclick="checkFinish('<?php echo $view['wr_7']; ?>', '<?php echo "{$board_skin_path}/finish.control.php?bo_table={$bo_table}&wr_id={$wr_id}&page={$page}"; ?>');" onfocus="this.blur();"><img src="/resources/img/reservation/b_finish.gif" alt="예약완료" /></a>
		<a href="<?php echo $delete_href; ?>" onfocus="this.blur();"><img src="/resources/img/reservation/b_delete.gif" alt="예약취소" /></a>
		<a href="<?php echo $copy_href; ?>" onfocus="this.blur();"><img src="/resources/img/reservation/b_copy.gif" alt="복사하기" /></a>
		<a href="<?php echo $move_href; ?>" onfocus="this.blur();"><img src="/resources/img/reservation/b_move.gif" alt="이동하기" /></a>
		<a href="<?php echo $list_href; ?>" onfocus="this.blur();"><?php echo $BUTTON; ?></a>
		<?php } else{ ?>
		<a href="<?php echo $write_href; ?>" onfocus="this.blur();"><img src="/resources/img/reservation/b_write.gif" alt="예약하기" /></a>
		<?php if($view['wr_7'] == 'T'){ echo "<a href=\"#none\" onclick=\"window.alert('입금 이후에 예약내용을 취소하시려면 전화로 문의해주세요.');\" onfocus=\"this.blur();\">"; } else{ echo "<a href=\"{$delete_href}\" onfocus=\"this.blur();\">"; }?><img src="/img/b_delete.gif" alt="예약취소" /></a>
		<a href="<?php echo $list_href; ?>&select=<?php echo $select; ?>" onfocus="this.blur();"><?php echo $BUTTON; ?></a>
		<?php } ?>
	</p>
</div>
<script type="text/javascript" src="<?php echo $g4['path']; ?>/js/board.js"></script>

</body>
</html>