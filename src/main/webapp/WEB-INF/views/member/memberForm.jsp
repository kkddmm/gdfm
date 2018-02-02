<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:if test="${isError}">
	<script type="text/javascript">
		alert("${message}");
		//location.href="${pageContext.request.contextPath}/member/memberForm"
		history.pushState(null,"","${pageContext.request.contextPath}/member/memberForm?type=${param.type}");
	</script>
</c:if>

<script type="text/javascript">

var duplicateCheck = false;
$(function(){
	$("input[name=mem_id]").on("keyup",function(){
		duplicateCheck = false;
		$("#resultMsg").text("");
	});
	
	
	$("#btnIdCheck").click(function() {
		if($("input[name=mem_id]").val()){
			duplicateCheck = false;
			mem_id = $("input[name=mem_id]").val();
			$.ajax({
				type: 'post',
				url : '${pageContext.request.contextPath}/member/memberExists',
				data : "mem_id=" + mem_id,
				success : function(data, status){
					console.log(status);
					console.log(data);
					console.log(JSON.stringify(data));
					if(data.result == "true"){
						$("#resultMsg").html("<span style='color:#ff0000'>사용중인 아이디 입니다.</span>");
					}else{
						duplicateCheck = true;
						$("#resultMsg").html("<span style='color:#0000ff'>사용가능한 아이디 입니다.</span");
					}
				},
				error : function(){
					console.log(error);
				}
			});
			
		}else{
			alert("아이디를 입력하세요.");
			return;
		}
	});
});

/* 
 *회원 가입
 */
function fn_save(type) {
	
	if(!validate()){
		return;
	}
	
	var frm = document.memberForm;
	
	<c:if test="${param.type == 'I'}">
		frm.action = "memberInsert?type=${param.type}";
	</c:if>
	<c:if test="${param.type != 'I'}">
		frm.action = "memberUpdate";
	</c:if>
	/* if(type == "U"){	
		frm.action = "memberUpdate.jsp";
	}else{
		frm.action = "memberInsert.jsp"
	} */
	frm.submit();
}

function validate() {
	
	var frm = document.memberForm;
	<c:if test="${param.type == 'I'}">
		if(duplicateCheck == false){
			alert("아이디 중복 체크를 해주세요.");
			return false;
		}
	</c:if>
	
	if(frm.mem_id.value == ""){
		alert("아이디를 입력하세요.");
		frm.mem_id.focus();
		return false;
	}
	
	if(frm.mem_name.value == ""){
		alert("이름을 입력하세요.");
		frm.mem_name.focus();
		return false;
	}
	
	if(frm.mem_pwd.value == "" || frm.mem_pwd_confirm.value == ""){
		alert("비밀번호를 입력하세요.");
		return false;
	}else{
		if(frm.mem_pwd.value != frm.mem_pwd_confirm.value){
			alert("비밀번호가 같지 않습니다.");
			return false;
		}
	}
	
	if(frm.mem_birth.value == ""){
		alert("생년월을 입력하세요.");
		frm.mem_birth.focus();
		return false;
	}
	
	if(frm.mem_phone.value == ""){
		alert("전화번호를 입력하세요.");
		frm.mem_phone.focus();
		return false;
	}
	
	if(frm.mem_email.value == ""){
		alert("이메일 입력하세요.");
		frm.mem_email.focus();
		return false;
	}
	
	if(frm.mem_zipcode.value == ""){
		alert("우편번호를 입력하세요.");
		frm.mem_zipcode.focus();
		return false;
	}
	if(frm.mem_addr.value == ""){
		alert("주소를 입력하세요.");
		frm.mem_addr.focus();
		return false;
	}
	if(frm.mem_addr_detail.value == ""){
		alert("상세주소를 입력하세요.");
		frm.mem_addr_detail.focus();
		return false;
	}
	
	return true;
}

/* 
 * 회원 목록 함수
 */
function fn_list() {
	location.href="memberList";
}

</script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
				<script>
				    function sample6_execDaumPostcode() {
				        new daum.Postcode({
				            oncomplete: function(data) {
				                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				
				                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
				                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				                var fullAddr = ''; // 최종 주소 변수
				                var extraAddr = ''; // 조합형 주소 변수
				
				                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				                    fullAddr = data.roadAddress;
				
				                } else { // 사용자가 지번 주소를 선택했을 경우(J)
				                    fullAddr = data.jibunAddress;
				                }
				
				                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
				                if(data.userSelectedType === 'R'){
				                    //법정동명이 있을 경우 추가한다.
				                    if(data.bname !== ''){
				                        extraAddr += data.bname;
				                    }
				                    // 건물명이 있을 경우 추가한다.
				                    if(data.buildingName !== ''){
				                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				                    }
				                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
				                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
				                }
				
				                // 우편번호와 주소 정보를 해당 필드에 넣는다.
				                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
				                document.getElementById('sample6_address').value = fullAddr;
				
				                // 커서를 상세주소 필드로 이동한다.
				                document.getElementById('sample6_address2').focus();
				            }
				        }).open();
				    }
				</script>
