package com.spring.pension.domain;

import com.google.gson.Gson;

public class ChatVO {
	
	private String user_id;
	private String content;
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	public static ChatVO convertMessage(String source) {
		ChatVO message = new ChatVO();
		Gson gson = new Gson();
		message = gson.fromJson(source,  ChatVO.class);
		return message;
	}
	@Override
	public String toString() {
		return "ChatVO [user_id=" + user_id + ", content=" + content + ", getUser_id()=" + getUser_id()
				+ ", getContent()=" + getContent() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}
	
	
}
