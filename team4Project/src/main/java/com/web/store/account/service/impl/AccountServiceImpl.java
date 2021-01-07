package com.web.store.account.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.store.account.dao.MemberDao;
import com.web.store.account.dao.MemberLoginHistoryDao;
import com.web.store.account.javabean.MemberBean;
import com.web.store.account.javabean.MemberLoginHistory;

@Service
@Transactional
public class AccountServiceImpl {
	
	@Autowired
	MemberDao memberDao;
	
	@Autowired
	MemberLoginHistoryDao mlhDao;
	
	
	public void insert(MemberBean member) throws Exception {
		memberDao.insert(member);

	}
	
	public List<MemberBean> selectAllMembers() throws Exception {
		List<MemberBean> members = memberDao.selectAll();

		return members;
	}
	
	public MemberBean selectById(String id) throws Exception {
		int memberId = Integer.parseInt(id);
		MemberBean member = memberDao.selectById(memberId);

		return member;
	}
	
	public int deleteById(int memberId) throws Exception {
		int result = memberDao.deleteById(memberId);

		return result;
	}

	public int update(MemberBean member) throws Exception {
		int result = memberDao.updateNickName(member);

		return result;
	}
	
	public int updateProfileImages(MemberBean member) throws Exception {
		int result = memberDao.updateProfileImages(member);

		return result;
	}
	
	//
	public void insert(MemberLoginHistory mlh) throws Exception {
		mlhDao.insert(mlh);

	}
	
	public List<MemberLoginHistory> selectAllMemberLoginHists() throws Exception {
		return mlhDao.selectAll();
	}
}
