package com.spring.pension.domain;

import java.util.Date;

public class BoardVO {

		private Integer rCode;	//예약코드
		private Date reserDate; //예약날짜
		private String roomN;//방이름
		private String room; //방크기
		private String max;//최대인원수
		private Integer fee; // 가격
		private Integer addfee; //추가 가격
		private String choice; //방선택
		
		public Integer getrCode() {
			return rCode;
		}
		public void setrCode(Integer rCode) {
			this.rCode = rCode;
		}
		public Date getReserDAte() {
			return reserDate;
		}
		public void setReserDAte(Date reserDAte) {
			this.reserDate = reserDAte;
		}
		public String getRoomN() {
			return roomN;
		}
		public void setRoomN(String roomN) {
			this.roomN = roomN;
		}
		public String getRoom() {
			return room;
		}
		public void setRoom(String room) {
			this.room = room;
		}
		public String getMax() {
			return max;
		}
		public void setMax(String max) {
			this.max = max;
		}
		public Integer getFee() {
			return fee;
		}
		public void setFee(Integer fee) {
			this.fee = fee;
		}
		public Integer getAddfee() {
			return addfee;
		}
		public void setAddfee(Integer addfee) {
			this.addfee = addfee;
		}
		public String getChoice() {
			return choice;
		}
		public void setChoice(String choice) {
			this.choice = choice;
		}
		@Override
		public String toString() {
			return "BoardVO [rCode=" + rCode + ", reserDAte=" + reserDate + ", roomN=" + roomN + ", room=" + room
					+ ", max=" + max + ", fee=" + fee + ", addfee=" + addfee + ", choice=" + choice + ", getrCode()="
					+ getrCode() + ", getReserDAte()=" + getReserDAte() + ", getRoomN()=" + getRoomN() + ", getRoom()="
					+ getRoom() + ", getMax()=" + getMax() + ", getFee()=" + getFee() + ", getAddfee()=" + getAddfee()
					+ ", getChoice()=" + getChoice() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
					+ ", toString()=" + super.toString() + "]";
		}
		
		
}
