package com.spring.pension.persistence;

import com.spring.pension.domain.ReserVO;

import java.util.List;

public interface ReserDAO {
	
	// 예약현황 다 가져오기
	public List<ReserVO> listAll() throws Exception;
	// 예약 하기
	public void create(ReserVO vo) throws Exception;
}
