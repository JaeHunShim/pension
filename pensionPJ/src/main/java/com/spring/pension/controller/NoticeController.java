package com.spring.pension.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.pension.domain.Criteria;
import com.spring.pension.domain.NoticeVO;
import com.spring.pension.domain.PageMaker;
import com.spring.pension.domain.SearchCriteria;
import com.spring.pension.service.NoticeService;

@Controller
@RequestMapping("/notice/*")
public class NoticeController {

	@Inject
	private NoticeService noticeService;
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	// 글 삽입 페이지로 이동
	@RequestMapping(value="/register",method=RequestMethod.GET)
	public void registerGET() throws Exception {
		
		logger.info("글쓰기 페이지로 이동------------");
	}
	// 글삽입후 처리
	@RequestMapping(value="/register",method=RequestMethod.POST)
	public String noticeRegister(NoticeVO noticeVO,RedirectAttributes rttr) throws Exception {
		logger.info("글쓰기 처리 -----------------------------------------------------------");
		
		noticeService.insertBoard(noticeVO);
		logger.info("글등록에서 받아오는 VO" + noticeVO.toString());
		rttr.addFlashAttribute("msg", "success");
		
		logger.info("-------------------------------------------------------------------");
		return "redirect:/notice/list";
	}
	//1. 글 목록 
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public void list(Model model) throws Exception {
		
		model.addAttribute("list", noticeService.list());
	}
	//2. 글 목록(페이징 + 검색처리)
	@RequestMapping(value="/searchList",method=RequestMethod.GET)
	public void listPage(@ModelAttribute("cri") SearchCriteria cri,Model model) throws Exception{
		//페이징 처리한 결과물 model에 실어서 보냄
		model.addAttribute("list", noticeService.listSearch(cri));
		//검색한후에  그전페이지에 대한 내용 저장
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		logger.info("list페이지에서 가지고오는 정보" + cri.toString());
		pageMaker.setTotalCount(noticeService.listCount(cri));
		model.addAttribute("pageMaker", pageMaker);
		logger.info(cri.toString());
		
	}
	//1. 글 세부사항
	@RequestMapping(value="/read",method=RequestMethod.GET)
	public void read(@RequestParam("bno") int bno, Model model) throws Exception {
		
		model.addAttribute(noticeService.read(bno));
	}
	//2. 글 세부사항(검색결과 유지하기 위해 cri정보 를 가지고옴 )
	@RequestMapping(value="/readPage",method=RequestMethod.GET)
	public void searchReadPage(@RequestParam("bno") int bno, @ModelAttribute("cri")SearchCriteria cri , Model model) throws Exception {
		
		model.addAttribute(noticeService.read(bno));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		model.addAttribute("pageMaker", pageMaker);
	}
	//글 삭제
	@RequestMapping(value="/delete",method=RequestMethod.GET)
	public String remove(@RequestParam("bno") int bno,RedirectAttributes rttr) throws Exception {
		
		noticeService.remove(bno);
		rttr.addFlashAttribute("msg", "success");
		
		return "redirect:/notice/list";
	}
	// 글수정 페이지로 이동
	@RequestMapping(value="/modify",method=RequestMethod.GET)
	public void updateGET(@RequestParam("bno") int bno,Model model) throws Exception {
		
		model.addAttribute(noticeService.read(bno));
	}
	// 수정처리 
	@RequestMapping(value="/modify",method=RequestMethod.POST)
	public String updatePOST(NoticeVO noticeVO, RedirectAttributes rttr) throws Exception {
		
		noticeService.update(noticeVO);
		rttr.addFlashAttribute("msg", "success");
		
		return "redirect:/notice/list";
	}
}
