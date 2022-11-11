package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.dao.UserDAO;
import kr.co.vo.UserVO;

@Service
public class UserServiceImpl implements UserService {

	@Inject
	private UserDAO dao;

	@Override
	public UserVO idCheck(String id) throws Exception {
		// TODO Auto-generated method stub
		return dao.idCheck(id);
	}

	@Override
	public List<UserVO> userList() throws Exception {
		// TODO Auto-generated method stub
		return dao.userList();
	}

	@Override
	public void joinUser(UserVO vo) throws Exception {
		dao.joinUser(vo);
		
	}

	@Override
	public UserVO login(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.login(vo);
	}
}
