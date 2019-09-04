package com.blog.utils;

import java.util.Random;

import org.apache.shiro.crypto.hash.Md5Hash;

import com.blog.domain.Blogger;

public class SecurityTool {
	public static void main(String[] args) {
		Blogger blogger = new Blogger();
		blogger.setPassword("123456");
		blogger.setUsername("admin");
		encrypt(blogger);
		System.out.println(blogger.getUsername()+":"+blogger.getPassword()+":"+blogger.getSalt());
	}
	/*
	 * 对password进行MD5加盐加密，返回加密过的password,并存储盐salt
	 */
	public static void encrypt(Blogger blogger){
		String salt = "";
		Random random = new Random();
		String str = "qwertyuiopasdfghjklzxcvbnm1234567890+-=*;',.";
		for(int i=0;i<15;i++){
			salt += String.valueOf(str.charAt(random.nextInt(str.length())));//从str中随机获取字符生成长度为saltLen的加密盐
		}
		String passwordSalt = new Md5Hash(blogger.getPassword(), salt).toString();
		blogger.setPassword(passwordSalt);
		blogger.setSalt(salt);
	}
	/*
	 * 用于登录时密码验证
	 * 根据用户输入的未加密密码和用户的盐进行解密（实际上同样是MD5加密，只不过加密结果用来判断与数据库中的加密密码是否相同）
	 * 返回解密结果
	 */
	public static String deciphering(String password,Blogger blogger){
		return new Md5Hash(password, blogger.getSalt()).toString();
	}
}
