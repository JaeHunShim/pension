use pension;

-- 예약현황 받아오기 
select r_fullDate,r_lastfullDate,reser_select,reservation.user_id,user_email
,reservation.user_name,room_name,user_phone,inwon_check,total_pay
from user,reservation where user.user_id = reservation.user_id
order by r_fullDate;

-- 예약 현황 페이징 처리해서 게시물 받아오기 
		select reserNo,r_fullDate,r_lastfullDate,reser_select,reservation.user_id,user_email,reservation.user_name,
		room_name,user_phone,inwon_check,total_pay
		from 
		user,reservation where user.user_id = reservation.user_id
		order by r_fullDate desc
		limit #{pageStart},#{perPageNum};
-- 예약 게시물 총 갯수 구하기 
select count(reserNo) from reservation;