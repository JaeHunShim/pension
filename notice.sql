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
-- 총 갯수 가지고 오기
-- 페이징 처리(sql로 불러와서 써먹음)
<sql id="search">
		<if test="searchType != null">
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
		</if>
</sql>
-- 페이징 처리 
<select id ="listSearch" resultType ="noticeVO">
		<![CDATA[
		select
			bno,title,content,writer,regdate,viewcnt
		from
			notice
		where bno>0
		]]>
		<include refid="search"></include>
		<![CDATA[
		order by bno desc,regdate desc
		limit #{pageStart},#{perPageNum}
		]]>	
	</select>
-- 총 게시물 가지고 오기 
	<select id="listSearchCount" resultType="int">
		<![CDATA[
		select count(bno)
			from notice
		where bno>0
		]]>
		<include refid="search"></include>
	</select>

