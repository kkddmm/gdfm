package kr.co.gdfm.boardqna.controller;

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

import kr.co.gdfm.boardqna.model.Boardqna;
import kr.co.gdfm.boardqna.model.Comment;
import kr.co.gdfm.boardqna.service.BoardqnaService;
import kr.co.gdfm.cinema.model.Cinema;
import kr.co.gdfm.common.cinemalist.mapper.CinemaListMapper;
import kr.co.gdfm.common.file.model.FileItem;
import kr.co.gdfm.common.file.service.FileItemService;
import kr.co.gdfm.common.util.PagingUtil;


@Controller
@RequestMapping("/board")
public class BoardqnaController {
	
	@Autowired
	BoardqnaService boardqnaService;

	@Autowired
	CinemaListMapper cinamaListMapper;
	
	@Autowired
	FileItemService fileItemService;
	
	@RequestMapping("/3030201")
	public String boardListqna(
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
		totalCount = boardqnaService.getBoardqnaCount(paramMap);
		
		// 페이징 처리
		PagingUtil pagingUtil = new PagingUtil(currentPage, totalCount, pageSize, pageCount);
		
		paramMap.put("startRow", pagingUtil.getStartRow());
		paramMap.put("endRow", pagingUtil.getEndRow());
		
		List<Boardqna> boardqnaList = boardqnaService.getBoardqnaList(paramMap);
		
		model.addAttribute("boardqnaList", boardqnaList);
		model.addAttribute("pagingUtil", pagingUtil);
		
		return "board/3030201";
		
	}
	
	@RequestMapping("/3030202/{bo_id}") // @PathVariable. /boardView/1233(pk,시퀀즈번호)/{mem_id}
	public String boardqnaView(
			//@RequestParam(value="bo_seq_no") int bo_seq_no,
			@PathVariable(value="bo_id", required=true) int bo_id,
			Model model
			) throws Exception {
		
		Boardqna boardqna = null;
		
		if(bo_id != 0) {
			boardqna = boardqnaService.getBoardqna(bo_id);
		}
		
		List<Comment> commentList = boardqnaService.getCommentList(bo_id);
		
		model.addAttribute("boardqna", boardqna);
		model.addAttribute("commentList", commentList);
		
		return "board/3030202";
	}
	
	@RequestMapping("/3030202/commentInsert")
	public String commnetInsert(Comment comment) throws Exception {
		//System.out.println(comment.getBo_co_id());
		int bo_id = comment.getBo_id();
		//int variable = 1;
		//Map<String, Integer> paramMap= new HashMap<>();
		//paramMap.put("bo_id", bo_id);
		//paramMap.put("variable", variable);
		//boardqnaService.updateCommentCnt(paramMap);
		System.out.println(comment.getBo_co_id());
		boardqnaService.commentInsert(comment);
		System.out.println(comment.getBo_co_id());
	
		return "redirect:/board/3030202/"+bo_id;

	}

	@RequestMapping("/3030202/commentDelete")
	public String commentDelete(int bo_co_id, int bo_id) throws Exception {

		int variable = -1;
		Map<String, Integer> paramMap= new HashMap<>();
		paramMap.put("bo_co_id", bo_co_id);
		paramMap.put("variable", variable);
		
		//boardqnaService.updateCommentCnt(paramMap);
		boardqnaService.commentDelete(bo_co_id);

		return "redirect:/board/3030202/"+bo_id;

	}

	@RequestMapping("/3030202/commentUpdate")
	public String commentDelete(int bo_co_id, int bo_id, String bo_co_content) throws Exception {

		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("bo_co_id", bo_co_id);
		paramMap.put("bo_co_content", bo_co_content);

		boardqnaService.commentUpdate(paramMap);

		return "redirect:/board/3030202/"+bo_id;

	}	
	
	@RequestMapping("/3030203")
	public String boardqnaForm(
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

			Boardqna boardqna = new Boardqna();
				
			if(bo_id != 0) {
				boardqna = boardqnaService.getBoardqna(bo_id);
					
			}else {
				// 로그인 사용자 정보
				//board.setBo_writer(member.getMem_id());
				//board.setBo_writer_name(member.getMem_name());
			}
			
			Map<String, Object> paramMap = new HashMap<>();
			List<Cinema> cinemaList = cinamaListMapper.selectCinemaList(paramMap);
			model.addAttribute("boardqna", boardqna);
			model.addAttribute("cinemaList", cinemaList);
				
			return "board/3030203";
	}
	
	@RequestMapping(value="/boardqnaInsert", method=RequestMethod.POST)
	public String boardqnaInsert(
			Boardqna boardqna,
			HttpServletRequest request,
			Model model
			) throws Exception {
		
				
				String viewPage = "common/message";

				boolean isError = false;
				String message = "정상 등록되었습니다.";
				String locationURL = "/board/3030201";
				
				try {
				
					// 파일 목록 생성.
					List<FileItem> fileItemList = fileItemService.uploadFiles(request, boardqna.getBo_type());
					
					boardqna.setFileItemList(fileItemList);
					
					int updCnt = boardqnaService.insertBoardqna(boardqna);
					
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
	
	@RequestMapping(value="/boardqnaUpdate", method=RequestMethod.POST)
	public String boardqnaUpdate(
			Boardqna boardqna,
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
				boardqna.setBo_upd_user("test");
				
				String viewPage = "common/message";

				boolean isError = false;
				String message = "정상 수정되었습니다.";
				//String locationURL = "/board/boardView/" + board.getBo_seq_no();
				String locationURL = "/board/3030202/" + boardqna.getBo_id();
		
				try {
							
					// 파일 업로드처리
					List<FileItem> fileItemList = fileItemService.uploadFiles(request, boardqna.getBo_type());
					boardqna.setFileItemList(fileItemList);
					
					int updCnt = boardqnaService.updateBoardqna(boardqna);
					
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
	@RequestMapping("/boardqnaDelete")
	public String boardqnaDelete(
			HttpSession session,
			@RequestParam("bo_id") int bo_id,
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
		String locationURL = "/board/3030201";
		
		try {
			
			int updCnt = boardqnaService.deleteBoardqna(paramMap);
			
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
}
