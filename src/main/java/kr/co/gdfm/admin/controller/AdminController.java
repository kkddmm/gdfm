package kr.co.gdfm.admin.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.google.common.io.Files;

import kr.co.gdfm.board.model.Board;
import kr.co.gdfm.board.model.Boardcmtnotice;
import kr.co.gdfm.board.model.Boardtype;
import kr.co.gdfm.board.model.Comment;
import kr.co.gdfm.board.service.BoardService;
import kr.co.gdfm.cinema.model.Cinema;
import kr.co.gdfm.common.cinemalist.mapper.CinemaListMapper;
import kr.co.gdfm.common.file.model.FileItem;
import kr.co.gdfm.common.file.service.FileItemService;
import kr.co.gdfm.common.util.CookieBox;
import kr.co.gdfm.common.util.PagingUtil;
import kr.co.gdfm.member.model.Member;
import kr.co.gdfm.member.model.Memberclass;
import kr.co.gdfm.member.service.MemberService;
import kr.co.gdfm.movie.model.Movie;
import kr.co.gdfm.movie.service.MovieService;
import kr.co.gdfm.reservation.model.Reservation;
import kr.co.gdfm.reservation.service.ReservationService;
import kr.co.gdfm.snack.model.Snack;
import kr.co.gdfm.snack.model.SnackBuy;
import kr.co.gdfm.snack.service.SnackService;


