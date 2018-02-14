<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">



<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>


$(function(){
	
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
	
})
</script>
<style>
.info{
	width: 60%;
}
.cnt,.price{
	width:20%;
}
td, tr, th{
	border:1px solid black; 
}
.goods{
	width: 33.3%;
}
tr{
	height:50px;
}
</style>




	<section id="portfolio">
	<div class="col-md-12" style="padding-bottom: 20px;">
	
		<div style="padding:10px;" class="divGoods">
			<table class="myTable" style="width:100%;">
				<thead>
					<tr>
						<th class="info">영화정보</th>
						<th class="cnt">자리수</th>
						<th class="price">가격</th>
					</tr>
				</thead>
				
				<tbody>
					<tr>				
			          <td class="info">영화정보 들어갈 곳</td>
			          <td class="cnt">자리수 들어갈 곳</td>
			          <td class="price">가격 들어갈 곳</td>
			        </tr>	        
				</tbody>
			</table><br>
				
				
				
				
			<table class="myTable" style="width:100%;">
				<thead>
					<tr>
						<th class="info">스낵정보</th>
						<th class="cnt">수량</th>
						<th class="price">가격</th>
					</tr>
				</thead>
				
				<tbody>
					<tr>				
			          <td class="info">스낵정보 들어갈 곳</td>
			          <td class="cnt">수량 들어갈 곳</td>
			          <td class="price">가격 들어갈 곳</td>
			        </tr>	        
				</tbody>
			</table><br>
		</div>
		
		<br>
		
		
		<div style="padding:10px;" class="divGoodsInfo">
			<table class="myTable" style="width:100%;">
				<thead>
					<tr>
						<td class="goods">총상품금액</td>
						<td class="goods">포인트 사용</td>
						<td class="goods">최종 결제금액</td>
					</tr>
				</thead>
				
				<tbody>
					<tr>
						<td class="goods">17500원</td>
						<td class="goods">포인트</td>
						<td class="goods">최종 결제하게 될 금액</td>
					</tr>
				</tbody>
			</table>
		</div >
		
		<div style="padding:10px;">
			<table class="myTable" style="width:100%;">
				<tr>
					<td>*포인트
					<input type="text" > <input type="checkbox" > <label>전액사용</label> <td>보유 포인트 <input type="text" > 점</td>
				</tr>		
			</table>
		</div>	
		<div style="padding-top: 10px;" >
			<input class="btn btn-success" style="float: right;" type="button" value="결제하기" onclick="">
		</div>
		
	
	</div>
	
	</section>







