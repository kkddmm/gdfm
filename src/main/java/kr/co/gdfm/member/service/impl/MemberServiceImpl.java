package kr.co.gdfm.member.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

//import kr.co.gdfm.common.sms.mapper.SmsMapper;
//import kr.co.gdfm.common.sms.model.SmsMsg;
import kr.co.gdfm.member.mapper.MemberMapper;
import kr.co.gdfm.member.model.Member;
import kr.co.gdfm.member.model.Memberclass;
import kr.co.gdfm.member.service.MemberService;
//이름설정안해주면 클래스이름 따라감
@Service("memberService")
public class MemberServiceImpl implements MemberService {
	
	//로그
	//private static Logger logger = Logger.getLogger(MemberServiceImpl.class);
	
	//bean 등록
	@Autowired
	MemberMapper memberMapper;
	
	@Autowired
	//SmsMapper SmsMapper;
	
	@Override
	public List<Member> getMemberList(Map<String, Object> paramMap) throws Exception {
		return memberMapper.selectMemberList(paramMap);
	}

	@Override
	public Member getMember(String mem_id) throws Exception {
		return memberMapper.selectMember(mem_id);
	}

	@Override
	public int insertMember(Member member) throws Exception {
		int upCnt = memberMapper.insertMember(member);
		
		//SmsMsg smsMsg = new SmsMsg();
		
		//smsMsg.setSms_title("회원가입");
		//smsMsg.setSms_content("저희 사이트의 회원가입을 축하합니다.");
		//smsMsg.setSms_phone_no(member.getMem_phone());
		//smsMsg.setSms_status("1");
		
		//SmsMapper.insertSms(smsMsg);
	
		return upCnt;
	}

	@Override
	public int updateMember(Member member) throws Exception {
		return memberMapper.updateMember(member);
	}

	@Override
	public int deleteMember(String mem_id) throws Exception {
		return memberMapper.deleteMember(mem_id);
	}

	@Override
	public int getMemberConunt(Map<String, Object> paramMap) throws Exception {
		return memberMapper.selectMemberCount(paramMap);
	}

	@Override
	public List<Memberclass> getMemberclassList(Map<String, Object> paramMap) throws Exception {
		return memberMapper.selectMemberclassList(paramMap);
	}
}
