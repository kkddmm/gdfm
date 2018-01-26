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
	function fn_writeForm() {
		location.href = "${pageContext.request.contextPath}/board/3030103";
	}
	
	
	function fn_search(currentPage) {
		var frm = document.searchForm;
		
		frm.currentPage.value = currentPage;
		
		if(frm.searchType.value !="" && frm.searchWord.value == ""){
			alert("검색어를 입력하세요.");
			return false;
		}
		
		frm.action = "${pageContext.request.contextPath}/board/3030101";//절대경로
		//frm.action = "boardList";//상대경로
		frm.submit();
		
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
		<h3>게시판 목록</h3>
	
	<div align="right">
			<input type="button" value="글쓰기" class="btn btn-primary" onclick="fn_writeForm();">
	</div>
	
	
	<!-- 검색기능 -->
	<div>
		<form name="searchForm" method="post" class="form-inline">
			<p>
				<input type="hidden" name="currentPage" value="${param.currentPage}">	<!-- 현재페이지 -->
				<select name="searchType" class="form-control">
					<!-- 01,02...공통코드 -->
					<option value="">전체</option>
					<option ${param.searchType == '01' ? 'selected' : ''} value="01">제목</option>
					<option ${param.searchType == '02' ? 'selected' : ''} value="02">내용</option>
					<option ${param.searchType == '03' ? 'selected' : ''} value="03">제목+내용</option>
					<option ${param.searchType == '04' ? 'selected' : ''} value="04">작성자</option>
				</select>
				
				<input type="text" name="searchWord" value="${param.searchWord}" size="40" class="form-control">
				<input type="button" value="검색" onclick="fn_search(1);" class="btn btn-primary">
			</p>
			<p>
				<div class="form-group">
					<label>총 게시글 : ${pagingUtil.totalCount}</label>
				</div>
				<div class="form-group" style="float:right;">
					<label>페이지 사이즈 :</label>
				<select name="pageSize" class="form-control"><!-- 페이지 사이즈 -->
					<option ${param.pageSize == '10' ? 'selected' : ''} value="10">10개</option>
					<option ${param.pageSize == '20' ? 'selected' : ''} value="20">20개</option>
					<option ${param.pageSize == '50' ? 'selected' : ''} value="50">50개</option>
				</select>
				</div>
			</p>
		</form>
	</div>
	
	
	<table class="table table-bordered table-striped table-hover">
		<thead>
			<tr class="info">
				<th class="row-fluid span1" style="text-align:center;">번호</th>
				<th class="row-fluid span2" style="text-align:center;">영화관</th>
				<th style="text-align:center;">제목</th>
				<th class="row-fluid span2" style="text-align:center;">작성자</th>
				<th class="row-fluid span2" style="text-align:center;">작성일자</th>
				<th class="row-fluid span2" style="text-align:center;">조회수</th>
			</tr>
		</thead>
		
		<tbody>
			
			<c:if test="${not empty boardList}" >
				<c:forEach var="board" items="${boardList}" varStatus="i">
					<fmt:parseDate value="${board.bo_reg_date}" pattern="yyyy-MM-dd" var="reg_date2" />
					<fmt:formatDate value="${reg_date2}" pattern="yyyy-MM-dd" var="reg_date3" />
					<tr>
						<td style="text-align:center;">${(pagingUtil.totalCount-(pagingUtil.currentPage-1)*pagingUtil.pageCount) - i.index - ((pagingUtil.currentPage-1)*5)}</td>
						<td style="text-align:center;">${board.ci_id_name}</td>
						
						<td class="text-left"><a href="3030102/${board.bo_id}">${board.bo_title}</a></td>
						
						<td style="text-align:center;">${board.mem_id_name}</td>
						<td style="text-align:center;">${reg_date3}</td>
						<td style="text-align:center;">${board.bo_hit_cnt}</td>
					</tr>
				</c:forEach>			
			</c:if>
			<c:if test="${empty boardList}" >
				<tr>
					<td colspan="6" align="center">게시글이 존재하지 않습니다.</td>
				</tr>		
			</c:if>
			
			
		</tbody>
	</table>
	
	<!-- 페이지 네이게이션 -->
	<div class="pagination" style="text-align:center;">
		<ul>
			${pagingUtil.pageHtml}
		</ul>
	</div>
	</div>
</body>
</html>