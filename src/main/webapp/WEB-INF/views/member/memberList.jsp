<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<script type="text/javascript">

function fn_form(){
	location.href="memberForm?type=I";
}

function fn_search(currentPage) {
	
	var frm = document.searchForm;
	
	frm.currentPage.value = currentPage;
	
	if(frm.searchType.value != "" && frm.searchWord.value == ""){
		alert("검색어를 입력하세요");
		return false;
	}
	frm.action = "${pageContext.request.contextPath}/member/memberList";//절대경로
	frm.submit();
}

</script>
<div class="slider">
	<div class="container">
		
		<h2>회원목록</h2>
		<!-- 검색폼 -->
		<div align="right">
			<input type="button" value="회원가입" class="btn btn-warning" onclick="fn_form()">
		</div>
		<form class="form-inline" name="searchForm" method="post">
			<p>
			<input type="hidden" name="currentPage" value="${param.currentPage}">	<!-- 현재페이지 -->
			
			<select name="searchType" class="form-control">
				<option value="">전체</option>
				<option value="id" ${param.searchType == 'id' ? 'selected' : ''}>아이디</option>
				<option value="name" ${param.searchType == 'name' ? 'selected' : ''}>이름</option>
			</select>
			<input type="text" name="searchWord" value="${param.searchWord}" class="form-control">
			<input type="button" value="검색" class="btn btn-warning" onclick="fn_search(1)">
			</p>
			<p>
				<div class="form-group">
					<label>총 게시글 : ${pagingUtil.totalCount}</label>
				</div>
				<div class="form-group" style="float:right;">
					<label>페이지 사이즈 :</label>
				<select name="pageSize" class="form-control"><!-- 페이지 사이즈 -->
					<option ${param.pageSize == '10' ? 'selected' : ''} value="10">10개</option>
					<option ${param.pageSize == '20' ? 'selected' : ''} value="20">20개</option>
					<option ${param.pageSize == '50' ? 'selected' : ''} value="50">50개</option>
				</select>
				</div>
			</p>
		</form>
		<!-- 검색폼 -->
		
		
		
		<table class="table table-bordered table-striped table-hover text-center">
			<thead>
				<tr class="info">
					<th class="col-xs-2 text-center">아이디</th>
					<th class="col-xs-1 text-center">이름</th>
					<th class="col-xs-2 text-center">전화번호</th>
					<th>이메일</th>
					<th class="col-xs-1 text-center">등급</th>
					<th class="col-xs-2 text-center">가입일자</th>
				</tr>
			</thead>
			
			<tbody>
			<c:if test="${not empty memberList}">
				<c:forEach var="member" items="${memberList}">
				
					<c:url var="viewURL" value="memberView">
						<c:param name="mem_id" value="${member.mem_id}"></c:param>
					</c:url>
				
					<tr>
						<td>${member.mem_id}</td>
						<td><a href="${viewURL}" style="color:#666666;">${member.mem_name}</a></td>
						<td>${member.mem_phone}</td>
						<td>${member.mem_email}</td>
						<td>${member.class_code_name}</td>
						<td>${member.mem_reg_date}</td>
					</tr>
				</c:forEach>
			</c:if>
			
			<c:if test="${empty memberList}">
				<tr><td colspan="6" align="center">조회된 결과가 없습니다.</td></tr>
			</c:if>
			</tbody>
		</table>
		
		<!-- 페이지 네이게이션 -->
		<div style="text-align:center;">
			<ul class="pagination">
				${pagingUtil.pageHtml}
			</ul>
		</div>
		
	</div>
</div>





