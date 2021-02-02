package com.web.store.admin.service.impl;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.store.account.dao.MemberDao;
import com.web.store.account.javabean.MemberBean;
import com.web.store.admin.service.AdminService;

@Service
@Transactional
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	MemberDao memberDao;
	
	
	@Override
	public List<MemberBean> selectByConditions(int page, int pageSize, String keywordFullname, String keywordEmail, String keywordQid, String columnName, Boolean sortASC ) throws SQLException {
		
		return memberDao.selectByConditions(page, pageSize, keywordFullname.trim(), keywordEmail.trim(), keywordQid.trim(), columnName.trim().toLowerCase(), sortASC );
	}
	
	@Override
	public int getTotalCount() throws SQLException {
		
		return memberDao.getTotalCount();
	}

}
