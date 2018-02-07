package kr.co.gdfm.member.controller;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;

import kr.co.gdfm.common.util.PagingUtil;
import kr.co.gdfm.member.model.Member;
import kr.co.gdfm.member.model.Memberclass;
import kr.co.gdfm.member.service.MemberService;

@Controller
@RequestMapping("/member")
//@SessionAttributes(value="member") // redirect해도 데이터 유지함.
public class MemberController {
	
	@Resource(name="memberService")
	private MemberService memberService;
	
	// model.ModelAttribute("searchTypeMap")
	@ModelAttribute("searchTypeMap") // 화면에쓸 데이터 model넣기. searchTypeMap바인딩
	public Map<String, String> getSearchType() {
		HashMap<String, String> searchTypeMap = new LinkedHashMap<>(); // 순서해쉬맵일경우
		searchTypeMap.put("id", "아이디");
		searchTypeMap.put("name", "이름");
		return searchTypeMap;
	}
	
	//@RequestMapping("/member/memberList")
	// 기본이 value
	//@RequestMapping(value="/memberList", method=RequestMethod.GET)
	@RequestMapping(value="/memberList")
	// 기본형데이터 올 수 있음.
		//public String memberList(HttpServletRequest request, @RequestParam("searchType") String search, String searchWord) throws Exception {
		//required=true searchType 반드시 들어와야한다.
		//Model ==  ModelAndView
		public String memberList(
				@RequestParam(value="searchType", required=false, defaultValue="") String searchType,
				@RequestParam(value="searchWord", required=false, defaultValue="") String searchWord,
				@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage,
				@RequestParam(value="pageSize", required=false, defaultValue="10") int pageSize,
				Model model
				) throws Exception {

		int pageCount = 5;	//기본값
		int totalCount = 0;
		
		Map<String, Object> paramMap = new HashMap<>();
		
		if(StringUtils.isNotBlank(searchWord)) {
			paramMap.put("searchType", searchType);
			paramMap.put("searchWord", searchWord);
		}
		
		totalCount = memberService.getMemberConunt(paramMap);
		
		// 페이징 처리
		PagingUtil pagingUtil = new PagingUtil(currentPage, totalCount, pageSize, pageCount);
				
		paramMap.put("startRow", pagingUtil.getStartRow());
		paramMap.put("endRow", pagingUtil.getEndRow());
		
		// 회원 목록 조회
		List<Member> memberList =  memberService.getMemberList(paramMap);
		// 회원 등급
		List<Memberclass> memberclassList = memberService.getMemberclassList(paramMap);
		
		model.addAttribute("memberList", memberList);
		model.addAttribute("pagingUtil", pagingUtil);
		model.addAttribute("memberclassList", memberclassList);
		
		return "member/memberList";
	}
	
	//@RequestMapping("/member/memberView")
	@RequestMapping("/memberView")
	public String memberView(
			@RequestParam(value="mem_id", required=true) String mem_id ,
			Model model
			) throws Exception {
		
		Member member = memberService.getMember(mem_id);
		
		model.addAttribute("member", member);
		
		return "member/memberView";
	}
	
	
	@RequestMapping(value="/memberForm")
	public String memberForm(
			HttpSession session,
			@RequestParam(value="mem_id", required=false) String mem_id ,
			//Member member,
			Model model
			) throws Exception {
		
		Member member = new Member();
	
		if(StringUtils.isNotBlank(mem_id)){
			member = memberService.getMember(mem_id);
			model.addAttribute("member", member);
		}
		
		
		if(session.getAttribute("member") != null){
			member = (Member)session.getAttribute("member");
			System.out.println("memberForm :" + member.getMem_id());
		}
		
		Map<String, Object> paramMap = new HashMap<>();
		List<Memberclass> memberclassList = memberService.getMemberclassList(paramMap);
		
		model.addAttribute("member", member);
		model.addAttribute("memberclassList", memberclassList);
		
		
		
//		if(mem_id != null){
//			member = memberService.getMember(mem_id);
//			model.addAttribute("member", member);
//		}

		return "member/memberForm";
		
	}
	
	//@ModelAttribute("member") == model.addAttribute("member", member);
	//SessionStatus 완료시점에서 추가.
	@RequestMapping(value="/memberInsert", method=RequestMethod.POST)
	public String memberInset(
			@ModelAttribute("member") Member member,
			Model model,
			SessionStatus sessionStatus
			) throws Exception {
		System.out.println("mem_id : " + member.getMem_id() );
		System.out.println("mem_name : " + member.getMem_name() );

		String viewPage = "common/message";
		
		boolean isError = false;
		String message = "정상적으로 회원가입 되었습니다.";
		
		// 유효성검증.
		if(member.getMem_id() == null || member.getMem_id().isEmpty() ) {
			isError = true;
			message = "아이디를 입력하세요!.";
		}
		if(StringUtils.isBlank(member.getMem_name())) {
			isError = true;
			message = "이름을 입력하세요!.";
			
			model.addAttribute("isError", isError);
			model.addAttribute("message", message);
			
			// form에 데이터 member 넘기기
			//model.addAttribute("member", member);
			return "member/memberForm";
			
			//return "redirect:/member/memberForm?type=I";
		}
		
		try {
			
			if(!isError) {
				int updCnt = memberService.insertMember(member);
	
				if (updCnt == 0) {
					// 에러
					message = "회원등록 실패하였습니다.";
					isError = true;
				}
				// 정상 완료시 세션 애플리뷰트 제거.
				//sessionStatus.setComplete();
			}
		} catch (Exception e) {
			// 에러
			message = "회원등록 실패하였습니다.";
			isError = true;
			throw e;
		}
		
		model.addAttribute("isError", isError);
		model.addAttribute("message", message);
		model.addAttribute("locationURL", "/member/memberEnd");
		return viewPage;
		
	}
	
