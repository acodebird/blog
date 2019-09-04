package com.blog.domain;

/**
 * 博客类型
 * @author 张小旭
 *
 */
public class BlogType {
	private Integer id;//博客类型id
	private String typename;//博客类型名
	private Integer orderNo;//序号
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTypename() {
		return typename;
	}
	public void setTypename(String typename) {
		this.typename = typename;
	}
	public Integer getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(Integer orderNo) {
		this.orderNo = orderNo;
	}
	
}
