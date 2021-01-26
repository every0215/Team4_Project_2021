package com.web.store.account.dao;

import java.sql.SQLException;
import java.util.List;

import com.web.store.account.javabean.MemberCreditCard;

public interface MemberCreditCardDao {

	MemberCreditCard selectById(int id) throws SQLException;

	void insert(MemberCreditCard mCreditCard) throws SQLException;

	int deleteById(int id);

}