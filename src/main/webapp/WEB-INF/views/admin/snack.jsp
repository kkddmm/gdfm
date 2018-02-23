<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<script>
	function fn_comboset(snack_type) {
		location.href = "${pageContext.request.contextPath}/admin/snack?snack_type="
				+ snack_type;
	}
</script>
<div class="slider">
<h2>스낵정보</h2>
	<table class="table table-bordered table-striped table-hover">
			<thead>
				<tr class="warning">
					<th class="col-xs-1 text-center">번호</th>
					<th class="col-xs-3 text-center">제품명</th>
					<th class="text-center">콤보구성</th>
				</tr>
			</thead>
			
			<tbody>
				<c:if test="${not empty snackList}" >
					<c:forEach var="snack" items="${snackList}" varStatus="i">
						<tr>
							<td style="text-align:center;">${(pagingUtil.totalCount-(pagingUtil.currentPage-1)*pagingUtil.pageCount) - i.index - ((pagingUtil.currentPage-1)*5)}</td>			
							<td class="text-center"><a href="snack_detail/${snack.snack_id}" style="color:#666666;">${snack.snack_name}</a></td>
							<td class="text-left">
							<c:choose>
								<c:when test="${snack.snack_combo_yn=='Y'}">
									<span>${snack.snack_subname}</span>
								</c:when>
							</c:choose>
							</td>
						</tr>
					</c:forEach>			
				</c:if>
				<c:if test="${empty snackList}" >
					<tr>
						<td colspan="3" align="center">게시글이 존재하지 않습니다.</td>
					</tr>		
				</c:if>
				
				
			</tbody>
		</table>
</div>