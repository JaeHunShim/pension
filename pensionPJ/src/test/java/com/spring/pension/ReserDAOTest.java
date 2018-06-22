package com.spring.pension;

import java.text.SimpleDateFormat;
import java.util.Date;

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
		
		ReserVO reserVO = new ReserVO();
		reserVO.setUser_id("jaehuniya");
		reserVO.setEntance_time("3시");
		reserVO.setUser_name("심재훈");
		String a = "2014-2-20";
		String b = "2014-2-21";
		Date date =new SimpleDateFormat("yyyy-MM-dd").parse(a);
		Date date1 =new SimpleDateFormat("yyyy-MM-dd").parse(b);
		reserVO.setR_fullDate(date);
		reserVO.setR_lastFullDate(date1);
		reserVO.setPayment("무동장입금");
		reserVO.setReser_content("테스트");
		reserVO.setRoom_name("데이지");
		reserVO.setReser_select(1);
		reserVO.setTotal_pay(200000);
		reserVO.setInwon_check(3);
		dao.insert(reserVO);
	}
}
