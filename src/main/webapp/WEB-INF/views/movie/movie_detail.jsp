<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Piccolo Theme</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
	<div class="container main-container">
	
		<div class="row">
	
		 <div class="moive_poster col-md-4">
		 		
		 			<br>
		 			<br>
		 			<br>
		 			<br>
		 				
						<img src="${pageContext.request.contextPath}/movieposter/${movie.movie_name}_poster.jpg" alt="movie_poster">
					 	<br>
					 	</div> 
					 	
					 	<br>
					 	<br>
					 	
					 <div class="moive_poster col-md-8">
					 		<p style="text-align: center;">${movie.movie_ko_name}</p>
					 		<p>${movie.movie_name}</p>
					 		<p>감독 : ${movie.movie_director} / 배우 : ${movie.movie_actor}</p>
					 		<%-- 배우 : ${movie.movie_actor} --%>
					 		<p>장르 : </p>
					 		<p>기본 : ${movie.movie_grade} 이상 , ${movie.movie_running_time} , ${movie.movie_production_country}</p>
					 		<p>개봉 : ${movie.movie_release_date}</p> 
					 	</div>
					 	
		<div class="movie_story col-md-8">
					 <p>${movie.movie_story}</p> 
		</div>			
		
		
		 
         <a href="${pageContext.request.contextPath}/reservation/101">예매 하기 </a>                
                     
                     <!--같은 탭으로 열기 --> 
                   
           <input type="button" value="예매하기" onClick="location.href='${pageContext.request.contextPath}/reservation/101'"> 
                     
                     <!--새로운 탭으로 열기--> 
                     
         <!--  <input type="button" value="버튼이름" onClick="window.open('http://google.com')"> -->

				<!-- <button type="button" onclick="location.href='reservation/101.jsp'">예매하기</button> -->

			<br>
			
				<div class="movie_trailer col-md-8">
					<p align="middle">
					<iframe width="560" height="315" style="text-align: center;"
						src="${movie.movie_trailer}" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe></p>
					
						 <p>${movie.movie_ko_name}예고편</p>	 	
					
				</div>
				
			<br>
			<br>
			<br>
			
				
				<div class="movie_stillcut col-md-8">
						
						<div id="about-slider">
        <div id="carousel-slider" class="carousel slide" data-ride="carousel">
          <!-- Indicators -->
          <ol class="carousel-indicators visible-xs">
            <li data-target="#carousel-slider" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-slider" data-slide-to="1"></li>
            <li data-target="#carousel-slider" data-slide-to="2"></li>
          </ol>

          <div class="carousel-inner">
          				
          				<script type="text/javascript">
          									var i=1;
          									           
          				</script>
          				
            <div class="item active">
              <img src="${pageContext.request.contextPath}/movieposter/${movie.movie_name}_stillcut1.jpg"class="img-responsive" alt="movie_stillcut.jpg">
            </div>
           <%--  <div class="item">
              <img src="${pageContext.request.contextPath}/img/1987.jpg" class="img-responsive" alt="">
            </div>
            <div class="item">
              <img src="${pageContext.request.contextPath}/img/역린.jpg" class="img-responsive" alt="">
            </div> --%>
          </div>

          <a class="left carousel-control hidden-xs" href="#carousel-slider" data-slide="prev">
						<i class="fa fa-angle-left"></i>
					</a>
          <a class=" right carousel-control hidden-xs" href="#carousel-slider" data-slide="next">
						<i class="fa fa-angle-right"></i>
					</a>
        </div>
        <!--/#carousel-slider-->
      </div>
      <!--/#about-slider-->
    </div>
  </div>
						
						
						
						
						
						
						
						
						
						
						
				
				
				</div>
		
					
					
		</div>
	
	</div>
</body>
</html>