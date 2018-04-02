-- 스키마(데이터베이스) 생성
create schema pension DEFAULT CHARACTER SET utf8;

-- db사용
use pension;

-- table명 바꾸기
rename table new_table to board;
rename table board to reservation;
-- 테이블 내용뽑아오기 

select * from reservation;

