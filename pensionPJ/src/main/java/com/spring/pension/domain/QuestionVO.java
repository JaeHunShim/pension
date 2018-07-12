package com.spring.pension.domain;

import java.util.Arrays;
import java.util.Date;

public class QuestionVO {

	private Integer qno; //질문 번호
	private String title;	// 제목
	private String content;	//내용
	//private String writer;	//작성자  session 처리하면서 없애버림
	private String user_id;
	private Date regdate;	//작성날짜
	private int viewcnt;	//조회수
	private String password; // 비밀번호
	private String files[]; //첨부파일
	private int replycnt; //댓글 개수
	private String secret;
	
	
	public Integer getQno() {
		return qno;
	}
	public void setQno(Integer qno) {
		this.qno = qno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String[] getFiles() {
		return files;
	}
	public void setFiles(String[] files) {
		this.files = files;
	}
	public int getReplycnt() {
		return replycnt;
	}
	public void setReplycnt(int replycnt) {
		this.replycnt = replycnt;
	}
	
	public String getSecret() {
		return secret;
	}
	public void setSecret(String secret) {
		this.secret = secret;
	}
	@Override
	public String toString() {
		return "QuestionVO [qno=" + qno + ", title=" + title + ", content=" + content + ", user_id=" + user_id
				+ ", regdate=" + regdate + ", viewcnt=" + viewcnt + ", password=" + password + ", files="
				+ Arrays.toString(files) + ", replycnt=" + replycnt + ", getQno()=" + getQno() + ", getTitle()="
				+ getTitle() + ", getContent()=" + getContent() + ", getUser_id()=" + getUser_id() + ", getRegdate()="
				+ getRegdate() + ", getViewcnt()=" + getViewcnt() + ", getPassword()=" + getPassword() + ", getFiles()="
				+ Arrays.toString(getFiles()) + ", getReplycnt()=" + getReplycnt() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
	
	
}
