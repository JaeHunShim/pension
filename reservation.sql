use pension;
 -- 예약 테이블 생성 
create table reservation(
	reserNo int,
	user_id varchar(50) not null,
    user_name varchar(50) not null,
    room_name varchar(50) not null,
    total_pay int not null,
    r_fullDate date not null,
    r_lastfullDate date not null,
    reser_select int not null,
    entance_time varchar(20) not null,
    reser_content varchar(3000),
    payment varchar(20) not null,
    inwon_check int not null,
    primary key(user_id),
    foreign key(user_id) references user(user_id)
    on delete cascade
);
drop table reservation;
 -- 고객예약 정보 넣는 부분 
 insert into reservation values(#{user_id},#{user_name},#{romm_name},#{total_pay},#{fullDate},#{lastFullDate},#{reser_select},#{entance_time},
 #{reser_content},#{payment});
 
 -- 예약 현황 검색
 select * from reservation;
 
 -- colunm 명 바꾸기
 ALTER TABLE reservation CHANGE reser_conetent reser_content varchar(200) not null;
 alter table reservation add inwon_check varchar(3) not null;
 alter table reservation change inwon_check inwon_check int not null;
 
 -- reserNo 받아오기
 select reserNo from reservation;