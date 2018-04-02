package com.spring.pension.domain;

import java.util.Arrays;
import java.util.Date;

public class QuestionVO {

		private Integer qno; //질문 번호
		private String title;	// 제목
		private String content;	//내용
		private String writer;	//작성자
		private Date regdate;	//작성날짜
		private int viewcnt;	//조회수
		private String password; // 비밀번호
		private String files[]; //첨부파일
		
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
		public String getWriter() {
			return writer;
		}
		public void setWriter(String writer) {
			this.writer = writer;
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
		@Override
		public String toString() {
			return "QuestionVO [qno=" + qno + ", title=" + title + ", content=" + content + ", writer=" + writer
					+ ", regdate=" + regdate + ", viewcnt=" + viewcnt + ", password=" + password + ", files="
					+ Arrays.toString(files) + ", getQno()=" + getQno() + ", getTitle()=" + getTitle()
					+ ", getContent()=" + getContent() + ", getWriter()=" + getWriter() + ", getRegdate()="
					+ getRegdate() + ", getViewcnt()=" + getViewcnt() + ", getPassword()=" + getPassword()
					+ ", getFiles()=" + Arrays.toString(getFiles()) + ", getClass()=" + getClass() + ", hashCode()="
					+ hashCode() + ", toString()=" + super.toString() + "]";
		}
		
		
}
