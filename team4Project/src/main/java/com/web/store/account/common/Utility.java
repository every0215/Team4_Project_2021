package com.web.store.account.common;

public class Utility {

	public static boolean hasValue(String str ){
		if((str != null)&&(str.length()>0)) {
			return true;
		}
		return false;
	}
}
