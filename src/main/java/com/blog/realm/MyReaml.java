package com.blog.realm;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import com.blog.domain.Blogger;
import com.blog.service.BloggerService;

public class MyReaml extends AuthorizingRealm{
	@Autowired
	private BloggerService bloggerService;
	
	//获取授权信息
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		return null;
	}
	//登陆验证，参数token是基于用户名和密码的令牌
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		//从令牌中取出用户名
		String username = (String) token.getPrincipal();
		//shiro验证密码是否正确
		Blogger blogger = bloggerService.getByUsername(username);
		if(blogger!=null) {
			AuthenticationInfo info = new SimpleAuthenticationInfo(blogger.getUsername(), blogger.getPassword(), getName());
			return info;
		}
		return null;
	}

}
