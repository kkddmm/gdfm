<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">



<title>영화보기좋은날</title>


<!-- Bootstrap -->
  <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
  <link href="${pageContext.request.contextPath}/css/animate.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/css/prettyPhoto.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/css/responsive.css" rel="stylesheet">
  
  
  
  <!-- =======================================================
    Theme Name: Gp
    Theme URL: https://bootstrapmade.com/gp-free-multipurpose-html-bootstrap-templat/
    Author: BootstrapMade
    Author URL: https://bootstrapmade.com
  ======================================================= -->
<!-- <style>
/* Remove the navbar's default margin-bottom and rounded borders */
.navbar {
	margin-bottom: 0;
	border-radius: 0;
}

/* Set height of the grid so .sidenav can be 100% (adjust as needed) */
.row.content {
	height: 450px
}

/* Set gray background color and 100% height */
.sidenav {
	padding-top: 20px;
	background-color: #f1f1f1;
	height: 100%;
}

/* Set black background color, white text and some padding */
footer {
	background-color: #555;
	color: white;
	padding: 20px;
}

/* On small screens, set height to 'auto' for sidenav and grid */
@media screen and (max-width: 767px) {
	.sidenav {
		height: auto;
		padding: 15px;
	}
	.row.content {
		height: auto;
	}
}
</style> -->


  <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.prettyPhoto.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.isotope.min.js"></script>

<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/wow.min.js"></script>


</head>
<body class="homepage">

<div class="container" style="padding: 0; margin: auto;">
	
	<header id="header">
		<tiles:insertAttribute name="header"/>
	</header>
	
	<nav class="navbar navbar-default">
		<tiles:insertAttribute name="nav"/>
	</nav>
	
	<!-- <article> -->
	<div class="container-fluid" style="min-height: 400px;">
		<tiles:insertAttribute name="body"/>
	</div>
	<!-- </article> -->
		
	<footer class="container-fluid text-center">
		<tiles:insertAttribute name="footer"/>
	</footer>

</div>



</body>
</html>
