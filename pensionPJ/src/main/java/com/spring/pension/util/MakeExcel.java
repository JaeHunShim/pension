package com.spring.pension.util;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.Workbook;

import net.sf.jxls.transformer.XLSTransformer;

public class MakeExcel {

	public void download(HttpServletRequest request , HttpServletResponse response,
			Map<String,Object> map, String fileName,String templateFile,String string) throws Exception {
		
		String tempPath = request.getSession().getServletContext().getRealPath("/WEB-INF/download"); //엑셀 파일이 들어갈 경로 
		
		try {
			InputStream is = new BufferedInputStream(new FileInputStream(tempPath +"\\" + templateFile));
			
			XLSTransformer xls = new XLSTransformer();

			Workbook workbook  = xls.transformXLS(is, map);
			
			response.setHeader("Content-Disposition", "attachment;filename=\""+fileName+".xlsx\"");
			
			OutputStream os = response.getOutputStream();
			
			workbook.write(os);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
