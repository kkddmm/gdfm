<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">



<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>

var snack_buy_id_val=0;
var reservation_id_val=0;


function fn_goPayment(){
	
	 if(${!empty resultMap.SNACK_BUY_ID}){			
		snack_buy_id_val='${resultMap.SNACK_BUY_ID}';
	}
	
	 if(${!empty reservation_id}){
		 reservation_id_val='${reservation_id}';
	 }
	 
	IMP.init('imp35163888')
		IMP.request_pay({
		    pg : 'inicis',
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '영화 보기 좋은 날',
		    amount : 1001,
//			    	$('#span_orderPrice').val(),
		    buyer_email : '${LOGIN_USER.mem_email}',
		    buyer_name : '${LOGIN_USER.mem_name}',
		    buyer_tel : '${LOGIN_USER.mem_phone}',
		    buyer_addr : '${LOGIN_USER.mem_addr}',
		    buyer_postcode : '${LOGIN_USER.mem_zipcode}'
		}, function(rsp) {
		    if ( rsp.success ) {
		    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
		    	jQuery.ajax({
		    		url: "${pageContext.request.contextPath}/payment/complete", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
		    		type: 'POST',
		    		dataType: 'json',
		    		data: {
			    		imp_uid : rsp.imp_uid,
			    		usedPoint: $('#span_usePoint').text(),
			    		snack_buy_id: snack_buy_id_val,
	    				reservation_id : reservation_id_val,
			    		mem_id:'${LOGIN_USER.mem_id}',
			    		pay_amount : rsp.paid_amount

			    		//기타 필요한 데이터가 있으면 추가 전달
		    		},success : function(data,status){
		    			console.log(status);
		    			var msg = '결제가 완료되었습니다.';
		    			msg += '\n고유ID : ' + rsp.imp_uid;
		    			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
		    			msg += '\결제 금액 : ' + rsp.paid_amount;
		    			msg += '카드 승인번호 : ' + rsp.apply_num;
		    			//alert(msg);
		    			location.href ="${pageContext.request.contextPath}/payment/802";
		    		},
		    		error : function(){
		    		
		    			
	/* 	    			jQuery.ajax({
		    				url:"https://api.iamport.kr/payments/cancel",
		    				type: 'POST',
		    				dataType: 'json',
		    				data: {
					    		imp_uid : rsp.imp_uid,
					    		merchant_uid : rsp.merchant_uid,
					    		amount : rsp.paid_amount,
					    		reason:'결제 중 에러발생'
//						    	$('#span_orderPrice').val(),
								
					    		//기타 필요한 데이터가 있으면 추가 전달
				    		},
				    		success: function(data){
				    			console.log(data);
				    			
				    		}
		    					
		    			}) */
		    			
		    			
		    			
		    			
		    			
		    			
		    			
		    			
		    			
		    			//[3] 아직 제대로 결제가 되지 않았습니다.
		    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
		    			alert("승인은 처리되었으나 트랜잭션 도중 실패");
		    		}
		    	})
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		        alert(msg);
		    }
		}); 
}






















/* 포인트 적용 */
function fn_pointUse(){
	
	var pointUse= $('.pointUse').val();
	var hasPoint= $('#hasPoint').data('price');
	var totalPrice =$('input[name="totalPrice"]').val(); 
	
	
	if(pointUse>hasPoint){
		alert("보유하신 포인트 이상으로 사용 불가능합니다");
		return false;
	}
	
	
	
	
	
	
	
	
	$('#pointApply > input[name="usePoint"]').val(pointUse);
	$('#pointApply > #span_usePoint').text(pointUse);
	
	var finalPoint= Number(hasPoint)-Number(pointUse);
	
	$('#hasPoint').val(finalPoint); 
	console.log(totalPrice, pointUse);
	
	$('#finalPrice > input[name="orderPrice"]').val(totalPrice - pointUse);
	$('#finalPrice > #span_orderPrice').text(totalPrice - pointUse);
	
}





