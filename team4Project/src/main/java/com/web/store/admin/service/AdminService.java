package com.web.store.admin.service;

import java.sql.SQLException;
import java.util.List;

import com.web.store.account.javabean.MemberBean;

public interface AdminService {

	List<MemberBean> selectByConditions(int page, int pageSize, String keywordFullname, String keywordEmail, String keywordQid, String columnName, Boolean sortASC ) throws SQLException;

	int getTotalCount() throws SQLException;

}