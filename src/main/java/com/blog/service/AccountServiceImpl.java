package com.blog.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.blog.domain.Account;
import com.blog.mapper.AccountMapper;

@Service
@Transactional(isolation=Isolation.DEFAULT,propagation=Propagation.REQUIRED,readOnly=false)
public class AccountServiceImpl implements AccountService {
	@Autowired
	private AccountMapper accountMapper;
	
	@Override
	public void transfer(Account a, Account b) {
		//扣钱
		accountMapper.reduce(a);
		
		//异常
		//int x=1/0;
		
		//减钱
		accountMapper.increase(b);
	}

}
