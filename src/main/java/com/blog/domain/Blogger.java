package com.blog.domain;

/**
 * 博主
 * @author 张小旭
 *
 */
public class Blogger {
	private Integer id;//博主id
	private String username;//账户名
	private String password;//密码
	private String profile;//个人信息
	private String nickname;//昵称
	private String sign;//个性签名
	private String image;//头像
	private String salt;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getSign() {
		return sign;
	}
	public void setSign(String sign) {
		this.sign = sign;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getSalt() {
		return salt;
	}
	public void setSalt(String salt) {
		this.salt = salt;
	}
	@Override
	public String toString() {
		return "Blogger [id=" + id + ", username=" + username + ", password=" + password + ", profile=" + profile
				+ ", nickname=" + nickname + ", sign=" + sign + ", image=" + image + ", salt=" + salt + "]";
	}
}
