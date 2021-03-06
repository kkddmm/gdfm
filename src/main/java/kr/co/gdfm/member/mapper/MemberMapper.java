package kr.co.gdfm.member.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdfm.member.model.Member;
import kr.co.gdfm.member.model.Memberclass;

@Mapper
public interface MemberMapper {
	
	public int selectMemberCount(Map<String, Object> paramMap) throws Exception;

	public List<Member> selectMemberList(Map<String, Object> paramMap) throws Exception;
	
	public Member selectMember(String mem_id) throws Exception;
	
	public int insertMember(Member member) throws Exception;
	
	public int updateMember(Member member) throws Exception;
	
	public int deleteMember(String mem_id) throws Exception;

	public List<Memberclass> selectMemberclassList(Map<String, Object> paramMap) throws Exception;
	
	public Member selectMemberidcheck(Map<String, Object> paramMap) throws Exception;

	public Member selectMemberpwdcheck(Map<String, Object> paramMap) throws Exception;
}
