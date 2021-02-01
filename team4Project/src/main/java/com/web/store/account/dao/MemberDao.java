package com.web.store.account.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Set;

import com.web.store.account.javabean.MemberBean;
import com.web.store.account.javabean.MemberNotification;
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
	void delete(MemberNotification memberNotification);
	void delete(MemberBean member);
	List<MemberBean> selectByConditions(int page, int pageSize, String keywordFullname, String keywordEmail, String keywordQid, String columnName, Boolean sortASC ) throws SQLException;
	int getTotalCount() throws SQLException;
	MemberBean checkForgotPasswordCode(byte[] forgotPasswordCode) throws SQLException;
	MemberBean selectByQidEmail(String qid, String email) throws SQLException;
	Set<MemberNotification> getMemberNotificationList(int memberId) throws SQLException;
	void updateWithClear(MemberBean m) throws SQLException;
	int getMemberNotificationCount(int memberId) throws SQLException;
	void updateMemberNotificationIsRead(int mNotificationId) throws SQLException;
	Set<MemberSubscription> getMemberSubscriptionList(int memberId) throws SQLException;
}
