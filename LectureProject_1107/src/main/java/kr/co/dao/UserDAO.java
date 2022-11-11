package kr.co.dao;

import java.util.List;

import kr.co.vo.LectureVO;
import kr.co.vo.UserVO;


public interface UserDAO {

	//아이디 중복체크
	public UserVO idCheck(String id) throws Exception;
	
	//유저 전체 정보 불러오기
	public List<UserVO> userList() throws Exception;
	
	//회원가입
	public void joinUser(UserVO vo) throws Exception;
	
	//로그인
	public UserVO login(UserVO vo) throws Exception;
}
