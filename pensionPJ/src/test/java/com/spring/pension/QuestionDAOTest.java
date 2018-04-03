package com.spring.pension;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.pension.domain.QuestionVO;
import com.spring.pension.persistence.QuestionDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class QuestionDAOTest {
	
	@Inject
	private QuestionDAO dao;
	
	private static final Logger logger = LoggerFactory.getLogger(QuestionDAOTest.class);
	
	@Test
	public void testInsertQuestion() throws Exception{
		
		QuestionVO qVO = new QuestionVO();
		
		qVO.setTitle("두번째 글입니다");
		qVO.setContent("두번째 글이 등록되는지 봅시다");
		qVO.setPassword("1");
		qVO.setWriter("심재훈");
		
		dao.creat(qVO);
	}

}
