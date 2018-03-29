package com.spring.pension.persistence;

import com.spring.pension.domain.BoardVO;

import java.util.List;

public interface BoardDAO {
	
	// 예약현황 다 가져오기
	public List<BoardVO> listAll() throws Exception;
	// 예약 하기
	public void create(BoardVO vo) throws Exception;
}
