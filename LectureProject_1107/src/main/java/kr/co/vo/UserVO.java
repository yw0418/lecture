package kr.co.vo;

import java.sql.Date;
import java.sql.Timestamp;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
public class UserVO {
	
	private int userNo;
	
	private String name;
	
	@Size(min=100, max=200, message = "dddd")
	private String id;
	
	private String password;
	
	private String deptName;
	
	private String mail;
	
	private String phone;
	
	private String userStatus;
	
	private String auth;
	
	private String authKey;
	
	private String authIs;
	
	private String delFlag;
	
	private Timestamp regDtm;
	
	

}
