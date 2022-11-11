package kr.co.vo;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Data;

@Data
public class UserVO {
	
	private int userNo;
	private String name;
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
	private String subNm;
	
	

}
