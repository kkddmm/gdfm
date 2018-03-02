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
	<table class="table table-bordered table-striped table-hover">
		<tr>
			<th class="info col-xs-2" style="padding-left:20px;font-size:18px;">아이디</th>
			<td style="color:#666666;">${member.mem_id}</td>
			<th class="info col-xs-2" style="padding-left:20px;font-size:18px;">이름</th>
			<td style="color:#666666;">${member.mem_name}</td>
		</tr>
<!-- 		<tr> -->
<!-- 			<th class="info">회원연령</th> -->
<%-- 			<td>${member.mem_age} 세</td> --%>
<!-- 		</tr> -->
		<tr>
			<th class="info" style="padding-left:20px;font-size:18px;">생년월일</th>
			<td style="color:#666666;">${member.mem_birth}</td>
			<th class="info" style="padding-left:20px;font-size:18px;">성별</th>
			<td style="color:#666666;">${member.mem_gender == 'M' ? '남자' : '여자'}</td>
		</tr>
		<tr>
			<th class="info" style="padding-left:20px;font-size:18px;">이메일</th>
			<td style="color:#666666;">${member.mem_email}</td>
			<th class="info" style="padding-left:20px;font-size:18px;">전화번호</th>
			<td style="color:#666666;">${member.mem_phone}</td>
		</tr>
		<tr>
			<th class="info" style="padding-left:20px;font-size:18px;">주소</th>
			<td colspan="3" style="color:#666666;">
			<p>우편번호 : ${member.mem_zipcode}</p>
			<p>${member.mem_addr} ${member.mem_addr_detail}</p>
			</td>
		</tr>
		<tr>
			<th class="info" style="padding-left:20px;font-size:18px;">등급</th>
			<td style="color:#666666;">
			${member.class_code_name}
			<c:if test="${LOGIN_USER.class_code == 1}">
				(<img alt="실버" src="${pageContext.request.contextPath}/img/silver3.png">)
			</c:if> 
			<c:if test="${LOGIN_USER.class_code == 2}">
				(<img alt="골드" src="${pageContext.request.contextPath}/img/gold3.png">)
			</c:if> 
			<c:if test="${LOGIN_USER.class_code == 3}">
				(<img alt="다이아" src="${pageContext.request.contextPath}/img/dia3.png">)
			</c:if> 
			</td>
			<th class="info" style="padding-left:20px;font-size:18px;">포인트</th>
			<td style="color:#666666;">${member.mem_point}</td>
		</tr>
		<tr>
			<td colspan="4">
				<table width="100%">
					<tr>
						<td align="center">
							<img alt="실버" src="${pageContext.request.contextPath}/img/silver4.png">
							<p style="text-align: center;font-size:18px;"><b>일반회원</b></p>
							<p style="text-align: center;font-size:14px;color:#666666;"><b>포인트 1%적립</b></p>
						</td>
						<td align="center">
							<img alt="골드" src="${pageContext.request.contextPath}/img/gold4.png">
							<p style="text-align: center;font-size:18px;"><b>15만원이상</b></p>
							<p style="text-align: center;font-size:14px;color:#666666;"><b>포인트 10%적립</b></p>
						</td>
						<td align="center">
							<img alt="다이아" src="${pageContext.request.contextPath}/img/dia4.png">
							<p style="text-align: center;font-size:18px;"><b>30만원이상</b>
							<p style="text-align: center;font-size:14px;color:#666666;"><b>포인트 20%적립</b></p>	
						</td>
					</tr>
				</table>
			</td>
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