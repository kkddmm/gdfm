<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	function fn_writeForm() {
		location.href = "${pageContext.request.contextPath}/admin/boardadmintypeForm";
	}
	
	function fn_writeForm2(seqNo) {
		location.href = "${pageContext.request.contextPath}/admin/boardadmintypeForm?bo_type_code=" + seqNo;
	}
	
	function fn_delete(seqNo) {
		if(confirm("삭제하시겠습니까?")){
			location.href = "${pageContext.request.contextPath}/admin/boardadmintypeDelete?bo_type_code=" + seqNo;
		}
	}
</script>
	<div class="slider">
		<div align="right">
			<input type="button" value="글쓰기" class="btn btn-warning" onclick="fn_writeForm();">
		</div>
		<br />
		<table class="table table-bordered table-striped table-hover">
			<thead>
				<tr class="warning">
					<th class="col-xs-2 text-center">번호</th>
					<th class="text-center">게시판이름</th>
					<th class="col-xs-2 text-center">수정 / 삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${not empty boardadmintypeList}" >
					<c:forEach var="boardadmintype" items="${boardadmintypeList}">
						<tr>
							<td class="text-center">${boardadmintype.bo_type_code}</td>
							<td>${boardadmintype.bo_type_name}</td>
							<td class="text-center">
								<input type="button" value="수정" class="btn btn-info" onclick="fn_writeForm2('${boardadmintype.bo_type_code}');"> 
								/ 
								<input type="button" value="삭제" class="btn btn-danger" onclick="fn_delete('${boardadmintype.bo_type_code}');">
							</td>
						</tr>
					</c:forEach>			
				</c:if>
			</tbody>
		</table>
	</div>