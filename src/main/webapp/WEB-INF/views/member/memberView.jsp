<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
	function fn_list() {
		location.href="memberList";
	}
	
	function fn_delete(mem_id) {// js분리시 사용
		if(confirm("정말 회원하시겠습니까?")){
			location.href='memberDelete?mem_id=' + mem_id;
		}
	}
</script>
<div class="slider">
<div>
	
	<h2>회원정보</h2>
	<table class="table table-bordered">
		<tr>
			<th class="info col-xs-2 text-center">회원아이디</th>
			<td>${member.mem_id}</td>
		</tr>
		<tr>
			<th class="info text-center">회원명</th>
			<td>${member.mem_name}</td>
		</tr>
<!-- 		<tr> -->
<!-- 			<th class="info text-center">회원연령</th> -->
<%-- 			<td>${member.mem_age} 세</td> --%>
<!-- 		</tr> -->
		<tr>
			<th class="info text-center">회원생년월일</th>
			<td>${member.mem_birth}</td>
		</tr>
		<tr>
			<th class="info text-center">회원성별</th>
			<td>${member.mem_gender == 'M' ? '남자' : '여자'}</td>
		</tr>
		<tr>
			<th class="info text-center">회원이메일</th>
			<td>${member.mem_email}</td>
		</tr>
		<tr>
			<th class="info text-center">전화번호</th>
			<td>${member.mem_phone}</td>
		</tr>
		<tr>
			<th class="info text-center">회원주소</th>
			<td>
			<p>${member.mem_zipcode}</p>
			<p>${member.mem_addr}</p>
			<p>${member.mem_addr_detail}</p>
			</td>
		</tr>
		<tr>
			<th class="info text-center">회원등급</th>
			<td>${member.class_code_name}</td>
		</tr>
		<tr>
			<th class="info text-center">회원포인트</th>
			<td>${member.mem_point}</td>
		</tr>
		</table>
		<p align="right">
				<input type="button" class="btn btn-warning" value="회원수정" onclick="location.href='memberForm?type=U&mem_id=${member.mem_id}'">
				<input type="button" class="btn btn" value="회원탈퇴" onclick="fn_delete('${member.mem_id}')">
				<c:if test="${LOGIN_USER.class_code == 99}">
					<input type="button" class="btn btn-default" value="회원목록" onclick="location.href='memberList'">
				</c:if>
		</p>
	
</div>
</div>