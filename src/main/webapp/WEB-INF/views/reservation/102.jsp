<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*" 
	%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko" class="no-js">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>영화 보기 좋은 날 | Codrops</title>
		<meta name="description" content="An experimental demo where a 3D perspective preview is shown for a selected seat in a cinema room." />
		<meta name="keywords" content="cinema, seat booking, seating plan, perspective, 3d" />
		<meta name="author" content="Codrops" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/normalize.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/demo.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/component.css" />
		<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.js"></script>
		<script src="${pageContext.request.contextPath}/js/modernizr-custom.js"></script>
		<script>
		function fn_goBack(){
			var goCon = confirm("선택한 정보는 저장되지 않습니다. 예매화면으로 돌아갈까요?");
			
			if(goCon==false){
				return false;
			}
			
			location.href='101';			
			
		}
		$(function(){
			console.log("ready~~");
			<c:forEach var="vo" items="${reservedSit}">
			console.log("${vo.SIT_NUM}");
			console.log($('.plan--shown [data-tooltip="${vo.SIT_NUM}"]'));
			$('.plan [data-tooltip="${vo.SIT_NUM}"]').addClass('row__seat--reserved').removeClass("tooltip").data("toolTip","");
			</c:forEach>	
			
			
			
			
			
			
			
			
		});
		</script>
		
	</head>
	<body>
		<header class="header">
			<div class="codrops-links">
				<a class="codrops-icon codrops-icon--prev" href="http://tympanus.net/Development/LineMenuStyles/" title="Previous Demo"><span>Previous Demo</span></a>
				<a class="codrops-icon codrops-icon--drop" href="http://tympanus.net/codrops/?p=25885" title="Back to the article"><span>Back to the Codrops article</span></a>
			</div>
			<h1 class="header__title">Cinema Seat Preview</h1>
			<p class="note note--screen">Please view on a larger screen</p>
			<p class="note note--support">Sorry, but your browser doesn't support preserve-3d!</p>
		</header>
		<div class="container">
			<div class="cube">
				<div class="cube__side cube__side--front"></div>
				<div class="cube__side cube__side--back">
					<div class="screen">
						<div class="video">
						<iframe width="100%" height="100%" src="${reserveMap.MOVIE_TRAILER}" frameborder="0"  encrypted-media"></iframe>
								<p>Sorry, but your browser does not support this video format.</p>
								<button style="display : none;"  class="action action--play action--shown" aria-label="Play Video"></button>
						</div>
						<div class="intro intro--shown">
							<div class="intro__side">
								<h2 class="intro__title">
									<span class="intro__up">영화보기 좋은날 ${reserveMap.CI_NAME} </span>
									<span class="intro__down">${reserveMap.MOVIE_KO_NAME}<span class="intro__partial"></span></span>
								</h2>
							</div>
							<div class="intro__side">
								<button class="action action--seats">자리 선택하기</button>
							</div>
						</div>
					</div>
				</div>
				<div class="cube__side cube__side--left"></div>
				<div class="cube__side cube__side--right"></div>
				<div class="cube__side cube__side--top"></div>
				<div class="rows rows--large">
<!-- 				자리 시야 전환용 좌석 --> 
<c:set var="start" value="64"/>
	    
	   <c:forEach var="j" begin="1" end="${reserveMap.SCREEN_COLUMN}">
	<c:set var="num" value="&#${start+j};"></c:set> 
	    <div class="row"> 
	    <c:forEach  var="i"  begin="1" end="${reserveMap.SCREEN_ROW}"> 
		<div data-seat="${num}${i}" class="row__seat"></div>
	    </c:forEach>
         </div>	    
	   </c:forEach>
				
				</div><!-- /rows -->
			</div><!-- /cube -->
		</div><!-- /container -->
		<div class="plan">
			<h3 class="plan__title">자리를 선택하세요</h3>
			<div class="rows rows--mini">
			
		  <c:forEach var="j" begin="1" end="${reserveMap.SCREEN_COLUMN}">
			<c:set var="num" value="&#${start+j};"></c:set> 
	    	<div class="row"> 
	    	<c:forEach  var="i"  begin="1" end="${reserveMap.SCREEN_ROW}"> 
	            <c:set var="resSeat" value="${num}${i}" />
				<div class="row__seat tooltip" data-tooltip="${num}${i}" ></div>
	    </c:forEach>
         </div>	    
	   </c:forEach>
			</div><!-- /rows -->
			<ul class="legend">
				<li class="legend__item legend__item--free">선택가능</li>
				<li class="legend__item legend__item--reserved">예약됨</li>
				<li class="legend__item legend__item--selected">선택됨</li>
			</ul>
			<button class="action action--buy">결제하기</button>
			<button onclick="fn_goBack();"  class="action action--buy">이전 화면으로</button>
		</div><!-- /plan -->
		<button class="action action--lookaround action--disabled" arial-label="Unlook View"></button>
		<script src="${pageContext.request.contextPath}/js/classie.js"></script>
		<script src="${pageContext.request.contextPath}/js/main/main.js"></script>
		
		
		
	</body>
</html>






