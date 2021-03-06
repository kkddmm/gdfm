<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko" class="no-js">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>영화 보기 좋은 날 | Codrops</title>
<meta name="description"
	content="An experimental demo where a 3D perspective preview is shown for a selected seat in a cinema room." />
<meta name="keywords"
	content="cinema, seat booking, seating plan, perspective, 3d" />
<meta name="author" content="Codrops" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/normalize.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/demo.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/component.css" />
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.js"></script>
<script src="${pageContext.request.contextPath}/js/modernizr-custom.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
		//예매 인원을 정해줄 변수
		var cnt = 0;
		var selectCnt= 0;
		var cntFlag = false;
		var price = ${reserveMap.DIMENSION_PRICE};
		var selectSitArray = [];
		function fn_goBack(){
			var goCon = confirm("선택한 정보는 저장되지 않습니다. 예매화면으로 돌아갈까요?");
			if(goCon==false){
				return false;
			}
			location.href='101';			
		}

		
		
		
		function showSelectSit(){
		var selectSitView = document.body.querySelector("#selectSitView");
			selectSitView.innerHTML = '';
		for(var i=0; i<selectSitArray.length;i++){
			selectSitView.innerHTML +=  '(' + selectSitArray[i]+ ')';
		}
		}
		function showPrice(){
			$('#amountView').html('');
			$('#amountView').html(price*selectCnt);
			$('[name=first_amount]').val('')
			$('[name=first_amount]').val(price*selectCnt);
			
		}
		
		function fn_goPayment(){
			var payCon = confirm("결제화면으로 이동하시겠습니까?");
			if(!payCon){
				return false;
			}
		$.ajax({
			url : '${pageContext.request.contextPath}/reservation/chkBeforePay' ,
		    method : 'post',
		    data : 'reservation_id=${reservation_id}',
		    dataType :'json',
		    success : function(data){
		    	//예약 가능
		    	if(data.success==1){
		    		if($('#amountView').html()==''||$('#amountView').html()==0){
						alert("좌석을 선택하세요");
						return false;
					}
					var payFrm = document.paymentForm;
					payFrm.method = 'post';
					payFrm.action = '${pageContext.request.contextPath}/payment/801';
					payFrm.submit();
		    	}else{
		    		//불가능
		    		alert("시간이 초과되었습니다.")
		    		location.href = '101';
		    		
		    	}
		    },  
		    error : function(){
		    	alert("체크중 에러 발생");
		    	
		    }
			
			
		})	
			
// 				    			location.href ="${pageContext.request.contextPath}/payment/801?reservation_id=${reservation_id}";
				    	
		}
		
		
		
		$(function(){
			 $('.rows--large .row__seat:nth-of-type('+parseInt((${reserveMap.SCREEN_ROW}/2))+')').css('margin-right','160px');
			$('.rows--mini .row__seat:nth-of-type('+parseInt((${reserveMap.SCREEN_ROW}/2))+')').css('margin-right','15px');
			  
			
		
			
			$('#startSelect').on('click',function(){ 
				if(cntFlag == false){
					return false; 
				}
			})
			<c:forEach var="vo" items="${reservedSit}">
			$('.plan [data-tooltip="${vo.SIT_NUM}"]').addClass('row__seat--reserved').removeClass("tooltip").data("toolTip","");
			</c:forEach>	
			
			$('.cnt').on("click",function(){
				$('.cnt').removeClass('white');
				$(this).addClass('white');
			cnt = $(this).html();
			cntFlag = true;
			})
			$('.plan').on('click','.row__seat--selected',function(){
				 var selectSit = $(this).attr('data-tooltip');
			var sitDelCon = confirm("선택한 좌석의 예약을 취소하시겠습니까?");
			 if(sitDelCon == true){
				 $.ajax({
				method : 'post',
				url : '${pageContext.request.contextPath}/reservation/deleteSit',
				data : 'reservation_id=${reservation_id}&selectSit='+selectSit,
				dataType : 'json',
				success : function(data,status){
					$('[data-tooltip='+selectSit+']').removeClass('row__seat--selected');
					cnt++;
					selectCnt--;
					selectSitArray = $.grep(selectSitArray, function(value){
					   return value!=selectSit;
					})
					 showSelectSit();
					showPrice();
					 },
				error : function(){
				}
				})
			 }
			 else{
				 return false;
			 }
			});
			
		$('.plan').on("click",'.tooltip:not(.row__seat--selected)',function(){ 
			 if(cnt<=0){
				alert("선택한 최대 인원수를 초과하셨습니다.")
			return false;
			}         
			 var selectSit = $(this).attr('data-tooltip');  
						$.ajax({
							method : 'post',
							url : '${pageContext.request.contextPath}/reservation/insertSit',
							data : 'reservation_id=${reservation_id}&selectSit='+selectSit+'&show_id=${reserveMap.SHOW_ID}',
							dataType : 'json',
							success : function(data, status){
								if(data.success!=0){
								$('[data-tooltip="'+selectSit+'"]').addClass('row__seat--selected');
								cnt--;
								selectCnt++; 
								selectSitArray.push(selectSit);
								showSelectSit();
								showPrice();
								}else{
									alert("이미 선택된 좌석입니다");
									$('[data-tooltip="'+selectSit+'"]').removeClass('row__seat--selected');
									console.log($('[data-tooltip="'+selectSit+'"]').html());
									return false;
								}
							},
							error : function(){
							}
						})	
					})
		});
		</script>
	<%-- 	 //조회 전 실행
		console.log('예약 가능 좌석 클릭! 사실은모름..');			
		 var selectSit = $(this).attr('data-tooltip');
			$.ajax({
			method : 'post',
			url : '${pageContext.request.contextPath}/reservation/isreserved',
			data : "selectSit="+selectSit+"&show_id=${reserveMap.SHOW_ID}",
			dataType : 'json',
			success : function(data, status){
				console.log(data); 
				if(data==true){
					alert("이미 선택된 좌석입니다");
					$('[data-tooltip="'+selectSit+'"]').removeClass('row__seat--selected');
					console.log($('[data-tooltip="'+selectSit+'"]').html());
					return false;
				}if(data==false){
					console.log("insert 되는중..");  
 				},
 				error : function(){
 					alert("좌석 예매된건지 조회 할 때 에러 발생함!")
 					}
 				})
		 --%>
		
		
		
<style>
.white {
	background-color: white;
}
</style>
</head>
<body>
	<header class="header">
		<div class="codrops-links">
			<a class="codrops-icon codrops-icon--prev"
				href="http://tympanus.net/Development/LineMenuStyles/"
				title="Previous Demo"><span>Previous Demo</span></a> <a
				class="codrops-icon codrops-icon--drop"
				href="http://tympanus.net/codrops/?p=25885"
				title="Back to the article"><span>Back to the Codrops
					article</span></a>
		</div>
		<h1 class="header__title">Cinema Seat Preview</h1>
		<p class="note note--screen">Please view on a larger screen</p>
		<p class="note note--support">Sorry, but your browser doesn't
			support preserve-3d!</p>
	</header>
	<div class="container">
		<div class="cube">
			<div class="cube__side cube__side--front"></div>
			<div class="cube__side cube__side--back">
				<div class="screen">
					<div class="video">
						<iframe width="100%" height="100%"
							src="${reserveMap.MOVIE_TRAILER}?&amp;autoplay=1&amp;loop=1" frameborder="0"encrypted-media"></iframe>
						<p>Sorry, but your browser does not support this video format.</p>
						<button style="display: none;"
							class="action action--play action--shown" aria-label="Play Video"></button>
					</div>
					<div class="intro intro--shown">
						<div class="intro__side">
							<h2 class="intro__title">
								<span class="intro__up">영화보기 좋은날 ${reserveMap.CI_NAME} </span> <span
									class="intro__down">${reserveMap.MOVIE_KO_NAME}(${reserveMap.DIMENSION_NAME})<span
									class="intro__partial"></span></span>
							</h2>
						</div>
						<div class="intro__side">
							<h2>
								예매할 인원수를 선택하세요

								<button style="border: 1px solid white" class="action cnt">1</button>
								<button style="border: 1px solid white" class="action cnt">2</button>
								<button style="border: 1px solid white" class="action cnt">3</button>
								<button style="border: 1px solid white" class="action cnt">4</button>
								<button style="border: 1px solid white" class="action cnt">5</button>
								<button style="border: 1px solid white" class="action cnt">6</button>
							</h2>
							<button id="startSelect" class="action action--seats">좌석
								선택하기</button>
						</div>
					</div>
				</div>
			</div>
			<div class="cube__side cube__side--left"></div>
			<div class="cube__side cube__side--right"></div>
			<div class="cube__side cube__side--top"></div>
			<div class="rows rows--large">
				<!-- 				자리 시야 전환용 좌석 -->
				<c:set var="start" value="64" />
				<c:forEach var="j" begin="1" end="${reserveMap.SCREEN_COLUMN}">
					<c:set var="num" value="&#${start+j};"></c:set>
					<div class="row">
						<c:forEach var="i" begin="1" end="${reserveMap.SCREEN_ROW}">
							<div data-seat="${num}${i}" class="row__seat"></div>
						</c:forEach>
					</div>
				</c:forEach>
			</div>
			<!-- /rows -->
		</div>
		<!-- /cube -->
	</div>
	<!-- /container -->
	<div class="plan">
		<h3 class="plan__title">자리를 선택하세요</h3>
		<div class="rows rows--mini">

			<c:forEach var="j" begin="1" end="${reserveMap.SCREEN_COLUMN}">
				<c:set var="num" value="&#${start+j};"></c:set>
				<div class="row">
					<c:forEach var="i" begin="1" end="${reserveMap.SCREEN_ROW}">
						<c:set var="resSeat" value="${num}${i}" />
						<div class="row__seat tooltip" data-tooltip="${num}${i}"></div>
					</c:forEach>
				</div>
			</c:forEach>
		</div>
		<!-- /rows -->
		<ul class="legend">
			<li class="legend__item legend__item--free">선택가능</li>
			<li class="legend__item legend__item--reserved">선택불가</li>
			<li class="legend__item legend__item--selected">선택됨</li>
		</ul>
		<h2 style="color: white;">선택한 좌석번호</h2>
		<h3 id="selectSitView" style="color: white;"> 
			</h2>
			<h2 style="color: white;">총 가격</h2>
			<h2  id="amountView" name="amountView" style="color: white;"></h2>
			<form id="paymentForm" name="paymentForm">
			<input type="hidden" name="first_amount"/>
			<input type="hidden" name="reservation_id" value="${reservation_id}"/>
			</form>
	<button onclick="fn_goPayment();" class="action action--buy">결제하기</button>
		<button onclick="fn_goBack();" class="action action--buy">이전
			화면으로</button>
	</div>
	<!-- /plan -->
	<button class="action action--lookaround action--disabled"
		arial-label="Unlook View"></button>
	<script src="${pageContext.request.contextPath}/js/classie.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/main/main.js?version=56475444756841"></script>
</body>
</html>

