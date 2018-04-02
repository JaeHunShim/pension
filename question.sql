-- 질문과 답변 게시판 만들기

use pention;

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

-- 질문 게시판 보기 --

select * from question;