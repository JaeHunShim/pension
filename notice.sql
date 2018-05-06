use pension;

-- 관리자 테이블 생성

create table notice(
	bno int not null auto_increment,
    title varchar(200) not null,
    content text null,
    writer varchar(50) not null,
    regdate timestamp not null default now(),
    viewcnt int default 0,
    primary key (bno)
);

drop table notice;

-- 테이블 전체 보기
select * from notice;

-- autoincreament 초기화
ALTER TABLE notice AUTO_INCREMENT=1;

-- 목록 보기
select bno,title,regdate,viewcnt from notice where bno>0 order by bno desc, regdate desc;

-- 상세보기
select bno,title,regdate,content,viewcnt from notice where bno=#{bno};

-- 글 삭제
delete from notice where bno=#{bno};

-- 글 수정
update notice set title=#{title},content=#{content},regdate=now() where bno=#{bno}

-- viewcnt 증가

update notice set viewcnt = viewcnt+1 where bno=1;