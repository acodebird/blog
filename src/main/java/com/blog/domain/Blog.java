package com.blog.domain;

import java.util.Date;

/**
 * 博客
 * @author 张小旭
 *
 */
public class Blog {
	private Integer id;//博客id
	private String title;//博客题目
	private String summary;//博客摘要
	private Date releaseDate;//博客发表时间
	private Integer clickHit;//点击数量
	private Integer replyHi;//回复数量
	private String content;//博客内容
	private BlogType blogType;//博客类型
	private String keyWord;//博客关键词
	private Integer state;//博客状态，1代表发表，0代表草稿
	private String contentStr;//纯文本格式的博客内容
	private String releaseDateStr;//字符串格式的博客发表时间，方便操作
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public Date getReleaseDate() {
		return releaseDate;
	}
	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}
	public Integer getClickHit() {
		return clickHit;
	}
	public void setClickHit(Integer clickHit) {
		this.clickHit = clickHit;
	}
	public Integer getReplyHi() {
		return replyHi;
	}
	public void setReplyHi(Integer replyHi) {
		this.replyHi = replyHi;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public BlogType getBlogType() {
		return blogType;
	}
	public void setBlogType(BlogType blogType) {
		this.blogType = blogType;
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
	public String getContentStr() {
		return contentStr;
	}
	public void setContentStr(String contentStr) {
		this.contentStr = contentStr;
	}
	public String getReleaseDateStr() {
		return releaseDateStr;
	}
	public void setReleaseDateStr(String releaseDateStr) {
		this.releaseDateStr = releaseDateStr;
	}
}
