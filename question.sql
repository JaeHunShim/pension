-- 질문과 답변 게시판 만들기

use pension;

CREATE TABLE `pension`.`question` (
  `qno` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(200) NOT NULL,
  `content` TEXT NULL,
  'secret' varchar(20) not null default 'n',
  `user_id` VARCHAR(45) NOT NULL,
  `regdate` DATETIME NULL DEFAULT now(),
  `viewcnt` INT NULL,
  `password` VARCHAR(50) CHARACTER SET 'utf8' NULL,
  PRIMARY KEY (`qno`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- 칼럼명 바꾸기

alter table question change writer user_id varchar(50) not null;
alter table question modify secret varchar(5);
-- password 칼럼 추가 
alter table question add column password varchar(50);

-- 비밀글과 공개글 여부
alter table question add column secret varchar(5) not null default 'n';

alter table question drop password;
-- 질문 삽입 sql문 --

insert into question(title,content,writer,password) values('첫번째글','첫번째글 등록입니다.','심재훈','1');

-- auto_increament 초기화

ALTER TABLE question AUTO_INCREMENT=1;

-- 질문 게시판 보기 --

select * from question;

-- 질문 게시판 목록 보기

select qno,title,content,writer,regdate,viewcnt
	from question
    order by qno desc, regdate;

-- 조건에 맞는 상세 게시물 보여주기

	select 
		qno,title,content,regdate,viewcnt 
	from 
		question 
	where 
		qno=1 and password=1;
        
-- view 카운트수 올리기

update question set viewcnt=viewcnt+1 where qno=2;

-- viewcnt 삭제하고 다시 속성 추가함 (업뎃이 안되서...)
alter table question drop viewcnt; 

alter table question add viewcnt int default 0;

-- 게시물 삭제 
delete from question where qno=4;

-- 게시물 수정 
update question set title='수정했습니다.',content='수정한 게시물 입니다.' where qno =1;

-- 총 게시물 수 가지고 오기 (페이징 처리 하기 위해서)
select count(qno) from question where qno>0;

-- 페이징 처리 하기 
select qno,title,content,writer,regdate,viewcnt
		from
			question
		where qno>0
		order by qno desc,regdate desc
		limit 1,10;

-- 검색결과에 맞는 게시물 가지고 오기 

		select
			qno,title,content,writer,regdate,viewcnt
		from
			question
		where qno>0
		
	/*<if test="searchType != null">
			<if test="searchType == 't'.toString()">
				and title like CONCAT('%',#{keyword},'%')
			</if>
			<if test="searchType == 'c'.toString()">
				and content like CONCAT('%',#{keyword},'%')
			</if>
			<if test="searchType == 'w'.toString()">
				and writer like CONCAT('%',#{keyword},'%')
			</if>
			<if test="searchType == 'tc'.toString()">
				and (title like CONCAT('%',#{keyword},'%') 
				or content like CONCAT('%',#{keyword},'%'))
			</if>
			<if test="searchType == 'cw'.toString()">
				and (content like CONCAT('%',#{keyword},'%') 
				or writer like CONCAT('%',#{keyword},'%'))
			</if>
			<if test="searchType == 'tcw'.toString()">
				and (title like CONCAT('%',#{keyword},'%') 
				or content like CONCAT('%',#{keyword},'%')
				or writer like CONCAT('%',#{keyword},'%'))
			</if>
		</if> */
 		
		order by qno desc,regdate desc
		limit 1,10;
	
-- 댓글 컬럼 추가
alter table question add column replycnt int default 0;

-- question 테이블의 reply갯수와 reply테이블의 rno갯수가 같아지게 수정

update question set replycnt=(
	select count(rno) from reply
    where qno = question.qno
)
where qno>0;

-- 댓글 작성추가 후에 글 목록에서 댓글 갯수까지 가지고오게 바꾸기

select qno,title,content,writer,regdate,viewcnt,replycnt
from quesiton
where qno>0
order by qno desc,regdate desc
limit #{pageStart},#{perPageNum};

-- 다음글  이전글 불러오는 부분 

select * from question where qno=100
union all(select * from question where qno<100 order by qno desc limit 1)
union all(select * from question where qno>100 order by qno asc limit 1)
order by qno desc;
