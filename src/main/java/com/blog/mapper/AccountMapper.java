package com.blog.mapper;

import com.blog.domain.Account;

public interface AccountMapper {
	//账户加钱操作
	public void increase(Account a);
	//账户扣钱操作
	public void reduce(Account a);
}
