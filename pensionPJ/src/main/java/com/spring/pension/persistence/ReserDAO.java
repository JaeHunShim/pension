package com.spring.pension.persistence;

import com.spring.pension.domain.ReserVO;

import java.util.List;
import java.util.Map;

public interface ReserDAO {
	//예약 하는 부분 
	public void insert(ReserVO reserVO) throws Exception;
	//에약 번호 받아오는 부분
	public List<ReserVO> getReserNo() throws Exception;
	//관리자가 볼 예약페이지
	public List<Map<String,Object>> admin() throws Exception;
}
