package kr.co.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.dao.BoardDAO;
import kr.co.util.FileUtils;
import kr.co.vo.BoardVO;
import kr.co.vo.LectureVO;
import kr.co.vo.PagingVO;
import kr.co.vo.SignVO;

@Service
public class BoardServiceImpl implements BoardService{

	@Inject
	private BoardDAO dao;
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
		
	// 수강신청 목록 조회
	@Override
	public List<LectureVO> lectureList() throws Exception {
		// TODO Auto-generated method stub
		return dao.lectureList();
	}

	@Override
	public LectureVO contentList(int lectureNo) throws Exception {
		// TODO Auto-generated method stub
		return dao.contentList(lectureNo);
	}

	@Override
	public List<LectureVO> teacherList(String id) throws Exception {
		// TODO Auto-generated method stub
		return dao.teacherList(id);
	}

	@Override
	public void signList(HashMap<String, Object> param) throws Exception {
		dao.signList(param);
		
	}

	@Override
	public void nowPeopleAdd(int now) throws Exception {
		dao.nowPeopleAdd(now);
		
	}

	@Override
	public List<HashMap<String, Object>> addList(int id) throws Exception {
		// TODO Auto-generated method stub
		return dao.addList(id);
	}

	@Override
	public int changeId(String id) throws Exception {
		// TODO Auto-generated method stub
		return dao.changeId(id);
	}

	@Override
	public int isSign(HashMap<String, Object> signMap) throws Exception {
		// TODO Auto-generated method stub
		return dao.isSign(signMap);
	}

	@Override
	public int lectureCount() throws Exception {
		// TODO Auto-generated method stub
		return dao.lectureCount();
	}

	@Override
	public List<LectureVO> selectLecture(PagingVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectLecture(vo);
	}


	@Override
	public void delOne(int lectureNo) throws Exception {
		dao.delOne(lectureNo);
		
	}

	@Override
	public void addLecture(LectureVO vo, MultipartHttpServletRequest mpRequest) throws Exception {
		
		dao.addLecture(vo);
		
		List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(vo, mpRequest); 
		int size = list.size();
		for(int i=0; i<size; i++){ 
			dao.insertFile(list.get(i)); 
		}
		
	}

	@Override
	public List<Map<String, Object>> selectFileList(int bno) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectFileList(bno);
	}

	@Override
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectFileInfo(map);
	}

	@Override
	public void updateStudy(LectureVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.updateStudy(vo);
	}


}
