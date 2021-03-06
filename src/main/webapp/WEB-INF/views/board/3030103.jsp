<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<link href="${pageContext.request.contextPath}/summernote/summernote.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/summernote/summernote.js"></script>
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
		location.href="3030101?bo_type_code=${param.bo_type_code}";
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
		if(frm.ci_id.value == ""){
			alert("영화관선택은 필수 입력 항목입니다.");
			frm.ci_id.focus();
			return false;
		}
		
		if(frm.bo_content.value == ""){
			alert("내용을 입력하세요.");
			frm.bo_content.focus();
			return false;
		}
		
		
	}
	
	
</script>
<div class="slider">
	<div>
		
		<h2>${board.bo_id == 0 ? '글쓰기' : '글수정'}</h2>
	
	<form name="boardForm" id="boardForm" method="post" enctype="multipart/form-data">
		<input type="hidden" name="bo_id" value="${board.bo_id}"><!-- 핵심 -->
		<c:if test="${not empty board.bo_type_code}">
		<input type="hidden" name="bo_type_code" value="${board.bo_type_code}">
		</c:if>
		<c:if test="${empty board.bo_type_code}">
		<input type="hidden" name="bo_type_code" value="${param.bo_type_code}">
		</c:if>
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
							<c:if test="${not empty cinemaList}" >
								<c:forEach var="cinema" items="${cinemaList}">
									<option value=${cinema.ci_id} ${cinema.ci_id == board.ci_id ? 'selected' : ''}>${cinema.ci_name}</option>
								</c:forEach>			
							</c:if>
						</select>
					</div>
				</td>
			</tr>	
			<tr>
				<th class="info text-center">작성자</th>
				<td>
					<div class="col-xs-3">
	 					<input type="hidden" name="mem_id" value="${board.mem_id}">
	 					<input type="text" name="mem_id_name" value="${board.mem_id_name}" class="form-control" readonly>					
					</div>
				</td>
			</tr>
			<c:if test="${param.bo_type_code == 1}">
			<tr>
				<th class="info text-center">공지여부</th>
				<td>
					<div class="checkbox col-xs-12">
						<label for="bo_notice_yn"><input type="checkbox" name="bo_notice_yn" id="bo_notice_yn" value="Y" ${board.bo_notice_yn == 'Y' ? 'checked' : ''}>공지여부</label><!-- label체크시 체크박스체크같음 -->
					</div>
				</td>
			</tr>	
			</c:if>
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
					<button type="button" class="btn btn-warning btn-xs" id="btnFileAdd">추가</button>
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
					 <script>
					    $(document).ready(function() {
					    	$('#bo_content').summernote({
					    		  height: 300,                 // set editor height
					    		  minHeight: null,             // set minimum height of editor
					    		  maxHeight: null,             // set maximum height of editor
					    		  focus: true                  // set focus to editable area after initializing summernote
					    	});
					    });
					  </script>
				</td>
			</tr>	
			
		</table>
		
		<p align="right">
			
			<c:if test="${board.bo_id == 0}">
			<input type="button" value="저장" class="btn btn-warning" onclick="fn_save('I');">
			</c:if>
			
			<c:if test="${board.bo_id != 0}">
			<input type="button" value="수정" class="btn btn-warning" onclick="fn_save('U');">	
			</c:if>
			
			<input type="reset" value="취소" class="btn">
			<input type="button" value="목록" class="btn btn-default" onclick="fn_list();">
		</p>
		
	</form>
	</div>
</div>