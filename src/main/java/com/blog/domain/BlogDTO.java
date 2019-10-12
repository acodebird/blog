package com.blog.domain;

public class BlogDTO {
	//查询发表年份
	private String publishYear;
	//查询博客类别
	private Integer typeId;
	//查询关键词
	private String keyWord;
	//查询博客类状态，1表示已发表文章，0表示草稿，默认为已发表文章
	private Integer state = 1;
	//是否携带查询条件，false表示不携带查询条件，true表示携带，默认不携带
	private boolean search = false;
	
	public String getPublishYear() {
		return publishYear;
	}
	public void setPublishYear(String publishYear) {
		this.publishYear = publishYear;
	}
	public Integer getTypeId() {
		return typeId;
	}
	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}
	public String getKeyWord() {
		return keyWord;
	}
	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	
	public boolean isSearch() {
		return search;
	}
	public void setSearch(boolean search) {
		this.search = search;
	}
	@Override
	public String toString() {
		return "BlogDTO [publishYear=" + publishYear + ", typeId=" + typeId + ", keyWord=" + keyWord + ", state="
				+ state + "]";
	}
	
}
