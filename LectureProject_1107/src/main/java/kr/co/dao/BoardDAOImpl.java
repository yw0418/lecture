package kr.co.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.vo.LectureVO;
import kr.co.vo.PagingVO;
import kr.co.vo.SearchCriteria;

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
	public int lectureCount(SearchCriteria cri) throws Exception{
		// TODO Auto-generated method stub
		return sqlSession.selectOne("boardMapper.lectureCount", cri);
	}


	@Override
	public List<LectureVO> selectLecture(SearchCriteria cri) throws Exception{
		// TODO Auto-generated method stub
		return sqlSession.selectList("boardMapper.selectLecture", cri);
	}


	@Override
	public void addLecture(LectureVO vo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("boardMapper.addLecture", vo);
	}


	@Override
	public void delOne(int lectureNo) throws Exception {
		sqlSession.delete("boardMapper.delOne", lectureNo);
		
	}


	@Override
	public void insertFile(Map<String, Object> map) throws Exception {
		sqlSession.insert("boardMapper.insertFile", map);
		
	}


	@Override
	public List<Map<String, Object>> selectFileList(int bno) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("boardMapper.selectFileList", bno);
	}


	@Override
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("boardMapper.selectFileInfo", map);
	}


	@Override
	public void updateFile(Map<String, Object> map) throws Exception {
		sqlSession.update("boardMapper.updateFile", map);
		
	}


	@Override
	public void updateStudy(LectureVO vo) throws Exception {
		sqlSession.update("boardMapper.updateStudy", vo);
		
	}





	
}
