package kr.co.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.vo.LectureVO;
import kr.co.vo.PagingVO;

@Repository
public class BoardDAOImpl implements BoardDAO{

	@Inject
	private SqlSession sqlSession;
		
	// 수강신청 목록 조회
	@Override
	public List<LectureVO> lectureList() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("boardMapper.lectureList");
	}

	
	@Override
	public LectureVO contentList(int lectureNo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("boardMapper.contentList", lectureNo);
	}

	@Override
	public List<LectureVO> teacherList(String id) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("boardMapper.teacherList", id);
	}

	@Override
	public void signList(HashMap<String, Object> param) throws Exception {
		sqlSession.insert("boardMapper.signList", param);
		
	}


	@Override
	public void nowPeopleAdd(int now) throws Exception {
		sqlSession.update("boardMapper.nowPeopleAdd", now);
		
	}


	@Override
	public List<HashMap<String, Object>> addList(int id) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("boardMapper.addList", id);
	}


	@Override
	public int changeId(String id) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("boardMapper.changeId", id);
	}


	@Override
	public int isSign(HashMap<String, Object> signMap) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("boardMapper.isSign", signMap);
	}


	@Override
	public int lectureCount() throws Exception{
		// TODO Auto-generated method stub
		return sqlSession.selectOne("boardMapper.lectureCount");
	}


	@Override
	public List<LectureVO> selectLecture(PagingVO vo) throws Exception{
		// TODO Auto-generated method stub
		return sqlSession.selectList("boardMapper.selectLecture", vo);
	}


	@Override
	public void addLecture(LectureVO vo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("boardMapper.addLecture", vo);
	}





	
}
