package com.web.store.customerService.model;

import java.util.HashSet;
import java.util.Set;

import com.google.gson.annotations.Expose;

public class Customer {
	
	@Expose
	private String id;
	@Expose
	private String type;
	@Expose
	private String nickName;
	private Set<Customer> toSet=new HashSet<Customer>();
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public Set<Customer> getToSet() {
		return toSet;
	}
	public void setToSet(Set<Customer> toSet) {
		this.toSet = toSet;
	}
	
	
}
