package com.spring.pension.domain;

import java.util.Date;

import com.google.gson.Gson;

public class ChatVO {
	
	private String me_user_id;
	private String yu_user_id;
	private String me_content;
	private String yu_content;
	private Date regdate;
	
	
	public String getMe_user_id() {
		return me_user_id;
	}
	public void setMe_user_id(String me_user_id) {
		this.me_user_id = me_user_id;
	}
	public String getYu_user_id() {
		return yu_user_id;
	}
	public void setYu_user_id(String yu_user_id) {
		this.yu_user_id = yu_user_id;
	}
	public String getMe_content() {
		return me_content;
	}
	public void setMe_content(String me_content) {
		this.me_content = me_content;
	}
	public String getYu_content() {
		return yu_content;
	}
	public void setYu_content(String yu_content) {
		this.yu_content = yu_content;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	//Gson이용해서 Json타입 변경 하는 부분 
	public static ChatVO convertMessage(String source) {
		ChatVO message = new ChatVO();
		Gson gson = new Gson();
		message = gson.fromJson(source,  ChatVO.class);
		return message;
	}
	@Override
	public String toString() {
		return "ChatVO [me_user_id=" + me_user_id + ", yu_user_id=" + yu_user_id + ", me_content=" + me_content
				+ ", yu_content=" + yu_content + ", regdate=" + regdate + ", getMe_user_id()=" + getMe_user_id()
				+ ", getYu_user_id()=" + getYu_user_id() + ", getMe_content()=" + getMe_content() + ", getYu_content()="
				+ getYu_content() + ", getRegdate()=" + getRegdate() + ", getClass()=" + getClass() + ", hashCode()="
				+ hashCode() + ", toString()=" + super.toString() + "]";
	}
	
	
}
