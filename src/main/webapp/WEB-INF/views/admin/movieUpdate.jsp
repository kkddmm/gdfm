<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div class="slider">

	<!-- <h2>영화 정보 관리자 페이지 </h2> -->

                
      <form action="${pageContext.request.contextPath}/admin/updateMovie" method="post">
				<form id="formUpdate" name="formUpdate" enctype="multipart/form-data">


			
			<div class="container">
			
				  <h2>Movie Admin Table</h2>
				  
				  <p>Update Movie</p>
				              
				  <table class="table">
				    	
				    	<tbody>
				    	
				    			<tr>
				    						<th>영화 제목 : </th>
				    						 			
				    						    <td><input type="text" name="movie_name" value="${movie.movie_name}"/></td>
				    			</tr>
				    			
				    			<tr>
				    						<th>영화 한국 제목 : </th>
				    								
				    						    <td><input type="text" name="movie_ko_name" value="${movie.movie_ko_name}"/></td>
				    			</tr>
				    			
				    			<tr>
				    						<th>영화 감독 : </th>
				    						    <td><input type="text" name="movie_director" value="${movie.movie_director}"/></td>
				    			</tr>
				    			
				    			<tr>
				    						<th>영화 배우 : </th>
				    						    <td><input type="text" name="movie_actor" value="${movie.movie_actor}"/></td>
				    			</tr>
				    			
				    			
				    			<tr>
						    				<th>영화 스토리  : </th>
						    				<th><textarea cols="100" placeholder="영화 줄거리를 입력하세요" name="movie_story" value="${movie.movie_story}"></textarea></th>
				    			</tr>	
				    		
				  	
				    			<tr>
				    						<th>영화 등급 : </th>
				    						<td>
				    									<select class="form-control" name="movie_grade"> 
																<option value="${movie.movie_grade}">12세 이상</option> 
																<option value="${movie.movie_grade}">15세 이상</option> 
																<option value="${movie.movie_grade}">청소년 불가</option> 
																<option value="${movie.movie_grade}">전체 이용가</option>
																 
														</select> 
				    						</td>
				    			</tr>
				    			
				    			<tr>
				    						<th>영화 상영 여부 : </th>
				    								
				    							<td>
													  <label>
													    <input type="radio" value="Y" name="movie_show_yn" ${movie.movie_show_yn != 'N' ? 'checked="checked"' : ''} >
													   				Y
													  </label>
													  
													  <label>
													    <input type="radio" value="N" name="movie_show_yn" ${movie.movie_show_yn == 'N' ? 'checked="checked"' : ''} >
													   				N
													  </label>
													
												</td>
				    			</tr>
				    			
				    			<tr>
				    						<th>영화 개봉 일자 : </th>
				    						<td><input type="text" name="movie_release_date" value="${movie.movie_release_date}"/></td>
				    			</tr>
				    			
				    			<tr>
				    						<th>영화 상영 시간 : </th>
				    						<td><input type="text" name="movie_running_time" value="${movie.movie_running_time}"/></td>
				    			</tr>
				    			
				    			<tr>
				    						<th>영화 제작 국가 : </th>
				    						<td><input type="text" name="movie_production_country" value="${movie.movie_production_country}" /></td>
				    			</tr>
				    			
				    			
				    			<tr>
				    						<th>영화 장르 : </th>
				    						
				    							<td>
					    									<c:forEach varStatus="status" var="genre" items="${genreList}">
													  <label>
													  		
													    <input type="checkbox" name="movie_genre_name" value="${genre.MOVIE_GENRE_CODE}">
													   				${genre.MOVIE_GENRE_NAME} 
													  </label>
													  <c:if test="${status.count%5==0}">  <br> </c:if>
											  		</c:forEach>
										 
													</td>
				    			</tr>
				    			
				    			<tr>
				    						<th>영화 차원 : </th>
				    						
				    							<td>
				    							<div class="checkbox">
				    							<c:forEach var="dimension" items="${dimensionList}">
													  <label>
													    <input type="checkbox" name="movie_dimension_code" value="${dimension.DIMENSION_CODE}">
													   				${dimension.DIMENSION_NAME}
													  </label>
												  </c:forEach>
												</div>
												</td>
				    			</tr>
				    			

				   
				     
				 			</tbody>
				  </table>
				  
				  
				</div>
			
			
			  				<p align="right">
           				<input style="color: white;" type="submit" class="btn btn-warning" value="영화 정보 수정" 
           						onClick="location.href='${pageContext.request.contextPath}/admin/movieList'"> 
                </p>
			  	
			
			
			</form>
				
		</div>
			 
	
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
	
		</table>
</div>