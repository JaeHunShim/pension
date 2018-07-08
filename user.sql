
use pension;

-- 유저 테이블 생성 
create table user(
	user_id varchar(50) not null, 
    user_password varchar(50) not null,
    user_name varchar(50) not null,
    user_address varchar(100) not null,
    user_email varchar(100) not null,
    user_phone varchar(50) not null,
    regdate timestamp not null default now(),
    primary key(user_id)
);

select * from user;

-- 회원 가입
insert into user(user_id,user_password,user_name,user_address,user_email,user_phone)values(#{user_id},#{user_password},#{user_name},#{user_address},#{user_email},#{user_phone})
-- 아이디 체크 
select count(*) from user where user_id ="jeahuniya";

-- 자신의 회원정보 받아오기 
select user_id,user_name,user_address,user_email,user_phone from user where user_id=#{user_id}

-- 자신의 예약 받아오기 

	select reserNo,r_fullDate,r_lastfullDate,reser_select,room_name,inwon_check,total_pay,deposit from reservation 
		where user_id=#{user_id} order by r_fullDate desc 
		limit #{pageStart},#{perPageNum}
-- 해당 아이디의 회원 정보 갯수 (페이징 처리)

select count(reserNo) from reservation where user_id = #{user_id} 
-- 로그인 
select * from user where user_id=#{user_id} and user_password=#{user_password}
 -- 회원 삭제 
delete from user where user_password='12' and user_id='jaehuniya1';