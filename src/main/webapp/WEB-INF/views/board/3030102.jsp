<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Piccolo Theme</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- CSS
================================================== -->
<link href='http://fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-responsive.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/prettyPhoto.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/flexslider.css" />
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
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.prettyPhoto.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.flexslider.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.custom.js"></script>
<script type="text/javascript">
$(document).ready(function () {

    $("#btn-blog-next").click(function () {
      $('#blogCarousel').carousel('next')
    });
     $("#btn-blog-prev").click(function () {
      $('#blogCarousel').carousel('prev')
    });

     $("#btn-client-next").click(function () {
      $('#clientCarousel').carousel('next')
    });
     $("#btn-client-prev").click(function () {
      $('#clientCarousel').carousel('prev')
    });
    
});

 $(window).load(function(){

    $('.flexslider').flexslider({
        animation: "slide",
        slideshow: true,
        start: function(slider){
          $('body').removeClass('loading');
        }
    });  
});

</script>
<script type="text/javascript">
	function fn_writeForm(seqNo) {
		location.href = "${pageContext.request.contextPath}/board/3030103?bo_id=" + seqNo;
	}
	function fn_delete(seqNo) {
		if(confirm("삭제하시겠습니까?")){
			location.href = "${pageContext.request.contextPath}/board/boardDelete?bo_id=" + seqNo;
	
		}
	}
	function fn_list() {
		location.href = "${pageContext.request.contextPath}/board/3030101";
	}
	
	
</script>	
</head>
<body>
	<div class="container">
		<div class="row header"><!-- Begin Header -->
	      
	        <!-- Logo
	        ================================================== -->
	        <div class="span5 logo">
	        	<a href="../"><img src="img/piccolo-logo.png" alt="" /></a>
	            <h4>영화 그 이상의 감동.</h4>
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
	                     
	                     <li><a href="gallery-3col.htm">스낵관</a></li>
	                    </ul>
	           
	            </div>
	
	            <!-- Mobile Nav
	            ================================================== -->
	            <form action="#" id="mobile-nav" class="visible-phone">
	                <div class="mobile-nav-select">
	                <select onchange="window.open(this.options[this.selectedIndex].value,'_top')">
	                    
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
	        
	    </div><!-- End Header -->
		<h3>게시판 상세보기</h3>
	
	<table class="table">
		<tr>
			<th class="row-fluid span2" style="text-align:center;">제목</th>
			<td>
				${board.bo_title}
			</td>
		</tr>	
		<tr>
			<th style="text-align:center;">작성자</th>
			<td>
				${board.mem_id_name}
			</td>
		</tr>	
		<tr>
			<th style="text-align:center;">첨부파일</th>			
			<td>
				<c:forEach var="fileItem" items="${board.fileItemList}">
					<div>
						<a href="${pageContext.request.contextPath}/common/download?file_id=${fileItem.file_id}">${fileItem.file_name}</a> ${fileItem.file_fancy_size}
					</div>
				</c:forEach>
			</td>
		</tr>
		<tr>
			<td colspan="2" style="white-space: pre-wrap;">${board.bo_content}</td>
		</tr>			
	</table>
		
		<p align="right">
		
<%-- 		<c:if test="${not empty LOGIN_USER and LOGIN_USER.mem_id == board.mem_id}">	 --%>
			<input type="button" value="수정" class="btn btn-primary" onclick="fn_writeForm('${board.bo_id}');">
			<input type="button" value="삭제" class="btn btn" onclick="fn_delete('${board.bo_id}');">
<%-- 		</c:if>	 --%>
			<input type="button" value="목록" class="btn btn-default" onclick="fn_list();">
		</p>
	</div>
</body>
</html>