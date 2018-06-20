package com.spring.pension.persistence;

import com.spring.pension.domain.ReserVO;

import java.util.List;

public interface ReserDAO {
	//예약 하는 부분 
	public void insert(ReserVO reserVO) throws Exception;
}
