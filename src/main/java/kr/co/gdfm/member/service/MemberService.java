package kr.co.gdfm.member.service;

import java.util.List;
import java.util.Map;

import kr.co.gdfm.member.model.Member;
import kr.co.gdfm.member.model.Memberclass;

public interface MemberService {
	
	// 총 회원수
	public int getMemberConunt(Map<String, Object> paramMap) throws Exception;
	
	// 회원목록조회
	public List<Member> getMemberList(Map<String, Object> paramMap) throws Exception;// ArrayList도 가능 검색  Map<String, Object> String searchType,String searchWord
	
	// 회원정보조회
	public Member getMember(String mem_id) throws Exception;
	
	// 회원 등록
	public int insertMember(Member member) throws Exception;
	
	// 회원 수정
	public int updateMember(Member member) throws Exception;
	
	// 회원 삭제
	public int deleteMember(String mem_id) throws Exception;

	// 회원 삭제
	//public int deleteMember(String[] mem_id) throws Exception; //대량삭제시
	
	// 회원등급
	public List<Memberclass> getMemberclassList(Map<String, Object> paramMap) throws Exception;
	
	// 회원아이디찾기
	public Member getMemberidcheck(Map<String, Object> paramMap) throws Exception;

	// 회원비밀번호찾기
	public Member getMemberpwdcheck(Map<String, Object> paramMap) throws Exception;
}
