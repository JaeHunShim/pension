package com.spring.pension.domain;

import org.springframework.web.multipart.MultipartFile;

public class UploadVO {

	private MultipartFile Filedata;  //파일 이름
	
	private String callback; // 콜백 url
	
	private String callback_func;

	public MultipartFile getFiledata() {
		return Filedata;
	}

	public void setFiledata(MultipartFile filedata) {
		Filedata = filedata;
	}

	public String getCallback() {
		return callback;
	}

	public void setCallback(String callback) {
		this.callback = callback;
	}

	public String getCallback_func() {
		return callback_func;
	}

	public void setCallback_func(String callback_func) {
		this.callback_func = callback_func;
	}

	@Override
	public String toString() {
		return "UploadVO [Filedata=" + Filedata + ", callback=" + callback + ", callback_func=" + callback_func
				+ ", getFiledata()=" + getFiledata() + ", getCallback()=" + getCallback() + ", getCallback_func()="
				+ getCallback_func() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}
	
	
	
}
