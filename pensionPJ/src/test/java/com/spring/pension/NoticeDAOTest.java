package com.spring.pension;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.pension.domain.NoticeVO;
import com.spring.pension.persistence.NoticeDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class NoticeDAOTest {
	
	@Inject
	private NoticeDAO noticeDAO;
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeDAOTest.class);
	@Test
	public void insertNotice() throws Exception{
		
		NoticeVO vo = new NoticeVO();
			for(int i=0; i<100; i++) {
			vo.setWriter("재훈"+i);
			vo.setTitle(i+1 +"번째 글입니다.");
			vo.setContent(i+1 +"번째 글 태스트 해봅니다.");
			
			noticeDAO.create(vo);
		}
	}
}
