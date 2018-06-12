package com.spring.pension;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.pension.domain.ReserVO;
import com.spring.pension.persistence.ReserDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class ReserDAOTest {
	
	@Inject
	private ReserDAO dao;
	
	private static final Logger logger = LoggerFactory.getLogger(ReserDAOTest.class);
	
	@Test
	public void testInsertReser() throws Exception{
		
		ReserVO reser = new ReserVO();
/*		reser.setAddfee(1000);
		reser.setChoice("Y");
		reser.setFee(24000);
		reser.setMax("4명");
		reser.setRoom("24평");
		reser.setRoomN("재훈방");*/
		
		dao.create(reser);
	}
}
