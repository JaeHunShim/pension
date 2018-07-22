package com.spring.pension.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.spring.pension.domain.Criteria;
import com.spring.pension.domain.PageMaker;
import com.spring.pension.domain.ReplyVO;
import com.spring.pension.service.ReplyService;

@RestController
@RequestMapping("/reply")
public class ReplyController {

	@Inject
	private ReplyService replyService;
	
	private static final Logger logger = LoggerFactory.getLogger(ReplyController.class);
	// 질문 게시판에서 댓글 등록(ajax처리로 해야 하기때문에  json 형태로 넘어온 데이터를 RequestBody로 겍체화 시킴) 
	@RequestMapping(value="",method=RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody ReplyVO replyVO) throws Exception {
		System.out.println("댓글에서 받아오는 데이터 " + replyVO);
		ResponseEntity<String> entity = null;
		
		try {
			replyService.addReply(replyVO);
			entity = new ResponseEntity<String>("success",HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	// 1. 댓글 목록 보여주기 (PathVariable을 이욯해서 uri 상에 원하는 데이터를 가지고 옴)
	@RequestMapping(value="/all/{qno}",method=RequestMethod.GET)
	public ResponseEntity<List<ReplyVO>> list(@PathVariable("qno") Integer qno) throws Exception {
		
		ResponseEntity<List<ReplyVO>> entity = null;
		
		try {
			entity = new ResponseEntity<>(replyService.listReply(qno),HttpStatus.OK);
			
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	// 2. 댓글 목록 보여주기 (PathVariable을 이욯해서 uri 상에 원하는 데이터를 가지고 옴, 페이징 처리 하기 위해서 Criteria 사용)
	@RequestMapping(value="/{qno}/{page}", method= RequestMethod.GET)
	public ResponseEntity<Map<String,Object>> listPage(@PathVariable("qno") Integer qno,@PathVariable("page") Integer page) throws Exception {
		
		ResponseEntity<Map<String,Object>> entity = null;
		
		try {
			// 1) uri에서 받아온 page를 set해줌
			logger.info("받아오는 page번호: " + page.toString());
			Criteria cri = new Criteria();
			cri.setPage(page);
			// 2) set해준 page를 포함한 cri정보를 pageMaker에 set
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			// 3) qno와 cri 정보를 map에 담아서 view에 보냄 (view단에서 lit분해해서 써먹어야함)
			Map<String,Object> map = new HashMap<String,Object>();
			List<ReplyVO> list = replyService.listReplyPage(qno, cri);
			map.put("list", list);
			// 4) 총게시물수도 마찬가지로 map에 같이 담아서 뷰로 보냄 
			int replyCount = replyService.count(qno);
			pageMaker.setTotalCount(replyCount);
			map.put("pageMaker", pageMaker);
			entity = new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);
			
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	// 댓글 수정하는 부분 (파라미터로 uri에 rno와 RequestBody로 ajax 로 넘어온 json데이터를 객체로 만들어줌 )
	@RequestMapping(value="/{rno}",method= {RequestMethod.PUT,RequestMethod.PATCH})
	public ResponseEntity<String> update(@PathVariable("rno") Integer rno,@RequestBody ReplyVO replyVO) throws Exception {
		
		ResponseEntity<String> entity = null;
		try {
			replyVO.setRno(rno);
			replyService.modifyReply(replyVO);
			
			entity= new ResponseEntity<String>("success",HttpStatus.OK);
			
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	//삭제 처리 하는 부분 
	@RequestMapping(value="/{rno}", method=RequestMethod.DELETE)
	public ResponseEntity<String> remove(@PathVariable("rno") Integer rno) throws Exception {
		
		ResponseEntity<String> entity = null;
		try {
			replyService.removeReply(rno);
			entity= new ResponseEntity<String>("success",HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
