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

$(function(){
	$("#btncheck").click(function() {
		var frm = document.memberIdcheck;
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
			
			if(frm.mem_email.value == ""){
				alert("이메일 입력하세요.");
				frm.mem_email.focus();
				return false;
			}
			mem_id = $("input[name=mem_id]").val();
			mem_name = $("input[name=mem_name]").val();
			mem_email = $("input[name=mem_email]").val();
			$.ajax({
				type: 'post',
				url : '${pageContext.request.contextPath}/member/memberPwdcheck',
				data : "mem_name="+mem_name+"&mem_email="+mem_email+"&mem_id="+mem_id,
				success : function(data, status){
 					console.log(status);
 					console.log(data);
 					console.log(JSON.stringify(data));
 					console.log(data.mem_id);
					if(data.mem_pwd){
						alert(data.mem_name+"님 비밀번호는 "+data.mem_pwd+" 입니다.");
					}else{
						alert("해당아이디가 없습니다.");
					}
				},
				error : function(){
					console.log(error);
				}
			});
			
	});
});

/* 
 *회원 가입
 */
function fn_save(type) {
	
	if(!validate()){
		return;
	}
	
	var frm = document.memberIdcheck;
	
	frm.submit();
}

function validate() {
	
	var frm = document.memberIdcheck;
	
	if(frm.mem_name.value == ""){
		alert("이름을 입력하세요.");
		frm.mem_name.focus();
		return false;
	}
	
	if(frm.mem_email.value == ""){
		alert("이메일 입력하세요.");
		frm.mem_email.focus();
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
<div class="slider">
	<div class="container">
		<!-- name bean 프로퍼티와 같게 -->
		<h2>아이디찾기</h2>
	
		
		<form name="memberIdcheck" id="memberIdcheck" method="post">
		<table class="table table-bordered">
			<tr>
				<th class="info text-center">회원아이디</th>
				<td><input type="text" name="mem_id" size="20"> 아이디를 입력하세요</td>
			</tr>
			<tr>
				<th class="info text-center">회원명</th>
				<td><input type="text" name="mem_name" size="20"> 실명을 입력하세요</td>
			</tr>
			<tr>
				<th class="info text-center">회원이메일</th>
				<td><input type="text" name="mem_email" size="20"> (예:test@naver.com)</td>
			</tr>
		</table>
			<p align="right">
					<input type="button" class="btn btn-warning" value="확인" id="btncheck" />
					<input type="reset" class="btn btn" value="취소" />
			</p>
		</form>
	</div>
</div>