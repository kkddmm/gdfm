<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<script>
	function fn_comboset(snack_type) {
		location.href = "${pageContext.request.contextPath}/snack/snack?snack_type="
				+ snack_type;
	}
</script>

<style>
ul, li {
	list-style: none;	
}
.image:hover{
	border:1px solid yellow;
}
</style>

 

		<section id="portfolio">
		
 
			<div class="center">
				<h2 align="left">스낵메뉴</h2>

			</div>

			<div class="col-md-12">

				<ul class="nav nav-pills nav-justified pull-right">


					<li class="image"><a class="btn btn-default"
						href="<c:url value="/snack/snack?snack_type=combo"/>">콤보</a></li>
					<li class="image"><a class="btn btn-default"
						href="<c:url value="/snack/snack?snack_type=popcorn"/>">팝콘</a></li>
					<li class="image"><a class="btn btn-default"
						href="<c:url value="/snack/snack?snack_type=drink"/>">음료</a></li>
					<li class="image"><a class="btn btn-default"
						href="<c:url value="/snack/snack?snack_type=snack"/>">스낵</a></li>

					

				</ul>

			</div>



			<!--/#portfolio-filter-->


<div>


	<c:if test="${not empty snackList}">
		<c:forEach var="snack" items="${snackList}">

			<div class="col-md-4">
				<!-- Gallery Item 1 -->
				<div style="height: 400px; border: 10px; border-color: 3f3f3f;">

					<li class="image" align="center">								
		                        
					<a href="${pageContext.request.contextPath}/snack/snack_detail/${snack.snack_id}">
						<img src="${pageContext.request.contextPath}/img/snack/${snack.snack_name}.jpg" alt="Gallery">
					</a> <br> 
					 	<span>${snack.snack_name}</span><br> 
					 <c:choose>
							<c:when test="${snack.snack_combo_yn=='Y'}">
								<span>${snack.snack_subname}</span>
							</c:when>
					</c:choose>

					</li>
				</div>
			</div>
		</c:forEach>

	</c:if>

	<c:if test="${empty snackList}">
		<td colspan="5" align="center">메뉴가 존재하지 않습니다.</td>
	</c:if>



</div>
<!-- End gallery list-->






<div class="row">
				
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





