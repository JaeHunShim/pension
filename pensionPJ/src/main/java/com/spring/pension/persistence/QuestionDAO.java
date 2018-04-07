package com.spring.pension.persistence;

import com.spring.pension.domain.QuestionVO;

public interface QuestionDAO {
	
	//질문등록
	public void creat(QuestionVO questionVO) throws Exception;

}
