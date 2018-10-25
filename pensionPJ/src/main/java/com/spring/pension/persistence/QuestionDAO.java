package com.spring.pension.persistence;

import java.util.List;

import com.spring.pension.domain.Criteria;
import com.spring.pension.domain.QuestionVO;
import com.spring.pension.domain.SearchCriteria;

public interface QuestionDAO {
	
	//질문등록
	public void creat(QuestionVO questionVO) throws Exception;
	//1. 천체글 목록 보여주기
	public List<QuestionVO>listAll() throws Exception;
	//2. 전체글 목록 보여주기: 페이징 처리후 (파라미터로 page를 받아와야 함)
	public List<QuestionVO>listPage(int page) throws Exception;
	//3. 전체글 목록 보여주기: 페이징 처리를 도와주는 criteria 
	public List<QuestionVO>listCriteria(Criteria cri) throws Exception;
	//4. 게시글 목록 보여주기  검색결과에 따라서 따라서 게시물 가지고 오는 부분 
	public List<QuestionVO> listSearch(SearchCriteria cri) throws Exception;
	//1). 총 게시물 수를 구하기 위한 부분 (총게시물에 따라서 페이징 처리를 해야 하기때문에)
	public int countPaging(Criteria cri) throws Exception;
	//2). 총 게시물 수를 구하기 위한 부분 :색결과물의 갯수를 가지고 오는 부분 
	public int listSearchConunt(SearchCriteria cri) throws Exception;
	//비밀번호(qno와 일치하는 password) 받아오는 부분
	public String getPassword(int qno,String passowrd) throws Exception;
	//게시글 상세 페이지 보여주는 부분 
	public QuestionVO read(Integer qno, String password) throws Exception;
	//조회수 증가 시키기 
	public void updateViewCnt(Integer qno) throws Exception;
	//게시물 삭제 하기
	public void delete(Integer qno) throws Exception;
	//게시물 수정하기 
	public void modify(QuestionVO questionVO) throws Exception;
	//qno와 일치하는 Vo가지고 오기
	public QuestionVO getQno(Integer qno) throws Exception;
	// 댓글 갯수 업데이트 하는  부분
	public void updateReplyCnt(Integer qno,int amount) throws Exception;
	//이전 게시물과 다음 게시물에 대한 정보
	public List<QuestionVO> preNePage(Integer qno) throws Exception;
}
