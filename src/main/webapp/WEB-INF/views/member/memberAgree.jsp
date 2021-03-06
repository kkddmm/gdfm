<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<script>

function agree_check() {
	//var frm = document.memberAgree;
	if($('[name="acc1"]').is(":checked") != true)
	{
		alert('가입 약관에 동의하셔야 합니다.');
		$('[name="acc1"]').focus();
		return false;
	}
	document.memberAgree.submit();
}

	
</script>

<style>
p.inline{
	display: inline;	
	
}
h2{
	display: inline;	
}
div.divRight{
	float: right;
}
.divBorder{
	border: 1px solid rgb(201, 205, 214);	
}
dd a{
	font-size: 15px;	
}
dt, dd{
	text-align: left;
	height: 50px;
}

</style>

<section id="portfolio">
	<div class="col-md-2">
						
	</div>
	<div class="col-md-12" style="background-color:#eeeeee">	
	<hgroup>
	<h2 style="font-size:40px;">회원가입</h2><br>
		<!-- <div class="divRight">
			<p class="inline">
				<a href="#">home</a>
				<a href="#">서비스</a>
				<a href="#">회원가입</a>
			</p>
		</div> -->
		<br>
	</hgroup>
	<article align="center">
		<p class="inline" style="font-size: 20px;">약관동의</p>
		<span class="glyphicon glyphicon-chevron-right"></span>
		<p class="inline" style="font-size: 20px;">정보입력</p>
		<span class="glyphicon glyphicon-chevron-right"></span>
		<p class="inline" style="font-size: 20px;">가입완료</p>
	</article>
	<h5>[이용약관] 약관을 읽으신 후 동의 여부를 체크해 주세요.</h5>
	<div>
		<div class="divBorder" style="overflow:scroll; width:100%; height:400px; padding-left: 10px; padding-right: 10px;background-color:#ffffff">  
					제 1장 총칙
		<h5>제 1조 (목적)</h5>
		<p>이 약관은 영화보기 좋은 날에서 제공하는 대표홈페이지 및 주요사업 홈페이지에서 (이하 "당 홈페이지"라 함) 제공하는 모든 서비스(이하 "서비스")의 이용조건 및 절차, 이용자와 당 홈페이지의 권리, 의무, 책임사항과 기타 필요한 사항을 규정함을 목적으로 합니다.</p>
		<h5>제2조 (약관의 효력과 변경)</h5>
		<p>당 홈페이지는 귀하가 본 약관 내용에 동의하는 것을 조건으로 귀하에게 서비스를 제공할 것이며, 귀하가 본 약관의내용에 동의하는 경우, 당 홈페이지의 서비스 제공 행위 및 귀하의 서비스 사용 행위에는 본 약관이 우선적으로 적용될 것입니다. 
		당 홈페이지는 본 약관을 사전 고지 없이 변경할 수 있으며, 변경된 약관은 당 홈페이지 내에 공지함으로써 이용자가직접 확인하도록 할 것입니다. 이용자가 변경된 약관에 동의하지 아니하는 경우, 
		이용자는 본인의 회원등록을 취소(회원탈퇴)할 수 있으며, 계속 사용의 경우는 약관 변경에 대한 동의로 간주됩니다. 변경된 약관은 공지와 동시 에그 효력이 발생됩니다.</p>
		<h5>제3조 (약관 외 준칙)</h5>
		<p>본 약관에 명시되지 않은 사항은 전기통신기본법, 전기통신사업법, 정보통신윤리위원회심의규정, 정보통신 윤리 강령, 프로그램보호법 및 기타 관련 법령의 규정에 의합니다.</p>
		<h5>제4조 (용어의 정의)</h5>
		<p>본 약관에서 사용하는 용어의 정의는 다음과 같습니다.
		이용자 : "당 홈페이지"에 접속하여 "당 홈페이지"에서 제공하는 서비스를 받는 회원 및 비회원
		통합회원(이하 "회원"라 합니다.) : "당 홈페이지"에 접속하여 이 약관에 동의하고, 통합ID(고유번호)와 비밀번호를 발급 받은 자로 대전광역정신건강복지센터에서 제공하는 주요사업 홈페이지의 이용을 원할 경우 홈페이지의 사용여부를 승낙하는 것만으로 별도의 가입 없이 해당 홈페이지를 이용할 수 있습니다.
		비회원 : 회원가입을 하지 않고 "당 홈페이지"에서 제공하는 서비스를 이용하는 자
		정회원 : 회원가입을 하고 당 홈페이지에서 운영하는 사이트 정회원 서비스를 이용하는 자
		통합ID(고유번호) : 회원 식별과 회원의 서비스 이용을 위하여 이용자가 선정하고 "당 홈페이지"에서 승인하는 영문자와 숫자의 조합(이용자는 하나의 ID만 발급, 이용 가능)
		비밀번호 : 회원의 정보 보호를 위해 이용자 자신이 설정한 문자와 숫자의 조합
		회원가입 : "회원가입" 이라 함은 서비스 이용과 관련하여 당 홈페이지와 회원 간에 체결하는 이용계약
		회원탈퇴 : 회원이 "당 홈페이지"에서 이용계약을 종료시키는 의사표시</p>
		<h5>제 2 장 서비스 제공 및 이용</h5>
		<h5>제 5 조 (이용 계약의 성립)</h5>
		<p>이용계약은 신청자가 온라인으로 당 홈페이지에서 제공하는 소정의 가입신청 양식에서 요구하는 사항을 기록하여 가입을 완료하는 것으로 성립됩니다. 당 홈페이지는 다음 각 호에 해당하는 이용계약에 대하여는 가입을 취소할 수 있습니다.
		1)다른 사람의 명의를 사용하여 신청하였을 때 
		2)이용 계약 신청서의 내용을 허위로 기재하였거나 신청하였을 때 
		3)사회의 안녕 질서 혹은 미풍양속을 저해할 목적으로 신청하였을 때 
		4)다른 사람의 당 홈페이지 서비스 이용을 방해하거나 그 정보를 도용하는 등의 행위를 하였을 때 
		5)당 홈페이지를 이용하여 법령과 본 약관이 금지하는 행위를 하는 경우 
		6)기타 당 홈페이지가 정한 이용신청요건이 미비 되었을 때 당 홈페이지는 다음 각 항에 해당하는 경우 그 사유가 해소될 때까지 이용계약 성립을 유보할
		    수 있습니다. 
		7)서비스 관련 제반 용량이 부족한 경우 
		8)기술상 장애 사유가 있는 경우 당 홈페이지가 제공하는 서비스는 변경될 수 있으며, 변경 사항은 홈페이지 내 공지사항을 통해서 이용자에게 알릴 수
		    있습니다. </p>
		<h5>제 6 조 (개인정보 수집 및 이용에 대한 동의)</h5>
		<p>회원 개인정보의 수집 및 이용에 대해서는 당 홈페이지 개인정보 처리방침이 적용됩니다. 당 홈페이지 회원의 개인정보는 다음과 같이 수집·이용 됩니다.
		1) 회원가입 시 수집하는 개인정보 항목 : 성명, 이메일주소 
		2) 개인정보 수집 및 이용목적 : 회원관리 
		3) 개인정보의 보유 및 이용기간 : 회원가입 시 수집한 개인정보는 회원이 홈페이지를 탈퇴할 때까지 보유되며, 탈퇴 시 해당 회원의 개인정보는 폐기
		    됩니다. 
		4) 동의거부 권리 및 불이익 : 회원가입 시 저희 재단이 수집하는 개인정보 항목을 입력하지 않으시는 경우 당 홈페이지의 회원가입 및 그에 따른 컨텐츠
		    이용이 제한될 수 있습니다. 
		5) 당 홈페이지는 회원가입 시 수집한 회원의 개인정보를 본인의 승낙 없이 제3자에게 제공하지 않습니다. 
		6) 회원이 본 약관에 따라 당 홈페이지 회원가입을 하는 것은 위의 1)~5)의 개인정보 수집, 이용에 동의하는 것으로 간주됩니다.</p>
		<h5>제 7 조 (회원의 정보 보안)</h5>
		<p>당 홈페이지는 「개인정보보호법」 제29조에 따라 개인정보처리방침을 수립하고 개인정보의 안전성 확보에 필요한 기술적, 관리적, 물리적 조치를 하고 있습니다. 
		ID와 비밀번호에 관한 모든 관리의 책임은 회원에게 있으며, 회원의 ID나 비밀번호가 부정하게 사용되었다는 사실을 발견한 경우에는 즉시 당 홈페이지에 신고하여야 합니다. 신고를 하지 않음으로 인한 모든 책임은 회원 본인에게있습니다. 
		이용자는 당 홈페이지 서비스의 사용 종료 시마다 정확히 접속을 종료하도록 해야 하며, 정확히 종료하지 아니함으로써 제3자가 귀하에 관한 정보를 이용하게 되는 등의 
		결과로 인해 발생하는 손해 및 손실에 대하여 당 홈페이지는 책임을 부담하지 아니합니다.</p>
		<h5>제 8 조 (서비스 이용시간)</h5>
		<p>서비스 이용시간은 당 홈페이지의 업무상 또는 기술상 특별한 지장이 없는 한 연중무휴, 1일 24시간을 원칙으로 합니다. 
		제1항의 이용시간은 정기점검 등의 필요로 인하여 당 홈페이지가 정한 날 또는 시간은 예외로 합니다.</p>
		<h5>제 9 조 (서비스의 내용)</h5>
		
		<p>통합홈페이지에서 회원가입시, 대표홈페이지에 가입 처리됨을 원칙으로 합니다.</p>
		<h5>제 10 조 (서비스의 중지 및 정보의 저장과 사용)</h5>
		<p>회원은 당 홈페이지 서비스에 보관되거나 전송된 메시지 및 기타 통신 메시지 등의 내용이 국가의 비상사태, 정전, 당 홈페이지의 관리 범위 외의 서비스 설비 장애 및 기타 불가항력에 의하여 보관되지 못하였거나 삭제된 경우,전송되지 못한 경우 및 기타 통신 데이터의 손실이 있을 경우에 당 홈페이지는 관련 책임을 부담하지 아니합니다. 
		당 홈페이지가 정상적인 서비스 제공의 어려움으로 인하여 일시적으로 서비스를 중지하여야 할 경우에는 서비스 중지 1주일전의 고지 후 서비스를 중지할 수 있으며, 이 기간 동안 회원이 고지내용을 인지하지 못한 데 대하여 당 홈페이지는 책임을 부담하지 아니합니다. 국가의 비상사태, 정전, 당 홈페이지의 관리범위 외 서비스 설비장애 및 기타 불가항력의 경우 위 사전 고지기간은 감축되거나 생략될 수 있습니다. 또한 위 서비스 중지에 의하여 본 서비스에 보관되거나 전송된 메시지 및 기타 통신 메시지 등의 내용이 보관되지 못하였거나 삭제된 경우, 전송되지 못한 경우 및 기타 통신 데이터의 손실이 있을 경우에 대하여도 당 홈페이지는 책임을 부담하지 아니합니다. 
		당 홈페이지의 사정으로 서비스를 영구적으로 중단하여야 할 경우 제2항에 의거합니다. 다만, 이 경우 사전 고지기간은 1개월로 합니다. 
		당 홈페이지는 사전 고지 후 서비스를 일시적으로 수정, 변경 및 중단할 수 있으며, 이에 대하여 귀하 또는 제3자에게 어떠한 책임도 부담하지 아니합니다. 
		당 홈페이지는 이용자가 본 약관의 내용에 위배되는 행동을 한 경우, 사전 고지 없이 서비스 사용을 중지시킬 수 있습니다.</p>
		<h5>제 11 조 (서비스의 변경 및 해지)</h5>
		<p>당 홈페이지는 이용자가 서비스를 이용하여 기대하는 손익이나 서비스를 통하여 얻은 자료로 인한 손해에 관하여 책임을 지지 않으며, 이용자가 본 서비스에 게재한 정보, 자료, 사실의 신뢰도, 정확성 등, 내용에 관하여는 책임을 지지 않습니다. 
		당 홈페이지는 이용자가 서비스를 이용하여, 고의 또는 과실로 타 이용자에게 손해를 입힌 경우에 대하여 책임을 부담하지 아니합니다.</p>
		<h5>제 12 조 (정보 제공 및 홍보물 게재)</h5>
		<p>당 홈페이지는 서비스를 운영함에 있어서 각종 정보를 서비스에 게재하는 방법 등으로 회원에게 제공할 수 있습니다. 당 홈페이지는 서비스에 적절하다고 판단되거나 활용 가능성 있는 홍보물을 게재할 수 있습니다.</p>
		<h5>제 13 조 (당 홈페이지에 제출된 게시물의 저작권)</h5>
		<p>회원이 게시한 게시물의 내용에 대한 권리는 귀하에게 있습니다. 당 홈페이지는 게시된 내용을 사전 통지 없이 이동 할 수 있는 권리를 보유하며, 다음의 경우 사전 통지 없이 삭제할 수 있습니다.
		1)본 서비스 약관에 위배되거나 상용 또는 불법, 음란, 저속하다고 판단되는 게시물을 게시한 경우 
		2)다른 회원 또는 제 3자를 비방하거나 중상모략으로 명예를 손상시키는 내용인 경우 
		3)공공질서 및 미풍양속에 위반되는 내용인 경우 
		4)범죄적 행위에 결부된다고 인정되는 내용일 경우 
		5)제3자의 저작권 등 기타 권리를 침해하는 내용인 경우 
		6)기타 관계 법령에 위배되는 경우이용자의 게시물이 타인의 저작권을 침해함으로써 발생하는 민, 형사상의 책임은 전적으로 회원이 부담하여야 합니다.</p>
		<h5>제 14 조 (사용자의 행동규범 및 서비스 이용제한)</h5>
		<p>회원이 제공하는 정보의 내용이 허위인 것으로 판명되거나, 그러하다고 의심할 만한 합리적인 사유가 발생할 경우 당 홈페이지는 귀하의 본 서비스 사용을 일부 또는 전부 중지할 수 있으며, 이로 인해 발생하는 불이익에 대해 책임을 부담하지 아니합니다. 
		회원이 당 홈페이지 서비스를 통하여 게시, 전송, 입수하였거나 전자메일 등, 다른 수단에 의하여 게시, 전송 또는 입수한 모든 형태의 정보에 대하여는 회원이 모든 책임을 부담하며 당 홈페이지는 어떠한 책임도 부담하지 아니합니다. 당 홈페이지는 당 홈페이지가 제공한 서비스가 아닌 가입자 또는 기타 유관기관이 제공하는 서비스의 내용상의 정확성,완전성 및 품질에 대하여 보장하지 않습니다. 따라서 당 홈페이지는 회원이 위 내용을 이용함으로 인하여 입게 된 모든 종류의 손실이나 손해에 대하여 책임을 부담하지 아니합니다.
		회원은 본 서비스를 통하여 다음과 같은 행위를 금지합니다. 
		1)타인의 아이디(ID)와 비밀번호를 도용하는 행위 
		2)저속, 음란, 모욕적, 위협적이거나 타인의 프라이버시를 침해할 수 있는 내용을 전송, 게시, 게재, 전자메일 또는 기타의 방법으로 전송하는 행위 
		3)서비스를 통하여 전송된 내용의 출처를 위장하는 행위 
		4)법률, 계약에 의하여 이용할 수 없는 내용을 게시, 게재, 전자메일 또는 기타의 방법으로 전송하는 행위 
		5)타인의 특허, 상표, 영업비밀, 저작권, 기타 지적재산권을 침해하는 내용을 게시, 게재, 전자메일 또는 기타의 방법으로 전송하는 행위 
		6)당 홈페이지의 승인을 받지 아니한 광고, 판촉물, 정크메일, 스팸, 행운의 편지, 피라미드 조직 등, 다른 형태의 권유를 게시, 게재, 전자메일 또는
		    기타의 방법으로 전송하는 행위 
		7)다른 사용자의 개인정보를 수집 또는 저장하는 행위당 홈페이지는 회원이 본 약관을 위배했다고 판단되면 당 홈페이지와 관련한 모든 이용정보를
		    이용자의 동의 없이 삭제할 수 있습니다.</p>
		<h5>제 3 장 의무 및 책임</h5>
		<p>제 15 조 (당 홈페이지의 의무)
		당 홈페이지는 법령과 본 약관이 금지하거나 미풍양속에 반하는 행위를 하지 않으며, 계속적, 안정적으로 서비스를 제공하기 위해 노력할 의무가 있습니다. 
		당 홈페이지는 이용자가 안전하게 당 홈페이지서비스를 이용할 수 있도록 이용자의 개인정보 (신용정보 포함) 보호를 위한 보안시스템을 갖추어야 합니다. 
		단, 당 홈페이지는 이용자의 귀책사유로 인한 서비스 이용 장애에 대하여 책임을 지지 않습니다.</p>
		<h5>제 16 조 (회원의 의무)</h5>
		<p>회원 가입 시에 요구되는 정보는 정확하게 기입하여야 하며, 기입된 정보가 정확하게 유지·갱신되어야 합니다. 또한, 회원은 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는 안 됩니다. 
		회원은 당 홈페이지의 사전 승낙 없이 서비스를 이용하여 어떠한 영리행위도 할 수 없습니다. 
		회원은 당 홈페이지 서비스를 이용하여 얻은 정보를 당 홈페이지의 사전승낙 없이 복사, 복제, 변경, 번역, 출판·방송 기타의 방법으로 사용하거나 이를 타인에게 제공할 수 없습니다.
		회원은 당 홈페이지 서비스 이용과 관련하여 다음 각 호의 행위를 하여서는 안됩니다. 
		1)다른 회원의 ID를 부정 사용하는 행위 
		2)범죄행위를 목적으로 하거나 기타 범죄행위와 관련된 행위 
		3)선량한 풍속, 기타 사회질서를 해하는 행위 
		4)타인의 명예를 훼손하거나 모욕하는 행위 
		5)타인의 지적재산권 등의 권리를 침해하는 행위 
		6)해킹행위 또는 컴퓨터바이러스의 유포행위 
		7)타인의 의사에 반하여 광고성 정보 등 일정한 내용을 지속적으로 전송하는 행위 
		8)서비스의 안전적인 운영에 지장을 주거나 줄 우려가 있는 일체의 행위 
		9)당 홈페이지에 게시된 정보의 변경귀하는 회원가입 이후 당 홈페이지에서 제공하는 서비스를 제공받을 의사가 없는 등의 사유가 있을 경우에는
		    언제든지 회원탈퇴(해지)를 할 수 있으며 "당 홈페이지"는 즉시 회원탈퇴를 처리합니다. (대전광역정신건강복지센터에서는 각 홈페이지별 회원을
		    통합 운영하고 있으므로 통합회원을 탈퇴하면 서비스 중인 모든 홈페이지에 로그인할 수 없습니다.)</p>
		<h5>제 4 장 기타</h5>
		<h5>제 17 조 (당 홈페이지의 소유권</h5>
		<p>당 홈페이지가 제공하는 서비스, 그에 필요한 소프트웨어, 이미지, 마크, 로고, 디자인, 서비스명칭, 정보 및 상표 등과 관련된 지적재산권 및 기타 권리는 당 홈페이지 운영기관에 소유권이 있습니다. 
		회원은 당 홈페이지가 명시적으로 승인한 경우를 제외하고는 제17조 1항에 대한 소유권의 전부 또는 일부의 수정, 대여, 대출, 판매, 배포, 제작, 양도, 저작권 기한연장, 담보권 설정 행위, 
		상업적 이용 행위를 할 수 없으며, 제3자로 하여금 이와 같은 행위를 하도록 허락할 수 없습니다.</p>
		<h5>제 18 조 (양도금지)</h5>
		<p>회원이 서비스의 이용권한, 기타 이용계약 상 지위를 타인에게 양도, 증여할 수 없으며, 이를 담보로 제공할 수 없습니다.</p>
		<h5>제 19 조 (손해배상)</h5>
		<p>당 홈페이지는 무료로 제공되는 서비스와 관련하여 회원에게 어떠한 손해가 발생하더라도 당 홈페이지가 아래 각항의 경우를 제외하고는 이에 대한 어떠한 책임도 부담하지 않습니다. 
		당 홈페이지에서 고의로 행한 범죄행위 
		당 홈페이지에서 제공하는 무료 서비스를 원천제공자의 동의 없이 유료서비스로 전환한 경우 
		당 홈페이지에서 부당이득을 취할 목적으로 제16조(당 홈페이지의 의무)조항을 고의적으로 위반한 경우</p>
		<h5>제 20 조 (면책조항)</h5>
		<p>당 홈페이지는 천재지변 또는 이에 준하는 불가항력으로 인하여 "서비스"를 제공할 수 없는 경우에는 "서비스" 제공에 관한 책임이 면제됩니다. 
		당 홈페이지는 서비스에 표출된 어떠한 의견이나 정보에 대해 확신이나 대표할 의무가 없으며 회원이나 제3자에 의해 표출된 의견을 승인하거나 반대하거나 수정하지 않습니다. 당 홈페이지는 어떠한 경우라도 회원이 서비스에 담긴 정보에 의존해 얻은 이득이나 입은 손해에 대해 책임이 없습니다. 
		당 홈페이지는 회원 간 또는 회원과 제3자간에 서비스를 매개로 하여 물품거래 혹은 금전적 거래 등과 관련하여 어떠한 책임도 부담하지 아니하고, 회원이 서비스의 이용과 관련하여 기대하는 이익에 관하여 책임을 부담하지 않습니다. 
		당 홈페이지는 무료로 제공되는 서비스 이용과 관련하여 관련법에 특별한 규정이 없는 한 책임을 지지 않습니다.</p>
		<h5>제 21 조 (관할법원)</h5>
		<p>본 서비스 이용과 관련하여 발생한 분쟁에 대해 소송이 제기될 경우 대전지방법원을 관할 법원으로 합니다.
		부 칙
		(시행일) 본 약관은 2018년 2월 12일부터 시행됩니다. 
		본 약관에 대한 저작권은 대전광역정신건강복지센터에 귀속하며 무단 복제, 배포, 전송, 기타 저작권 침해행위를 엄금합니다. 제기된 분쟁에 관한 소송에는 한국 법을 적용합니다.</p>
			
		</div>
		<p>
		
	</div>
		<p>
		<p>
		<p>
	
	<form name="memberAgree" method="post" action="memberForm?type=I">
	<div align="right">	
		<input type="checkbox" name='acc1'>
			<label>회원약관에 동의합니다.</label>
		</input>
	</div>
	<div align="right">
		<input class="btn btn-success" type="button" value="확인" onclick="agree_check()">
		<input class="btn" type="button" value="취소">
	</div>
	</form>
	<br>
	<br>	

	</div>
	
				<table width="100%" class="table table-bordered">
					<tr>
						<td align="center">
							<img alt="실버" src="${pageContext.request.contextPath}/img/silver4.png" width="35%" hight="35%">
							<p style="text-align: center;font-size:18px;"><b>일반회원</b></p>
							<p style="text-align: center;font-size:14px;color:#666666;"><b>포인트 1%적립</b></p>
						</td>
						<td align="center">
							<img alt="골드" src="${pageContext.request.contextPath}/img/gold4.png" width="35%" hight="35%">
							<p style="text-align: center;font-size:18px;"><b>15만원이상</b></p>
							<p style="text-align: center;font-size:14px;color:#666666;"><b>포인트 10%적립</b></p>
						</td>
						<td align="center">
							<img alt="다이아" src="${pageContext.request.contextPath}/img/dia4.png" width="35%" hight="35%">
							<p style="text-align: center;font-size:18px;"><b>30만원이상</b>
							<p style="text-align: center;font-size:14px;color:#666666;"><b>포인트 20%적립</b></p>	
						</td>
					</tr>
				</table>
			

</section>
