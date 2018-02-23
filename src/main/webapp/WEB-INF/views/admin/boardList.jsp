<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div style="display:inline-block;">
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
		location.href = "${pageContext.request.contextPath}/admin/boardForm?bo_type_code=${param.bo_type_code}";
	}
	
	
	function fn_search(currentPage) {
		var frm = document.searchForm;
		
		frm.currentPage.value = currentPage;
		
		if(frm.searchType.value !="" && frm.searchWord.value == ""){
			alert("검색어를 입력하세요.");
			return false;
		}
		
		frm.action = "${pageContext.request.contextPath}/admin/boardList?bo_type_code=${param.bo_type_code}";//절대경로
		//frm.action = "boardList";//상대경로
		frm.submit();
		
	}

</script>
<div class="slider">
	<div class="container2">
		<c:if test="${not empty boardtypeList}" >
			<c:forEach var="boardtype" items="${boardtypeList}">
				<h2>${boardtype.bo_type_name}</h2>		
			</c:forEach>			
		</c:if>
		<div align="right">
				<c:if test="${param.bo_type_code == 1}">
					<c:if test="${not empty sessionScope.LOGIN_USER && LOGIN_USER.class_code == 99}">
						<input type="button" value="글쓰기" class="btn btn-warning" onclick="fn_writeForm();">
					</c:if>
				</c:if>
				<c:if test="${param.bo_type_code != 1}">
					<c:if test="${not empty sessionScope.LOGIN_USER}">
						<input type="button" value="글쓰기" class="btn btn-warning" onclick="fn_writeForm();">
					</c:if>
				</c:if>
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
					<input type="button" value="검색" onclick="fn_search(1);" class="btn btn-warning">
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
				<tr class="warning">
					<th class="col-xs-1 text-center">번호</th>
					<th class="col-xs-2 text-center">영화관</th>
					<th class="text-center">제목</th>
					<th class="col-xs-1 text-center">작성자</th>
					<th class="col-xs-2 text-center">작성일자</th>
					<th class="col-xs-1 text-center">조회수</th>
				</tr>
			</thead>
			
			<tbody>
			<c:if test="${param.bo_type_code == 1}">
				<c:if test="${not empty noticeList}" >
					<c:forEach var="notice" items="${noticeList}">
						<fmt:parseDate value="${notice.bo_reg_date}" pattern="yyyy-MM-dd" var="reg_notice_date2" />
						<fmt:formatDate value="${reg_notice_date2}" pattern="yyyy-MM-dd" var="reg_notice_date3" />
						<tr>
							<td style="text-align:center;">공지</td>
							<td style="text-align:center;">${notice.ci_id_name}</td>
							
							<td class="text-left"><a href="boardView/${notice.bo_id}/${notice.bo_type_code}" style="color:#666666;"><b>${notice.bo_title}</b></a></td>
							
							<td style="text-align:center;">${notice.mem_id_name}</td>
							<td style="text-align:center;">${reg_notice_date3}</td>
							<td style="text-align:center;"></td>
						</tr>
					</c:forEach>			
				</c:if>
			</c:if>
				<c:if test="${not empty boardList}" >
					<c:forEach var="board" items="${boardList}" varStatus="i">
						<fmt:parseDate value="${board.bo_reg_date}" pattern="yyyy-MM-dd" var="reg_date2" />
						<fmt:formatDate value="${reg_date2}" pattern="yyyy-MM-dd" var="reg_date3" />
						<tr>
							<td style="text-align:center;">${(pagingUtil.totalCount-(pagingUtil.currentPage-1)*pagingUtil.pageCount) - i.index - ((pagingUtil.currentPage-1)*5)}</td>
							<td style="text-align:center;">${board.ci_id_name}</td>
							
							<td class="text-left"><a href="boardView/${board.bo_id}/${board.bo_type_code}" style="color:#666666;">${board.bo_title}</a></td>
							
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
		<div style="text-align:center;">
			<ul class="pagination">
				${pagingUtil.pageHtml}
			</ul>
		</div>
	</div>
</div>
</div>
