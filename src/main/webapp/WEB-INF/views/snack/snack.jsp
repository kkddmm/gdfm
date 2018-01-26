<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>영화보기 좋은 날</title>
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
<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.easing.1.3.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.prettyPhoto.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.quicksand.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.custom.js"></script>

<script type="text/javascript">
	
</script>


</head>



<body>
	<div class="color-bar-1"></div>
    <div class="color-bar-2 color-bg"></div>
    
    <div class="container main-container">
    
      <div class="row header"><!-- Begin Header -->
      
        <!-- Logo
        ================================================== -->
        <div class="span5 logo">
        	<a href="index.jsp"><img src="${pageContext.request.contextPath}/img/movielogo.png" alt="" /></a>
            <h5>영화 그 이상의 감동</h5>
        </div>
        
        <!-- Main Navigation
        ================================================== -->
        <div class="span7 navigation">
            <div class="navbar hidden-phone">
            
                <ul class="nav">
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">예매 <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">예매 depth1</a></li>
                            <li><a href="#">예매 depth1</a></li>
                            
                        </ul>
                    </li>
                  
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">영화 <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">영화 depth1</a></li>
                            <li><a href="#">영화 depth2</a></li>                           
                        </ul>
                    </li>
                     <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">커뮤니티 <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">커뮤니티 depth1</a></li>
                            <li><a href="#">커뮤니티 depth2</a></li>
                            
                           
                        </ul>
                     </li>
                     
                     <li><a href="snack">스낵관</a></li>
                    </ul>
           
            </div>

            <!-- Mobile Nav
            ================================================== -->
            <form action="#" id="mobile-nav" class="visible-phone">
                <div class="mobile-nav-select">
                <select onchange="window.open(this.options[this.selectedIndex].value,'_top')">
                    
                    <option value="index.jsp">예매</option>
                        <option value="index.jsp">- Full Page</option>
                        <option value="index-gallery.jsp">- Gallery Only</option>
                       
                    <option value="features.jsp">영화</option>
                    <option value="page-full-width.jsp">Pages</option>
                        <option value="page-full-width.jsp">- Full Width</option>
                        <option value="page-right-sidebar.jsp">- Right Sidebar</option>
                        
                    <option value="gallery-4col.jsp">커뮤니티</option>
                        <option value="gallery-3col.jsp">- 3 Column</option>
                        <option value="gallery-4col.jsp">- 4 Column</option>               
                       
                    <option value="snack_main">스낵관</option>
                        
                </select>
                </div>
                </form>
        </div>

      </div><!-- End Header -->
      
      
          
    <!-- 스낵타입  -->
    	
    		<div class="navbar hidden-phone">
            
                <ul class="nav" >
                    <li>
                        <a class="btn" href="${pageContext.request.contextPath}/snack/snack?snack_type=combo"}>콤보세트</a>                
                        
                    </li>
                  
                    <li>
                        <a class="btn" href="${pageContext.request.contextPath}/snack/snack?snack_type=popcorn" >팝콘</a>                        
                    </li>
                    
                     <li >
                        <a class="btn" href="${pageContext.request.contextPath}/snack/snack?snack_type=drink">음료</a>                        
                     </li>
                     
                     <li>
                     	<a class="btn" href="${pageContext.request.contextPath}/snack/snack?snack_type=snack">스낵</a>
                     </li>
                 </ul>           
     	       </div>

    
   
      
      
      
      
      
      
      
     
    <!-- Page Content
    ================================================== --> 
    <div class="row">

        <!-- Gallery Items
        ================================================== --> 
        <div class="span12 gallery">

            

            <div class="row clearfix">
                <ul class="gallery-post-grid holder">

			<c:if test="${not empty snackList}">
				<c:forEach var="snack" items="${snackList}">
						
					<!-- Gallery Item 1 -->
	                    <li  class="span4 gallery-item" data-id="id-1" data-type="illustration">
	                        <span class="gallery-hover-3col hidden-phone hidden-tablet" >
	                            <span class="gallery-icons" >
	                                
	                                <a href="${pageContext.request.contextPath}/snack/snack_detail" class="item-details-link"></a>
	                            </span>
	                        </span>
	                        <a href="gallery-single.jsp"><img src="${pageContext.request.contextPath}/img/snack/${snack.snack_name}.jpg" alt="Gallery"></a>
	                       
	                       	<span class="project-details">${snack.snack_name}</span>
	                       <c:choose>
	                       		<c:when test="${snack.snack_combo_yn=='Y'}">
	                       			<span class="project-details">${snack.snack_subname}</span>
	                       		</c:when>	                       	
	                       </c:choose>
	                       
	                    </li>
						
						
					</c:forEach>
				
				</c:if>
				
				<c:if test="${empty snackList}">
					<td colspan="5" align="center">메뉴가 존재하지 않습니다.</td>
				</c:if>

                </ul>
            </div>

           

        </div><!-- End gallery list-->

    </div><!-- End container row -->
    
    </div> <!-- End Container -->

    <!-- Footer Area
        ================================================== -->
        <div class="footer-container"><!-- Begin Footer -->
            <div class="container">
                <div class="row footer-row">
                </div>
    
                <div class="row"><!-- Begin Sub Footer -->
                    <div class="span12 footer-col footer-sub">
                        <div class="row no-margin">
                            <div class="span6"><span class="left">Copyright 2012 Piccolo Theme. All rights reserved.</span></div>
                            <div class="span6">
                                <span class="right">
                                <a href="#">Home</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="#">Features</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="#">Gallery</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="#">Blog</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="#">Contact</a>
                                </span>
                            </div>
                        </div>
                    </div>
                </div><!-- End Sub Footer -->
    
            </div>
        </div><!-- End Footer -->

    <!-- Scroll to Top -->  
    <div id="toTop" class="hidden-phone hidden-tablet">Back to Top</div>
    
</body>
</html>