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
<script type="text/javascript" src="/script.js"></script>
<div id="calendar" style="width: <?php echo $width; ?>;">
	<p class="title">
		<a href="#none" onclick="movePage('<?php echo $prev; ?>');" onfocus="this.blur();"><img src="/resources/img/reservation/b_prev.gif" alt="이전" /></a>
		&nbsp;<?php echo $year; ?>년 <?php echo $month; ?>월&nbsp;
		<a href="#none" onclick="movePage('<?php echo $next; ?>');" onfocus="this.blur();"><img src="/resources/img/reservation/b_next.gif" alt="다음" /></a>
	</p>
	<table>
		<col class="col01"></col>
		<col class="col02"></col>
		<col class="col03"></col>
		<col class="col04"></col>
		<col class="col05"></col>
		<col class="col06"></col>
		<col class="col07"></col>
		<tr>
			<td class="section red">일요일</td>
			<td class="section">월요일</td>
			<td class="section">화요일</td>
			<td class="section">수요일</td>
			<td class="section">목요일</td>
			<td class="section">금요일</td>
			<td class="section">토요일</td>
		</tr>
		<tr>
		<?php
		for($i = 0; $i < $total; $i++)
		{
			if($i > 0 && $i % 7 == 0)
			{
				echo "</tr><tr>";
			}
			if($i >= $min && $i < $max)
			{
				$var = "{$year}-{$month}-" . sprintf('%02d', $day);
				if($var < $g4['time_ymd'] || $var > $limit['max'])
				{
					echo "<td class=\"gray\">{$day}일</td>";
				}
				else
				{
					echo "<td>";
					echo "<p class=\"day\">{$day}일</p>";
					for($k = 0; $k < $count; $k++)
					{
						$number = getRoom($day, $k);
						if($var >= $limit['min'] && $number < $amount[$k])
						{
							$icon = $style = 'open';
						}
						else
						{
							$icon = $style = 'close';
						}
						if($number == 1 && $number == $amount[$k])
						{
							$link = "{$g4['bbs_path']}/board.php?bo_table={$bo_table}&wr_id={$room[$day][$class[$k]['0']]}&select={$var}";
						}
						else
						{
							$link = "{$g4['bbs_path']}/write.php?bo_table={$bo_table}&select={$var}";
						}
						echo "<p>";
						echo "<img src=\"{$board_skin_path}/resources/img/reservation/i_{$icon}.gif\" alt=\"\" /> ";
						echo "<a href=\"{$link}\" onfocus=\"this.blur();\">";
						echo "<span class=\"{$style}\">{$group[$k]}({$number}/{$amount[$k]})</span>";
						echo "</a>";
						echo "</p>";
					}
					echo '</td>';
				}
				$day++;
			}
			else
			{
				echo '<td class="null">&nbsp;</td>';
			}
		}
	?>
		</tr>
	</table>
	<p class="explain">달력에서 원하는 일자를 클릭한 후 예약접수 및 예약확인/취소를 할 수 있습니다</p>
	<?php if($is_admin){ ?>
	<p class="button">
		<a href="<?php echo $g4['bbs_path']; ?>/board.php?bo_table=<?php echo $bo_table; ?>&type=true" onfocus="this.blur();"><img src="/resources/img/reservation/b_list.gif" alt="목록보기" /></a>
	</p>
	<?php } ?>
</div>

</body>
</html>