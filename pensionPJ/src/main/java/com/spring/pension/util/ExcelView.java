package com.spring.pension.util;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.spring.pension.domain.ReserDTO;

public class ExcelView extends AbstractExcelPOIView{
	@SuppressWarnings("unchecked")
    @Override
    protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request, HttpServletResponse response) throws Exception {
 
 
        //target에 따라서 엑셀 문서 작성을 분기한다.
        
            //Object로 넘어온 값을 각 Model에 맞게 형변환 해준다.
            List<ReserDTO> listreser = (List<ReserDTO>) model.get("excellist");
            System.out.println(listreser);
            //Sheet 생성
            Sheet sheet = workbook.createSheet("예약현황");
            Row row = null;
            int rowCount = 0;
            int cellCount = 0;
 
            // 제목 Cell 생성
            row = sheet.createRow(rowCount++);
 
            row.createCell(cellCount++).setCellValue("예약번호");
            row.createCell(cellCount++).setCellValue("예약날짜");
            row.createCell(cellCount++).setCellValue("퇴실날짜");
            row.createCell(cellCount++).setCellValue("숙박기간");
            row.createCell(cellCount++).setCellValue("아이디");
            row.createCell(cellCount++).setCellValue("이메일");
            row.createCell(cellCount++).setCellValue("이름");
            row.createCell(cellCount++).setCellValue("휴대폰번호");
            row.createCell(cellCount++).setCellValue("방이름");
            row.createCell(cellCount++).setCellValue("숙박인원");
            row.createCell(cellCount++).setCellValue("금액");
            row.createCell(cellCount++).setCellValue("입금여부");
            // 데이터 Cell 생성
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            for (ReserDTO reserDTO:listreser) {
            	row = sheet.createRow(rowCount++);
                cellCount = 0;
                row.createCell(cellCount++).setCellValue(reserDTO.getReserNo()); //데이터를 가져와 입력
                row.createCell(cellCount++).setCellValue(format.format(reserDTO.getR_fullDate()));
                row.createCell(cellCount++).setCellValue(format.format(reserDTO.getR_lastFullDate()));
                row.createCell(cellCount++).setCellValue(reserDTO.getReser_select());
                row.createCell(cellCount++).setCellValue(reserDTO.getUser_id());
                row.createCell(cellCount++).setCellValue(reserDTO.getUser_email());
                row.createCell(cellCount++).setCellValue(reserDTO.getUser_name()); //데이터를 가져와 입력
                row.createCell(cellCount++).setCellValue(reserDTO.getUser_phone());
                row.createCell(cellCount++).setCellValue(reserDTO.getRoom_name());
                row.createCell(cellCount++).setCellValue(reserDTO.getInwon_check());
                row.createCell(cellCount++).setCellValue(reserDTO.getTotal_pay());
                row.createCell(cellCount++).setCellValue(reserDTO.getDeposit());
                
                
            }
 
        }
 
 
    @Override
    protected Workbook createWorkbook() {
        return new XSSFWorkbook();
    }
}