<div class="slider">
	<div class="container">
		<!-- name bean 프로퍼티와 같게 -->
		<c:if test="${param.type == 'I'}">
			<h2>회원가입</h2>
		</c:if>
		
		<c:if test="${param.type != 'I'}">
			<h2>회원수정</h2>
		</c:if>
		
		<form name="memberForm" method="post">
		<table class="table table-bordered">
			<tr>
				<th class="info col-xs-2 text-center">회원아이디</th>
				<td>
					<input type="hidden" id="idChk" value="N" />
					<input type="text" name="mem_id" value="${member.mem_id}"> 
					<button type="button" class="btn btn-warning" id="btnIdCheck">중복체크</button>
					8~20자 내의 영문,숫자 조합
					<label id="resultMsg"></label>
				</td>
			</tr>
			<tr>
				<th class="info text-center">회원명</th>
				<td><input type="text" name="mem_name" size="20" value="${member.mem_name}"> 실명을 입력하세요</td>
			</tr>
			<tr>
				<th class="info text-center">회원비밀번호</th>
				<td><input type="password" name="mem_pwd" size="20" value="${member.mem_pwd}"> 8~20자 내의 영문,숫자 조합</td>
			</tr>
			<tr>
				<th class="info text-center">회원비밀번호확인</th>
				<td><input type="password" name="mem_pwd_confirm" size="20" value="${member.mem_pwd}"> 8~20자 내의 영문,숫자 조합</td>
			</tr>
			<tr>
				<th class="info text-center">회원연령</th>
				<td>
					<select name="mem_age">
						<c:if test="${param.type != 'I'}">
							<option value=${member.mem_age}>${member.mem_age}</option>
						</c:if>
						<c:forEach var="age" begin="1" end="120">
							<option value=${age}>${age}</option>
						</c:forEach>
					</select>
					세
				</td>
			</tr>
			<tr>
				<th class="info text-center">회원생년월일</th>
				<td><input type="text" name="mem_birth" size="10" value="${member.mem_birth}" id="mem_birth"> (예: 19910101)</td>
			</tr>
			<tr>
				<th class="info text-center">회원성별</th>
				<td>
					<c:if test="${param.type == 'I'}">
						<input type="radio" name="mem_gender" id="mem_gender1" value="M" checked/><label for="mem_gender1">남자</label>
						<input type="radio" name="mem_gender" id="mem_gender2" value="F"/><label for="mem_gender2">여자</label>
					</c:if>
					<c:if test="${param.type != 'I'}">	
						<input type="radio" name="mem_gender" id="mem_gender1" value="M" ${member.mem_gender == 'M' ? 'checked' : ''}/><label for="mem_gender1">남자</label>
						<input type="radio" name="mem_gender" id="mem_gender2" value="F" ${member.mem_gender == 'F' ? 'checked' : ''}/><label for="mem_gender2">여자</label>
					</c:if>
				</td>
			</tr>
			<tr>
				<th class="info text-center">회원이메일</th>
				<td><input type="text" name="mem_email" size="20" value="${member.mem_email}"> (예:test@naver.com)</td>
			</tr>
			<tr>
				<th class="info text-center">전화번호</th>
				<td><input type="text" name="mem_phone" size="20" value="${member.mem_phone}"> '-' 없이 입력</td>
			</tr>
			<tr>
				<th class="info text-center">회원주소</th>
				<td>
					<p><input type="text" name="mem_zipcode" size="6" value="${member.mem_zipcode}" id="sample6_postcode" placeholder="우편번호">
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="btn btn-warning"></p>
					<p><input type="text" name="mem_addr" size="50" value="${member.mem_addr}" id="sample6_address" placeholder="주소"></p>
					<p><input type="text" name="mem_addr_detail" size="50" value="${member.mem_addr_detail}" id="sample6_address2" placeholder="상세주소"></p>
				</td>
			</tr>
			<tr>
				<th class="info text-center">회원등급</th>
				<td>
					<div class="col-xs-2">
						<select name="class_code" class="form-control">
							<option value="">선택해주세요</option>
							<c:if test="${not empty memberclassList}" >
								<c:forEach var="memberclass" items="${memberclassList}">
									<option value=${memberclass.class_code} ${memberclass.class_code == member.class_code ? 'selected' : ''}>${memberclass.class_name}</option>
								</c:forEach>			
							</c:if>
						</select>
					</div>
				</td>
			</tr>
			<tr>
				<th class="info text-center">회원포인트</th>
				<td><input type="text" name="mem_point" size="20" value="${member.mem_point}"></td>
			</tr>
		</table>
			<p align="right">
					<c:if test="${param.type == 'I'}">
						<input type="button" class="btn btn-warning" value="가입하기" onclick="fn_save('I')">
					</c:if>
					<c:if test="${param.type != 'I'}">
						<input type="button" class="btn btn-warning" value="수정하기" onclick="fn_save('U')">
					</c:if>
					<input type="reset" class="btn btn" value="취소">
					<input type="button" class="btn btn-default" value="목록" onclick="fn_list()">
			</p>
		</form>
	</div>
</div>