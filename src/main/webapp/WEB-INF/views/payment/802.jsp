<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<script>
function fn_goMyPage(pageType){
	
	if(pageType=='M'){
		location.href="${pageContext.request.contextPath}/mypage/reserveList?mem_id=${LOGIN_USER.mem_id}";		
	}else{		
			location.href="${pageContext.request.contextPath}/mypage/snackBuy?mem_id=${LOGIN_USER.mem_id}";		
	}
}

</script>

<style>
	#divBox{
		
	}
</style>



<section id="portfolio">
	<div class="col-md-3">		
	</div>
	
		<div class="col-md-6">		
			<div class="col-md-12" id="divBox">
				결제가 완료되었습니다
			</div>	
			<div   id="payCheck">
				<input type="button" value="결제내역 확인" onclick="fn_goMyPage('${param.pageType}');">
			</div>		
		</div>
	
	<div  class="col-md-3">		
	</div>
	
	
	
	
	
	
	
</section>






