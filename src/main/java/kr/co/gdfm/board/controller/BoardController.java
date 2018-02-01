package kr.co.gdfm.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.gdfm.board.model.Board;
import kr.co.gdfm.board.model.Boardcmtnotice;
import kr.co.gdfm.board.model.Boardtype;
import kr.co.gdfm.board.service.BoardService;
import kr.co.gdfm.boardqna.model.Comment;
import kr.co.gdfm.cinema.model.Cinema;
import kr.co.gdfm.common.cinemalist.mapper.CinemaListMapper;
import kr.co.gdfm.common.file.model.FileItem;
import kr.co.gdfm.common.file.service.FileItemService;
import kr.co.gdfm.common.util.PagingUtil;


@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	BoardService boardService;

	@Autowired
	CinemaListMapper cinamaListMapper;
	
	@Autowired
	FileItemService fileItemService;
	
	@RequestMapping("/3030101")
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
		
		return "board/3030101";
		
	}
	
	@RequestMapping("/boardtypeList")
	public String boardtypeList(
			@RequestParam(value="bo_type_code", required=false, defaultValue="0") int bo_type_code,
			Model model) throws Exception {
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("bo_type_code", bo_type_code);
		List<Boardtype> boardtypeList = boardService.getBoardtypeList(paramMap);
		
		model.addAttribute("boardtypeList", boardtypeList);
		
		return "board/boardtypeList";
		
	}
	
	@RequestMapping("/3030102/{bo_id}/{bo_type_code}") // @PathVariable. /boardView/1233(pk,시퀀즈번호)/{mem_id}
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
		
		return "board/3030102";
	}
	
	@RequestMapping("/3030103")
	public String boardForm(
			HttpSession session,
			@RequestParam(value="bo_id", required=false, defaultValue="0") int bo_id,
			Model model 
			) throws Exception {
		

			// 로그인 여부 확인
				
			//Member member = (Member)session.getAttribute("LOGIN_USER");
			
			// 로그인 폼으로 리다이렉트
			//if(member == null) {
			//	return "redirect:/login/loginForm";
			//}

			Board board = new Board();
				
			if(bo_id != 0) {
				board = boardService.getBoard(bo_id);
					
			}else {
				// 로그인 사용자 정보
				//board.setBo_writer(member.getMem_id());
				//board.setBo_writer_name(member.getMem_name());
			}
			Map<String, Object> paramMap = new HashMap<>();
			List<Cinema> cinemaList = cinamaListMapper.selectCinemaList(paramMap);
			
			model.addAttribute("board", board);
			model.addAttribute("cinemaList", cinemaList);
				
			return "board/3030103";
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
				String locationURL = "/board/3030101?bo_type_code=" + board.getBo_type_code();
				
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
				
				//Member member = (Member)session.getAttribute("LOGIN_USER");
					
			//	if(member == null) {
			//		return "redirect:/login/loginForm";
			//	}
				
				// 세션에서 로그인 사용자 정보 셋팅.
			//	board.setUpd_user(member.getMem_id());
				board.setBo_upd_user("test");
				
				String viewPage = "common/message";

				boolean isError = false;
				String message = "정상 수정되었습니다.";
				//String locationURL = "/board/boardView/" + board.getBo_seq_no();
				String locationURL = "/board/3030102/" + board.getBo_id() + "/" + board.getBo_type_code();
		
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
						
		//Member member = (Member)session.getAttribute("LOGIN_USER");
					
		//if(member == null) {
		//	return "redirect:/login/loginForm";
		//}
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		//paramMap.put("upd_user", member.getMem_id());
		paramMap.put("upd_user", "test");
		paramMap.put("bo_id", bo_id);
		
		String viewPage = "common/message";

		boolean isError = false;
		String message = "정상 삭제되었습니다.";
		String locationURL = "/board/3030101?bo_type_code=" + bo_type_code;
		
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
		//System.out.println(comment.getBo_co_id());
		int bo_id = comment.getBo_id();
		//int variable = 1;
		//Map<String, Integer> paramMap= new HashMap<>();
		//paramMap.put("bo_id", bo_id);
		//paramMap.put("variable", variable);
		//boardqnaService.updateCommentCnt(paramMap);
		System.out.println(comment.getBo_co_id());
		boardService.commentInsert(comment);
		System.out.println(comment.getBo_co_id());
		
		//String cust_id = board.getBo_writer();
		//String co_writer = comment.getCo_writer();
		boardcmtnotice.setBo_co_id(comment.getBo_co_id());
		
		//if(!cust_id.equals(co_writer)) {
			boardService.commentInsertnotice(boardcmtnotice);
		//}
		
	
		return "redirect:/board/3030102/"+bo_id+"/"+bo_type_code;

	}

	@RequestMapping("/commentDelete")
	public String commentDelete(int bo_co_id, int bo_id, int bo_type_code) throws Exception {

		int variable = -1;
		Map<String, Integer> paramMap= new HashMap<>();
		paramMap.put("bo_co_id", bo_co_id);
		paramMap.put("variable", variable);
		
		//boardqnaService.updateCommentCnt(paramMap);
		boardService.commentDelete(bo_co_id);

		return "redirect:/board/3030102/"+bo_id+"/"+bo_type_code;

	}

	@RequestMapping("/commentUpdate")
	public String commentDelete(int bo_co_id, int bo_id, int bo_type_code, String bo_co_content) throws Exception {

		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("bo_co_id", bo_co_id);
		paramMap.put("bo_co_content", bo_co_content);

		boardService.commentUpdate(paramMap);

		return "redirect:/board/3030102/"+bo_id+"/"+bo_type_code;

	}	
}
