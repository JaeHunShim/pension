use pension;

-- 댓글 테이블 생성

create table reply(
	rno int not null auto_increment,
    qno int not null default 0,
    replytext varchar(1000) not null,
    replyer varchar(50) not null,
    regdate timestamp not null default now(),
    updatedate timestamp not null default now(),
    primary key(rno),
    constraint fk_question foreign key(qno) references question(qno)
);
-- replyer 를 user_id로 컬럼명 바꿈

select * from reply;
alter table reply change replyer user_id varchar(50);

alter table reply change user_id replyer varchar(50);
-- 댓글 삽입
insert into reply(qno, replytext,replyer) values(#{qno},#{replytext},#{replyer});
-- 1. 댓글 목록 불러오기
select * from reply where rno=#{rno} order by rno desc;
-- 2. 댓글 목록 불러오기 (페이징 처리)
	select * from reply
	where qno=#{qno}
	order by rno desc
	limit #{cri.startPage},#{cri.perPageNum} 
-- 댓글 목록 수정
update reply set replytext =#{replytext},updatedate = now();
-- 댓글 목록 샂게 
delete from reply where rno=#{rno};
-- 댓글 게시물 수 가지고 오기
select count(qno) from reply where qno=#{qno}

	

ALTER TABLE reply CHANGE bno qno int not null default 0;

drop table reply;

ALTER TABLE reply AUTO_INCREMENT=1;

delete from reply where rno=5;
