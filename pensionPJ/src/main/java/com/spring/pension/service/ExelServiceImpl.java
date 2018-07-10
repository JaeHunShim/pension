package com.spring.pension.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.pension.domain.ReserDTO;
import com.spring.pension.persistence.ExcelDAO;

@Service
public class ExelServiceImpl implements ExcelService {
	
	@Inject
	private ExcelDAO excelDAO;
	
	@Override
	public List<ReserDTO> getAllObjects() {
		
		
		return excelDAO.getBooks();
	}

}
