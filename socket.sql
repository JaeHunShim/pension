use pension;
 -- 메세지 저장하는 테이블
 
 create table chat(
	user_id varchar(20) not null,
    content text,
    regdate datetime,
    primary key(user_id)
 );
