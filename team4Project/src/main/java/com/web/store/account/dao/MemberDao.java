package com.web.store.account.dao;

import java.sql.SQLException;
import java.util.List;

import com.web.store.account.javabean.MemberBean;
import com.web.store.account.javabean.MemberSubscription;

public interface MemberDao {
	List<MemberBean> selectAll() throws SQLException;
	MemberBean selectById(int id) throws SQLException;
	void insert(MemberBean m) throws SQLException;
	int deleteById(int id) throws SQLException;
	void update(MemberBean m) throws SQLException;
	int updateNickname(MemberBean m) throws SQLException;
	int updateProfileImages(MemberBean m) throws SQLException;
	MemberBean selectByLoginInfo(String email, String pwd) throws SQLException;
	int updateVerified(MemberBean m) throws SQLException;
	int updateActive(MemberBean m) throws SQLException;
	int updatePassword(MemberBean m) throws SQLException;
	void delete(MemberSubscription memberSubscription);
}
