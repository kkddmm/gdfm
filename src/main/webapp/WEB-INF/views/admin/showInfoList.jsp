<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<script type="text/javascript">

function fn_form(){
	location.href="showInfoForm";
}

function fn_search(currentPage) {
	
	var frm = document.searchForm;
	frm.currentPage.value = currentPage;
	frm.action = "${pageContext.request.contextPath}/reservation/getShowInfoList";
	frm.submit();
}




</script>

<form class="form-inline" name="searchForm" method="post">
			<input type="hidden" name="currentPage" value="${param.currentPage}">	<!-- 현재페이지 -->
			</form>
			
<div class="slider">
	<div class="row">
		
		<h2>상영정보 목록</h2>
		<table class="table table-striped table-hover text-center">
			<thead>
				<tr class="warning">
					<th class="col-xs-2 text-center">영화명</th>
					<th class="col-xs-1 text-center">극장명</th>
					<th class="col-xs-2 text-center">상영관명</th>
					<th class="col-xs-1 text-center">시작시간</th>
					<th class="col-xs-1 text-center">종료시간</th>
					<th class="col-xs-2 text-center">상영일</th>
					<th class="col-xs-2 text-center">차원명</th>
				</tr>
			</thead>
			
			<tbody>
			<c:if test="${not empty showInfoList}">
				<c:forEach var="showInfo" items="${showInfoList}">
					<tr>
						<td>${showInfo.MOVIE_KO_NAME}</td>
						<td>${showInfo.CI_NAME}</td>
						<td>${showInfo.SCREEN_NAME}</td>
						<td>${showInfo.START_TIME}</td>
						<td>${showInfo.END_TIME}</td>
						<td>${showInfo.SHOW_DATE}</td>
						<td>${showInfo.DIMENSION_NAME}</td>
					</tr>
				</c:forEach>
			</c:if>
			
			<c:if test="${empty showInfoList}">
				<tr><td colspan="6" align="center">조회된 결과가 없습니다.</td></tr>
			</c:if>
			</tbody>
		</table>
		<div align="right">
			<input type="button" value="추가" class="btn btn-warning" onclick="fn_form()">
		</div>
		<!-- 페이지 네이게이션 -->
		<div style="text-align:center;">
			<ul class="pagination">
				${pagingUtil.pageHtml}
			</ul>
		</div>
		
	</div>
</div>





