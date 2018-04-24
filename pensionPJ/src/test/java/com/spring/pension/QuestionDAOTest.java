package com.spring.pension;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.pension.domain.Criteria;
import com.spring.pension.domain.QuestionVO;
import com.spring.pension.domain.SearchCriteria;
import com.spring.pension.persistence.QuestionDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class QuestionDAOTest {
	
	@Inject
	private QuestionDAO dao;
	
	private static final Logger logger = LoggerFactory.getLogger(QuestionDAOTest.class);
	
	//더미 데이터 넣기 
	@Test
	public void testInsertQuestion() throws Exception{
		
		QuestionVO qVO = new QuestionVO();
		for(int i=0; i<100; i++) {
		qVO.setTitle(i+"번째 데이터 입니다.");
		qVO.setContent(i+"번째 글 등록했습니다. 제대로 되야해");
		qVO.setPassword("1");
		qVO.setWriter("심재훈"+i);
		
		dao.creat(qVO);
		}
	}

	//페이징 처리 테스트 
	@Test
	public void testCriteria() throws Exception{
		
		Criteria cri = new Criteria();
		cri.setPage(2);
		cri.setPerPageNum(10);
		
		List<QuestionVO> list = dao.listCriteria(cri);
		
		for(QuestionVO vo:list) {
			
			logger.info(vo.getQno() + ":" + vo.getTitle());
		}
	}
	@Test
	public void testSearch() throws Exception{
		
		SearchCriteria cri = new SearchCriteria();
		cri.setPage(1);
		cri.setKeyword("1");
		cri.setSearchType("c");
		
		logger.info("==============================================================");
		
		List<QuestionVO> list = dao.listSearch(cri);
		for(QuestionVO vo:list) {
			logger.info(vo.getQno()+ ":" +vo.getTitle());
		}
		
		logger.info("==============================================================");
		logger.info("갯수: " + dao.listSearchConunt(cri));
	}
}
