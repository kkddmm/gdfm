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
				<a href="${pageContext.request.contextPath}/login/loginForm" style="color:#FFFFFF;font-size:11px;">로그인</a>
		    </c:if>
	      	<c:if test="${not empty sessionScope.LOGIN_USER}">
				<span style="color:#FFFFFF;font-size:12px;">
					<b>
						${LOGIN_USER.mem_name}
					</b> 님
				</span> |                
				<a href="${pageContext.request.contextPath}/admin/memberView?mem_id=${LOGIN_USER.mem_id}" style="color:#FFFFFF;font-size:11px;">마이페이지</a><span style="color:#FFFFFF;font-size:11px;">|</span>                
				<a href="${pageContext.request.contextPath}/admin/logout" style="color:#FFFFFF;font-size:11px;">로그아웃</a>                
		    </c:if>
	    </div>
        <div class="collapse navbar-collapse navbar-right">
          <ul class="nav navbar-nav">
            	<li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">커뮤니티<b class="caret"></b></a>
                       <ul class="dropdown-menu">
                           <li><a href="${pageContext.request.contextPath}/admin/boardadmintypeList">게시판생성</a></li>
                          <%--  <c:forEach var="boardadmintype" items="${boardadmintypeList}">
                           		<li><a href="${pageContext.request.contextPath}/admin/boardList?bo_type_code=${boardadmintype.bo_type_code}">${boardadmintype.bo_type_name}</a></li>
                           </c:forEach> --%>
                           		<li><a href="${pageContext.request.contextPath}/admin/boardList?bo_type_code=1">공지사항</a></li>
                           		<li><a href="${pageContext.request.contextPath}/admin/boardList?bo_type_code=2">질문답변</a></li>                              
                       </ul>
                  </li>
                        
                  <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">회원관리<b class="caret"></b></a>
                       <ul class="dropdown-menu">
                           <li><a href="${pageContext.request.contextPath}/admin/memberList">회원관리</a></li>                
                       </ul>
                  </li>
                  <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">스낵<b class="caret"></b></a>
                       <ul class="dropdown-menu">
                           <li><a href="${pageContext.request.contextPath}/admin/snack">스낵상품정보</a></li>                
                           <li><a href="${pageContext.request.contextPath}/admin/snackBuy">스낵구매정보</a></li>                
                       </ul>
                  </li>
                  
                  <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">예매<b class="caret"></b></a>
                       <ul class="dropdown-menu">
                           <li><a href="${pageContext.request.contextPath}/admin/reserveList">예매구매정보</a></li>                       
                       </ul>
                  </li>
            
                  <li class="dropdown">
                    <a  href="${pageContext.request.contextPath}/admin/movieList">영화정보<b class="caret"></b></a>
                     <ul class="dropdown-menu">
                           <li><a href="${pageContext.request.contextPath}/admin/movleList">영화관리</a></li>                       
                     </ul>
                  </li>                   
          </ul>
        </div>
      </div>
      <!--/.container-->
    </nav>
    <!--/nav-->