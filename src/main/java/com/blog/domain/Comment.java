package com.blog.domain;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 评论表
 * @author 张小旭
 *
 */
public class Comment {
	private Integer id;//评论id
	private String userIp;//评论的用户ip
	private Blog blog;//评论属于那个博客
	private String content;//评论内容
	private Date commentDate;//评论时间
	private Integer state;//评论状态，0代表删除，1代表正常
	private Integer replyId;//回复那一条评论的id，NULL表示该评论不是回复别人的评论
	private String replyIp;//回复的用户ip
	private Date updateDate;//评论更新时间
	private String commentDateStr;//评论日期的字符串形式
	private List<Comment> replys = new ArrayList<Comment>();//该评论的回复集合
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUserIp() {
		return userIp;
	}
	public void setUserIp(String userIp) {
		this.userIp = userIp;
	}
	public Blog getBlog() {
		return blog;
	}
	public void setBlog(Blog blog) {
		this.blog = blog;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public Integer getReplyId() {
		return replyId;
	}
	public void setReplyId(Integer replyId) {
		this.replyId = replyId;
	}
	public String getReplyIp() {
		return replyIp;
	}
	public void setReplyIp(String replyIp) {
		this.replyIp = replyIp;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	public String getCommentDateStr() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return sdf.format(this.commentDate);
	}
	public void setCommentDateStr(String commentDateStr) {
		this.commentDateStr = commentDateStr;
	}
	public List<Comment> getReplys() {
		return replys;
	}
	public void setReplys(List<Comment> replys) {
		this.replys = replys;
	}
	@Override
	public String toString() {
		return "Comment [id=" + id + ", userIp=" + userIp + ", blog=" + blog + ", content=" + content + ", commentDate="
				+ commentDate + ", state=" + state + ", replyId=" + replyId + ", replyIp=" + replyIp
				+ ", commentDateStr=" + commentDateStr + ", replys=" + replys + "]";
	}
}