$(function(){
	
	 var sumPrice=0; 
	 
	 /*총상품금액-포인트 차감한 최종결제금액*/
	if(${pageType!='M'}){
	 $('#snackInfo tbody td.price').each(function(){
		var price= $(this).attr('data-price');
		sumPrice+=Number(price);		
	});
	 
	 
	 	$('#total > input[name="totalPrice"]').val(sumPrice);
		$('#total > #span_totalPrice').text(sumPrice);
		
		$('#finalPrice > input[name="orderPrice"]').val(sumPrice);
		$('#finalPrice > #span_orderPrice').text(sumPrice);
		
	 
	}
	
	 
	// $('#total ').html(sumPrice);
	
		
	

	/* 보유 포인트 전체 사용 */
	$('#allPointUse').click(function(){
		console.log('전체사용 클릭 ')
		var hasPoint= $('#hasPoint').data('price');
		var totalPrice =$('input[name="totalPrice"]').val();	
		var pointUse = 0;
		
		if($(this).prop('checked')){
			// 전액사용 
			pointUse = hasPoint;
		}else{
		   // 전액사용 취소 	
		   pointUse = 0;
		}
	    
		$('.pointUse').val(pointUse);	
		
		$('#pointApply > input[name="usePoint"]').val(pointUse);
		$('#pointApply > #span_usePoint').text(pointUse);
		
		var finalPoint= Number(hasPoint)-Number(pointUse);
		
		$('#hasPoint').val(finalPoint); 
		console.log(totalPrice, pointUse);
		
		$('#finalPrice > input[name="orderPrice"]').val(totalPrice - pointUse);
		$('#finalPrice > #span_orderPrice').text(totalPrice - pointUse);
	    
	    
	});

	
	
		
		
// 	var totalPrice= $('#total').val();
// 	var pointApply = $('#pointApply').val();
// 	var finalPrice=totalPrice-NumberpointApply);
	
// 	 $('#snackInfo tbody td.finalPrice').html(finalPrice);
	
		
	/* 
	IMP.request_pay({
	    pg : 'html5_inicis',
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : '주문명:결제테스트',
	    amount : 14000,
	    buyer_email : 'iamport@siot.do',
	    buyer_name : '구매자이름',
	    buyer_tel : '010-1234-5678',
	    buyer_addr : '서울특별시 강남구 삼성동',
	    buyer_postcode : '123-456'
	}, function(rsp) {
	    if ( rsp.success ) {
	        var msg = '결제가 완료되었습니다.';
	        msg += '고유ID : ' + rsp.imp_uid;
	        msg += '상점 거래ID : ' + rsp.merchant_uid;
	        msg += '결제 금액 : ' + rsp.paid_amount;
	        msg += '카드 승인번호 : ' + rsp.apply_num;
	    } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
	    }

	    alert(msg);
	});
	 */

	 
	 
	 
	 
	
});
</script>

<style>
.info{
	width: 60%;
}
.cnt,.price{
	width:20%;
}

.goods{
	width: 33.3%;
}
tr{
	height:50px;
}
th{
	text-align: center;
	background-color:rgb(255, 255, 102);
}

div .myTable2{
	margin-left: auto; margin-right: auto;
	}
p,.cine{
	text-align: center; 
}
.snck{
	text-align: center;
	}
.myTable2{
	border: 0.5px solid #eeeeee;
	bor
}
.font15{
	font-size: 20px;
}



