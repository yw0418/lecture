package kr.co.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.vo.BoardVO;
import kr.co.vo.LectureVO;
import kr.co.vo.PagingVO;
import kr.co.vo.SearchCriteria;
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
	
	// 기존 수강신청 목록에 있는지 조회
	public int isSign(HashMap<String, Object> signMap) throws Exception;
	
	// 게시물 총 갯수
	public int lectureCount(SearchCriteria cri) throws Exception;

	// 페이징 처리 게시글 조회
	public List<LectureVO> selectLecture(SearchCriteria cri) throws Exception;
	
	// (교사)강의등록
	public void addLecture(LectureVO vo, MultipartHttpServletRequest mpRequest) throws Exception;
	
	//(교사)강의 삭제
	public void delOne(int lectureNo) throws Exception;
	
	//첨부파일 조회
	public List<Map<String, Object>> selectFileList(int bno) throws Exception;
	
	//첨부파일 다운로드
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception;
	
	// (교사) 강의 수정
	public void updateStudy(LectureVO vo) throws Exception;
}
