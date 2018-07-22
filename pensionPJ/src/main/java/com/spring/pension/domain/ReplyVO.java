package com.spring.pension.domain;

import java.util.Date;

public class ReplyVO {

		private Integer rno;
		private Integer qno;
		private String replytext;
		private String replyer; 
		private Date regdate;
		private Date updatedate;
		
		public Integer getRno() {
			return rno;
		}
		public void setRno(Integer rno) {
			this.rno = rno;
		}
		public Integer getQno() {
			return qno;
		}
		public void setQno(Integer qno) {
			this.qno = qno;
		}
		public String getReplytext() {
			return replytext;
		}
		public void setReplytext(String replytext) {
			this.replytext = replytext;
		}
		public String getReplyer() {
			return replyer;
		}
		public void setReplyer(String replyer) {
			this.replyer = replyer;
		}
		public Date getRegdate() {
			return regdate;
		}
		public void setRegdate(Date regdate) {
			this.regdate = regdate;
		}
		public Date getUpdatedate() {
			return updatedate;
		}
		public void setUpdatedate(Date updatedate) {
			this.updatedate = updatedate;
		}
		
		@Override
		public String toString() {
			return "ReplyVO [rno=" + rno + ", qno=" + qno + ", replytext=" + replytext + ", replyer=" + replyer
					+ ", regdate=" + regdate + ", updatedate=" + updatedate + ", getRno()=" + getRno() + ", getQno()="
					+ getQno() + ", getReplytext()=" + getReplytext() + ", getReplyer()=" + getReplyer()
					+ ", getRegdate()=" + getRegdate() + ", getUpdatedate()=" + getUpdatedate() + ", getClass()="
					+ getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
		}
		
		
}
