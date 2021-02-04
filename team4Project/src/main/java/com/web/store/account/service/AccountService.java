package com.web.store.account.service;

import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.List;
import java.util.Set;

import com.web.store.account.javabean.MCoinTopUpDetail;
import com.web.store.account.javabean.MemberBean;
import com.web.store.account.javabean.MemberCreditCard;
import com.web.store.account.javabean.MemberLoginHistory;
import com.web.store.account.javabean.MemberNotification;
import com.web.store.account.javabean.MemberSubscription;

public interface AccountService {

	void insert(MemberBean member) throws Exception;

	List<MemberBean> selectAllMembers() throws Exception;

	MemberBean selectById(String id) throws Exception;

	int deleteById(int id) throws Exception;

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

	void delete(MemberSubscription memberSubscription) throws Exception;

	void mCoinTopUp(MemberBean member, MCoinTopUpDetail mCoinTopUpDetail) throws Exception;

	void delete(MemberNotification memberNotification) throws Exception;

	void addMemberNotification(MemberBean member, int type, String title, String description, String url) throws Exception;

	void delete(MemberBean member);
	
	MemberBean selectWithNotificationById(String id) throws Exception;

	MemberBean checkForgotPasswordCode(byte[] forgotPasswordCode) throws SQLException;
	
	MemberBean selectByQidEmail(String qid, String email) throws SQLException;

	Set<MemberNotification> getMemberNotificationList(int memberId) throws SQLException;

	int getMemberNotificationCount(int memberId) throws SQLException;

	void updateMemberNotificationIsRead(int mNotificationId) throws SQLException;

	Set<MemberSubscription> getMemberSubscriptionList(int memberId) throws SQLException;

	Boolean mCoinSpend(MemberBean member, BigDecimal spendAmount ) throws Exception;
	
	
}