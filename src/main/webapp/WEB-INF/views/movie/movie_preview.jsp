<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">





<style>
	
	@import url(https://fonts.googleapis.com/css?family=Raleway:500,900);
	
	.moive_poster img{
		width: 320px;
		height: 350px;
	}

 

/* Demo purposes only */
body {
   background-color: white;
}
 
.moviebtn {
   border-width: 5px;
   border-style: solid;
   opacity: 0.4;
}

ul, li {
	list-style: none;	
}


</style>


 

		<section id="portfolio">
		
 
			<div class="center">
				<h2 align="right" style="color: BLACK;"><a href="${pageContext.request.contextPath}/movie/movie_information">무비차트</a></h2>

			</div>

			<div class="col-md-12">

				<%-- <ul class="nav nav-pills nav-justified pull-right">


					<li><a class="btn btn-default"
						href="<c:url value="/snack/snack?snack_type=combo"/>">콤보</a></li>
					<li><a class="btn btn-default"
						href="<c:url value="/snack/snack?snack_type=popcorn"/>">팝콘</a></li>
					<li><a class="btn btn-default"
						href="<c:url value="/snack/snack?snack_type=drink"/>">음료</a></li>
					<li><a class="btn btn-default"
						href="<c:url value="/snack/snack?snack_type=snack"/>">스낵</a></li>

					

				</ul> --%>

			</div>



			<!--/#portfolio-filter-->


<div>


	<c:if test="${not empty movieList}">
		<c:forEach var="movie" items="${movieList}">

			<div class="col-md-4">
				<!-- Gallery Item 1 -->
				<div style="height: 400px; border: 10px; border-color: 3f3f3f;">

					<!-- <li align="center">			 -->					
		                        
		                 <div class="moive_poster">
					<a href="${pageContext.request.contextPath}/movie/movie_information/${movie.movie_name}">
						<img src="${pageContext.request.contextPath}/movieposter/${movie.movie_name}_poster.jpg" alt="movie_poster">
					</a> <br>
					</div> 
					 <%-- 	<span>${snack.snack_name}</span><br>  --%>
					
					</li>
				</div>
			</div>
		</c:forEach>

	</c:if>

	



</div>
<!-- End gallery list-->







 		
		
		</section>
		<!--/#portfolio-item-->



		<!--/#bottom-->


		<!--/.top-bar-->

 
<br>
<br>
<br>
<br>
<br>
<br>





