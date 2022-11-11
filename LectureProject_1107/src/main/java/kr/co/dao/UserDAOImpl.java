package kr.co.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

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
	public List<UserVO> userList() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("userMapper.userList");
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

	
	
}
