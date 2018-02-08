<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
	function fn_writeForm(seqNo,botypeCode) {
		location.href = "${pageContext.request.contextPath}/board/3030103?bo_id=" + seqNo + "&bo_type_code=" + botypeCode;
	}
	function fn_delete(seqNo,botypeCode) {
		if(confirm("삭제하시겠습니까?")){
			location.href = "${pageContext.request.contextPath}/board/boardDelete?bo_id=" + seqNo + "&bo_type_code=" + botypeCode;
	
		}
	}
	function fn_list() {
		location.href = "${pageContext.request.contextPath}/board/3030101?bo_type_code=${board.bo_type_code}";
	}
	
	function fn_co_upt(bo_co_id, bo_id, bo_type_code, bo_co_content){

		//기존의 댓글 표시창 html 제거 
		$('#td'+bo_co_id).html('');
		
		$("<form>").attr('id','updateform'+bo_co_id).appendTo('#td'+bo_co_id);
		$('<input>').attr({'type':'hidden','value':bo_co_id,'name':'bo_co_id'}).appendTo($('#updateform'+bo_co_id));
		$('<input>').attr({'type':'hidden','value':bo_id,'name':'bo_id'}).appendTo($('#updateform'+bo_co_id));
		
		$('<textarea>').attr('name','bo_co_content').val(bo_co_content).css({
			'width' : '800px'
		}).addClass('co_upt_area').appendTo($('#updateform'+bo_co_id));
		$('<span>').addClass('glyphicon glyphicon-ok').on('click',function(){
		var upt_co_content =$('.co_upt_area').val();
		
		
		var upt_confirm = confirm("정말로 댓글을 수정하시겠습니까?");
		if(upt_confirm==true){
			var updateForm = $('#updateform'+bo_co_id)[0];
			updateForm.action = "${pageContext.request.contextPath}/board/commentUpdate?bo_type_code="+bo_type_code;
			updateForm.method = "post";
			updateForm.submit();
		}
		else{
			return false;
		}
		}).appendTo($('#td'+bo_co_id));
		
		$('<span>').addClass('glyphicon glyphicon-share-alt').on('click',function(){
			var uptconfirm2 = confirm("수정중인 내용은 저장되지 않습니다. 글 내용화면으로 돌아갈까요?");
			
			if(uptconfirm2==true){
				
				location.href ="${pageContext.request.contextPath}/board/communityBoardView?bo_id="+bo_id+"&bo_type_code="+bo_type_code;
			}else{
				return false;
			}
		}).appendTo($('#td'+bo_co_id));
	}
			
	function fn_co_del(bo_co_id, bo_id, bo_type_code){
				
		var delCon = confirm("댓글을 삭제하시겠습니까?");
				
		if(delCon==true){
			location.href = "${pageContext.request.contextPath}/board/commentDelete?bo_co_id="+bo_co_id+"&bo_id="+bo_id+"&bo_type_code="+bo_type_code;
		}else{
			return false;
		}
	}
	
	function fn_commentInsert(botypeCode){
		var commentFrm = document.commentForm;
		if(commentFrm.bo_co_content.value!=''){
			commentFrm.action ="${pageContext.request.contextPath}/board/commentInsert?bo_type_code="+botypeCode;
			commentFrm.submit();
		}else{
			alert("내용을 입력하세요");
			return false;
		}
				
	}
	
</script>	
<div class="slider">
	<div>
	<c:if test="${not empty boardtypeList}" >
		<c:forEach var="boardtype" items="${boardtypeList}">
			<h2>${boardtype.bo_type_name}</h2>		
		</c:forEach>			
	</c:if>
	<table class="table">
		<tr>
			<th class="col-xs-2 text-center info">제목</th>
			<td>
				<b>${board.bo_title}</b>
			</td>
		</tr>	
		<tr>
			<th class="text-center info">작성자</th>
			<td>
				${board.mem_id_name}
			</td>
		</tr>	
		<tr>
			<th class="text-center info">영화관</th>
			<td>
				${board.ci_id_name}
			</td>
		</tr>	
		<tr>
			<th class="text-center info">첨부파일</th>			
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
		
		<c:if test="${not empty LOGIN_USER and LOGIN_USER.mem_id == board.mem_id}">	
			<input type="button" value="수정" class="btn btn-warning" onclick="fn_writeForm('${board.bo_id}','${board.bo_type_code}');">
			<input type="button" value="삭제" class="btn btn" onclick="fn_delete('${board.bo_id}','${board.bo_type_code}');">
		</c:if>	
			<input type="button" value="목록" class="btn btn-default" onclick="fn_list();">
		</p>
		<c:if test="${board.bo_type_code == 2}">
<!-- 		<p>댓글 수 : </p> -->
			<table class="table table-bordered">
				<c:forEach var="comment" items="${commentList}">
					<tr>
						<td><strong>${comment.mem_id}</strong> 등록 : ${comment.bo_co_reg_date}</td>
					</tr>
						<tr>
							
									<td id="td${comment.bo_co_id}" style="white-space: pre-wrap">${comment.bo_co_content}<c:if test="${LOGIN_USER.mem_id == comment.mem_id}"><span id="commentUdt" onclick="fn_co_upt(${comment.bo_co_id},${board.bo_id},${board.bo_type_code},'<spring:escapeBody javaScriptEscape="true">${comment.bo_co_content}</spring:escapeBody>');" class="glyphicon glyphicon-ok"></span>  <span id="commentDel${comment.bo_co_id}" onclick="fn_co_del(${comment.bo_co_id},${board.bo_id},${board.bo_type_code});" class="glyphicon glyphicon-remove"></span>
 								</c:if></td>
						</tr>	

				</c:forEach>

			</table>

			<c:if test="${empty LOGIN_USER}">
				<div text-align="center">
					<p>
						<strong>로그인</strong>을 하시면 댓글을 등록할 수 있습니다.
					</p>

				</div>
			</c:if>
			 <c:if test="${not empty LOGIN_USER}">
				<h5>댓글 달기 - ${LOGIN_USER.mem_id}</h5>
				<form method="post" name="commentForm">
				<input name="mem_id" type="text" style="display: none;" value="${LOGIN_USER.mem_id}" /> 
<!-- 					<input type="hidden" name="mem_id" value="test"> -->
					<input type="hidden" name="bo_id" value="${board.bo_id}">
					<textarea placeholder="건강한 댓글은 작성자에게 힘이 됩니다." rows="8" class="form-control" name="bo_co_content"></textarea>
					<p>
						<a style="float: right;" class="button" onclick="fn_commentInsert('${board.bo_type_code}');"><button>댓글등록</button></a>
					</p>
				</form>
			</c:if>
		</c:if>
		
	</div>
</div>
