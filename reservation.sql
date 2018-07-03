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
    deposit varchar(8) default '입금전',
    primary key(reserNo),
    foreign key(user_id) references user(user_id)
    on delete cascade
);
drop table reservation;
 -- 고객예약 정보 넣는 부분 
 insert into reservation values(#{user_id},#{user_name},#{romm_name},#{total_pay},#{fullDate},#{lastFullDate},#{reser_select},#{entance_time},
 #{reser_content},#{payment});
 
 -- 예약 현황 검색
 select * from reservation order by r_fullDate desc;
 
 alter table reservation drop deposit; 
 -- colunm 명 바꾸기
 ALTER TABLE reservation CHANGE reser_conetent reser_content varchar(200) not null;
 alter table reservation add inwon_check varchar(3) not null;
 alter table reservation change inwon_check inwon_check int not null;
 
 -- reserNo 받아오기
 select reserNo from reservation;
  -- 더미데이터 
 insert into reservation values(2018813,'admin','심재훈','아이비',120000,'2018-08-01','2018-08-02',1,'오후3시','이양','무통장입금',4);
 insert into reservation values(2018823,'admin','심재훈','아이비',120000,'2018-08-02','2018-08-03',1,'오후3시','이양','무통장입금',4);
 insert into reservation values(2018833,'admin','심재훈','아이비',120000,'2018-08-03','2018-08-04',1,'오후3시','이양','무통장입금',4);
 insert into reservation values(2018843,'admin','심재훈','아이비',120000,'2018-08-04','2018-08-05',1,'오후3시','이양','무통장입금',4);
 insert into reservation values(2018853,'admin','심재훈','아이비',120000,'2018-08-05','2018-08-06',1,'오후3시','이양','무통장입금',4);
 insert into reservation values(2018863,'admin','심재훈','아이비',120000,'2018-08-06','2018-08-07',1,'오후3시','이양','무통장입금',4);
 insert into reservation values(2018873,'admin','심재훈','아이비',120000,'2018-08-07','2018-08-08',1,'오후3시','이양','무통장입금',4);
 insert into reservation values(2018883,'admin','심재훈','아이비',120000,'2018-08-08','2018-08-09',1,'오후3시','이양','무통장입금',4);
 insert into reservation values(2018893,'admin','심재훈','아이비',120000,'2018-08-09','2018-08-10',1,'오후3시','이양','무통장입금',4);
 
 insert into reservation values(20188103,'admin','심재훈','아이비',120000,'2018-08-10','2018-08-11',1,'오후3시','이양','무통장입금',4);
 insert into reservation values(20188113,'admin','심재훈','아이비',120000,'2018-08-11','2018-08-12',1,'오후3시','이양','무통장입금',4);
 insert into reservation values(20188123,'admin','심재훈','아이비',120000,'2018-08-12','2018-08-13',1,'오후3시','이양','무통장입금',4);
 insert into reservation values(20188133,'admin','심재훈','아이비',120000,'2018-08-13','2018-08-14',1,'오후3시','이양','무통장입금',4);
 insert into reservation values(20188143,'admin','심재훈','아이비',120000,'2018-08-14','2018-08-15',1,'오후3시','이양','무통장입금',4);
 insert into reservation values(20188153,'admin','심재훈','아이비',120000,'2018-08-15','2018-08-16',1,'오후3시','이양','무통장입금',4);
 insert into reservation values(20188163,'admin','심재훈','아이비',120000,'2018-08-16','2018-08-17',1,'오후3시','이양','무통장입금',4);
 insert into reservation values(20188173,'admin','심재훈','아이비',120000,'2018-08-17','2018-08-18',1,'오후3시','이양','무통장입금',4);
 insert into reservation values(20188183,'admin','심재훈','아이비',120000,'2018-08-18','2018-08-19',1,'오후3시','이양','무통장입금',4);
 insert into reservation values(20188193,'admin','심재훈','아이비',120000,'2018-08-19','2018-08-20',1,'오후3시','이양','무통장입금',4);
 
 --  입금 컬럼 추가(deposit)
 alter table reservation add deposit varchar(8) default '입금전';
 -- 입금 칼럼 수정
 alter table reservation change deposit deposit varchar(5) default "입금전";
 -- deposit 수정
 update reservation set deposit=if(deposit='입금전','입금완료','입금전') where reserNo = 20188123;
 
 		select reserNo,r_fullDate,r_lastfullDate,reser_select,reservation.user_id,user_email,reservation.user_name,
		room_name,user_phone,inwon_check,total_pay,deposit
		from 
		user,reservation where user.user_id = reservation.user_id
		order by r_fullDate desc