</style>




	<section id="portfolio">
	<div class="col-md-12" style="padding-bottom: 20px;">
	
		<div style="padding:10px;" class="divGoods">
		
		 <c:if test="${pageType=='M'}">
		
			<table class="myTable" style="width:100%;">
				<thead>
					<tr>
						<th class="info">영화정보</th>
						<th class="cnt">좌석번호</th>
						<th class="price">가격</th>
					</tr>
				</thead>
				
				<tbody>
					<tr id="movie">				
			          <td class="info cine">영화보기 좋은 날&nbsp;${resultMap.CI_NAME}(${resultMap.SCREEN_NAME})&nbsp;
			           ${resultMap.MOVIE_KO_NAME}(${resultMap.DIMENSION_NAME})&nbsp;${resultMap.START_TIME}~${resultMap.END_TIME} </td>
			          <td class="cnt cine"><c:forEach var="sit"  items="${resultMap.sitList}">(${sit})</c:forEach></td>
			          <td class="price cine">${resultMap.first_amount}</td>
			        </tr>	        
				</tbody>
			</table><br>
		</c:if> 
		
		
		
		
		
				
	
	
 	<c:if test ="${pageType!='M'}"> 
	
				
			<table id="snackInfo" class="myTable" style="width:100%;">
			
				<thead>
					<tr>
						<th style="font-size: 20px;" class="info snack">스낵 정보</th>
						<th style="font-size: 20px;" class="cnt snack">수량</th>                                   
						<th style="font-size: 20px;" class="price snack">가격</th>                      
					</tr>
				</thead>
				
				
				<tbody>
				
		<c:if test="${pageType=='S'}">
		
				<!-- 직접구매일때 -->
			<!--스낵정보-->				
					<tr>				
			          <td  class="info snck">${resultMap.SNACK_NAME}
			          <c:if test="${snack.snack_combo_yn=='Y'}">
			         	<span>${resultMap.SNACK_SUBNAME}</span> 
			          </c:if>
			          </td>
			          <td class="cnt snck">${resultMap.SNACK_CNT}</td>
			          <td class="price snck" data-price="${resultMap.SNACK_PRICE}">가격 : ${resultMap.SNACK_PRICE}원</td>
			        </tr>	        
		</c:if>
				
		<c:if test="${pageType=='B'}">
			<!--스낵정보-->				
				<c:forEach items="${snackList}" var="snack">
					<tr>				
			          <td style="font-size: 15px;" class="info snck">${snack.snack_name} 			          
				         <c:if test="${snack.snack_combo_yn=='Y'}">
				          	<span style="font-size: 15px;">${snack.snack_subname}</span>
						  </c:if>	
			         </td>
			        	
			          <td style="font-size: 15px;" class="cnt snck">${snack.snack_cnt}</td>
			          <td style="font-size: 15px;" class="price snck" data-price="${snack.snack_price}">${snack.snack_price}</td>
			        </tr>
			     </c:forEach>
		</c:if>
				</tbody>
			</table><br>
	</c:if> 
			
		</div>
		<br>
		
		<div style="padding:10px;" class="divGoodsInfo">
		
			<table id="money" class="myTable" style="width:100%;">
				<thead>
					<tr>
						<th style="font-size: 20px;" class="goods">총상품금액</th>
						<th style="width:20px;font-size: 20px;" class="goods"></th>
						<th style="font-size: 20px;" class="goods">포인트 사용</th>
						<th style="font-size: 20px;" class="goods">최종 결제금액</th>
					</tr>
				</thead>
				<!-- 구매하기 버튼 눌렀을 때 -->
				<c:if test="${pageType=='S'}">				
				<tbody>					
					<tr>
						<td  id="total" class="goods">
							<input class="font15" type="hidden" name="totalPrice" value="${resultMap.SNACK_PRICE}">
							<p class="font15" style="text-align: center;" id="span_totalPrice" >${resultMap.SNACK_PRICE}</p>
							
						</td>  <!-- 상품가격 -->
						
						<td><img style="width:20px;height:20px;" alt="" src="${pageContext.request.contextPath}/img/snack/minus.png"></td>
						<td id="pointApply" class="goods">
							<input class="font15" type="hidden" name="usePoint" value="0">
							<p class="font15" style="font-size: 15px;" id="span_usePoint">0</p>
						</td><!-- 적용 포인트 -->
						<td id="finalPrice" data-price="${resultMap.SNACK_PRICE}" class="goods">
							<input class="font15" type="hidden" name="orderPrice" value="${resultMap.SNACK_PRICE}">
							<p class="font15" id="span_orderPrice">${resultMap.SNACK_PRICE}</p>
						</td><!-- 최종결제 금액 -->
					</tr>
				</tbody>
				</c:if>
				
				
				
				
				<!-- 장바구니 결제하기 버튼 눌렀을 때 -->
				<c:if test="${pageType=='B'}">
					<tbody>					
						<tr>
						<!-- 총금액 구하기 -->
	<%-- 				<c:set var="sum" value="${0}" ></c:set> --%>
	<%-- 				<c:forEach items="${snackList}" var="snack"> --%>
	<%-- 				<c:set var="sum" value="${sum+snack.snack_price}" ></c:set> --%>
	<%-- 				</c:forEach> --%>
							<td  id="total" class="goods">
								<input class="font15" type="hidden" name="totalPrice" value="" >
								<p class="font15" style="text-align: center;" id="span_totalPrice" ></p>								
							</td>  <!-- 상품가격 -->
							<td><img style="width:20px;height:20px;" alt="" src="${pageContext.request.contextPath}/img/snack/minus.png"></td>
							<td class="font15" id="pointApply" class="goods">
								<input class="font15" type="hidden" name="usePoint" value="0">
								<p class="font15" id="span_usePoint">0</p>
							</td><!-- 적용 포인트 -->
							<td id="finalPrice" data-price="" class="goods">
								<input type="hidden" name="orderPrice" value="">
								<p class="font15" id="span_orderPrice"></p>
							</td><!-- 최종결제 금액 -->
						</tr>
					</tbody>
				</c:if>
