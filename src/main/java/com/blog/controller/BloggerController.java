package com.blog.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.blog.domain.Blogger;
import com.blog.service.BloggerService;
import com.blog.utils.SecurityTool;

/**
 * 博主后台controller
 * @author 张小旭
 *
 */
@Controller
@RequestMapping(value="admin")
public class BloggerController {
	@Autowired
	private BloggerService bloggerService;
	
	/**
	 * 博主登录验证
	 * @param blogger
	 * @param request
	 * @return
	 */
	@PostMapping(value="/login")
	public String login(Blogger blogger,HttpServletRequest request) {
		Blogger blogger2 = bloggerService.getByUsername(blogger.getUsername());
		if(blogger2!=null) {
			String password = SecurityTool.deciphering(blogger.getPassword(), blogger2);
			//shiro验证
			Subject subject = SecurityUtils.getSubject();
			UsernamePasswordToken token = new UsernamePasswordToken(blogger.getUsername(),password);
			try {
				//传递token到realm处理，验证成功重定向到后台主视图
				subject.login(token);
				subject.getSession().setAttribute("currentUser", blogger2);
				return "redirect:/views/admin/main.jsp";
			} catch (AuthenticationException e) {
				e.printStackTrace();
			}
		}
		//保存验证失败信息
		request.setAttribute("blogger", blogger);
		request.setAttribute("errorInfo", "账号或密码错误");
		//验证失败回到登陆页面
		return "admin/login";
	}
}
