use pension;

select r_fullDate,r_lastfullDate,reser_select,reservation.user_id,user_email
,reservation.user_name,room_name,user_phone,inwon_check,total_pay
from user,reservation where user.user_id = reservation.user_id
order by r_fullDate;