<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">




<style>
ul, li {
	list-style: none;	
}
.image:hover{
	border:1px solid yellow;
}
.snackId{
	text-decoration: underline;
}

</style>

		<section id="portfolio">
		
 
			<div class="center">
				<h2 align="left">스낵 장바구니</h2>

			</div>

			<div class="col-md-12">

				<ul class="nav nav-pills nav-justified pull-right">

				</ul>

			</div>



			<!--/#portfolio-filter-->


<div>

	<c:if test="${snack_id !=0}">
		
			<div class="col-md-4">
				<!-- Gallery Item 1 -->
				<div style="height: 400px; border: 10px; border-color: 3f3f3f;">

					<li class="image" align="center">
							<img src="${pageContext.request.contextPath}/img/snack/${snack.snack_name}.jpg" alt="Gallery">							
					</li>
					
				</div>
			</div>
					
			
					<c:forEach var="" items="">
							<div>
								<span>제품명: ${snack.snack_name}</span><br>
								<span>가격: ${snack.snack_price} 원</span><br> 
								<span>수량:
									<select name="snack_cnt">
									    <option value="${snack.snack_cnt}">1</option>
									    <option value="${snack.snack_cnt}">2</option>
									    <option value="${snack.snack_cnt}">3</option>
									    <option value="${snack.snack_cnt}">4</option>
									    <option value="${snack.snack_cnt}">5</option>
									</select>
								</span>		
								<span align="right"><input type="button"  value="삭제"></span>									
							</div>
					</c:forEach>
		
		<div>
		<hr>
			${snack.snack_use_info} 
		</div>
		<div>
			
			<input class ="btn" type="button" value="결제하기"/>
			<input class ="btn" onclick="location.href='${pageContext.request.contextPath}/snack/snack' " type="button" value="목록으로"/>
		</div>
	</c:if>
	

	<c:if test="${snack_id ==0}">
		<td colspan="5" align="center">제품정보가 존재하지 않습니다.</td>
	</c:if>



</div>



<!--특정 스낵메뉴 사용가능 극장 Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">사용가능 극장</h4>
      </div>
      <div class="modal-body">
       	 <c:if test="${snack.snack_id==17 }">
				<span>대전 용문점</span><br>
				<span>서울 홍대점</span><br>
				<span>전북대</span>		
			</c:if>
		
			<c:if test="${snack.snack_id==18 }">
				<span>대전 용문점</span><br>
				<span>서울 종로점</span> 	
			</c:if>
			
			<c:if test="${snack.snack_id==19 }">
				<span>서울 종로점</span>				
				<span>객사점</span>				
			</c:if>      
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div></div>



		
</section>
		<!--/#portfolio-item-->



		<!--/#bottom-->


		<!--/.top-bar-->

 
<br>
<br>
<br>
<br>
<br>
<br>





