package com.blog.domain;

public class Account {
	private Integer id;
	private String name;
	private Double money;
	private Double transferMoney;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Double getMoney() {
		return money;
	}
	public void setMoney(Double money) {
		this.money = money;
	}
	public Double getTransferMoney() {
		return transferMoney;
	}
	public void setTransferMoney(Double transferMoney) {
		this.transferMoney = transferMoney;
	}
	
}
