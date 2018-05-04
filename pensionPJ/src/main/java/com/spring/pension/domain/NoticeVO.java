package com.spring.pension.domain;

import java.util.Arrays;
import java.util.Date;

public class NoticeVO {

	private Integer bno; //게시물 번호
	private String writer; //작성자(관리자)
	private String title; //제목
	private String content; //내용
	private int viewcnt; //조회수
	private Date regdate; //날짜
	private String file[]; //파일 업로드 (smartEditor사용해서 필요없긴함)
	
	public Integer getBno() {
		return bno;
	}
	public void setBno(Integer bno) {
		this.bno = bno;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
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
	public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String[] getFile() {
		return file;
	}
	public void setFile(String[] file) {
		this.file = file;
	}
	@Override
	public String toString() {
		return "NoticeVO [bno=" + bno + ", writer=" + writer + ", title=" + title + ", content=" + content
				+ ", viewcnt=" + viewcnt + ", regdate=" + regdate + ", file=" + Arrays.toString(file) + ", getBno()="
				+ getBno() + ", getWriter()=" + getWriter() + ", getTitle()=" + getTitle() + ", getContent()="
				+ getContent() + ", getViewcnt()=" + getViewcnt() + ", getRegdate()=" + getRegdate() + ", getFile()="
				+ Arrays.toString(getFile()) + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}
	
	
}
