package com.web.store.account.service.impl;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.store.account.dao.MemberCreditCardDao;
import com.web.store.account.dao.MemberDao;
import com.web.store.account.dao.MemberLoginHistoryDao;
import com.web.store.account.javabean.MemberBean;
import com.web.store.account.javabean.MemberCreditCard;
import com.web.store.account.javabean.MemberLoginHistory;
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
	public void delete(MemberSubscription memberSubscription) throws Exception {
		memberDao.delete(memberSubscription);

	}
	
	//
	// 會員儲值
	//
//	@Override
//	public void insert(MCoinTopUpDetail mCoinTopUpDetail) throws Exception {
//		mCreditCardDao.insert(mCreditCard);
//
//	}
//	
//	
//	@Override
//	public int deleteMCoinTopUpDetailById(int mCoinTopUpDetailId) throws Exception {
//		int result = mCreditCardDao.deleteById(mCoinTopUpDetailId);
//
//		return result;
//	}


}
