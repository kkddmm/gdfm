<%@page import="kr.co.gdfm.common.util.CookieBox"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
	function fn_login() {
		var frm = document.loginForm;
		
		if(frm.mem_id.vale == ""){
			alert("아이디를 입력하세요.");
			return false;
		}
		
		if(frm.mem_pwd.vale == ""){
			alert("비밀번호를 입력하세요.");
			return false;
		}
		
		frm.action = "login";
		
		frm.submit();
	}
	function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	$(function(){
		$.ajax({
			type: 'post',
			url : '${pageContext.request.contextPath}/main/mainMovieDay',
			dataType: 'json',
			success : function(data, status){
				console.log(data.dailyBoxOfficeList);
	 			for(var i = 0; i < data.dailyBoxOfficeList.length; i++){
	 				var dboList = data.dailyBoxOfficeList[i];
					$('<tr>').html('<td>'+dboList.rank+'</td><td align="left">'+dboList.movieNm+' ('+dboList.rankInten+') ('+dboList.salesShare+'%)</td><td align="right">'+numberWithCommas(dboList.audiAcc)+'명</td>').appendTo('#movieTr');					
				}	
			},
			error : function(){
				console.log(error);
			}
		});
	});
</script>
<div class="slider">
	<div style="margin-left: 150px; margin-right: 150px;">
		<div class="panel-default" style="width: 35%; margin: auto;border: 1px solid #BDBDBD;border-radius: 20px;float: left;">
			
			<div class="panel-body">
				<span><img src="${pageContext.request.contextPath}/img/movielogo.png"/></span>
			</div>
			
			<div class="panel-body">
				<form class="form-horizontal" name="loginForm" method="post">
					<div class="form-group">
						<div class="col-xs-12">
							<input type="text" name="mem_id" value="${empty cookie.REMEMBER_ME ? '' : cookie.USER_ID.value}" class="form-control" placeholder="ID" style="border-radius: 10px;border:1px solid #BDBDBD;">
						</div>
					</div>
					<div class="form-group">
						<div class="col-xs-12">
							<input type="password" name="mem_pwd" value="" class="form-control" placeholder="PASSWORD" onkeypress="if( event.keyCode==13 ){fn_login();}" style="border-radius: 10px;border:1px solid #BDBDBD;">
						</div>
					</div>
					<div class="form-group">
						<div class="col-xs-12" style="text-align:left;">
							<label><input type="checkbox" name="remember_me" value="Y" ${empty cookie.REMEMBER_ME ? '' : 'checked'} > 아이디 저장</label>
						</div>
					</div>
					<div class="form-group">
						<div class="col-xs-12">
							<button class="btn btn-default btn-block" onclick="fn_login();" style="border-radius: 10px;"><b>LOGIN</b></button>
						</div>
					</div>
					<input type="hidden" name="url" value="${url}"/>
				</form>
				
				<hr>
				
				<div align="center">
					<a href="${pageContext.request.contextPath}/member/memberFormId" style="color:#666666;text-decoration: underline;"><b>아이디 찾기</b></a> |
					<a href="${pageContext.request.contextPath}/member/memberFormPwd" style="color:#666666;text-decoration: underline;"><b>비밀번호 찾기</b></a> |
					<a href="${pageContext.request.contextPath}/member/memberAgree" style="color:#666666;text-decoration: underline;"><b>회원가입</b></a>
				</div>
				
			</div>
		</div>
		<div style="float: right;">
	    <table border="0" class="table" id="movieTr">
			<tr style="background-color:#ffffee">
				<th class="col-xs-1 text-center">순위</th>
				<th class="text-center">영화명</th>
				<th class="col-xs-3 text-center">누적관객수</th>
			</tr>
		</table>
	  </div>
	</div>
</div>