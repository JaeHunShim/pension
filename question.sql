-- 질문과 답변 게시판 만들기

use pension;

CREATE TABLE `pension`.`question` (
  `qno` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(200) NOT NULL,
  `content` TEXT NULL,
  `writer` VARCHAR(45) NOT NULL,
  `regdate` DATETIME NULL DEFAULT now(),
  `viewcnt` INT NULL,
  `password` VARCHAR(50) CHARACTER SET 'utf8' NULL,
  PRIMARY KEY (`qno`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

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
delete from question where qno=1;

-- 게시물 수정 
update question set title='수정했습니다.',content='수정한 게시물 입니다.'; 

 