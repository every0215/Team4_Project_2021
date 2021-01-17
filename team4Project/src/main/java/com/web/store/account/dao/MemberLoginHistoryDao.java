package com.web.store.account.dao;

import java.sql.SQLException;
import java.util.List;

import com.web.store.account.javabean.MemberLoginHistory;

public interface MemberLoginHistoryDao {

	List<MemberLoginHistory> selectAll() throws SQLException;

	void insert(MemberLoginHistory memberLoginHist) throws SQLException;

}