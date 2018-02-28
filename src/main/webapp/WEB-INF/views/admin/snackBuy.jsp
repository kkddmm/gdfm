<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script>
	function fn_search(currentPage) {
		var frm = document.searchForm;
		
		frm.currentPage.value = currentPage;
		
		if(frm.searchType.value !="" && frm.searchWord.value == ""){
			alert("검색어를 입력하세요.");
			return false;
		}
		
		frm.action = "${pageContext.request.contextPath}/admin/snackBuy";//절대경로
		//frm.action = "boardList";//상대경로
		frm.submit();
	}
	
	function fn_delete(seqNo,memPoint,memId) {
		if(confirm("삭제하시겠습니까?")){
			location.href = "${pageContext.request.contextPath}/admin/snackBuyDelete?snack_buy_id=" + seqNo + "&mem_point=" + memPoint + "&mem_id=" + memId;
	
		}
	}
	
	function fn_useSnack(snack_buy_id){
			$.ajax({
				type: 'post',
				url:'${pageContext.request.contextPath}/admin/useSnack',
				data:"snack_buy_id="+snack_buy_id,
				dataType: 'json',
				success:function(data,status){
					console.log(data);
					if(data.result == "true"){
						alert("정상적으로 수정되었습니다.");
						location.href = "${pageContext.request.contextPath}/admin/snackBuy";
					}else{
						alert("수정이 실패하였습니다.");
					}
					
				},
				error: function(error){
					console.log(error);
				}
				
		});
			
	}
</script>

<div class="slider">
<h2>스낵구매정보</h2>
	<!-- 검색기능 -->
		<div>
			<form name="searchForm" method="post" class="form-inline">
				<p>
					<input type="hidden" name="currentPage" value="${param.currentPage}">	<!-- 현재페이지 -->
					<select name="searchType" class="form-control">
						<!-- 01,02...공통코드 -->
						<option value="">전체</option>
						<option ${param.searchType == '01' ? 'selected' : ''} value="01">이름</option>
						<option ${param.searchType == '02' ? 'selected' : ''} value="02">상품명</option>
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
					<th class="col-xs-1 text-center">이름</th>
					<th class="col-xs-1 text-center">아이디</th>
					<th class="text-center">상품명</th>
					<th class="col-xs-1 text-center">수량</th>
					<th class="col-xs-1 text-center">금액</th>
					<th class="col-xs-1 text-center">상태</th>
					<th class="col-xs-1 text-center">삭제</th>
					<th class="col-xs-1 text-center">사용여부</th>
					<th class="col-xs-1 text-center">쿠폰사용</th>
				</tr>
			</thead>
			
			<tbody>
				<c:if test="${not empty snackBuy}" >
					<c:forEach var="snackb" items="${snackBuy}" varStatus="i">
						<tr>
							<td style="text-align:center;">
								${(pagingUtil.totalCount-(pagingUtil.currentPage-1)*pagingUtil.pageCount) - i.index - ((pagingUtil.currentPage-1)*5)}
							</td>			
							<td class="text-center">${snackb.mem_name}</td>
							<td class="text-center">${snackb.mem_id}</td>
							<td class="text-left">${snackb.snack_name}</td>
							<td class="text-center">${snackb.snack_cnt}</td>
							<td class="text-right">
								<fmt:formatNumber var="pay_amount" value="${snackb.pay_amount}" pattern="#,###,###"/>
								${pay_amount}원
							</td>
							<td class="text-center">${snackb.pay_canel_yn == 'Y' ? '취소' : '완료'}</td>
							<td class="text-center"><input type="button" value="삭제" class="btn btn-danger" onclick="fn_delete('${snackb.snack_buy_id}','${snackb.mem_point}','${snackb.mem_id}');"></td>
							<td class="text-center">${snackb.snack_use_yn == 'Y' ? '사용' : '미사용'}</td>
							<td class="text-center">
							<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="nowDate" />
							<fmt:parseDate value="${nowDate}" pattern="yyyy-MM-dd" var="use_now" />
							<fmt:parseNumber value="${use_now.time}" integerOnly="true" var="use_now2" />
							<fmt:parseDate value="${snackb.pay_date}" pattern="yyyy-MM-dd" var="use_date2" />
							<fmt:parseNumber value="${use_date2.time+2592000000}" integerOnly="true" var="use_date3" />
							<c:if test="${snackb.snack_use_yn != 'Y'}">
								<c:if test="${use_date3 > use_now2}">
								<input onclick="fn_useSnack(${snackb.snack_buy_id})" type="button" value="사용" class="btn btn-info" />
								</c:if>
							</c:if>
							</td>
						</tr>
					</c:forEach>			
				</c:if>
				<c:if test="${empty snackBuy}" >
					<tr>
						<td colspan="7" align="center">게시글이 존재하지 않습니다.</td>
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