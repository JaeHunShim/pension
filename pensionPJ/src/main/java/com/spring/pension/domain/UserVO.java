package com.spring.pension.domain;

public class UserVO {
	
	private String user_id; 
    private String user_password; 
    private String user_name; 
    private String user_address; 
    private String user_email; 
    private String user_phone;
	
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
				+ ", user_address=" + user_address + ", user_email=" + user_email + ", user_phone=" + user_phone
				+ ", getUser_id()=" + getUser_id() + ", getUser_password()=" + getUser_password() + ", getUser_name()="
				+ getUser_name() + ", getUser_address()=" + getUser_address() + ", getUser_email()=" + getUser_email()
				+ ", getUser_phone()=" + getUser_phone() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}
}
