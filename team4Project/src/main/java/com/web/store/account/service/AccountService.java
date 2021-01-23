package com.web.store.account.service;

import java.sql.SQLException;
import java.util.List;

import com.web.store.account.javabean.MemberBean;
import com.web.store.account.javabean.MemberCreditCard;
import com.web.store.account.javabean.MemberLoginHistory;

public interface AccountService {

	void insert(MemberBean member) throws Exception;

	List<MemberBean> selectAllMembers() throws Exception;

	MemberBean selectById(String id) throws Exception;

	int deleteById(int id) throws Exception;

//	int update(MemberBean member) throws Exception;

	int updateProfileImages(MemberBean member) throws Exception;

	void insert(MemberLoginHistory mlh) throws Exception;

	List<MemberLoginHistory> selectAllMemberLoginHists() throws Exception;

	MemberBean selectByLoginInfo(String email, String pwd) throws Exception;

	int updateVerified(MemberBean m) throws SQLException;

	int updateActive(MemberBean m) throws SQLException;

	void insert(MemberCreditCard mCreditCard) throws Exception;

//	List<MemberCreditCard> selectAllMemberCreditCards() throws Exception;

	int deleteMemberCreditCardById(int memberCreditCardId) throws Exception;

	int updatePassword(MemberBean member) throws Exception;

	int updateNickname(MemberBean member) throws Exception;

	void update(MemberBean member) throws Exception;

}