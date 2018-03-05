<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<script>

function fn_delSnackBasket(btn,snack_buy_id,mem_id){
	$btn = $(btn);
	$.ajax({
		type: 'post',
		url : '${pageContext.request.contextPath}/snack/snack_deleteBasket',
		data : "snack_buy_id="+snack_buy_id,  		
		
		success : function(data, status){
			alert("물품을 장바구니에서 삭제했습니다.");
			$btn.closest(".cart").remove();  						
			console.log('스낵아이디'+snack_buy_id);
			
			calTotalPrice ();
			
// 			$('#totalPrice').val()
		},		
		error : function(error){
			console.log(error);
		}
	});	
}





function fn_goPayment(){
	
	var totalPrice= $('#totalPrice').val();
	
	location.href="${pageContext.request.contextPath}/payment/801?basket=Y&first_amount="+totalPrice;
	
	
}


function calTotalPrice (){

	var abcd=0;
	for(var i=0;i<$('.subPrice').length;i++){
	abcd +=  parseInt($('.subPrice').eq(i).val());		
	}
	
  $('#totalPrice').val(abcd);	
	
}







$(function(){
	calTotalPrice ();
});

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
.center{
	line-height:114px;
	width:1140px;
	height:114px;
	font-size: 40px;	
	text-align: left;	
}
.name{
	font-size: 25px;
}

</style>

<section id="portfolio">
		
 
			<div  class="center">
				장바구니
			</div>
			<hr>

			<div class="col-md-12">

				<ul class="nav nav-pills nav-justified pull-right">

				</ul>

			</div>



			<!--/#portfolio-filter-->


<div>
			
			<c:forEach var="basket" items="${basketList}">
			
				<div class="col-md-12 cart">
					<!-- Gallery Item 1 -->
						<div class="row" style="height: 200px; border: 1px solid #bdbdbd; border-color: 3f3f3f;margin: 5px; border-radius: 10px;">														
							<div align="center" style="padding-top: 20px;" class="col-md-3"><img style="border: 1px solid #eeeeee;border-radius: 20px; width: 160px;height:50%;"src="${pageContext.request.contextPath}/img/snack/${basket.snack_name}.jpg" alt="Gallery"></div>	
																	
							<div class="col-md-6" style=" margin-top:9px;">
								<span class="name">제품명:</span><span>${basket.snack_name}</span><br><hr><span class="name">가격:</span> <span> ${basket.snack_price}원</span><br><hr><span class="name">수량:</span> <span>${basket.snack_cnt}개</span>				
							</div>
							
							<div style="height:160px;" class="col-md-3">
								<div style="padding-top: 40px;" align="center"><input class="btn btn-warning" style="height:100px;width:100px;" type="button" id="BtnDelete" onclick="fn_delSnackBasket(this,${basket.snack_buy_id},'${LOGIN_USER.mem_id}');" value="삭제"></div>
								<input type="hidden" class="subPrice" type="text" value="${basket.snack_cnt*basket.snack_price}">
							</div>
						</div>
					<br>																		
				</div>			
			</c:forEach>

			
			
			<c:if test="${empty basketList}">
				<span>장바구니가 비었습니다.</span>
			</c:if>	
			
		<br/>		
	
	
	
		
	
	
	
	
</div>

		
	<c:if test="${basket.snack_buy_id!=''}">
		<div align="center">
			<!-- <span>총 결제금액:</span>  --><input style="margin-right: 10%; margin-bottom: 5%;" type="hidden" id="totalPrice"  type="text">
		</div>
	</c:if>
		 

		<div align="right">			
			<input class ="btn btn-success" type="button"  onclick="fn_goPayment('${LOGIN_USER.mem_id}');"  value="결제하기"/>
			<input  class ="btn btn-default" onclick="location.href='${pageContext.request.contextPath}/snack/snack' " type="button" value="목록으로"/>			
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

