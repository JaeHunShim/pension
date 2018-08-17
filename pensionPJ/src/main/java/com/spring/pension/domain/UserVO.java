package com.spring.pension.domain;

public class UserVO {
	
	private String user_id; //아이디
    private String user_password; //패스워드
    private String user_name; //이름
    private String user_address; //주소
    private String user_email; //이메일
    private String user_authorization; //인증번호
    private String user_phone; //폰번호
    private String user_address2; //자세한 주소 
    
    
	public String getUser_address2() {
		return user_address2;
	}
	public void setUser_address2(String user_address2) {
		this.user_address2 = user_address2;
	}
	public String getUser_authorization() {
		return user_authorization;
	}
	public void setUser_authorization(String user_authorization) {
		this.user_authorization = user_authorization;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_password() {
		return user_password;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_address() {
		return user_address;
	}
	public void setUser_address(String user_address) {

		this.user_address = user_address;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	@Override
	public String toString() {
		return "UserVO [user_id=" + user_id + ", user_password=" + user_password + ", user_name=" + user_name
				+ ", user_address=" + user_address + ", user_email=" + user_email + ", user_authorization="
				+ user_authorization + ", user_phone=" + user_phone + ", user_address2=" + user_address2
				+ ", getUser_address2()=" + getUser_address2() + ", getUser_authorization()=" + getUser_authorization()
				+ ", getUser_id()=" + getUser_id() + ", getUser_password()=" + getUser_password() + ", getUser_name()="
				+ getUser_name() + ", getUser_address()=" + getUser_address() + ", getUser_email()=" + getUser_email()
				+ ", getUser_phone()=" + getUser_phone() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}
	
}
