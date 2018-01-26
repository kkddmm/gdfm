<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Piccolo Theme</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- CSS
================================================== -->

<link href='http://fonts.googleapis.com/css?family=Oswald'
	rel='stylesheet' type='text/css'>




<!-- <link rel="stylesheet" href="http://bootstrapk.com/dist/css/bootstrap.min.css"> -->

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap-responsive.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/prettyPhoto.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/flexslider.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/custom-styles.css">
<!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <link rel="stylesheet" href="css/style-ie.css"/>
<![endif]-->

<!-- Favicons
================================================== -->
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/img/favicon.ico">
<link rel="apple-touch-icon"
	href="${pageContext.request.contextPath}/img/apple-touch-icon.png">
<link rel="apple-touch-icon" sizes="72x72"
	href="${pageContext.request.contextPath}/img/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="114x114"
	href="${pageContext.request.contextPath}/img/apple-touch-icon-114x114.png">

<!-- JS
================================================== -->
<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.prettyPhoto.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.flexslider.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.custom.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		$("#btn-blog-next").click(function() {
			$('#blogCarousel').carousel('next')
		});
		$("#btn-blog-prev").click(function() {
			$('#blogCarousel').carousel('prev')
		});

		$("#btn-client-next").click(function() {
			$('#clientCarousel').carousel('next')
		});
		$("#btn-client-prev").click(function() {
			$('#clientCarousel').carousel('prev')
		});

	});
	
	
	var movieSelect = false;
	var cinemaSelect = false;
	
	

	function fn_changeMovieByCinema(ci_id){
		
		alert('실행됩니까?');
		
		
	}
	
	
	function fn_loadAddr2(addr1){
		
	
		$.ajax({
		 type : 'post',
		 url :  '${pageContext.request.contextPath}/reservation/get/addr2',
		data : "ci_addr1="+addr1,
		dataType : "json",
	   success : function(data, status){
    	   $('#addr2View').html('');
       for(i in data){
// 			   var addr2 = data[i].CI_ADDR2;
		   $('<li>').html(data[i].CI_ADDR2).on('click',function(){
			   var addr2 = $(this).html();
			   $.ajax({
				   type :'post',
				   url : '${pageContext.request.contextPath}/reservation/get/movieName',
				   data : "ci_addr1="+addr1+"&ci_addr2="+addr2,
				  dataType : "json", 
				   success : function(data, status){
					   $('#movieView').html('');
					   for(k in data){
						   $('<li>').
						   html('<img src="${pageContext.request.contextPath}/img/'+data[k].MOVIE_GRADE+'.png" />'+data[k].MOVIE_KO_NAME)
						   .appendTo('#movieView')
						   
						   
					   }
					    
				   },
				   error : function(){}
			   })
			   
		   }).appendTo('#addr2View');
		   
		   
		   } 
	   },
	error : function() {
		alert("에러!");
				}
		})
		
	}
	
	
			   
	
	
	
	
	$(function() {
	
		
		
		
		
	});
	
	
	
	
</script>




<style>
.row.main {
	border: 1px solid black;
}

ul {
	list-style: none;
}
</style>








</head>
<body>


	<div class="container">



		<div class="row header">
			<!-- Begin Header -->

			<!-- Logo
        ================================================== -->
			<div class="span5 logo">
				<a href="../"><img src="${pageContext.request.contextPath}/img/movielogo.png" alt="" /></a>
				<h4>영화 그 이상의 감동.</h4>
			</div>

			<!-- Main Navigation
        ================================================== -->
			<div class="span7 navigation">
				<div class="navbar hidden-phone">

					<ul class="nav">
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="reservation/101">예매 <b
								class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="reservation/101">빠른예매</a></li>
								<li><a href="#">예매 depth1</a></li>

							</ul></li>

						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#">영화 <b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="#">영화 depth1</a></li>
								<li><a href="#">영화 depth2</a></li>

							</ul></li>
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#">커뮤니티 <b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="#">커뮤니티 depth1</a></li>
								<li><a href="#">커뮤니티 depth2</a></li>


							</ul></li>

						<li><a href="gallery-3col.htm">스낵관</a></li>
					</ul>

				</div>

				<!-- Mobile Nav
            ================================================== -->
				<form action="#" id="mobile-nav" class="visible-phone">
					<div class="mobile-nav-select">
						<select
							onchange="window.open(this.options[this.selectedIndex].value,'_top')">

							<option value="index.htm">예매</option>
							<option value="index.htm">- Full Page</option>
							<option value="index-gallery.htm">- Gallery Only</option>

							<option value="features.htm">영화</option>
							<option value="page-full-width.htm">Pages</option>
							<option value="page-full-width.htm">- Full Width</option>
							<option value="page-right-sidebar.htm">- Right Sidebar</option>

							<option value="gallery-4col.htm">커뮤니티</option>
							<option value="gallery-3col.htm">- 3 Column</option>
							<option value="gallery-4col.htm">- 4 Column</option>

							<option value="blog-style1.htm">스낵관</option>

						</select>
					</div>
				</form>

			</div>

		</div>
		<!-- End Header -->


		<div align="center" class="main row">
			<div class="span2">
				<h4>영화</h4>
				<hr />
				<ul class="nav nav-tabs">
					<li id="all" role="presentation" class="active"><a href="#">전체</a></li>
					<li id="2D" role="presentation"><a href="#">2D</a></li>
					<li id="3D" role="presentation"><a href="#">3D</a></li>
				</ul>
				<ul id="movieView">
					<c:if test="${not empty movieList}">
						<c:forEach items="${movieList}" var="movie">
							<li id="${movie.movie_id}"><img
								src="${pageContext.request.contextPath}/img/${movie.movie_grade}.png">${movie.movie_ko_name}</li>
						</c:forEach>
					</c:if>

				</ul>

			</div>
			<div class="span5 row">
				<h4>영화관</h4><hr/>
				<ul class="span2" id="addr1View">
					<c:if test="${not empty addr1List}">
						<c:forEach items="${addr1List}" var="cinema">
							<li onclick="fn_loadAddr2('${cinema.ci_addr1}');">${cinema.ci_addr1}</li>
						</c:forEach>
						<%-- 				<li id="${cinema.ci_id}" onclick="fn_changeMovieByCinema(${cinema.ci_id});">${cinema.ci_addr1}</li> --%>
					</c:if>
					
					</ul>
					
					<ul class="span1" id="addr2View">
					
					</ul>
			</div>
			<div class="span1">
				<h4>날짜</h4>
				<hr />
				<p>Donec sed odio dui. Cras justo odio, dapibus ac facilisis in,
					egestas eget quam. Vestibulum id ligula porta felis euismod semper.
					Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum
					nibh, ut fermentum massa justo sit amet risus.</p>
				<p>
					<a class="btn btn-default" href="#" role="button">View details
						»</a>
				</p>
			</div>
			<div class="span3">
				<h4>상영정보</h4>
				<hr />
				<p>Donec sed odio dui. Cras justo odio, dapibus ac facilisis in,
					egestas eget quam. Vestibulum id ligula porta felis euismod semper.
					Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum
					nibh, ut fermentum massa justo sit amet risus.</p>
				<p>
					<a class="btn btn-default" href="#" role="button">View details
					</a>
				</p>
			</div>
		</div>












	</div>


















	</div>







</body>
</html>