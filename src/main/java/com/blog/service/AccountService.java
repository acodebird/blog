package com.blog.service;

import com.blog.domain.Account;

public interface AccountService {
	//转账操作:账户a给账户b转账
	public void transfer(Account a,Account b);
}
