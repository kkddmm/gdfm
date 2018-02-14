<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">




<script type="text/javascript">
$(".hover").mouseleave(function() {
    $(this).removeClass("hover");
 });
 
 	$("#btnPosterAdd").click(function (){
		$('#movieList').append(
					
		
		
		);
		
		
	})
 
  selectMovieList : function(no){
	  
	  var pageNo = (no )
	  
  }
</script>
	  

<style>
	
	@import url(https://fonts.googleapis.com/css?family=Raleway:500,900);
	
	.moive_poster img{
		width: 320px;
		height: 350px;
	}

 
figure.snip1432 {
   font-family: 'Raleway', Arial, sans-serif;
   color: #fff;
   position: relative;
   float: left;
   overflow: hidden;
   margin: 10px 1%;
   min-width: 152px;
   max-width: 203px;
   width: 100%;
   background: #000000;
   color: #ffffff;
   text-align: left;
}
 
figure.snip1432 * {
   -webkit-box-sizing: border-box;
   box-sizing: border-box;
   -webkit-transition: all 0.6s ease;
   transition: all 0.6s ease;
}
 
figure.snip1432 img {
   opacity: 0.8;
   width: 100%;
   vertical-align: top;
   -webkit-transition: opacity 0.35s;
   transition: opacity 0.35s;
}
 
figure.snip1432 figcaption {
   position: absolute;
   bottom: 0;
   left: 0;
   width: 100%;
   height: 100%;
}
 
figure.snip1432 figcaption>div {
   height: 50%;
   overflow: hidden;
   width: 100%;
   position: relative;
}
 
figure.snip1432 h2, figure.snip1432 h3 {
   margin: 0;
   position: absolute;
   left: 0;
   padding: 0 30px;
   text-transform: uppercase;
}
 
figure.snip1432 h2 {
   font-weight: 900;
   top: 0;
}
 
figure.snip1432 h3 {
   font-size: 1em;
   bottom: 0;
   font-weight: 500;
   color: white;
}
 
figure.snip1432 h3:nth-of-type(2) {
   opacity: 0;
   -webkit-transform: translateY(150%);
   transform: translateY(150%);
}
 
figure.snip1432 a {
   left: 0;
   right: 0;
   top: 0;
   bottom: 0;
   position: absolute;
}
 
figure.snip1432:hover img, figure.snip1432.hover img {
   opacity: 0.3;
   -webkit-filter: grayscale(100%);
   filter: grayscale(100%);
}
 
figure.snip1432:hover figcaption h3:first-of-type, figure.snip1432.hover figcaption h3:first-of-type
   {
   -webkit-transform: translateY(150%);
   transform: translateY(150%);
   opacity: 0;
}
 
figure.snip1432:hover figcaption h3:nth-of-type(2), figure.snip1432.hover figcaption h3:nth-of-type(2)
   {
   opacity: 1;
   -webkit-transform: translateY(0%);
   transform: translateY(0%);
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
				<h2 align="right" style="color: BLACK;"><a href="#">무비차트</a>
				<a href="${pageContext.request.contextPath}/movie/movie_preview">상영예정작</a></h2>

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

	<!--  poster output  -->

	<c:if test="${not empty movieList}">
		<c:forEach var="movie" items="${movieList}">

			<div class="col-md-4">
				<!-- Gallery Item 1 -->
				<div style="height: 400px; border: 10px; border-color: 3f3f3f;">

					<!-- <li align="center">			 -->					
		                        
		                 <div class="moive_poster">
					<a href="${pageContext.request.contextPath}/movie/movie_detail/${movie.movie_id}">
						<img src="${pageContext.request.contextPath}/movieposter/${movie.movie_name}_poster.jpg" alt="movie_poster">
					</a> <br>
					
					</div> 
					 <%-- 	<span>${snack.snack_name}</span><br>  --%>
				</div>
				
				
				
			</div>
		</c:forEach>
	</c:if>
	
	<div class="moviePosterMoreList  col-md-12 ">
		
				<script>
				/* 	function fn_posterAdd(startRow,endRow) {
						
						currentCnt = currentCnt+1;
						
						$.ajax({
							url:'${pageContext.request.contextPath}/',
							method: ,
							type:'post',
							data:"currentPage="+currentCnt,
							success : function(data, status) {
									
								
								
							},
							error : function(error){
								alert("moviePosterMoreList 더보기 Error발생!");
							}
								
							
							
						});
						
						
					}
				
				 */
				
				</script>
	
		
		<input type="button" name="posterMoreList"  value="더보기" class="btn btn-primary" onclick="fn_posterAdd();" style="width: 100%">
		
		
				<br>
				<br>
				<br>
		
	
	</div>

	
	


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





