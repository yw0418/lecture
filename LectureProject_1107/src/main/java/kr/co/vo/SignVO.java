package kr.co.vo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class SignVO {
	private int signNo;
	private int signUserNo;
	private int signLectureNo;
	private Timestamp signDate;
}
