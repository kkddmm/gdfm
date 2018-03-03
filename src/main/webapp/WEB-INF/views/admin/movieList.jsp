<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div class="slider">
<h2>영화정보</h2>
	<!-- <input type="button" class="btn btn-warning" value="영화정보입력" /> -->
	
	
	 <p align="right">
           				<input style="color: white;" type="button" class="btn btn-warning" value="영화정보입력" 
           						onClick="location.href='${pageContext.request.contextPath}/admin/movieForm'"> 
           						 
           				<%-- <input style="color: white;" type="button" class="btn btn-warning" value="영화 파일 업로드" 
           						onClick="location.href='${pageContext.request.contextPath}/admin/fileUploadForm'">  --%>
                </p>
	<table class="table table-bordered table-striped table-hover">
			<thead>
				<tr class="warning">
					<th class="text-center">번호</th>
					<th class="text-center">제목</th>
					<th class="col-xs-3 text-center">기본</th>
					<th class="col-xs-1 text-center">개봉</th>
					<th class="col-xs-1 text-center">상영여부</th>
					<th class="col-xs-1 text-center">포스터</th>
					<th class="col-xs-1 text-center">스틸컷</th>
				</tr>
			</thead>
			
			<tbody>
				<c:if test="${not empty movieList}" >
					<c:forEach var="movie" items="${movieList}" varStatus="i">
					<c:set var="movie_release_date" value="${movie.movie_release_date}" />
					<c:set var="movie_grade" value="${movie.movie_grade}" />
						<tr>
							<td class="text-center">${i.index+1}</td>
							<td class="text-left">${movie.movie_name}(${movie.movie_ko_name})</td>
							<td class="text-left">${fn:substring(movie_grade,4,7)} 세이상 , ${movie.movie_running_time} , ${movie.movie_production_country}</td>
							<td class="text-center">${fn:substring(movie_release_date, 0, 10)}</td>
							<td class="text-center">${movie.movie_show_yn == 'Y' ? '상영중' : '미상영'}</td>
							<td class="text-center"><a href="fileUploadForm?movie_id=${movie.movie_id}&movie_name=${movie.movie_name}">이미지삽입</a></td>
							<td class="text-center"><a href="stillCutfileUploadForm?movie_id=${movie.movie_id}&movie_name=${movie.movie_name}">스틸컷삽입</a></td>
						</tr>
					</c:forEach>			
				</c:if>
				<c:if test="${empty movieList}" >
					<tr>
						<td colspan="5" align="center">글이 존재하지 않습니다.</td>
					</tr>		
				</c:if>
				
				
			</tbody>
		</table>
</div>