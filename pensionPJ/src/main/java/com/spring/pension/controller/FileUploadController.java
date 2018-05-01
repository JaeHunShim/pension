package com.spring.pension.controller;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


@Controller
@RequestMapping(value="/upload/*")
public class FileUploadController {
	
	private static final Logger logger = LoggerFactory.getLogger(FileUploadController.class);
	
	@RequestMapping(value="/photo_uploader" ,method=RequestMethod.GET)
	public void fileUploadPage() throws Exception {
		
	}
	@ResponseBody
	@RequestMapping(value="/photo_uploader", method=RequestMethod.POST, produces ="text/plain;charset=UTF-8")
	public String upload(HttpServletRequest request) throws Exception {
		
		//파일 정보
		StringBuffer sb = new StringBuffer();
		try {
			//원본 파일명
			String oldName= request.getHeader("file-name");
			logger.info(oldName);
			//파일 경로
			String filePath = "D:/dev/pension/pensionPJ/src/main//webapp/resources/smartEditor/uploadImage/";
			//저장될때 파일명 생성 
			String saveName= sb.append(new SimpleDateFormat("yyyyMMddHHmmss")
                    .format(System.currentTimeMillis()))
                    .append(UUID.randomUUID().toString())
                    .append(oldName.substring(oldName.lastIndexOf("."))).toString();
			 
			InputStream is = request.getInputStream();
	        OutputStream os = new FileOutputStream(filePath + saveName);
            int numRead;
            byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
            while ((numRead = is.read(b, 0, b.length)) != -1) {
                os.write(b, 0, numRead);
            }
            os.flush();
            os.close();
            
            //정보 출력 
            sb.append("&bNewLine=true")
            .append("&sFileName=").append(oldName)
            .append("&sFileURL=").append("/resources/smartEditor/uploadImage/")
            .append(saveName);
		}catch(Exception e){
			e.printStackTrace();
		}
		return sb.toString();
	}
}
