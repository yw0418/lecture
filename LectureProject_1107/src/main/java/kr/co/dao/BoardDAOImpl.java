package kr.co.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.vo.BoardVO;
import kr.co.vo.LectureVO;

@Repository
public class BoardDAOImpl implements BoardDAO{

	@Inject
	private SqlSession sqlSession;
	

	// 게시글 작성
	@Override
	public void write(BoardVO boardVO) throws Exception {
		sqlSession.insert("boardMapper.insert", boardVO);
		
	}

	// 게시물 목록 조회
	@Override
	public List<BoardVO> list() throws Exception {
	
		return sqlSession.selectList("boardMapper.list");

	}

	
	
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


	
}
