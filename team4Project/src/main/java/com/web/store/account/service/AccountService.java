package com.web.store.account.service;

import java.util.List;

import com.web.store.account.javabean.MemberBean;

public interface AccountService {

	void insert(MemberBean member) throws Exception;

	List<MemberBean> selectAllMembers() throws Exception;

	MemberBean selectById(String id) throws Exception;

	int deleteById(String id) throws Exception;

	int update(MemberBean member) throws Exception;

	int updateProfileImages(MemberBean member) throws Exception;

}