package kr.co.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.vo.PagingVO;
import kr.co.vo.UserVO;

@Repository
public class UserDAOImpl implements UserDAO{

	@Inject
	private SqlSession sqlSession;


	@Override
	public UserVO idCheck(String id) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("userMapper.idCheck", id);
	}


	@Override
	public List<HashMap<String, Object>> userList(PagingVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("userMapper.userList", vo);
	}


	@Override
	public void joinUser(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("userMapper.joinUser", vo);
	}


	@Override
	public UserVO login(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("userMapper.login", vo);
	}


	@Override
	public UserVO oneInfo(String id) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("userMapper.oneInfo", id);
	}


	@Override
	public void updateUser(UserVO vo) throws Exception {
		sqlSession.update("userMapper.updateUser", vo);
		
	}


	@Override
	public String oneAuth(String id) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("userMapper.oneAuth", id);
	}


	@Override
	public int oneNo(String id) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("userMapper.oneNo", id);
	}


	@Override
	public List<HashMap<String, Object>> aprvJoin(PagingVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("userMapper.aprvJoin", vo);
	}


	@Override
	public int countBoard() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("userMapper.countBoard");
	}


	@Override
	public void aprvUser(HashMap<String, Object> param) throws Exception {
		sqlSession.update("userMapper.aprvUser", param);
		
	}


	@Override
	public void refuseUser(HashMap<String, Object> param) throws Exception {
		sqlSession.update("userMapper.refuseUser", param);
		
	}

	
	
}
