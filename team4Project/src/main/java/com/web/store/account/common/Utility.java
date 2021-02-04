package com.web.store.account.common;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

public class Utility {

	public static boolean hasValue(String str) {
		if ((str != null) && (str.length() > 0)) {
			return true;
		}
		return false;
	}

	// SHA512加密 - Convert String to byte[]
	public static byte[] encryptUsingSHA512(String input) {
		try {
			// getInstance() method is called with algorithm SHA-512
			MessageDigest md = MessageDigest.getInstance("SHA-512");

			// digest() method is called
			// to calculate message digest of the input string
			// returned as array of byte
			byte[] messageDigest = md.digest(input.getBytes());

			return messageDigest;
		}
		// For specifying wrong message digest algorithms
		catch (NoSuchAlgorithmException e) {
			throw new RuntimeException(e);
		}
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public static <T> Set<T> ConvertListToSet(Collection<T> collection) {
		Set<T> setCollection = new LinkedHashSet<T>();
		for (Iterator iter = collection.iterator(); iter.hasNext();) {
			T obj = (T) iter.next();
			setCollection.add(obj);
		}
		return setCollection;
	}
	

}
