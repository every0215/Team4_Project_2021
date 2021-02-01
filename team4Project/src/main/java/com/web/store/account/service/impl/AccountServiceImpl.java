package com.web.store.account.service.impl;

import java.math.BigDecimal;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.store.account.dao.MemberCreditCardDao;
import com.web.store.account.dao.MemberDao;
import com.web.store.account.dao.MemberLoginHistoryDao;
import com.web.store.account.javabean.MCoin;
import com.web.store.account.javabean.MCoinTopUpDetail;
import com.web.store.account.javabean.MemberBean;
import com.web.store.account.javabean.MemberCreditCard;
import com.web.store.account.javabean.MemberLoginHistory;
import com.web.store.account.javabean.MemberNotification;
import com.web.store.account.javabean.MemberSubscription;
import com.web.store.account.service.AccountService;

@Service
@Transactional
public class AccountServiceImpl implements AccountService {
	
	@Autowired
	MemberDao memberDao;
	
	@Autowired
	MemberLoginHistoryDao mlhDao;
	
	@Autowired
	MemberCreditCardDao mCreditCardDao;
	
	@Override
	public void insert(MemberBean member) throws Exception {
		memberDao.insert(member);

	}
	
	@Override
	public void update(MemberBean member) throws Exception {
		memberDao.update(member);

	}
	
	
	@Override
	public List<MemberBean> selectAllMembers() throws Exception {
		List<MemberBean> members = memberDao.selectAll();

		return members;
	}
	
	@Override
	public MemberBean selectById(String id) throws Exception {
		int memberId = Integer.parseInt(id);
		MemberBean member = memberDao.selectById(memberId);

		return member;
	}
	
	@Override
	public MemberBean selectByLoginInfo(String email, String pwd) throws Exception {
		MemberBean member = memberDao.selectByLoginInfo(email, pwd);

		return member;
	}
	
	@Override
	public MemberBean selectByQidEmail(String qid, String email) throws SQLException {
		
		return memberDao.selectByQidEmail(qid, email);
	}
	
	@Override
	public MemberBean checkForgotPasswordCode(byte[] forgotPasswordCode) throws SQLException {
		
		return memberDao.checkForgotPasswordCode(forgotPasswordCode);
	}
	
	@Override
	public int deleteById(int memberId) throws Exception {
		int result = memberDao.deleteById(memberId);

		return result;
	}

	@Override
	public int updatePassword(MemberBean member) throws Exception {
		int result = memberDao.updatePassword(member);

		return result;
	}
	
	@Override
	public int updateNickname(MemberBean member) throws Exception {
		int result = memberDao.updateNickname(member);

		return result;
	}
	
	@Override
	public int updateProfileImages(MemberBean member) throws Exception {
		int result = memberDao.updateProfileImages(member);

		return result;
	}
	
	@Override
	public int updateVerified(MemberBean m) throws SQLException {
		return memberDao.updateVerified(m);
		
	}
	
	@Override
	public int updateActive(MemberBean m) throws SQLException {
		return memberDao.updateActive(m);
		
	}
	
	@Override
	public void insert(MemberLoginHistory mlh) throws Exception {
		mlhDao.insert(mlh);

	}
	
	@Override
	public List<MemberLoginHistory> selectAllMemberLoginHists() throws Exception {
		return mlhDao.selectAll();
	}

	//
	// 會員信用卡功能
	//
	@Override
	public void insert(MemberCreditCard mCreditCard) throws Exception {
		mCreditCardDao.insert(mCreditCard);

	}

	
	@Override
	public int deleteMemberCreditCardById(int memberCreditCardId) throws Exception {
		int result = mCreditCardDao.deleteById(memberCreditCardId);

		return result;
	}
	
	@Override
	public void delete(MemberBean member) {
		memberDao.delete(member);

	}
	
	@Override
	public Set<MemberSubscription> getMemberSubscriptionList(int memberId) throws SQLException {
		return memberDao.getMemberSubscriptionList(memberId);
	}
	
	@Override
	public void delete(MemberSubscription memberSubscription) throws Exception {
		memberDao.delete(memberSubscription);

	}
	
	@Override
	public void delete(MemberNotification memberNotification) throws Exception {
		memberDao.delete(memberNotification);

	}
	
	//
	// 會員儲值
	//
	@Override
	public void mCoinTopUp(MemberBean member, MCoinTopUpDetail mCoinTopUpDetail) throws Exception {
		if (member.getmCoin() == null) {
			MCoin mCoin = new MCoin();
			mCoin.setBalance(new BigDecimal(0));
			mCoin.setMember(member);
			member.setmCoin(mCoin);
		}
		
		member.getmCoin().setBalance(member.getmCoin().getBalance().add(mCoinTopUpDetail.getTopUpAmount()));
		
		update(member);
	}
	
	//
	// 會員通知
	//
	@Override
	public Set<MemberNotification> getMemberNotificationList(int memberId) throws SQLException {
		
		return memberDao.getMemberNotificationList(memberId);	
	}
	
	@Override
	public int getMemberNotificationCount(int memberId) throws SQLException {
		
		return memberDao.getMemberNotificationCount(memberId);
	}
	
	@Override
	public void updateMemberNotificationIsRead(int mNotificationId) throws SQLException {
		
		memberDao.updateMemberNotificationIsRead(mNotificationId);
	}
	
	@Override
	public void addMemberNotification(MemberBean member, int type, String title, String description, String url) throws Exception {
		//Set<MemberNotification> mNotificationList  = memberDao.getMemberNotificationList(member.getId());
//		if (member.getMemberNotificationList() == null ) {
//			mNotificationList = new LinkedHashSet<MemberNotification>();
//			member.setMemberNotificationList(mNotificationList);
//		}
		MemberNotification mNotification = new MemberNotification();
		mNotification.setType(type);
		mNotification.setTitle(title);
		mNotification.setDescription(description);
		mNotification.setMember(member);
		mNotification.setRead(false);
		mNotification.setUrl(url);
		mNotification.setCreatedDate(new Timestamp(System.currentTimeMillis()));

		member.getMemberNotificationList().add(mNotification);
		
		memberDao.update(member);
	}

	@Override
	public MemberBean selectWithNotificationById(String id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	
//	@Override
//	public int deleteMCoinTopUpDetailById(int mCoinTopUpDetailId) throws Exception {
//		int result = mCreditCardDao.deleteById(mCoinTopUpDetailId);
//
//		return result;
//	}


}
