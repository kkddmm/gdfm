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
</script>
<div class="slider">
<div>
	<div class="panel panel-success" style="width: 400px; margin: auto">
		
		<div class="panel-heading">
			<span style="font-size:24px;"><b>로그인</b></span> <div style="text-align:right;"><a href="${pageContext.request.contextPath}/" style="color:#666666;">Home</a></div>
		</div>
		
		<div class="panel-body">
			<form class="form-horizontal" name="loginForm" method="post">
				<div class="form-group">
					<div class="col-xs-12">
						<input type="text" name="mem_id" value="${empty cookie.REMEMBER_ME ? '' : cookie.USER_ID.value}" class="form-control" placeholder="아이디">
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-12">
						<input type="password" name="mem_pwd" value="" class="form-control" placeholder="비밀번호" onkeypress="if( event.keyCode==13 ){fn_login();}">
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-12">
						<label><input type="checkbox" name="remember_me" value="Y" ${empty cookie.REMEMBER_ME ? '' : 'checked'} >아이디 저장</label>
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-12">
						<input type="button" value="login" class="btn btn-warning btn-block" onclick="fn_login();">
					</div>
				</div>
				<input type="hidden" name="url" value="${url}"/>
			</form>
			
		</div>
	</div>
	<br>
	<br>
</div>
</div>