package com.blog.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.blog.domain.Account;
import com.blog.service.AccountService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext-core.xml")
public class TestAccountService {
	@Autowired
	private AccountService accountService;
	
	@Test
	public void test1() {
		Double transferMoney = 1000d;
		Account a = new Account();
		Account b = new Account();
		a.setId(1);
		b.setId(2);
		a.setTransferMoney(transferMoney);
		b.setTransferMoney(transferMoney);
		accountService.transfer(a, b);
	}
}
