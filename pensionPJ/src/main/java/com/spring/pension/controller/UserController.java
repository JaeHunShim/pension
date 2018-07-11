package com.spring.pension.controller;


import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.pension.domain.Criteria;
import com.spring.pension.domain.PageMaker;
import com.spring.pension.domain.UserVO;
import com.spring.pension.service.ReservationService;
import com.spring.pension.service.UserService;
import com.spring.pension.util.MailHandler;
import com.spring.pension.util.TempKey;


@RequestMapping("/user/*")
@Controller
public class UserController {

	@Inject
	private UserService userService;
	
	@Inject
	private ReservationService reserService;
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	//회원가입 폼 불러오는 부분 (modal처리)
	@RequestMapping(value="/join",method=RequestMethod.GET)
	public void join() {
		
	}
	//로그인 폼 불러오는 부분(moadal 처리)
	@RequestMapping(value="/login",method=RequestMethod.GET)	
	public void login() {
		
	}
	//회원 가입
	@RequestMapping(value="/join",method=RequestMethod.POST)
	public ResponseEntity<String> join(@RequestBody UserVO userVO) throws Exception {
		
		ResponseEntity<String> entity = null;
		try {
			userService.join(userVO);
			entity = new ResponseEntity<String>("success",HttpStatus.OK);
			
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	//아이디 중복 체크 
	@ResponseBody
	@RequestMapping(value="/idCheck",method=RequestMethod.POST)
	public ResponseEntity<Map<String,Object>> idCheck(@RequestBody String user_id) throws Exception {
		
		ResponseEntity<Map<String,Object>> entity = null;
		try {
				Map<String,Object> map = new HashMap<String,Object>();
				int count = 0;
				count = userService.userIdCheck(user_id);
				map.put("cnt", count);
				entity = new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	//이메일 인증번호 발송 
	@ResponseBody
	@RequestMapping(value="/emailCertification",method=RequestMethod.POST)
	public boolean emailAutorization(@RequestBody String user_email,HttpSession session) throws Exception {
		
			String key = new TempKey().getKey(50,false); //키 생성 
			session.setAttribute("key", key); //생성한 키를 session에 저장(view단에서 session값과 입력한 값이 동일한지 검사할거임)
			String subject ="회원가입 승인번호입니다.";
			StringBuilder sb = new StringBuilder();
			sb.append("회원가입 승인번호는").append(key).append("입니다.");
			
			return userService.send(subject, sb.toString(),"jaehuniya@gmail.com", user_email);
	}
	//로그인 체크 처리
	/*@ResponseBody
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public Map<String,Object> loginCheck(@RequestBody UserVO userVO,Model model,HttpSession session) throws Exception {
		logger.info("받아오는 vo 정보:" + userService.loginCheck(userVO));
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("vo",userService.loginCheck(userVO));
		model.addAttribute(map);

		return map;
	}*/
	//로그인처리
	@RequestMapping(value="/loginPost",method=RequestMethod.POST)
	public void loginPost(UserVO userVO, Model model,HttpSession session) throws Exception {
		logger.info("userVO정보:" + userService.loginCheck(userVO));
		UserVO vo = userService.loginCheck(userVO);
		if(vo==null) {
			return;
		}
		model.addAttribute("vo",vo);
		
	}
	//아이디 패스워드 찾기 페이지 열기
	@RequestMapping(value="/find_password",method=RequestMethod.GET)
	public void forgetPassword() throws Exception{
		
	}
	//패스워드 찾는 로직 (email로 해당 아이디의 비밀번호를 보내서 처리)
	@ResponseBody
	@RequestMapping(value="/find_password",method=RequestMethod.POST)
	public ResponseEntity<Map<String,Object>> findPassword(@RequestBody UserVO userVO) throws Exception {
		System.out.println("user_id의 데이터 타입" + userVO instanceof String); //String 타입으로 넘어옴 
		logger.info("받아오는 user_id" + userVO.toString());
		logger.info("받아오는 정보   :" + userService.findPassword(userVO));
		ResponseEntity<Map<String,Object>> entity = null;
		try {
				Map<String,Object> map = new HashMap<String,Object>();
				
				boolean result = userService.findPassword(userVO);
				map.put("result", result);
				entity = new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	//로그아웃
	@RequestMapping(value="/logout",method=RequestMethod.GET)
	public String signOut(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		
		Object obj = session.getAttribute("login");
		
		if(obj != null) {
			response.setHeader("Cache-Control","no-store");
			session.removeAttribute("login");
			session.invalidate();
		}
		return "redirect:/main/index";
	}
	//자신의 정보 보기 (수정과 자신의 예약현황 확인)
	@RequestMapping(value="/info",method=RequestMethod.GET)
	public void modify(@RequestParam("user_id") String user_id, @ModelAttribute("cri") Criteria cri ,Model model) throws Exception {
		
		model.addAttribute("userVO", userService.userInfo(user_id));
		model.addAttribute("list", userService.reserInfo(user_id,cri));
		
		logger.info("cri정보" + cri);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(userService.totalInfo(user_id));
		model.addAttribute("pageMaker", pageMaker);
	}
	//탈퇴팝업창
	@RequestMapping(value="/secession",method=RequestMethod.GET)
	public void secession() throws Exception {
		
	}
	//탈퇴처리 하는 부분
	@ResponseBody
	@RequestMapping(value="/secession", method=RequestMethod.POST)
	public ResponseEntity<String> secessionPost(@RequestBody UserVO userVO) throws Exception {
		logger.info("받아오는 패스워드" + userVO.getUser_id());
		logger.info("받아오는 아이디" + userVO.getUser_password());
		ResponseEntity<String> entity = null;
		try {
			userService.deleteUser(userVO);
			entity= new ResponseEntity<String>("success",HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	// 선택 게시물 삭제(아이디도 같이 안보내면 오류가 뜸)
	@RequestMapping(value="/deleteRes",method=RequestMethod.GET)
	public String deleteRes(int reserNo,HttpSession session,RedirectAttributes rttr) throws Exception {
		UserVO userVO = (UserVO)session.getAttribute("login");
		
		reserService.delete(reserNo);
		rttr.addFlashAttribute("msg", "success");
		rttr.addAttribute("user_id", userVO.getUser_id());
		return "redirect:/user/info";
	}
	//패스워드 입력창 띄우는곳 (회원정보 수정하기 위해서 사용)
	@RequestMapping(value="/passInput", method=RequestMethod.GET)
	public void passInputGet() throws Exception {
		
	}
	//비밀번호 일치하는지 확인
	@ResponseBody
	@RequestMapping(value="/confirm" ,method=RequestMethod.POST)
	public ResponseEntity<String> passConfrim(@RequestBody UserVO userVO) throws Exception {
		
		ResponseEntity<String> entity = null;
		
		try {
			UserVO vo = userService.loginCheck(userVO);
			logger.info("vo정보:" + vo);
			if(vo !=null) {
				entity= new ResponseEntity<String>("success",HttpStatus.OK);
			}else if(vo ==null){
				entity= new ResponseEntity<String>("fail",HttpStatus.OK);
			}	
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	//회원 정보 수정하는 페이지 불러오기 
	@RequestMapping(value="/modify",method=RequestMethod.GET)
	public void userModify() throws Exception {
		
	}
	@RequestMapping(value="/modify",method=RequestMethod.POST)
	public String userModifyPOST(UserVO userVO) throws Exception {
		userService.userUpdate(userVO);
		
		return "redirect:/user/logout";
	}
}