@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	BoardService boardService;

	@Autowired
	CinemaListMapper cinamaListMapper;
	
	@Autowired
	FileItemService fileItemService;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	SnackService snackService;

	@Autowired
	ReservationService reservationService;
	
	@Autowired
	MovieService movieService;
	
	@ModelAttribute("searchTypeMap") // 화면에쓸 데이터 model넣기. searchTypeMap바인딩
	public Map<String, String> getSearchType() {
		HashMap<String, String> searchTypeMap = new LinkedHashMap<>(); // 순서해쉬맵일경우
		searchTypeMap.put("id", "아이디");
		searchTypeMap.put("name", "이름");
		return searchTypeMap;
	}
	
	@RequestMapping("/adminPage")
	public String adminPage(
			HttpServletRequest request,
			Model model
			) throws Exception {
		String myip = request.getRemoteAddr();
		model.addAttribute("myip", myip);
		return "admin/adminPage";
	}
	
	//게시판관리
	@RequestMapping("/boardList")
	public String boardList(
			@RequestParam(value="searchType", required=false, defaultValue="") String searchType,
			@RequestParam(value="searchWord", required=false, defaultValue="") String searchWord,
			@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage,
			@RequestParam(value="pageSize", required=false, defaultValue="10") int pageSize,
			@RequestParam(value="bo_type_code", required=false, defaultValue="0") int bo_type_code,
			Model model
			) throws Exception {
			
			int pageCount = 5;	//기본값
			int totalCount = 0;
			
			
			Map<String, Object> paramMap = new HashMap<>();
	
			paramMap.put("bo_type_code", bo_type_code);
	
			if(StringUtils.isNotBlank(searchType) && StringUtils.isNotBlank( searchWord )) {
				paramMap.put("searchType", searchType);
				paramMap.put("searchWord", searchWord);
			}
			// 총 게시글 수
			totalCount = boardService.getBoardCount(paramMap);
			
			// 페이징 처리
			PagingUtil pagingUtil = new PagingUtil(currentPage, totalCount, pageSize, pageCount);
			
			
			Map<String, Object> paramMap2 = new HashMap<>();
			List<Board> noticeList = boardService.getNoticeList(paramMap2);
			
			
			paramMap.put("startRow", pagingUtil.getStartRow());
			paramMap.put("endRow", pagingUtil.getEndRow());
			
			List<Board> boardList = boardService.getBoardList(paramMap);
			
			List<Boardtype> boardtypeList = boardService.getBoardtypeList(paramMap);
			
			model.addAttribute("boardList", boardList);
			model.addAttribute("pagingUtil", pagingUtil);
			model.addAttribute("noticeList", noticeList);
			model.addAttribute("boardtypeList", boardtypeList);
		
		return "admin/boardList";
	}
	
	@RequestMapping("/boardadmintypeList")
	public String boardadmintypeList(Model model) throws Exception {
		
		Map<String, Object> paramMap = new HashMap<>();
		
		List<Boardtype> boardadmintypeList = boardService.getadminBoardtypeList(paramMap);
		
		model.addAttribute("boardadmintypeList", boardadmintypeList);
		
		return "admin/boardadmintypeList";
		
	}
	
	@RequestMapping("/boardadmintypeForm")
	public String boardadmintypeForm(
				HttpSession session,
				@RequestParam(value="bo_type_code", required=false, defaultValue="0") int bo_type_code,
				Boardtype boardtype,
				Model model
			) throws Exception {
			
		// 로그인 여부 확인
		
		Member member = (Member)session.getAttribute("LOGIN_USER");
					
		// 로그인 폼으로 리다이렉트
		if(member == null) {
			return "redirect:/admin/loginForm";
		}
					
		if(bo_type_code != 0) {
			boardtype = boardService.getBoardtype(bo_type_code);
		}
			model.addAttribute("boardtype", boardtype);
			return "admin/boardadmintypeForm";
		
	}
	
	@RequestMapping(value="/boardadmintypeInsert", method=RequestMethod.POST)
	public String boardadmintypeInsert(
			Boardtype boardtype,
			HttpServletRequest request,
			Model model
			) throws Exception {
		
				
				String viewPage = "common/message";

				boolean isError = false;
				String message = "정상 등록되었습니다.";
				String locationURL = "/admin/boardadmintypeList";
				
				try {
					
					int updCnt = boardService.insertBoardtype(boardtype);
					
					if(updCnt == 0) {
						isError = true;
						message = "등록 실패하였습니다.";
					}
				}catch (Exception e) {
					isError = true;
					message = "등록 실패하였습니다.";
					throw e;
				}
				
				model.addAttribute("isError", isError);
				model.addAttribute("message", message);
				model.addAttribute("locationURL", locationURL);
				
				return viewPage;
		
	}
	
	@RequestMapping(value="/boardadmintypeUpdate", method=RequestMethod.POST)
	public String boardadmintypeUpdate(
			Boardtype boardtype,
			HttpSession session,
			HttpServletRequest request,
			Model model
			) throws Exception {
				
			Member member = (Member)session.getAttribute("LOGIN_USER");
					
				if(member == null) {
					return "redirect:/admin/loginForm";
				}
				
				
				String viewPage = "common/message";

				boolean isError = false;
				String message = "정상 수정되었습니다.";
				String locationURL = "/admin/boardadmintypeList";
		
				try {
							
					int updCnt = boardService.updateBoardtype(boardtype);
					
					if(updCnt == 0) {
						isError = true;
						message = "수정 실패하였습니다.";
					}
				}catch (Exception e) {
					isError = true;
					message = "수정 실패하였습니다.";
					throw e;
				}
				
				model.addAttribute("isError", isError);
				model.addAttribute("message", message);
				model.addAttribute("locationURL", locationURL);
				
				return viewPage;
	}
	
	@RequestMapping("/boardadmintypeDelete")
	public String boardadmintypeDelete(
			HttpSession session,
			@RequestParam("bo_type_code") int bo_type_code,
			Model model
			) {
						
		Member member = (Member)session.getAttribute("LOGIN_USER");
					
		//if(member == null) {
		//	return "redirect:/admin/loginForm";
		//}
		
		String viewPage = "common/message";

		boolean isError = false;
		String message = "정상 삭제되었습니다.";
		String locationURL = "/admin/boardadmintypeList";
		
		try {
			
			int updCnt = boardService.deleteBoardtype(bo_type_code);
			
			if(updCnt == 0) {
				isError = true;
				message = "삭제 실패하였습니다1.";
			}
		}catch (Exception e) {
			isError = true;
			message = "삭제 실패하였습니다2.";
		}
		
		model.addAttribute("isError", isError);
		model.addAttribute("message", message);
		model.addAttribute("locationURL", locationURL);
		
		return viewPage;
	}
	
	@RequestMapping("/boardView/{bo_id}/{bo_type_code}") // @PathVariable. /boardView/1233(pk,시퀀즈번호)/{mem_id}
	public String boardView(
			//@RequestParam(value="bo_seq_no") int bo_seq_no,
			@PathVariable(value="bo_id", required=true) int bo_id,
			@PathVariable(value="bo_type_code", required=true) int bo_type_code,
			Model model
			) throws Exception {
		
		Board board = null;
		
		if(bo_id != 0) {
			board = boardService.getBoard(bo_id);
		}
		Map<String, Object> paramMap = new HashMap<>();
		
		List<Comment> commentList = boardService.getCommentList(bo_id);
		
		paramMap.put("bo_type_code", bo_type_code);
		List<Boardtype> boardtypeList = boardService.getBoardtypeList(paramMap);
		
		model.addAttribute("board", board);
		model.addAttribute("commentList", commentList);
		model.addAttribute("boardtypeList", boardtypeList);
		
		return "admin/boardView";
	}
	
	@RequestMapping("/boardForm")
	public String boardForm(
			HttpSession session,
			@RequestParam(value="bo_id", required=false, defaultValue="0") int bo_id,
			Model model 
			) throws Exception {
		

			// 로그인 여부 확인
				
			Member member = (Member)session.getAttribute("LOGIN_USER");
			
			// 로그인 폼으로 리다이렉트
			if(member == null) {
				return "redirect:/login/loginForm";
			}

			Board board = new Board();
				
			if(bo_id != 0) {
				board = boardService.getBoard(bo_id);
					
			}else {
				// 로그인 사용자 정보
				board.setMem_id(member.getMem_id());
				board.setMem_id_name(member.getMem_name());
			}
			Map<String, Object> paramMap = new HashMap<>();
			List<Cinema> cinemaList = cinamaListMapper.selectCinemaList(paramMap);
			
			model.addAttribute("board", board);
			model.addAttribute("cinemaList", cinemaList);
				
			return "admin/boardForm";
	}
	
	@RequestMapping(value="/boardInsert", method=RequestMethod.POST)
	public String boardInsert(
			Board board,
			HttpServletRequest request,
			Model model
			) throws Exception {
		
				
				String viewPage = "common/message";

				boolean isError = false;
				String message = "정상 등록되었습니다.";
				String locationURL = "/admin/boardList?bo_type_code=" + board.getBo_type_code();
				
				try {
				
					// 파일 목록 생성.
					List<FileItem> fileItemList = fileItemService.uploadFiles(request, board.getBo_type_code());
					
					board.setFileItemList(fileItemList);
					
					int updCnt = boardService.insertBoard(board);
					
					if(updCnt == 0) {
						isError = true;
						message = "등록 실패하였습니다.";
					}
				}catch (Exception e) {
					isError = true;
					message = "등록 실패하였습니다.";
					throw e;
				}
				
				model.addAttribute("isError", isError);
				model.addAttribute("message", message);
				model.addAttribute("locationURL", locationURL);
				
				return viewPage;
		
	}
	
	@RequestMapping(value="/boardUpdate", method=RequestMethod.POST)
	public String boardUpdate(
			Board board,
			HttpSession session,
			HttpServletRequest request,
			Model model
			) throws Exception {
				
			Member member = (Member)session.getAttribute("LOGIN_USER");
					
				if(member == null) {
					return "redirect:/admin/loginForm";
				}
				
				// 세션에서 로그인 사용자 정보 셋팅.
				board.setBo_upd_user(member.getMem_id());
				//board.setBo_upd_user("test");
				
				String viewPage = "common/message";

				boolean isError = false;
				String message = "정상 수정되었습니다.";
				//String locationURL = "/board/boardView/" + board.getBo_seq_no();
				String locationURL = "/admin/boardView/" + board.getBo_id() + "/" + board.getBo_type_code();
		
				try {
							
					// 파일 업로드처리
					List<FileItem> fileItemList = fileItemService.uploadFiles(request, board.getBo_type_code());
					board.setFileItemList(fileItemList);
					
					int updCnt = boardService.updateBoard(board);
					
					if(updCnt == 0) {
						isError = true;
						message = "수정 실패하였습니다.";
					}
				}catch (Exception e) {
					isError = true;
					message = "수정 실패하였습니다.";
					throw e;
				}
				
				model.addAttribute("isError", isError);
				model.addAttribute("message", message);
				model.addAttribute("locationURL", locationURL);
				
				return viewPage;
	}
	@RequestMapping("/boardDelete")
	public String boardDelete(
			HttpSession session,
			@RequestParam("bo_id") int bo_id,
			@RequestParam("bo_type_code") int bo_type_code,
			Model model
			) {
						
		Member member = (Member)session.getAttribute("LOGIN_USER");
					
		//if(member == null) {
		//	return "redirect:/login/loginForm";
		//}
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("bo_upd_user", member.getMem_id());
		//paramMap.put("upd_user", "test");
		paramMap.put("bo_id", bo_id);
		
		String viewPage = "common/message";

		boolean isError = false;
		String message = "정상 삭제되었습니다.";
		String locationURL = "/admin/boardList?bo_type_code=" + bo_type_code;
		
		try {
			
			int updCnt = boardService.deleteBoard(paramMap);
			
			if(updCnt == 0) {
				isError = true;
				message = "삭제 실패하였습니다.";
			}
		}catch (Exception e) {
			isError = true;
			message = "삭제 실패하였습니다.";
		}
		
		model.addAttribute("isError", isError);
		model.addAttribute("message", message);
		model.addAttribute("locationURL", locationURL);
		
		return viewPage;
	}
	
	@RequestMapping("/commentInsert")
	public String commnetInsert(Comment comment, @RequestParam("bo_type_code") int bo_type_code, Boardcmtnotice boardcmtnotice) throws Exception {
		int bo_id = comment.getBo_id();
		System.out.println(comment.getBo_co_id());
		boardService.commentInsert(comment);
		System.out.println(comment.getBo_co_id());
		
		boardcmtnotice.setBo_co_id(comment.getBo_co_id());
		
		boardService.commentInsertnotice(boardcmtnotice);
		
		return "redirect:/admin/boardView/"+bo_id+"/"+bo_type_code;

	}

	@RequestMapping("/commentDelete")
	public String commentDelete(int bo_co_id, int bo_id, int bo_type_code) throws Exception {

		int variable = -1;
		Map<String, Integer> paramMap= new HashMap<>();
		paramMap.put("bo_co_id", bo_co_id);
		paramMap.put("variable", variable);
		
		boardService.commentDelete(bo_co_id);

		return "redirect:/admin/boardView/"+bo_id+"/"+bo_type_code;

	}

	@RequestMapping("/commentUpdate")
	public String commentDelete(int bo_co_id, int bo_id, int bo_type_code, String bo_co_content) throws Exception {

		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("bo_co_id", bo_co_id);
		paramMap.put("bo_co_content", bo_co_content);

		boardService.commentUpdate(paramMap);

		return "redirect:/admin/boardView/"+bo_id+"/"+bo_type_code;

	}
	
	// 회원관리
	@RequestMapping(value="/memberList")
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
		
		return "admin/memberList";
	}
	
	@RequestMapping("/memberView")
	public String memberView(
			@RequestParam(value="mem_id", required=true) String mem_id ,
			Model model
			) throws Exception {
		
		Member member = memberService.getMember(mem_id);
		
		model.addAttribute("member", member);
		
		return "admin/memberView";
	}
	
	
	@RequestMapping(value="/memberForm")
	public String memberForm(
			HttpSession session,
			@RequestParam(value="mem_id", required=false) String mem_id ,
			@ModelAttribute("now") Date now,
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
		
		return "admin/memberForm";
		
	}
	
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
			return "admin/memberForm";
			
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
		model.addAttribute("locationURL", "/admin/memberList");
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
		model.addAttribute("locationURL", "/admin/memberView?mem_id=" + member.getMem_id());
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
		model.addAttribute("locationURL", "/admin/memberList");
		
		return viewPage;
		
	}
	
	@RequestMapping("/memberExists")
	@ResponseBody
		public Map<String, Object> memberExists(
			@RequestParam(value="mem_id", required=true) String mem_id
			) throws Exception {
		
		Member member = memberService.getMember(mem_id);
		
		Map<String, Object> resultMap = new HashMap<>();
		
		if(member != null) {
			resultMap.put("result", "true");
		}else {
			resultMap.put("result", "false");
		}
		return resultMap;
	}
	
	//로그인
	@RequestMapping("/login")
	public String login(
			@RequestParam(value="mem_id", required=true) String mem_id,
			@RequestParam(value="mem_pwd") String mem_pwd,
			@RequestParam(value="remember_me", required=false) String remember_me,
			HttpSession session,
			HttpServletResponse response,
			String url,
			Model model
			) throws Exception {
		
		Member member = memberService.getMember(mem_id);
		
		boolean isError = true;
		String message = "";
		
		if(member != null) {
			if(mem_pwd.equals(member.getMem_pwd())) {
				// 로그인 성공
					session.setAttribute("LOGIN_USER", member);
					message = member.getMem_name() + "님 환영합니다.";
					isError = false;
				// 쿠키 관련 처리
				if ("Y".equals(remember_me)) {
					response.addCookie(CookieBox.createCookie("USER_ID", member.getMem_id(), "/", 60 * 60 * 24 * 30));
					response.addCookie(CookieBox.createCookie("REMEMBER_ME", "Y", "/", 60 * 60 * 24));
				} else {
					response.addCookie(CookieBox.createCookie("USER_ID", "", "/", 0));
					response.addCookie(CookieBox.createCookie("REMEMBER_ME", "", "/", 0)); // 쿠키삭제
				}
			}else {
				message = "비밀번호가 일치하지 않습니다.";
			}
		}else {
			message = "해당 아이디가 존재하지 않습니다.";
		}
		
		model.addAttribute("isError",isError);
		model.addAttribute("message",message);
		model.addAttribute("locationURL","/admin/adminPage");
		model.addAttribute("login","login");
		return "common/message";
	}
	
	@RequestMapping("/loginForm")
	public String loginForm(HttpServletRequest request, Model model) {
	//String url = request.getHeader("referer");
	//url = url.substring(url.indexOf("GoodDayForMovie/")+"GoodDayForMovie/".length());
	//model.addAttribute("url",url);
	return "admin/loginForm";
		
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/admin/loginForm";
	}
	
	// 스낵관
	@RequestMapping("/snack")
	public String snackList(
				@RequestParam(value="searchType", required=false, defaultValue="") String searchType,
				@RequestParam(value="searchWord", required=false, defaultValue="") String searchWord,
				@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage,
				@RequestParam(value="pageSize", required=false, defaultValue="10") int pageSize,
				Model model
			)throws Exception {

		int pageCount = 5;	//기본값
		int totalCount = 0;
		
		
		Map<String, Object> paramMap = new HashMap<>();

		if(StringUtils.isNotBlank(searchType) && StringUtils.isNotBlank( searchWord )) {
			paramMap.put("searchType", searchType);
			paramMap.put("searchWord", searchWord);
		}
		// 총 게시글 수
		totalCount = snackService.getSnackCount(paramMap);
		pageSize = totalCount;
		// 페이징 처리
		PagingUtil pagingUtil = new PagingUtil(currentPage, totalCount, pageSize, pageCount);
		
		paramMap.put("startRow", pagingUtil.getStartRow());
		paramMap.put("endRow", pagingUtil.getEndRow());
		
		List<Snack> snackList = snackService.getSnackList(paramMap);
		model.addAttribute("snackList", snackList);
		model.addAttribute("pagingUtil", pagingUtil);

		return "admin/snack";
	}
	@RequestMapping("/snack_detail/{snack_id}")
	public String snackDetail(@PathVariable(value = "snack_id", required = true) int snack_id, HttpSession session,
			Model model) throws Exception {

		Snack snack = null;
		Member member = null;

		if (snack_id != 0) {
			snack = snackService.snackView(snack_id);
		}
		model.addAttribute("snack", snack);
		return "admin/snack_detail";
	}
	@RequestMapping("/snackBuy")
	public String snackBuy(
			@RequestParam(value="searchType", required=false, defaultValue="") String searchType,
			@RequestParam(value="searchWord", required=false, defaultValue="") String searchWord,
			@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage,
			@RequestParam(value="pageSize", required=false, defaultValue="10") int pageSize,
			Model model
			) throws Exception {
			
			int pageCount = 5;	//기본값
			int totalCount = 0;
			
			
			Map<String, Object> paramMap = new HashMap<>();
	
			if(StringUtils.isNotBlank(searchType) && StringUtils.isNotBlank( searchWord )) {
				paramMap.put("searchType", searchType);
				paramMap.put("searchWord", searchWord);
			}
			// 총 게시글 수
			totalCount = snackService.getSnackBuyCount(paramMap);
			
			// 페이징 처리
			PagingUtil pagingUtil = new PagingUtil(currentPage, totalCount, pageSize, pageCount);
			
			
			
			paramMap.put("startRow", pagingUtil.getStartRow());
			paramMap.put("endRow", pagingUtil.getEndRow());
			
			List<SnackBuy> snackBuy = snackService.getSnackBuyList(paramMap);
			
			model.addAttribute("snackBuy", snackBuy);
			model.addAttribute("pagingUtil", pagingUtil);
		
		return "admin/snackBuy";
	}
	
	@RequestMapping("/snackBuyDelete")
	public String snackBuyDelete(
			HttpSession session,
			@RequestParam("snack_buy_id") int snack_buy_id,
			@RequestParam("mem_point") int mem_point,
			@RequestParam("mem_id") String mem_id,
			Model model
			) {
						
		Member member = (Member)session.getAttribute("LOGIN_USER");
					
		//if(member == null) {
		//	return "redirect:/login/loginForm";
		//}
		
		
		String viewPage = "common/message";

		boolean isError = false;
		String message = "정상 삭제되었습니다.";
		String locationURL = "/admin/snackBuy";
		
		try {
			Map<String, Object> paramMap = new HashMap<>();
			
			paramMap.put("mem_point", mem_point);
			paramMap.put("mem_id", mem_id);
			
			int updCnt2 = snackService.updateSnackBuyPoint(paramMap);
			
			int updCnt = snackService.deleteSnackBuy(snack_buy_id);
			
			if(updCnt == 0) {
				isError = true;
				message = "삭제 실패하였습니다.";
			}
		}catch (Exception e) {
			isError = true;
			message = "삭제 실패하였습니다.";
		}
		
		model.addAttribute("isError", isError);
		model.addAttribute("message", message);
		model.addAttribute("locationURL", locationURL);
		
		return viewPage;
	}
	
	@RequestMapping("/reserveList")
	public String reserveList(
			@RequestParam(value="searchType", required=false, defaultValue="") String searchType,
			@RequestParam(value="searchWord", required=false, defaultValue="") String searchWord,
			@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage,
			@RequestParam(value="pageSize", required=false, defaultValue="10") int pageSize,
			Model model
			) throws Exception {
			
			int pageCount = 5;	//기본값
			int totalCount = 0;
			
			
			Map<String, Object> paramMap = new HashMap<>();
	
			if(StringUtils.isNotBlank(searchType) && StringUtils.isNotBlank( searchWord )) {
				paramMap.put("searchType", searchType);
				paramMap.put("searchWord", searchWord);
			}
			// 총 게시글 수
			totalCount = reservationService.getresrveCount(paramMap);
			
			// 페이징 처리
			PagingUtil pagingUtil = new PagingUtil(currentPage, totalCount, pageSize, pageCount);
			
			
			
			paramMap.put("startRow", pagingUtil.getStartRow());
			paramMap.put("endRow", pagingUtil.getEndRow());
			
			List<Reservation> resrveList = reservationService.getresrveList(paramMap);
			
			model.addAttribute("resrveList", resrveList);
			model.addAttribute("pagingUtil", pagingUtil);
		
		return "admin/reserveList";
	}
	@RequestMapping("/reserveDelete")
	public String reserveDelete(
			HttpSession session,
			@RequestParam("reservation_id") int reservation_id,
			@RequestParam("mem_point") int mem_point,
			@RequestParam("mem_id") String mem_id,
			Model model
			) {
						
		Member member = (Member)session.getAttribute("LOGIN_USER");
					
		//if(member == null) {
		//	return "redirect:/login/loginForm";
		//}
		
		
		String viewPage = "common/message";

		boolean isError = false;
		String message = "정상 삭제되었습니다.";
		String locationURL = "/admin/reserveList";
		
		try {
			Map<String, Object> paramMap = new HashMap<>();
			
			paramMap.put("mem_point", mem_point);
			paramMap.put("mem_id", mem_id);
			
			int updCnt2 = reservationService.updateReservePoint(paramMap);
			
			int updCnt = reservationService.deleteReserve(reservation_id);
			
			if(updCnt == 0) {
				isError = true;
				message = "삭제 실패하였습니다.";
			}
		}catch (Exception e) {
			isError = true;
			message = "삭제 실패하였습니다.";
		}
		
		model.addAttribute("isError", isError);
		model.addAttribute("message", message);
		model.addAttribute("locationURL", locationURL);
		
		return viewPage;
	}
	
	//영화정보 입력 화면에 뿌려주는 부분 
	@RequestMapping("/movieList")
	public String movieList(
			Model model
			) throws Exception {
			List<Movie> movieList = new ArrayList<>();
			movieList = movieService.selectMovieList();
			model.addAttribute("movieList", movieList);
		return "admin/movieList";
	}
	
	//영화정보 입력 한걸  movieList 화면에 전달 
	@RequestMapping(value="/insertMovie" , method=RequestMethod.POST)
	public String insertMovieList(Movie movie, HttpServletRequest request,Model model) {

		
	System.out.println("insertMovie : "+movie);	
		
		    movieService.insertMovie(movie);
		       
		    	
		    
			
		return "redirect:/admin/movieList";
	}
	
	//영화 입력 폼 화면으로 이동
	/*public String updateMovieList(Movie movie) {
		
		int updateMovieList = movieService.updateMovie(movie);
		
		return "admin/movieUpdate";
	}*/
	
	
	
	@RequestMapping("/movieForm")
	public String insertMovie(Movie movie ,Model model) {
		
			ArrayList<String> list = new ArrayList<String>();
			
			
		
			List<Map<String, Object>> getMovieGenreList = movieService.getMovieGenreList();
			
			model.addAttribute("genreList",getMovieGenreList);
			
			//List<Map<String,Object>> getMovieDimensionList = new ArrayList<>();
			List<Map<String,Object>> getMovieDimensionList = movieService.getMovieDimensionList();
			
			model.addAttribute("dimensionList", getMovieDimensionList);
			
		 
		return "admin/movieInsert";
	}
	
	@RequestMapping("/fileUploadForm")
	public String fileUploadForm(Movie movie,Model model) {
		
	
		
//		model.addAttribute("movie", movie);
			
		
		return "admin/fileUploadForm";
	}
	
	@RequestMapping("/fileUpload")
	public String fileUpload(Movie movie) {
		
		System.out.println("Movie_id : "+movie.getMovie_id());
		//사용자가 보내 준 파일이 poster_file에 담김 
		MultipartFile poster_file = movie.getPoster_file();
		System.out.println("Movie_File : "+poster_file.getOriginalFilename());
		
		//Movie file에 저장 할 곳
		File targetFile = new File("/uploadFiles/movie/"+movie.getMovie_id()+"_poster.jpg");
		try {
			poster_file.transferTo(targetFile);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		
		return "redirect:/admin/movieList";
	}
	
	@RequestMapping("/fileCheck")
	public String fileCheck() {
		
		
		return "movie/fileCheck";
	}
	
	@RequestMapping("/fileTest")
	public String fileTest(File fileTest) {
		
		
		System.out.println("아무거나  ");
		System.out.println("File Test: " + fileTest.getName());
		
		
		
		
		return null;
		
	}
	
	//poster_image 를 받아올 주소
	@RequestMapping("/movieposter")
	public void file_addr(Movie movie, HttpServletResponse response) {
		
		int movie_id = movie.getMovie_id();
		File posterFile = new File("/uploadFiles/Movie/"+movie_id+"_poster.jpg");
		 
		try {
			ServletOutputStream out = response.getOutputStream();
			//File.copy(from,to) =>File.copy(posterFile, out)=>posterFile  
			Files.copy(posterFile, out);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}	
	//스틸컷 업로드 폼
	@RequestMapping("/stillCutfileUploadForm")
	public String stillCutfileUpload(Movie movie) {
		
		
		
		return "admin/stillCutfileUploadForm";
	}
	
	//스틸컷 파일 업로드
	@RequestMapping("/stillcutfileUpload")
	public String stillcutfileUpload(@ModelAttribute("movie") Movie movie ) throws Exception {

		System.out.println("Movie_id : "+movie.getMovie_id());
		
		//사용자가 보내 준 파일이 poster_file에 담김 
		MultipartFile[] stillcut_files = movie.getStillcut_file();
		
		
		// StillCut_File에 저장 할 곳
		for (int i = 1; i <= stillcut_files.length; i++) {
			System.out.println("StillCut_File : " + stillcut_files[i - 1].getOriginalFilename());
			File targetFile2 = new File("/uploadFiles/StillCut/" + movie.getMovie_name() + "_stillcut"+i+".jpg");

			try {
				stillcut_files[i - 1].transferTo(targetFile2);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		
		
		/*
		MultipartFile poster_file = movie.getPoster_file();
		System.out.println("Movie_File : "+poster_file.getOriginalFilename());
		
		//Movie file에 저장 할 곳
		File targetFile = new File("/uploadFiles/Movie/"+movie.getMovie_id()+"_poster.jpg");
		try {
			poster_file.transferTo(targetFile);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		*/
		
		return "redirect:/admin/movieList";
	}
	
	
	
	@RequestMapping("/snackForm")
	public String snackForm(
			) {		
//		snack=snackService.snackView(snack_id);
//		
//		model.addAttribute("snack",snack);
		
		return "/admin/snackForm";
	}
	
	
	
	@RequestMapping(value="/insertSnack", method=RequestMethod.POST)
	public String insertSnack(Snack snack, HttpServletRequest request, Model model) {
		
		String viewPage = "common/message";

		boolean isError = false;
		String message = "정상 등록되었습니다.";
		String locationURL = "/admin/snack";
		
		try {
		int insertCnt= snackService.insertSnack(snack);		
		
		if(insertCnt==0) {
			isError=true;
			message="스낵 등록 실패";
			}
		}catch(Exception e) {
			isError=true;
			message="스낵 등록 실패";
			throw e;
		}
		
		model.addAttribute("isError", isError);
		model.addAttribute("message", message);
		model.addAttribute("locationURL", locationURL);
		
		return viewPage;
	}
	
	
	//스낵 정보 삭제(관리자)
	@RequestMapping("/snackDel")
	public String deleteSnack(@RequestParam(value="snack_id")int snack_id, Model model) {
		
		boolean isError = false;
		String viewPage = "common/message";
		String message = "정상적으로 삭제 되었습니다.";
		
		try {
			int delCnt= snackService.deleteSnack(snack_id);
			if(delCnt==0) {
				isError=true;
				message="스낵 삭제에 실패하였습니다.";
				
			}
		}catch(Exception e) {
			isError=true;
			message="스낵 삭제에 실패하였습니다.";
		}	
		
		model.addAttribute("isError",isError);
		model.addAttribute("message",message);
		model.addAttribute("locationURL","/admin/snack");
		
		
		return viewPage;
	}
	
	
	@RequestMapping("/snackFileUploadForm")
	public String fileUploadForm(Snack snack,Model model) {
		
		
		return "admin/snackFileUploadForm";
	}
	
	
	
	@RequestMapping("/snackFileUpload")
	public String snackFileUpload(Snack snack) {
		
		System.out.println("snack_name : "+snack.getSnack_name());
		//사용자가 보내 준 파일이 poster_file에 담김 
		MultipartFile snackPoster_file = snack.getPoster_file();
		System.out.println("Snack_File : "+snackPoster_file.getOriginalFilename());
		
		//Movie file에 저장 할 곳
		File targetFile = new File("/uploadFiles/Snack/"+snack.getSnack_name()+".jpg");
		try {
			snackPoster_file.transferTo(targetFile);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		
		return "redirect:/admin/snack";
	}
	
	
	
	//poster_image 를 받아올 주소
	@RequestMapping("/snackPoster")
	public void snackFile_addr(Snack snack, HttpServletResponse response) {
		
		String snackName = snack.getSnack_name();
		File posterFile = new File("/uploadFiles/Snack/"+snackName+".jpg");
		 
		try {
			ServletOutputStream out = response.getOutputStream();
			//File.copy(from,to) =>File.copy(posterFile, out)=>posterFile  
			Files.copy(posterFile, out);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	
	
	
	
	
}