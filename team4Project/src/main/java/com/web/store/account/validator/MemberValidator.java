package com.web.store.account.validator;

import java.util.regex.Pattern;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.web.store.account.javabean.MemberBean;

@Component
public class MemberValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return MemberBean.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {

		ValidationUtils.rejectIfEmpty(errors, "fullname", "memberBean.fullname.empty", "不可為空白");
		ValidationUtils.rejectIfEmpty(errors, "nickname", "memberBean.nickname.empty", "不可為空白");
		ValidationUtils.rejectIfEmpty(errors, "qid", "memberBean.qid.empty", "不可為空白");
		ValidationUtils.rejectIfEmpty(errors, "email", "memberBean.email.empty", "不可為空白");
		ValidationUtils.rejectIfEmpty(errors, "pwd", "memberBean.pwd.empty", "不可為空白");
		ValidationUtils.rejectIfEmpty(errors, "pwd2", "memberBean.pwd2.empty", "不可為空白");
		
		// ValidationUtils.rejectIfEmpty(errors, "Country",
		// "memberBean.Country.empty","Country不可為空白");

		MemberBean member = (MemberBean) target;
		
		// fullname檢查
		if (member.getFullname().length() < 2) {
			errors.rejectValue("fullname", "memberBean.fullname.invalid", "至少2個字以上");
		} 
		else {
			Pattern pattern = Pattern.compile("[,./;\\[\\]\\\\\\|{}`~!@#$%^&*()\\'+= ]+", Pattern.CASE_INSENSITIVE);
			if ((pattern.matcher(member.getFullname()).matches())) {
				errors.rejectValue("fullname", "memberBean.fullname.invalid", "不可有特殊字元");
			}
		}
		
		// nickname檢查
		if ((member.getNickname().length() < 5) || (member.getNickname().length() > 30)) {
			errors.rejectValue("nickname", "memberBean.nickname.invalid", "5個到30個字");
        }
        else {
        	Pattern pattern = Pattern.compile("[,./;\\[\\]\\\\\\|{}`~!@#$%^&*()\\'+=]+", Pattern.CASE_INSENSITIVE);
			if ((pattern.matcher(member.getNickname()).matches())) {
				errors.rejectValue("nickname", "memberBean.nickname.invalid", "不可有特殊字元");
			}
        }
		
		// qid檢查
		if ((member.getQid().length() != 10)) {
			errors.rejectValue("qid", "memberBean.qid.invalid", "身份證字號長度錯誤");
		} 
		else {
			Pattern pattern = Pattern.compile("^[A-Z][1-2]\\d{8}$", Pattern.CASE_INSENSITIVE);
			if (!(pattern.matcher(member.getQid()).matches())) {
				errors.rejectValue("qid", "memberBean.qid.invalid", "身份證格式錯誤");
			}
		}

		//email檢查
		Pattern emailPattern = Pattern.compile("^\\w+((-\\w+)|(\\.\\w+))*\\@[A-Za-z0-9]+((\\.|-)[A-Za-z0-9]+)*\\.[A-Za-z]+$",
				Pattern.CASE_INSENSITIVE);
		if (!(emailPattern.matcher(member.getEmail()).matches())) {
			errors.rejectValue("email", "memberBean.email.invalid", "電子郵件格式錯誤");
		}
		
		//密碼檢查
		if ((member.getPwd().length() < 8) || (member.getPwd().length() > 20)) {
			errors.rejectValue("pwd", "memberBean.pwd.invalid", "請輸入8-20個字");
        }
        else {
            //必須包含英文字母、數字、特殊字元[!@#$%^&*]
        	Pattern pattern1 = Pattern.compile("(.*[a-z].*)", Pattern.CASE_INSENSITIVE);
        	Pattern pattern2 = Pattern.compile("(.*[0-9].*)", Pattern.CASE_INSENSITIVE);
        	Pattern pattern3 = Pattern.compile("(.*[~!@#\\$%\\^\\&*].*)", Pattern.CASE_INSENSITIVE);
    		if (!(pattern1.matcher(member.getPwd()).matches()) || !(pattern2.matcher(member.getPwd()).matches()) || !(pattern3.matcher(member.getPwd()).matches())) {
    			errors.rejectValue("pwd", "memberBean.pwd.invalid", "必須包含英文字母、數字、特殊字元[~!@#$%^&*]");
    		}
        }
        
      	//password2的check
        if( !member.getPwd().equals(member.getPwd2()) ){
        	errors.rejectValue("pwd2", "memberBean.pwd2.invalid", "密碼不一致");
        }

        //print out all errors
        for (Object object : errors.getAllErrors()) {
            if(object instanceof FieldError) {
                FieldError fieldError = (FieldError) object;
                System.out.println(fieldError.getField()+ ": "+ fieldError.getRejectedValue() +" ("+fieldError.getCode()+")");
            }

            if(object instanceof ObjectError) {
                ObjectError objectError = (ObjectError) object;
                System.out.println(objectError.getObjectName()+ ": "+ objectError.getDefaultMessage() +" ("+objectError.getCode()+")");
            }
        }
	}

}
