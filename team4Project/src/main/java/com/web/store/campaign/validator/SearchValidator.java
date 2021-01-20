package com.web.store.campaign.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.web.store.campaign.model.Campaign;
import com.web.store.campaign.model.SearchBean;

public class SearchValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		boolean b = SearchBean.class.isAssignableFrom(clazz);
		return b;
	}

	@Override
	public void validate(Object target, Errors errors) {
		SearchBean search = (SearchBean)target;
		search.convertStringToTimestamp();
		if(search.getStrDate().compareTo(search.getEndDate())>0) {
			errors.rejectValue("endDateStr","","開始時間不得大於結束時間");
		}
	}

}
