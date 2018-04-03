package com.spring.pension.service;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.spring.pension.domain.QuestionVO;
import com.spring.pension.persistence.QuestionDAO;

@Service
public class QuestionServiceImpl implements QuestionService {
	
	public static final Logger logger = LoggerFactory.getLogger(QuestionServiceImpl.class);
	
	@Inject
	private QuestionDAO questionDAO;
	
	@Override
	public void regist(QuestionVO questionVO) throws Exception {
		
		logger.info("게시물 등록 Service" + questionDAO);
		
		questionDAO.creat(questionVO);
	}

}
