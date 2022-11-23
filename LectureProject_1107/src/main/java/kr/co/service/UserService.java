package kr.co.service;

import java.util.HashMap;
import java.util.List;

import kr.co.vo.Criteria;
import kr.co.vo.PagingVO;
import kr.co.vo.SearchCriteria;
import kr.co.vo.UserVO;

public interface UserService {

	//아이디 중복체크
	public UserVO idCheck(String id) throws Exception;
	
	//유저 전체 정보 불러오기
	public List<HashMap<String, Object>> userList(SearchCriteria cri) throws Exception;
	
	//회원가입
	public void joinUser(UserVO vo) throws Exception;
	
	//로그인
	public UserVO login(UserVO vo) throws Exception;
	
	//한명의 회원정보 불러오기
	public UserVO oneInfo(String id) throws Exception;
	
	//정보수정
	public void updateUser(UserVO vo) throws Exception;
	
	//권한찾기
	public String oneAuth(String id) throws Exception;
	
	//유저번호 찾기
	public int oneNo(String id) throws Exception;
	
	//승인상태 확인
	public List<HashMap<String, Object>> aprvJoin(PagingVO vo) throws Exception;
	
	// 유저 총 갯수
	public int countBoard(SearchCriteria cri);
	
	// 가입승인
	public void aprvUser(HashMap<String, Object> param) throws Exception;
	
	// 가입거절
	public void refuseUser(HashMap<String, Object> param) throws Exception;
}

