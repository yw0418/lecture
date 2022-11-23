package kr.co.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.dao.UserDAO;
import kr.co.vo.Criteria;
import kr.co.vo.PagingVO;
import kr.co.vo.SearchCriteria;
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
	public List<HashMap<String, Object>> userList(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.userList(cri);
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

	@Override
	public UserVO oneInfo(String id) throws Exception {
		// TODO Auto-generated method stub
		return dao.oneInfo(id);
	}

	@Override
	public void updateUser(UserVO vo) throws Exception {
		dao.updateUser(vo);
		
	}

	@Override
	public String oneAuth(String id) throws Exception {
		// TODO Auto-generated method stub
		return dao.oneAuth(id);
	}

	@Override
	public int oneNo(String id) throws Exception {
		// TODO Auto-generated method stub
		return dao.oneNo(id);
	}

	@Override
	public List<HashMap<String, Object>> aprvJoin(PagingVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.aprvJoin(vo);
	}

	@Override
	public int countBoard(SearchCriteria cri) {
		// TODO Auto-generated method stub
		return dao.countBoard(cri);
	}

	@Override
	public void aprvUser(HashMap<String, Object> param) throws Exception {
		dao.aprvUser(param);
		
	}

	@Override
	public void refuseUser(HashMap<String, Object> param) throws Exception {
		dao.refuseUser(param);
		
	}
}
