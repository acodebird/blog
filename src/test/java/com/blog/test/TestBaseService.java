package com.blog.test;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.blog.domain.BaseBean;
import com.blog.service.BaseService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext-core.xml")
public class TestBaseService {
	@Resource(type=BaseService.class)
	private BaseService baseService;
	
	@Test
	public void test1() {
		BaseBean bean = baseService.getOneById(15);
		System.out.println(bean);
	}
}
