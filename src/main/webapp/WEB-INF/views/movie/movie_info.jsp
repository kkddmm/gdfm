<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
   
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script type="text/javascript" src="js/jquery-3.2.1.js"></script>
<script type="text/javascript" src="js/MovieButton.js"></script>
<link rel = "stylesheet" type = "text/css" href = "css/Moviebutton.css">
<title>Piccolo Theme</title>
<style>
	@import url(https://fonts.googleapis.com/css?family=Raleway:500,900);
 
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
   background-color: #212121;
}
 
.moviebtn {
   border-width: 5px;
   border-style: solid;
   opacity: 0.4;
}

</style>

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- CSS
================================================== -->
<link href='http://fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-responsive.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/prettyPhoto.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/custom-styles.css">

<!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <link rel="stylesheet" href="css/style-ie.css"/>
<![endif]--> 

<!-- Favicons
================================================== -->
<link rel="shortcut icon" href="${pageContext.request.contextPath}/img/favicon.ico">
<link rel="apple-touch-icon" href="${pageContext.request.contextPath}/img/apple-touch-icon.png">
<link rel="apple-touch-icon" sizes="72x72" href="${pageContext.request.contextPath}/img/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="114x114" href="${pageContext.request.contextPath}/img/apple-touch-icon-114x114.png">

<!-- JS
================================================== -->
<script src="${pageContext.request.contextPath}/js/jquery-1.8.3.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.easing.1.3.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.prettyPhoto.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.quicksand.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.custom.js"></script>

<script>
$(".hover").mouseleave(function() {
    $(this).removeClass("hover");
 });
  
 
	


</script>
	  
 
</head>
<body>
<div class="container main-container">
	

		 
  <div id="content">
      <div id="item">
      <div class ="box-image">
         				<strong class="rank">No.1</strong>
         		</div>
         <figure class="snip1432"> 
         		<img src="${pageContext.request.contextPath}/movieposter/mazerunnerposter.jpg"
            alt="sample36"/> 
            	
         
         				<div style="border: 1px solid gold; float: left; width: 33%;">

            	
            		<c:forEach items="${movieList}" var="movie">
            					
            				${movie.movie_name}
            			.
            			
            					<img src="${pageContext.request.contextPath}/movieposter/${movie.movie_name}_poster.jpg"/>
            					
            		
            		
            		</c:forEach>

								첫번째 영역
							</div>            			
            			
            		
       			
            <%-- 	<img src="${pageContext.request.contextPath}/movieposter/1987_poster.jpg"
            alt="sample36"/> 
            
            	<img src="${pageContext.request.contextPath}/movieposter/coco_poster.jpg"
            alt="sample36"/> 
            
            	<img src="${pageContext.request.contextPath}/movieposter/commuter_poster.jpg"
            alt="sample36"/> 
            
            	<img src="${pageContext.request.contextPath}/movieposter/firstsecret_poster.jpg"
            alt="sample36"/> 
            
            	<img src="${pageContext.request.contextPath}/movieposter/godwithme_poster.jpg"
            alt="sample36"/> 
            
            	<img src="${pageContext.request.contextPath}/movieposter/thatismyworld_poster.jpg"
            alt="sample36"/>  --%>
            			
            			
            			
            
         <div>
         	
            
         </div>
         <div>
           
         </div>
         </figure>
 
 
      </div>
   </div> 
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
 
	
	
	
	
	
	
	
	
	
	
	
		 

		</div>

	</body>
	
</html>







