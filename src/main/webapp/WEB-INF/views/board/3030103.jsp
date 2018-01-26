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
<%-- <link href="${pageContext.request.contextPath}/summernote/summernote.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/summernote/summernote.js"></script> --%>

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

$(function () {
	
	$frm = $("#boardForm");
    
	// 파일 추가
	$("#btnFileAdd").click(function(){
		$("#fileList").append(
			'<div class="col-xs-12">' +
			'<input type="file" name="uploadFiles" multiple="multiple" style="display: inline;">' +
			'<button type="button" class="btn btn-danger btn-xs btn-delete-file">X</button>' +
			'</div>'
		);
	});
	
	// 신규 파일 삭제
	$("#fileList").on("click", ".btn-delete-file", function() {
		$(this).parent().remove();
	});
	
	// 기존 파일 삭제
	$(".btn-delete-exist").on("click", function() {
		$(this).parent().html('<input type="hidden" name="delFileSeqNo" value="' + $(this).data("file_id") + '">');
	});
});

	function fn_list() {
		location.href="3030101";
	}
	
	function fn_save(type) {
		
		if(validate() == false){
			return false;
		}
		
		var frm = document.boardForm;
		
		frm.action = "boardInsert";
		
		if(type == 'U'){
			frm.action = "boardUpdate";
		}
		frm.submit();
		
	}
	
	function validate() {
		var frm = document.boardForm;
		
		if(frm.bo_title.value == ""){
			alert("제목을 입력하세요.");
			frm.bo_title.focus();
			return false;
		}
		if(frm.mem_id.value == ""){
			alert("작성자는 필수 입력 항목입니다.");
			frm.mem_id.focus();
			return false;
		}
		
		if(frm.bo_content.value == ""){
			alert("내용을 입력하세요.");
			frm.bo_content.focus();
			return false;
		}
		
		
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
		<h3>${board.bo_id == 0 ? '글쓰기' : '글수정'}</h3>
	
	<form name="boardForm" id="boardForm" method="post" enctype="multipart/form-data">
		<input type="hidden" name="bo_id" value="${board.bo_id}"><!-- 핵심 -->
		<input type="hidden" name="bo_type" value="BBS">
		<input type="hidden" name="ci_id" value=2>
		<table class="table">
			<tr>
				<th width="15%" class="info text-center">제목</th>
				<td>
					<div class="col-xs-9"><!-- 12:size MAX -->
						<!-- name은 프로퍼티이름 -->
						<input type="text" name="bo_title" value="${board.bo_title}" class="form-control" placeholder="제목을 입력하세요.">
					</div>
				</td>
			</tr>	
			<tr>
				<th class="info text-center">영화관</th>
				<td>
					<div class="col-xs-3">
						<select name="ci_id" class="form-control">
							<option value="">선택해주세요</option>
							<option ${board.ci_id == '2' ? 'selected' : ''} value="2">대전탄방점</option>
							<option ${board.ci_id == '3' ? 'selected' : ''} value="3">서울홍대점</option>
							<option ${board.ci_id == '5' ? 'selected' : ''} value="5">서울종료점</option>
							<option ${board.ci_id == '6' ? 'selected' : ''} value="6">대전유성점</option>
							<option ${board.ci_id == '7' ? 'selected' : ''} value="7">대전용문점</option>
							<option ${board.ci_id == '8' ? 'selected' : ''} value="8">대전터미널점</option>
							<option ${board.ci_id == '9' ? 'selected' : ''} value="9">전북대점</option>
							<option ${board.ci_id == '10' ? 'selected' : ''} value="10">객사점</option>
						</select>
					</div>
				</td>
			</tr>	
			<tr>
				<th class="info text-center">작성자</th>
				<td>
					<div class="col-xs-3">
<%-- 						<input type="hidden" name="mem_id" value="${board.mem_id}"> --%>
						<input type="hidden" name="mem_id" value="test">
<%-- 						<input type="text" name="mem_id_name" value="${board.mem_id_name}" class="form-control" readonly> --%>
						<input type="text" name="mem_id_name" value="홍길동" class="form-control" readonly>
					</div>
				</td>
			</tr>	
			<tr>
				<th class="info text-center">공지여부</th>
				<td>
					<div class="checkbox col-xs-12">
						<label for="bo_notice_yn"><input type="checkbox" name="bo_notice_yn" id="bo_notice_yn" value="Y" ${board.bo_notice_yn == 'N' ? '' : 'checked'} checked>공지여부</label><!-- label체크시 체크박스체크같음 -->
					</div>
				</td>
			</tr>	
			<!-- 첨부파일 multiple="multiple" -->
			<tr>
				<th class="info text-center">첨부파일</th>
				<td>
				<p>
					<c:forEach var="fileItem" items="${board.fileItemList}">
						<div style="margin: 5px;">
							<a href="${pageContext.request.contextPath}/common/download?file_id=${fileItem.file_id}">${fileItem.file_name}</a> ${fileItem.file_fancy_size}
						<button type="button" class="btn btn-danger btn-xs btn-delete-exist" data-file_id="${fileItem.file_id}">X</button>
						</div>
					</c:forEach>
				</p>
				<p>
					<button type="button" class="btn btn-primary btn-xs" id="btnFileAdd">추가</button>
				</p>
				<div id="fileList">	
					
					<div class="col-xs-12">
						<!-- 이름은 의미없음 -->
						<input type="file" name="uploadFiles" multiple="multiple" style="display: inline;"><button type="button" class="btn btn-danger btn-xs btn-delete-file">X</button>
					</div>
					
				</div>
					
				</td>
			</tr>
			<!-- //첨부파일 -->	
			<tr>
				<td colspan="2">
					<textarea rows="15" name="bo_content" id="bo_content" class="form-control">${board.bo_content}</textarea>
					 <!-- <script>
					    $(document).ready(function() {
					    	$('#bo_content').summernote({
					    		  height: 300,                 // set editor height
					    		  minHeight: null,             // set minimum height of editor
					    		  maxHeight: null,             // set maximum height of editor
					    		  focus: true                  // set focus to editable area after initializing summernote
					    	});
					    });
					  </script> -->
				</td>
			</tr>	
			
		</table>
		
		<p align="right">
			
			<c:if test="${board.bo_id == 0}">
			<input type="button" value="저장" class="btn btn-primary" onclick="fn_save('I');">
			</c:if>
			
			<c:if test="${board.bo_id != 0}">
			<input type="button" value="수정" class="btn btn-primary" onclick="fn_save('U');">	
			</c:if>
			
			<input type="reset" value="취소" class="btn">
			<input type="button" value="목록" class="btn btn-default" onclick="fn_list();">
		</p>
		
	</form>
	</div>
</body>
</html>