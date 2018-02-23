<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	function fn_list() {
		location.href="boardadmintypeList";
	}
	
	function fn_save(type) {
		
		validate();
		
		var frm = document.boardtypeForm;
		
		frm.action = "boardadmintypeInsert";
		
		if(type == 'U'){
			frm.action = "boardadmintypeUpdate";
		}
		frm.submit();
		
	}
	
	function validate() {
		var frm = document.boardtypeForm;
		
		if(frm.bo_type_name.value == ""){
			alert("게시판이름을 입력하세요.");
			frm.bo_type_name.focus();
			return false;
		}
		
	}
</script>
<div class="slider">
	<form name="boardtypeForm" id="boardtypeForm" method="post" enctype="multipart/form-data">
		<input type="hidden" name="bo_type_code" value="${boardtype.bo_type_code}"><!-- 핵심 -->
		<table class="table">
			<tr>
				<th width="15%" class="warning text-center">게시판이름</th>
				<td>
					<input type="text" name="bo_type_name" value="${boardtype.bo_type_name}" class="form-control" placeholder="게시판이름을 입력하세요.">
				</td>
			</tr>

		</table>

		<p align="right">

			<c:if test="${boardtype.bo_type_code == 0}">
				<input type="button" value="저장" class="btn btn-warning" onclick="fn_save('I');">
			</c:if>

			<c:if test="${boardtype.bo_type_code != 0}">
				<input type="button" value="수정" class="btn btn-warning" onclick="fn_save('U');">
			</c:if>

			<input type="reset" value="취소" class="btn"> <input type="button" value="목록" class="btn btn-default" onclick="fn_list();">
		</p>

	</form>
</div>