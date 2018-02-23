<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
	function fn_list() {
		location.href = "${pageContext.request.contextPath}/admin/snack";
	}
</script>
<div class="slider">
<h2>스낵정보</h2>
	<table class="table table-bordered">
		<tr>
			<th class="col-xs-3 text-center warning">제품명</th>
			<td>
				<b>${snack.snack_name}</b>
			</td>
		</tr>	
		<tr>
			<th class="text-center warning">가격</th>
			<td>
				${snack.snack_price} 원
			</td>
		</tr>	
		<tr>
			<th class="text-center warning">원산지 ${snack.snack_mat}</th>
			<td>
				${snack.snack_origin}
			</td>
		</tr>	
		<tr>
			<th class="text-center warning">상품설명</th>
			<td>
				${snack.snack_info}
			</td>
		</tr>	
		<tr>
			<th class="text-center warning">유효기간</th>
			<td>
				${snack.snack_exp}
			</td>
		</tr>	
		<tr>
			<th class="text-center warning">상품교환(클릭)</th>
			<td>
				<a  href="#"  data-toggle="modal" data-target="#myModal">${snack.snack_change_info}</a>
			</td>
		</tr>	
	</table>
  <p class="text-right">
  	<input type="button" value="목록" class="btn btn-default" onclick="fn_list();">
  </p>
  	<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">사용가능 극장</h4>
      </div>
      <div class="modal-body">
       	 <c:if test="${snack.snack_id==17 }">
				<span>대전 탄방점</span><br>
				<span>서울 역삼점</span><br>
				<span>전북 객사점</span>		
			</c:if>
		
			<c:if test="${snack.snack_id==18 }">
				<span>대전 대전점</span><br>
				<span>서울 강남점</span> 	
			</c:if>
			
			<c:if test="${snack.snack_id==19 }">
				<span>서울 역삼점</span>				
				<span>전북 객사점</span>				
			</c:if>      
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
  </div>
</div>



