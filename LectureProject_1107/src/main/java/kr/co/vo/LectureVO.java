package kr.co.vo;

import java.sql.Date;
import java.sql.Timestamp;

import javax.validation.constraints.Max;
import javax.validation.constraints.Size;

import lombok.Data;

@Data
public class LectureVO {

	private int lectureNo;
	@Max(2)
	private String title;
	private String content;
	private Timestamp lectureDate;
	private int teacherNo;
	private int nowPeople;
	private int maxPeople;
	private String name;
	private int signNo;
	private int signUserNo;
	private int signLectureNo;
	private Timestamp signDate; 
	private String id;
}
