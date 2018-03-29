package com.spring.pension;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.pension.domain.BoardVO;
import com.spring.pension.persistence.BoardDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class BoardDAOTest {
	
	@Inject
	private BoardDAO dao;
	
	private static final Logger logger = LoggerFactory.getLogger(BoardDAOTest.class);
	
	@Test
	public void testInsertBoard() throws Exception{
		
		BoardVO board = new BoardVO();
		board.setAddfee(1000);
		board.setChoice("Y");
		board.setFee(24000);
		board.setMax("4명");
		board.setRoom("24평");
		board.setRoomN("재훈방");
		
		dao.create(board);
	}
}
