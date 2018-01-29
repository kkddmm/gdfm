<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<div class="slider">
	<div class="container">
	
	<table class="table">
		<tr>
			<th class="col-xs-2 text-center">제목</th>
			<td>
				${board.bo_title}
			</td>
		</tr>	
		<tr>
			<th class="text-center">작성자</th>
			<td>
				${board.mem_id_name}
			</td>
		</tr>	
		<tr>
			<th class="text-center">영화관</th>
			<td>
				${board.ci_id_name}
			</td>
		</tr>	
		<tr>
			<th class="text-center">첨부파일</th>			
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
		
		<p class="text-right">
		
<%-- 		<c:if test="${not empty LOGIN_USER and LOGIN_USER.mem_id == board.mem_id}">	 --%>
			<input type="button" value="수정" class="btn btn-primary" onclick="fn_writeForm('${board.bo_id}');">
			<input type="button" value="삭제" class="btn btn" onclick="fn_delete('${board.bo_id}');">
<%-- 		</c:if>	 --%>
			<input type="button" value="목록" class="btn btn-default" onclick="fn_list();">
		</p>
	</div>
</div>
