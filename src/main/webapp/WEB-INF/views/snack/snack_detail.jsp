<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<script>

function fn_insertBasket(snack_id,mem_id){
	
	if('${LOGIN_USER}'==''){
		location.href="${pageContext.request.contextPath}/login/loginForm";	
	}
	var snackCnt = $('#snack_cnt').val(); 
	
	console.log(snackCnt);
	
	$.ajax({
		type: 'post',
		url : '${pageContext.request.contextPath}/snack/snack_insertBasket',
		data : "snack_id="+snack_id+"&mem_id="+mem_id+"&snack_cnt="+snackCnt,		
		success : function(data, status){
			alert("장바구니에 담았습니다.");
			console.log(snack_id);
			console.log(snackCnt);
			console.log(mem_id);
// 			alert(data.status);
// 			alert(data.message);
		},
		error : function(error){
			console.log(error);
		}
	});
}










	$(function(){
		$('.snack-type.${snack.snack_type}').addClass('active');
		

		//장바구니 DB에 저장
		 /* $("#BtnInsertBasket").on("click",  function(){
			
			
			$.ajax({
				type: 'post',
				url : '${pageContext.request.contextPath}/snack/snack_insertBasket',
				data : "snack_id=3&pay_id=3",
				success : function(data, status){
					alert("장바구니에 담았습니다.");
					alert(data.status);
					alert(data.message);
				},
				error : function(error){
					console.log(error);
				}
			});
		}); 
		 */
		
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



</style>

		<section id="portfolio">
		
 
			<div class="center">
				<h2 align="left">스낵메뉴</h2>

			</div>

			<div class="col-md-12">

				<ul class="nav nav-pills nav-justified pull-right">


					<li><a class="btn btn-default snack-type combo"
						href="<c:url value="/snack/snack?snack_type=combo"/>">콤보</a></li>
					<li ><a class="btn btn-default  snack-type popcorn"
						href="<c:url value="/snack/snack?snack_type=popcorn"/>">팝콘</a></li>
					<li><a class="btn btn-default  snack-type drink"
						href="<c:url value="/snack/snack?snack_type=drink"/>">음료</a></li>
					<li><a class="btn btn-default  snack-type snack"
						href="<c:url value="/snack/snack?snack_type=snack"/>">스낵</a></li>

				</ul>

			</div>



			<!--/#portfolio-filter-->


<div>



<%-- div>

<img alt="" src="${pageContext.request.contextPath}/img/snack/${snack.snack_name}.jpg">

</div>
 --%>


	<c:if test="${snack_id !=0}">
		
			<div class="col-md-4">
				<!-- Gallery Item 1 -->
				<div style="height: 400px; border: 10px; border-color: 3f3f3f;">

					<li class="image" align="center">								
		                        
					
							<img src="${pageContext.request.contextPath}/img/snack/${snack.snack_name}.jpg" alt="Gallery">
							
					</li>
					
					
				</div>
			</div>
					
			
					
							<div>
								<span>제품명: ${snack.snack_name}</span><br>
								<span>가격: ${snack.snack_price} 원</span><br> 
								<span>원산지 ${snack.snack_mat}: ${snack.snack_origin}</span><br> 
								 
								<span>상품설명: ${snack.snack_info}</span><br> 
								<span>유효기간: ${snack.snack_exp}</span><br> 
								
								
								<c:choose>
										<c:when test="${snack.snack_id==17||snack.snack_id==18||snack.snack_id==19 }">
											<span class="snackId"><a  href="#"  data-toggle="modal" data-target="#myModal">상품교환(클릭): ${snack.snack_change_info}</a><span><br> 
										</c:when>
										<c:otherwise>
											<span>${snack.snack_change_info}</span><br>										
										</c:otherwise>
								</c:choose>								
								
							</div>
			
			<!--임시 수량   -->
			<!-- <input id="snack_cnt" type="text" value="3" /> -->
					<span>수량:
						<input type="number" min="0" required value="1" name="snack_cnt" id="snack_cnt" style="width:50px;">
					</span>		
			
			
		
		<div>
		<hr>
			${snack.snack_use_info} 
		</div>
		<div>
<%-- 		<c:if test="${not empty LOGIN_USER.mem_id}"> --%>
<%-- 		</c:if> --%>
			<input class="btn" type="button" id="BtnInsertBasket" onclick="fn_insertBasket(${snack.snack_id},'${LOGIN_USER.mem_id}');" name="BtnInsertBasket" value="장바구니"/>
			<input class ="btn" type="button" onclick="fn_snackBuy();" value="구매하기"/>
			<input class ="btn" onclick="location.href='${pageContext.request.contextPath}/snack/snack' " type="button" value="목록으로"/>
		</div>
	</c:if>
	

	<c:if test="${snack_id ==0}">
		<td colspan="5" align="center">제품정보가 존재하지 않습니다.</td>
	</c:if>



</div>
<!-- End gallery list-->


<%-- <div class="modal" id="modal">
     <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h3 id="myModalLabel">이용가능 극장</h3>
     </div>
      <div class="modal-body">
        
	        <c:if test="${snack.snack_id==17 }">
				<li>대전 용문점</li>
				<li>서울 홍대점</li>
				<li>전북대</li>		
			</c:if>
		
			<c:if test="${snack.snack_id==18 }">
				<li>대전 용문점</li>
				<li>서울 종로점</li>			
			</c:if>
			
			<c:if test="${snack.snack_id==19 }">
				<li>객사점</li>
				<li></li>			
			</c:if>      
        
      </div>
</div> --%>



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