<!-- 				영화 -->

 
	<c:if test ="${pageType=='M'}">
				<tbody>					
					<tr>
						<td id="total" class="goods">
							<input type="hidden" name="totalPrice" value="${resultMap.first_amount}">
							<p class="font15" style="text-align: center;" id="span_totalPrice" >${resultMap.first_amount}</p>
							
						</td>  <!-- 상품가격 -->
						<td><img style="width:20px;height:20px;" alt="" src="${pageContext.request.contextPath}/img/snack/minus.png"></td>
						<td id="pointApply" class="goods">
							<input type="hidden" name="usePoint" value="0">
							<p class="font15" id="span_usePoint">0</p>
						</td><!-- 적용 포인트 -->
						<td class="font15" id="finalPrice" data-price="${resultMap.first_amount}" class="goods">
							<input type="hidden" name="orderPrice" value="${resultMap.first_amount}">
							<p class="font15" id="span_orderPrice">${resultMap.first_amount}</p>
						</td><!-- 최종결제 금액 -->
					</tr>
				</tbody>
				</c:if>   
			
				
			</table>
		</div >
		
		<div style="padding:10px;align-content: right;">
			<table class="myTable2" style="width:40%;">
				
				<tr class="pointTb">
					<td ><span style="padding-left: 10px;">*포인트&nbsp&nbsp&nbsp&nbsp&nbsp</span>
						<input class="pointUse" type="text" > <label> <input id="allPointUse"  type="checkbox">전액사용</label> 
						<input onclick="fn_pointUse();" type="button" value="적용"/>
					</td>
					
				</tr>
				<tr class="pointTb"> 
					<td><span style="padding-left: 10px;">보유 포인트</span> <input id="hasPoint" type="text" readonly="readonly" data-price="${memberInfo.mem_point}" value="${memberInfo.mem_point}"> 점</td>
				</tr>	
				
			</table>
		</div>	
		<div style="padding-top: 10px;" >
			<input class="btn btn-success" style="float: right;" type="button" value="결제하기" onclick="fn_goPayment();">
		</div>
		
	
	</div>
	
		
	
	</div>
	
	</section>



