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

	<c:if test="${pay_id ==0}">
		
			<div class="col-md-4">
				<!-- Gallery Item 1 -->
				<div style="height: 400px; border: 10px; border-color: 3f3f3f;">

					<li class="image" align="center">
							<img src="${pageContext.request.contextPath}/img/snack/${snack.snack_name}.jpg" alt="Gallery">							
					</li>					
				</div>
			</div>
					
			
					<c:forEach var="basket" items="${basketList}">
							<div>
								<span>제품명: ${basket.snack_name}</span><br>
								<span>가격: ${basket.snack_price} 원</span><br> 
								<span>수량: ${basket.snack_cnt}개</span><br>									
								<span align="right"><input type="button" onclick="fn_delte(${basket.snack_id});" value="삭제"></span>									
							</div>
					</c:forEach>
		
		<div>
			
			<input class ="btn" type="button" value="결제하기"/>
			<input class ="btn" onclick="location.href='${pageContext.request.contextPath}/snack/snack' " type="button" value="목록으로"/>
		</div>
	</c:if>
	
	<c:if test="${pay_id!=0 }">
		<span>장바구니가 비어있습니다.</span>
	</c:if>
	




</div>






		
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





