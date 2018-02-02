<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<script>

function fn_delSnackBasket(snack_buy_id){	
	$.ajax({
		type: 'post',
		url : '${pageContext.request.contextPath}/snack/snack_deleteBasket',
		data : "snack_buy_id="+snack_buy_id,   		
		success : function(data, status){
			alert("물품을 장바구니에서 삭제했습니다.");
			alert(data.status);
			alert(data.message);
		},
		error : function(error){
			console.log(error);
		}
	});	
}
</script>


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

.div{
	 display: inline;
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
	<c:if test="${pay_id==null}">
			<c:forEach var="basket" items="${basketList}">
			
				<div class="col-md-12">
					<!-- Gallery Item 1 -->
					
					
					<div class="row" style="height: 400px; border: 10px; border-color: 3f3f3f;">														
						<div class="col-md-4""><img src="${pageContext.request.contextPath}/img/snack/${basket.snack_name}.jpg" alt="Gallery"></div>											
						<div class="col-md-6">
							<span>제품명: ${basket.snack_name}<br>가격: ${basket.snack_price}원<br>수량: ${basket.snack_cnt}개</span>				
						</div>
						<div class="col-md-2">
							<span align="right"><input type="button" id="BtnDelete" onclick="fn_delSnackBasket(${basket.snack_buy_id});" value="삭제"></span>
						</div>
					</div>												
					<br>	
																		
				</div>						
			</c:forEach>
		<br/>		
	</c:if>	
	
	<c:if test="${pay_id!=null}">
		<span>장바구니가 비어있습니다.</span>
	</c:if>	
</div>
		<div>
			
		</div>

		<div align="right">			
			<input class ="btn" type="button" value="결제하기"/>
			<input  class ="btn" onclick="location.href='${pageContext.request.contextPath}/snack/snack' " type="button" value="목록으로"/>			
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




