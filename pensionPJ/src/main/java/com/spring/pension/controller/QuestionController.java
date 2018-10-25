package com.spring.pension.controller;

import java.util.Date;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.pension.domain.Criteria;
import com.spring.pension.domain.PageMaker;
import com.spring.pension.domain.QuestionVO;
import com.spring.pension.domain.SearchCriteria;
import com.spring.pension.service.QuestionService;

@Controller
@RequestMapping("/question/*")
public class QuestionController {
	
	@Inject
	private QuestionService questionService;
	
	private static final Logger logger = LoggerFactory.getLogger(QuestionController.class);
	//글 몰록보기1
	@RequestMapping(value="/listAll",method=RequestMethod.GET)
	public  void listAll(Model model) throws Exception {
		logger.info("글목록 불러오기------------------");
		model.addAttribute("list",questionService.listAll());
	}
	//글 목록 보기2: 페이징 처리한후 (Cirteria 사용해서 )
	@RequestMapping(value="/listCriteria", method=RequestMethod.GET)
	public void listCriteria(Criteria cri,Model model) throws Exception{
		
		model.addAttribute("list",questionService.listCriteria(cri));
		
	}
	//글 목록  보기3:하단 페이징 처리까지 (Criteria 와 pageMaker사용) 총 게시물수를 가지고 오기 위해서 @ModelAttribute 사용해서 view 페이지에서 데이터 가지고옴
	@RequestMapping(value="/listPage",method=RequestMethod.GET)
	public void listPage(@ModelAttribute("cri")Criteria cri,Model model) throws Exception{
		logger.info("-----------------------글 목록 보는 페이지 -----------------------------------------");
		model.addAttribute("list",questionService.listCriteria(cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		 //totalPageCount 안가지고 올때 써먹었던것 
		//pageMaker.setTotalCount(131);
		pageMaker.setTotalCount(questionService.listCountCriteria(cri));
		model.addAttribute("pageMaker",pageMaker);
	}
	//글 목록 보기4: 검색까지 가능하게 하기 
	@RequestMapping(value="/searchListPage",method=RequestMethod.GET)
	public void listSearchPage(@ModelAttribute("cri") SearchCriteria cri,Model model) throws Exception {
		
		logger.info(cri.toString());
		//model.addAttribute("list", questionService.listCriteria(cri));
		model.addAttribute("list", questionService.listSearchCriteria(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		//pageMaker.setTotalCount(questionService.listCountCriteria(cri));
		pageMaker.setTotalCount(questionService.listSearchCount(cri));
		
		model.addAttribute("pageMaker", pageMaker);
	}
	//글작성 페이지 이동 
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public void registerGet(QuestionVO qVO, Model model) throws Exception {
		
		logger.info("글쓰기 페이지로 이동------------------");
	}
	//글작성 처리
	// 글작성 처리후 매핑을 searchListPage로 이동
	@RequestMapping(value="/register",method=RequestMethod.POST)
	public String registerPost(QuestionVO qVO, RedirectAttributes rttr) throws Exception {
		
		logger.info("-------------------------글쓰기 처리------------------------------");
		logger.info("QuestionVO 에 있는 값" + qVO.toString());
		logger.info("--------------------------------------------------------------");
		questionService.regist(qVO);
		rttr.addFlashAttribute("msg","success");
		logger.info("rttr 메세지........................"+rttr.getFlashAttributes());
		
		return "redirect:/question/searchListPage";
	}
	//1. 글조회 할때 password 입력창 불러오기
	@RequestMapping(value="/password" ,method=RequestMethod.GET)
	public void password(@RequestParam("qno") int qno ,Model model) {
		logger.info("패스워드 입력창 출력-------------");
		logger.info("받아온 qno-------" + qno);	
		model.addAttribute("qno", qno);
	}
	// 1. 패스워드 체크란에서 페이징 정보 받아오기 (검색기능 추가후 Criteria 에서 SearchCriteria 로 수정)
	@RequestMapping(value="/passwordCheck",method=RequestMethod.GET)
	public void passwordCheck(@RequestParam("qno") int qno, @ModelAttribute("cri")SearchCriteria cri, Model model) {
		logger.info("------------------passwordCheck 부분----------------------------");
		logger.info("passwordCheck cri 정보" + cri.getPage());
		logger.info("passwordCheck cri 정보" + cri.getPerPageNum());
		logger.info("받아오는 qno" + qno);
		logger.info("--------------------------------------------------------------");
		model.addAttribute("qno",qno);
	}

	//조건에 맞는 상세페이지 불러오기 
	@RequestMapping(value="/read",method=RequestMethod.POST)
	public void read(int qno ,String password, Model model) throws Exception{
		
		logger.info("passwrod에서 받아온  qno: "+qno + " 받오는 password: " +password );
		
		model.addAttribute(questionService.read(qno,password));
	}
	//조건에 맞는 상세 페이지 불러오기:페이징 정보를 받아와서 페이지 정보 유지
	//이전과 다음글에 대한 처리 추가 .
	@RequestMapping(value="/readPage",method=RequestMethod.GET)
	public ModelAndView readPage(@RequestParam("qno")int qno, String password, @ModelAttribute("cri") SearchCriteria cri,Model model,RedirectAttributes rttr) throws Exception{
		ModelAndView mav = new ModelAndView();
		logger.info("-------------------readPage로 이동하기--------------------------------");
		logger.info("passwordChcek에서 가지고오는 데이터" + cri.toString());
		logger.info("------------------------------------------------------------------");
		String password2 = questionService.getPassword(qno,password);
		System.out.println("password정보:" + password);
		System.out.println("password2정보:" + password2);
		
		if(password2 !=null || password == null){
			mav.setViewName("/question/readPage");
			mav.addObject(questionService.read(qno,password));
			mav.addObject("list", questionService.preNePage(qno));
			/*model.addAttribute(questionService.read(qno,password));
			model.addAttribute("list", questionService.preNePage(qno));*/
			return mav;
		}else {
			mav.setViewName("/question/passwordCheck");
			mav.addObject("qno",qno);
			mav.addObject("result","failure");
			return mav;
		}
		// 비밀번호가 틀렸을시 처리 하는 부분 
		/*if(questionService.read(qno,password)== null) {
			System.out.println("정보들:" +questionService.read(qno,password));
			rttr.addFlashAttribute("result","fail");
			model.addAttribute("qno", qno);
			
		}else {*/
			//System.out.println("비밀번호:" + password);
			/*model.addAttribute(questionService.read(qno,password));
			model.addAttribute("list", questionService.preNePage(qno));*/
		/*}*/
	}
	// 게시글 삭제 하기: 정보유지 안했을때 
	@RequestMapping(value="/delete",method=RequestMethod.GET)
	public String remove(int qno,RedirectAttributes rttr) throws Exception{
			
		logger.info("삭제페이지에서 받아오는 qno:" + qno);
		questionService.remove(qno);
		rttr.addFlashAttribute("msg","success");
		return "redirect:/question/listAll";
	}
	//게시글 삭제하기 :정보 유지 
	//게시글 삭제하기: cirteria를 searchCriteria 로 바꾸고 keyword ,searchType 추가
	@RequestMapping(value="/deletePage",method=RequestMethod.GET)
	public String remove(@RequestParam("qno")int qno, @ModelAttribute("cri")SearchCriteria cri,RedirectAttributes rttr) throws Exception{
		logger.info("----------------------------질문 삭제 부분 --------------------------------------");
		logger.info("가지고오는 qno :" + qno +"--" +"가지고오는 page" + cri.getPage() +"--" + "가지고오는 perPage" + cri.getPerPageNum());
		logger.info("-------------------------------------------------------------------");
		questionService.remove(qno);
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addFlashAttribute("msg","success");
		
		return "redirect:/question/searchListPage";
	}
	// 게시물 수정페이지로 이동: 수정위해서 read 페이지에서 qno 받아오기 model에 넝어서 modify 페이지에 뿌리기
	@RequestMapping(value="/modify",method=RequestMethod.GET)
	public void modifyGET(@RequestParam("qno")int qno,Model model) throws Exception{
		logger.info("수정페이지로 가는 부분 -------------------------------------");
		model.addAttribute(questionService.getQno(qno));
		
	}
	//게시물 수정 페이지로 이동: 게시물 수정한 후에 페이지 유지
	@RequestMapping(value="/modifyPage",method=RequestMethod.GET)
	public void modifyPageGet(@RequestParam("qno")int qno,@ModelAttribute("cri")SearchCriteria cri ,Model model) throws Exception{
		logger.info("--------------------수정페이지 불러오기 -------------------------------------");
		logger.info("가지고오는 qno :" + qno +"--" +"가지고오는 page" + cri.getPage() +"--" + "가지고오는 perPage" + cri.getPerPageNum());
		logger.info("----------------------------------------------------------------------");
		model.addAttribute(questionService.getQno(qno));
	}
	//게시물 수정처리:정보유지 안했을때
	@RequestMapping(value="/modify",method=RequestMethod.POST)
	public String modifyPOST(QuestionVO questionVO,RedirectAttributes rttr) throws Exception{
		logger.info("vo객체 데이터들 " + questionVO.toString());
		
		questionService.modify(questionVO);
		return "redirect:/question/listAll";
	}
	//게시물 수정 처리 : 처리한후에 정보유지 
	//Criteria를 SearchCriteria 로 수정해서 검색후 페이지 유지하게 하고 searchType과 keyword추가
	@RequestMapping(value="/modifyPage",method=RequestMethod.POST)
	public String modifyPagePOST(QuestionVO questionVO,SearchCriteria cri,RedirectAttributes rttr) throws Exception{
		logger.info("-----------------------------수정 처리 부분 -------------------------------------");
		logger.info("가지고온 cir정보: " + cri.getPage()+"----" + cri.getPerPageNum());
		logger.info("---------------------------------------------------------------------------");
		questionService.modify(questionVO);
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		rttr.addFlashAttribute("msg","success");
		
		return "redirect:/question/searchListPage";
	}
}
