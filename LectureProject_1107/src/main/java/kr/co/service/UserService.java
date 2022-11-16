package kr.co.service;

import java.util.HashMap;
import java.util.List;

import kr.co.vo.UserVO;

public interface UserService {

	//아이디 중복체크
	public UserVO idCheck(String id) throws Exception;
	
	//유저 전체 정보 불러오기
	public List<HashMap<String, Object>> userList() throws Exception;
	
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
}

