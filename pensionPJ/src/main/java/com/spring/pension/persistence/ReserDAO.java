package com.spring.pension.persistence;

import com.spring.pension.domain.Criteria;
import com.spring.pension.domain.ReserVO;
import java.util.List;
import java.util.Map;

public interface ReserDAO {
	//예약 하는 부분 
	public void insert(ReserVO reserVO) throws Exception;
	//에약 번호 받아오는 부분
	public List<ReserVO> getReserNo() throws Exception;
	//1.관리자가 볼 예약페이지
	public List<Map<String,Object>> admin() throws Exception;
	// 총 예약테이블 갯수 구하기(페이징 처리 하기 위해서)
	public int conutPage(Criteria cri) throws Exception;
	//2.관리자가 볼 예약페이지 (페이징처리)
	public List<Map<String,Object>> management(Criteria cri) throws Exception;
	//관리자가 게시물 삭제
	public void delete(int reserNo) throws Exception;
}
