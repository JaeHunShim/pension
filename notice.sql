use pension;

-- 관리자 테이블 생성

CREATE TABLE notice (
  `bno` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(200) NOT NULL,
  `content` TEXT NULL,
  `writer` VARCHAR(45) NOT NULL,
  `regdate` DATETIME NULL DEFAULT now(),
  `viewcnt` INT NULL,
  PRIMARY KEY (`bno`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- 테이블 전체 보기
select * from notice;

-- autoincreament 초기화
ALTER TABLE notice AUTO_INCREMENT=1;

-- 목록 보기
select bno,title,regdate,viewcnt from notice where bno>0 order by bno desc, regdate desc;

-- 상세보기
select bno,title,regdate,content,viewcnt from notice where bno=#{bno} 

-- 글 삭제
delete from notice where bno=#{bno}

-- 글 수정
update notice set title=#{title},content=#{content},regdate=now() where bno=#{bno}

