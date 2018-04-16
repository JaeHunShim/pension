package com.spring.pension.service;

import java.util.List;

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
	// 게시물 등록하는 부분 
	@Override
	public void regist(QuestionVO questionVO) throws Exception {
		
		logger.info("게시물 등록 Service" + questionDAO);
		
		questionDAO.creat(questionVO);
	}
	// 게시글 목록 가져오기
	@Override
	public List<QuestionVO> listAll() throws Exception {
		
		return questionDAO.listAll();
	}
	// 상세글 가지고오기 
	@Override
	public QuestionVO read(String password) throws Exception {
		logger.info("가져오는 데이터 " + questionDAO.read(password));
		return questionDAO.read(password);
	}


}
