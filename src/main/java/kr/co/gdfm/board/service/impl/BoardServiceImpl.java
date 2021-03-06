package kr.co.gdfm.board.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.gdfm.board.mapper.BoardMapper;
import kr.co.gdfm.board.model.Board;
import kr.co.gdfm.board.model.Boardcmtnotice;
import kr.co.gdfm.board.model.Boardtype;
import kr.co.gdfm.board.service.BoardService;
import kr.co.gdfm.board.model.Comment;
import kr.co.gdfm.cinema.model.Cinema;
import kr.co.gdfm.common.file.mapper.FileItemMapper;
import kr.co.gdfm.common.file.model.FileItem;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	BoardMapper boardMapper;
	
	@Autowired
	FileItemMapper fileItemMapper;
	
	@Override
	public int getBoardCount(Map<String, Object> paramMap) throws Exception {
		return boardMapper.selectBoardCount(paramMap);
	}

	@Override
	public List<Board> getBoardList(Map<String, Object> paramMap) throws Exception {
		return boardMapper.selectBoardList(paramMap);
	}

	@Override
	public Board getBoard(int bo_id) throws Exception {
		
		// 조회수 업데이트 수행
		boardMapper.updateHitCnt(bo_id);
		
		Board board = boardMapper.selectBoard(bo_id);
		
		//파일 목록 조회
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("ref_id", board.getBo_id());
		paramMap.put("file_biz_type", board.getBo_type_code());
					
		List<FileItem> fileItemList = fileItemMapper.selectFileItemList(paramMap);
		board.setFileItemList(fileItemList);
		
		return board;
	}

	@Override
	public int insertBoard(Board board) throws Exception {
		
		int updCnt = boardMapper.insertBoard(board);
		
		// 파일 저장.
		List<FileItem> fileItemList = board.getFileItemList();
		if(fileItemList != null && !fileItemList.isEmpty()) {
			for (FileItem fileItem : fileItemList) {
			fileItem.setRef_id(board.getBo_id());
			fileItem.setFile_reg_user(board.getMem_id());
			fileItem.setFile_upd_user(board.getMem_id());
			fileItemMapper.insertFileItem(fileItem);
			}
		}
		
		return updCnt;
	}

	@Override
	public int updateBoard(Board board) throws Exception {
		
		// 기존 파일 삭제
		String[] delFileSeqNo = board.getDelFileSeqNo();
		if(delFileSeqNo != null && delFileSeqNo.length > 0) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("delFileSeqNo", delFileSeqNo);
		fileItemMapper.deleteFileItem(paramMap);
		}
		
		int updCnt = boardMapper.updateBoard(board);
		
		// 신규 파일 등록
		List<FileItem> fileItemList = board.getFileItemList();
		if(fileItemList != null && !fileItemList.isEmpty()) {
			for (FileItem fileItem : fileItemList) {
				fileItem.setRef_id(board.getBo_id());
				fileItem.setFile_reg_user(board.getMem_id());
				fileItem.setFile_upd_user(board.getMem_id());
				fileItemMapper.insertFileItem(fileItem);
			}
		}
		
		return updCnt;
	}

	@Override
	public int deleteBoard(Map<String, Object> paramMap) throws Exception {
		return boardMapper.deleteBoard(paramMap);
	}

	@Override
	public List<Board> getNoticeList(Map<String, Object> paramMap) throws Exception {
		return boardMapper.selectNoticeList(paramMap);
	}

	@Override
	public List<Cinema> getCinemaList(Map<String, Object> paramMap) throws Exception {
		return boardMapper.selectCinemaList(paramMap);
	}
	
	@Override
	public List<Comment> getCommentList(int bo_id) throws Exception {
		return boardMapper.getCommentList(bo_id);
	}

	@Override
	public int commentInsert(Comment comment) throws Exception {
		return boardMapper.commentInsert(comment);
	}
	
	@Override
	public int commentDelete(int bo_co_id) throws Exception {
		return boardMapper.commentDelete(bo_co_id);
	}

	@Override
	public int commentUpdate(Map<String, Object> paramMap) throws Exception {
		return boardMapper.commentUpdate(paramMap);
	}
	
	@Override
	public List<Boardtype> getBoardtypeList(Map<String, Object> paramMap) throws Exception {
		return boardMapper.selectBoardtypeList(paramMap);
	}
	
	@Override
	public List<Boardtype> getadminBoardtypeList(Map<String, Object> paramMap) throws Exception {
		return boardMapper.selectadminBoardtypeList(paramMap);
	}
	
	@Override
	public int commentInsertnotice(Boardcmtnotice boardcmtnotice) throws Exception {
		return boardMapper.insertBoardcmtnotice(boardcmtnotice);
	}

	@Override
	public int updateBoardtype(Boardtype boardtype) throws Exception {
		return boardMapper.updateadminBoardtype(boardtype);
	}

	@Override
	public Boardtype getBoardtype(int bo_type_code) throws Exception {
		return boardMapper.selectadminBoardtype(bo_type_code);
	}

	@Override
	public int insertBoardtype(Boardtype boardtype) throws Exception {
		return boardMapper.insertadminBoardtype(boardtype);
	}

	@Override
	public int deleteBoardtype(int bo_type_code) throws Exception {
		return boardMapper.deleteadminBoardtype(bo_type_code);
	}
}
