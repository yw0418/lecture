package kr.co.service;

import java.util.HashMap;
import java.util.List;

import kr.co.vo.BoardVO;
import kr.co.vo.LectureVO;
import kr.co.vo.SignVO;

public interface BoardService {
	
	// 수강신청 목록 조회
	public List<LectureVO> lectureList() throws Exception;
	
	// 글 하나 조회
	public LectureVO contentList(int lectureNo) throws Exception;
	
	// (교사)강의목록 조회
	public List<LectureVO> teacherList(String id) throws Exception;
	
	// 단일 수강신청
	public void signList(HashMap<String, Object> param) throws Exception;
	
	//신청인원 증가
	public void nowPeopleAdd(int now) throws Exception;
	
	// (학생) 수강신청 목록
	public List<HashMap<String, Object>> addList(int id) throws Exception;
	
	// 아이디 번호로 바꾸기
	public int changeId(String id) throws Exception;
}
