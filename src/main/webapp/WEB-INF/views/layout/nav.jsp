<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
          <a class="navbar-brand" href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath}/img/movielogo.png" width="250" height="80"/></a>
        </div>
        <div style="text-align:right;">
	      	<c:if test="${empty sessionScope.LOGIN_USER}">
				<a href="${pageContext.request.contextPath}/login/loginForm" style="color:#FFFFFF;font-size:11px;">로그인</a> <span style="color:#FFFFFF;font-size:11px;">|</span>                
				<a href="${pageContext.request.contextPath}/member/memberAgree" style="color:#FFFFFF;font-size:11px;">회원가입</a>                
		    </c:if>
	      	<c:if test="${not empty sessionScope.LOGIN_USER}">
				<span style="color:#FFFFFF;font-size:12px;">
					<b>
						${LOGIN_USER.mem_name}
							<c:if test="${LOGIN_USER.class_code == 1}">
								(<img alt="실버" src="${pageContext.request.contextPath}/img/silver3.png">)
							</c:if> 
							<c:if test="${LOGIN_USER.class_code == 2}">
								(<img alt="골드" src="${pageContext.request.contextPath}/img/gold3.png">)
							</c:if> 
							<c:if test="${LOGIN_USER.class_code == 3}">
								(<img alt="다이아" src="${pageContext.request.contextPath}/img/dia3.png">)
							</c:if> 
					</b> 님
				</span>  
				<c:if test="${LOGIN_USER.class_code == 99}">  
				<span style="color:#FFFFFF;font-size:11px;">|</span>
				<a href="${pageContext.request.contextPath}/admin/adminPage" style="color:#FFFFFF;font-size:11px;">관리자페이지</a>    
				</c:if>
				<span style="color:#FFFFFF;font-size:11px;">|</span>             
				<a href="${pageContext.request.contextPath}/login/logout" style="color:#FFFFFF;font-size:11px;">로그아웃</a>                
		    </c:if>
	    </div>
        <div class="collapse navbar-collapse navbar-right">
          <ul class="nav navbar-nav">
            	<li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="${pageContext.request.contextPath}/reservation/101">예매<b class="caret"></b></a>
                      <ul class="dropdown-menu">
                           <li><a href="${pageContext.request.contextPath}/reservation/101">빠른예매</a></li>             
                       </ul>
                  </li>
                        
                  <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="${pageContext.request.contextPath}/movie/movie_information">영화<b class="caret"></b></a>
                       <ul class="dropdown-menu">
                           <li><a href="${pageContext.request.contextPath}/movie/movie_information">영화무비차트</a></li>                   
                       </ul>
                  </li>
                  
                  <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="${pageContext.request.contextPath}/board/3030101?bo_type_code=1">커뮤니티<b class="caret"></b></a>
                       <ul class="dropdown-menu">
                           <li><a href="${pageContext.request.contextPath}/board/3030101?bo_type_code=1">공지사항</a></li>
                           <li><a href="${pageContext.request.contextPath}/board/3030101?bo_type_code=2">질문답변</a></li>                            
                       </ul>
                  </li>
            
                  <li class="dropdown">
                    <a  href="${pageContext.request.contextPath}/snack/snack">스낵
                    <c:if test="${not empty sessionScope.LOGIN_USER}"> 
                    <b class="caret"></b>
                    </c:if></a>      
                    <c:if test="${not empty sessionScope.LOGIN_USER}">              
                       <ul class="dropdown-menu">
                           <li><a href="${pageContext.request.contextPath}/snack/snack">스낵코너</a></li>                                                   
                           <li><a href="${pageContext.request.contextPath}/snack/snack_basket/${LOGIN_USER.mem_id}">스낵 장바구니</a></li>                                                   
                       </ul>      
                    </c:if> 
                  </li> 
                  <c:if test="${not empty sessionScope.LOGIN_USER}">   
                  <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="${pageContext.request.contextPath}/admin/memberView?mem_id=${LOGIN_USER.mem_id}">마이페이지<b class="caret"></b></a>
                       <ul class="dropdown-menu">
                           <li><a href="${pageContext.request.contextPath}/member/memberView?mem_id=${LOGIN_USER.mem_id}">회원정보</a></li>
                           <li><a href="${pageContext.request.contextPath}/mypage/reserveList?mem_id=${LOGIN_USER.mem_id}">예매구매이력</a></li>                            
                           <li><a href="${pageContext.request.contextPath}/mypage/snackBuy?mem_id=${LOGIN_USER.mem_id}">스낵구매이력</a></li>                            
                       </ul>
                  </li>               
                  </c:if>
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