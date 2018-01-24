<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<script
	src="${pageContext.request.contextPath}/js/jquery.prettyPhoto.js"></script>
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

	$(function() {

	});
</script>


<style>
.row.main{
border : 1px solid black;
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
				<a href="index.htm"><img src="img/piccolo-logo.png" alt="" /></a>
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
			<div class="span3">
				<h4>영화</h4><hr/>
<ul class="nav nav-tabs">
  <li role="presentation" class="active"><a href="#">전체</a></li>
  <li role="presentation"><a href="#">2D</a></li>
  <li role="presentation"><a href="#">3D</a></li>
</ul>




			</div>
			<div class="span4">
				<h4>영화관</h4><hr/>
				<p>Donec id elit non mi porta gravida at eget metus. Fusce
					dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh,
					ut fermentum massa justo sit amet risus. Etiam porta sem malesuada
					magna mollis euismod. Donec sed odio dui.</p>
				<p>
					<a class="btn btn-default" href="#" role="button">View details
						»</a>
				</p>
			</div>
			<div class="span1">
				<h4>날짜</h4><hr/>
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
				<h4>상영정보</h4><hr/>
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