package com.blog.domain;

public class BaseBean {
	private Integer uid;
	private String uname;
	private Integer age;
	private String address;
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	@Override
	public String toString() {
		return "BaseBean [uid=" + uid + ", uname=" + uname + ", age=" + age + ", address=" + address + "]";
	}
	
}
