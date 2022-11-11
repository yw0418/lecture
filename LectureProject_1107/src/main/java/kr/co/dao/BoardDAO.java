package kr.co.dao;

import java.util.List;

import kr.co.vo.BoardVO;
import kr.co.vo.LectureVO;

public interface BoardDAO {

	// 게시글 작성
	public void write(BoardVO boardVO) throws Exception;
	
	// 게시물 목록 조회
	public List<BoardVO> list() throws Exception;
	
	
	
	//아래부터
	
	// 수강신청 목록 조회
	public List<LectureVO> lectureList() throws Exception;
	
	// 글 하나 조회
	public LectureVO contentList(int lectureNo) throws Exception;
	
	// (교사)강의목록 조회
	public List<LectureVO> teacherList(String id) throws Exception;
	
}
