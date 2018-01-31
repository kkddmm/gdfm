package kr.co.gdfm.boardqna.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.gdfm.boardqna.mapper.BoardqnaMapper;
import kr.co.gdfm.boardqna.model.Boardqna;
import kr.co.gdfm.boardqna.model.Comment;
import kr.co.gdfm.boardqna.service.BoardqnaService;
import kr.co.gdfm.common.file.mapper.FileItemMapper;
import kr.co.gdfm.common.file.model.FileItem;

@Service("boardqnaService")
public class BoardqnaServiceImpl implements BoardqnaService {
	
	@Autowired
	BoardqnaMapper boardqnaMapper;
	
	@Autowired
	FileItemMapper fileItemMapper;
	
	@Override
	public int getBoardqnaCount(Map<String, Object> paramMap) throws Exception {
		return boardqnaMapper.selectBoardqnaCount(paramMap);
	}

	@Override
	public List<Boardqna> getBoardqnaList(Map<String, Object> paramMap) throws Exception {
		return boardqnaMapper.selectBoardqnaList(paramMap);
	}

	@Override
	public Boardqna getBoardqna(int bo_id) throws Exception {
		
		// 조회수 업데이트 수행
		boardqnaMapper.updateHitCntqna(bo_id);
		
		Boardqna boardqna = boardqnaMapper.selectBoardqna(bo_id);
		
		//파일 목록 조회
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("ref_id", boardqna.getBo_id());
		paramMap.put("file_biz_type", boardqna.getBo_type());
					
		List<FileItem> fileItemList = fileItemMapper.selectFileItemList(paramMap);
		boardqna.setFileItemList(fileItemList);
		
		return boardqna;
	}

	@Override
	public int insertBoardqna(Boardqna boardqna) throws Exception {
		
		int updCnt = boardqnaMapper.insertBoardqna(boardqna);
		
		// 파일 저장.
		List<FileItem> fileItemList = boardqna.getFileItemList();
		if(fileItemList != null && !fileItemList.isEmpty()) {
			for (FileItem fileItem : fileItemList) {
			fileItem.setRef_id(boardqna.getBo_id());
			fileItem.setFile_reg_user(boardqna.getMem_id());
			fileItem.setFile_upd_user(boardqna.getMem_id());
			fileItemMapper.insertFileItem(fileItem);
			}
		}
		
		return updCnt;
	}

	@Override
	public int updateBoardqna(Boardqna boardqna) throws Exception {
		
		// 기존 파일 삭제
		String[] delFileSeqNo = boardqna.getDelFileSeqNo();
		if(delFileSeqNo != null && delFileSeqNo.length > 0) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("delFileSeqNo", delFileSeqNo);
		fileItemMapper.deleteFileItem(paramMap);
		}
		
		int updCnt = boardqnaMapper.updateBoardqna(boardqna);
		
		// 신규 파일 등록
		List<FileItem> fileItemList = boardqna.getFileItemList();
		if(fileItemList != null && !fileItemList.isEmpty()) {
			for (FileItem fileItem : fileItemList) {
				fileItem.setRef_id(boardqna.getBo_id());
				fileItem.setFile_reg_user(boardqna.getMem_id());
				fileItem.setFile_upd_user(boardqna.getMem_id());
				fileItemMapper.insertFileItem(fileItem);
			}
		}
		
		return updCnt;
	}

	@Override
	public int deleteBoardqna(Map<String, Object> paramMap) throws Exception {
		return boardqnaMapper.deleteBoardqna(paramMap);
	}
	
	@Override
	public List<Comment> getCommentList(int bo_id) throws Exception {
		return boardqnaMapper.getCommentList(bo_id);
	}

	@Override
	public int commentInsert(Comment comment) throws Exception {
		return boardqnaMapper.commentInsert(comment);
	}
	
	@Override
	public int commentDelete(int bo_co_id) throws Exception {
		return boardqnaMapper.commentDelete(bo_co_id);
	}

	@Override
	public int commentUpdate(Map<String, Object> paramMap) throws Exception {
		return boardqnaMapper.commentUpdate(paramMap);
	}
}
