package com.spring.pension.service;

import com.spring.pension.domain.QuestionVO;

public interface QuestionService {

	// 질문 등록 서비스
	public void regist(QuestionVO questionVO) throws Exception;	
}
