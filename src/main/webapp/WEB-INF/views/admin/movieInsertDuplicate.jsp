<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div class="slider">
<h2>영화 정보 관리자</h2>




	<!-- <input type="button" class="btn btn-warning" value="영화정보입력" /> -->
	
	
	<%--  <p align="right">
           				<input style="color: white;" type="button" class="btn btn-warning" value="영화정보입력" 
           						onClick="location.href='${pageContext.request.contextPath}/admin/movieForm'"> 
                </p> --%>
                
      <form action="${pageContext.request.contextPath}/admin/insertMovie" method="post">
	
			
			
		<div class="input-group mb-3">
		  <div class="input-group-prepend">
		    <span class="input-group-text" id="inputGroup-sizing-default">감 독</span>
		  </div>
		  <input type="text" class="form-control"  name="movie_director" value="${movie.movie_director}">
		</div>	
		
		<div class="input-group mb-3">
		  <div class="input-group-prepend">
		    <span class="input-group-text" id="inputGroup-sizing-default">영화 제목</span>
		  </div>
		  <input type="text" class="form-control"  name="movie_name" value="${movie.movie_name}">
		</div>	
		<div class="input-group mb-3">
		  <div class="input-group-prepend">
		    <span class="input-group-text" id="inputGroup-sizing-default">영화 한국 제목</span>
		  </div>
		  <input type="text" class="form-control"  name="movie_ko_name" value="${movie.movie_ko_name}">
		</div>						
			
			<div class="input-group mb-3">
			  <div class="input-group-prepend">
			    <span class="input-group-text" id="inputGroup-sizing-default">배 우</span>
			  </div>
			  <input type="text" class="form-control"  name="movie_actor" value="${movie.movie_actor}">
			</div>
			
			<div class="input-group mb-3">
			  <div class="input-group-prepend">
			    <span class="input-group-text" id="inputGroup-sizing-default">상 영 시 간</span>
			  </div>
			  <input type="text" class="form-control"  name="movie_running_time" value="${movie.movie_running_time}">
			</div>
			
			<div class="input-group mb-3">
			  <div class="input-group-prepend">
			    <span class="input-group-text" id="inputGroup-sizing-default">개 봉 일</span>
			  </div>
			  <input type="text" class="form-control"  name="movie_release_date" value="${movie.movie_release_date}">
			</div>
			
			<p>줄 거 리 </p>
			<textarea name="movie_story" rows="10" cols="50" placeholder="줄거리를 써주세요" padding="10px"> </textarea>
			
			<div class="input-group mb-3">
			  <div class="input-group-prepend">
			    <span class="input-group-text" id="inputGroup-sizing-default">스 틸 컷 </span>
			  </div>
			  <input type="text" class="form-control" name="" value="">
			</div>
			
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span> 등급 </span>
					
						<select class="form-control"> 
								<option>12세 이상</option> 
								<option>15세 이상</option> 
								<option>청소년 불가</option> 
								<option>전체 이용가</option> 
						</select> 
				
						</div>
				</div>
			
			<div class="input-group mb-3">
			  <div class="input-group-prepend">
			    <span class="input-group-text" id="inputGroup-sizing-default">나 라</span>
			  </div>
			  <input type="text" class="form-control" name="movie_production_country" value="${movie.movie_production_country}">
			</div>
			
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text" id="inputGroup-sizing-default">상영 여부</span>
			  		<div class="checkbox">
						  <label>
						    <input type="checkbox" value="${movie.movie_show_yn}" name="movie_show_yn">
						   				Y
						  </label>
						  
						  <label>
						    <input type="checkbox" value="${movie.movie_show_yn}" name="movie_show_yn">
						   				N
						  </label>
						</div>
				</div>
		</div>
			
			<div class="input-group mb-3">
			  <div class="input-group-prepend">
			    <span class="input-group-text" id="inputGroup-sizing-default">예 고 편</span>
			  </div>
			  <input type="text" class="form-control"  name="" value="">
			</div>
			
			
			  <div class="input-group-prepend">
			    <span class="input-group-text" id="inputGroup-sizing-default">포 스 터</span>
			  </div>
			  <input type="text" class="form-control" >
			  
			  <span>차 원</span>
			  <div class="checkbox">
				  <label>
				    <input type="checkbox" value="">
				   				2D
				  </label>
				  <label>
				    <input type="checkbox" value="">
				   				3D
				  </label>
				  <label>
				    <input type="checkbox" value="">
				   				4D
				  </label>
				</div>
				
				 <span>장 르</span>
				
			  <div class="checkbox">
				  <label>
				    <input type="checkbox" value="">
				   				드라마 
				  </label>
				  <label>
				    <input type="checkbox" value="">
				   				액션
				  </label>
				  <label>
				    <input type="checkbox" value="">
				   				코미디 
				  </label>
				  <label>
				    <input type="checkbox" value="">
				   				애니메이션
				  </label>
				  <label>
				    <input type="checkbox" value="">
				   				전쟁
				  </label>
				  <label>
				    <input type="checkbox" value="">
				   				환타지 
				  </label>
				  <label>
				    <input type="checkbox" value="">
				   				호러 
				  </label>
				  <label>
				    <input type="checkbox" value="">
				   				미스터리 
				  </label>
				  <label>
				    <input type="checkbox" value="">
				   				스릴러
				  </label>
				  <label>
				    <input type="checkbox" value="">
				   				액션 
				  </label>
				  <label>
				    <input type="checkbox" value="">
				   				SF 
				  </label>
				  <label>
				    <input type="checkbox" value="">
				   				범죄 
				  </label>

				 <%--  <c:forEach var="genre" items="${movie.movie_genre_name}">
				  <label>
				    <input type="checkbox" value="">
				    
				   				${genre}
				  </label>
				  </c:forEach> --%>
				  
				</div>
				
				


				
				
						  
			  	<%-- <input type="submit" value="제출"  onClick="location.href='${pageContext.request.contextPath}/admin/movieList'">  --%>
			  	
			  				<p align="right">
           				<input style="color: white;" type="submit" class="btn btn-warning" value="영화 등록" 
           						onClick="location.href='${pageContext.request.contextPath}/admin/movieList'"> 
                </p>
			  	
			
					</div>
			 </form>
	
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
	
		</table>
</div>