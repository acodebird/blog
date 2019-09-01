package com.blog.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.blog.domain.BaseBean;
import com.blog.service.BaseService;

@Controller
@RequestMapping(value="/base")
public class BaseController {
	@Resource(type=BaseService.class)
	private BaseService baseService;
	
	@GetMapping(value="/getOneById")
	public @ResponseBody String getOneById(@RequestParam Integer uid) {
		BaseBean bean = baseService.getOneById(uid);
		System.out.println(bean);
		return "成功访问";
	}
	@GetMapping(value="/")
	public String toNewJsp() {
		return "new";
	}
}
