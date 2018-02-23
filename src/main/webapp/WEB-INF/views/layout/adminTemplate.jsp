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
<style>
.container2 {
  padding-right: 15px;
  padding-left: 15px;
  margin-right: auto;
  margin-left: auto;
}
@media (min-width: 768px) {
  .container2 {
    width: 720px;
  }
}
@media (min-width: 992px) {
  .container2 {
    width: 940px;
  }
}
@media (min-width: 1200px) {
  .container2 {
    width: 1140px;
  }
}
</style>


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
		<tiles:insertAttribute name="navadmin"/>
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