	@RequestMapping(value="/memberUpdate", method=RequestMethod.POST)
	public String memberUpdate(
			@RequestParam(value="mem_id", required=true) String mem_id ,
			@ModelAttribute("member") Member member,
			Model model
			) throws Exception {
		
		String viewPage = "common/message";
		
		boolean isError = false;
		String message = "정상 수정되었습니다.";
		
		if(StringUtils.isBlank(member.getMem_id())) {
			isError = true;
			message = "아이디를 입력하세요!.";
		}
		if(StringUtils.isBlank(member.getMem_name())) {
			isError = true;
			message = "이름을 입력하세요!.";
		}
		
		try {
			if(!isError) {
				int updCnt = memberService.updateMember(member);
	
				if (updCnt == 0) {
					// 에러
					isError = true;
					message = "회원수정에 실패하였습니다.";
				}
			}

		} catch (Exception e) {
			// 에러
			message = "회원수정에 실패하였습니다.";
			isError = true;
			throw e;
		}
		model.addAttribute("isError", isError);
		model.addAttribute("message", message);
		model.addAttribute("locationURL", "/member/memberView?mem_id=" + member.getMem_id());
		return viewPage;
	}
	
	@RequestMapping(value="/memberDelete")
	public String memberDelete(
			@RequestParam(value="mem_id", required=true) String mem_id ,
			Model model
			) throws Exception {
		
		boolean isError = false;
		String viewPage = "common/message";
		String message = "정상적으로 삭제 되었습니다.";
		try{
			int updCnt = memberService.deleteMember(mem_id);
			if(updCnt == 0){
				// 에러
				isError = true;	
				message = "회원삭제에 실패하였습니다.";
			}
			
		}catch(Exception e){
			// 에러
			isError = true;	
			message = "회원삭제에 실패하였습니다.";
			throw e;
		}
		
		model.addAttribute("isError", isError);
		model.addAttribute("message", message);
		model.addAttribute("locationURL", "/member/memberList");
		
		return viewPage;
		
	}
	
	@RequestMapping("/memberExists")
	// 응답에 Body에 인지하기
	// 제이쿼리, ajax
	// ajax json변환
	@ResponseBody
		public Map<String, Object> memberExists(
			@RequestParam(value="mem_id", required=true) String mem_id
			) throws Exception {
		
		Member member = memberService.getMember(mem_id);
		
		Map<String, Object> resultMap = new HashMap<>();
		
		/*resultMap.put("msg", "성공");
		resultMap.put("member", member);*/
		
		if(member != null) {
			resultMap.put("result", "true");
		}else {
			resultMap.put("result", "false");
		}
		return resultMap;
	}
	
	@RequestMapping(value="/memberIdcheck")
	@ResponseBody
	public Map<String, Object> memberIdcheck(
			@RequestParam(value="mem_name", required=true) String mem_name,
			@RequestParam(value="mem_email", required=true) String mem_email
			) throws Exception {
		
		Map<String, Object> paramMap = new HashMap<>();		
		paramMap.put("mem_name", mem_name);
		paramMap.put("mem_email",mem_email);
		
		Member member = memberService.getMemberidcheck(paramMap);
		
		if(member != null) {
			paramMap.put("mem_id", member.getMem_id());
		}

		return paramMap;
	
		
	}
	
	@RequestMapping(value="/memberFormId")
	public String memberFormId(
			Model model
			) throws Exception {
		
		return "member/memberFormId";
		
	}
	
	@RequestMapping(value="/memberPwdcheck")
	@ResponseBody
	public Map<String, Object> memberPwdcheck(
			@RequestParam(value="mem_id", required=true) String mem_id,
			@RequestParam(value="mem_name", required=true) String mem_name,
			@RequestParam(value="mem_email", required=true) String mem_email
			) throws Exception {
		
		Map<String, Object> paramMap = new HashMap<>();		
		paramMap.put("mem_name", mem_name);
		paramMap.put("mem_email",mem_email);
		paramMap.put("mem_id",mem_id);
		
		Member member = memberService.getMemberpwdcheck(paramMap);
		
		if(member != null) {
			paramMap.put("mem_pwd", member.getMem_pwd());
		}
		
		return paramMap;
		
		
	}
	
	@RequestMapping(value="/memberFormPwd")
	public String memberFormPwd(
			Model model
			) throws Exception {
		
		return "member/memberFormPwd";
		
	}
	
	@RequestMapping(value="/memberAgree")
	public String memberAgree(
			Model model
			) throws Exception {
		return "member/memberAgree";
	}
	
	@RequestMapping(value="/memberEnd")
	public String memberEnd(
			Model model
			) throws Exception {
		return "member/memberEnd";
		
	}
	
}
