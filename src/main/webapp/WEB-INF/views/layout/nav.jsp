<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



	 <nav class="navbar navbar-fixed-top" role="banner">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
          <a class="navbar-brand" href="/"><img src="${pageContext.request.contextPath}/img/movielogo.png" width="250" height="80"/></a>
        </div>

        <div class="collapse navbar-collapse navbar-right">
          <ul class="nav navbar-nav">
            	<li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">예매<b class="caret"></b></a>
                       <ul class="dropdown-menu">
                           <li><a href="#">예매 depth1</a></li>
                           <li><a href="#">예매 depth1</a></li>                            
                       </ul>
                  </li>
                  
                  
                  <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">영화<b class="caret"></b></a>
                       <ul class="dropdown-menu">
                           <li><a href="#">영화 depth1</a></li>
                           <li><a href="#">영화 depth1</a></li>                            
                       </ul>
                  </li>
                  
                  <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">커뮤니티<b class="caret"></b></a>
                       <ul class="dropdown-menu">
                           <li><a href="#">공지사항</a></li>
                           <li><a href="#">질문답변</a></li>                            
                       </ul>
                  </li>
                  
                  
                  <li >
                    <a  href="#">스낵</b></a>                       
                  </li>
                  
            <!-- <li class="dropdown"><a href="index.html">예매</a></li>
            <li class="dropdown toggle"><a href="about-us.html">영화</a></li>
            <li class="dropdown"><a href="services.html">커뮤니티</a></li>
            <li><a href="portfolio.html">스낵</a></li> -->
            
          </ul>
        </div>
      </div>
      <!--/.container-->
    </nav>
    <!--/nav-->