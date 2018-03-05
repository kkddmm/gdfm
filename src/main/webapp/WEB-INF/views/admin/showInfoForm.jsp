<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-material-datetimepicker.css?version=1513">
<script src="${pageContext.request.contextPath}/js/moment.min.js"></script>
<script src="${pageContext.request.contextPath}/js/material-min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap-material-datetimepicker.js">
</script>
<script>

//영화목록을 로드하는 함수 
	function fn_loadMovie() {

		$.ajax({
			url : "${pageContext.request.contextPath}/reservation/getMovie",
			method : 'post',
			dataType : 'json',
			success : function(data) {
				var movieList = data.MovieList
				for (i in movieList) {
					$('<option>').attr('value',movieList[i].movie_id).html(movieList[i].movie_ko_name).appendTo('#movieSelect');
				}
			},
			error : function() {
				alert("영화 정보 가져오는중 에러");

			}
		})

	}
	
	//영화관목록을 로드하는 함수
	function fn_loadCinema() {

		$.ajax({
			url : "${pageContext.request.contextPath}/reservation/getCinema",
			method : 'post',
			dataType : 'json',
			success : function(data) {
				var cinemaList = data.CinemaList
				for (i in cinemaList) {  
					$('<option>').attr('value',cinemaList[i].CI_ID).html(cinemaList[i].CI_NAME).appendTo('#cinemaSelect');
				}
			},
			error : function() {  
				alert("영화관 정보 가져오는중 에러");

			}
		})

	}
	
	//선택된 영화관 안의 상영관을 로드하는 함수
	function fn_loadScreen(ci_id){
		$('#screenSelect').html('');
		$.ajax({
			url : "${pageContext.request.contextPath}/reservation/getScreen",
			data : "ci_id="+ci_id,
			method : 'post',
			dataType : 'json',
			success : function(data) {
				var screenList = data.ScreenList
				for (i in screenList) {  
					$('<option>').attr('value',screenList[i].SCREEN_ID).html(screenList[i].SCREEN_NAME).appendTo('#screenSelect');
				}
			},
			error : function() {  
				alert("영화관 정보 가져오는중 에러");
			}
		})
	}
	
	//선택된 영화관의 상영가능차원 (2D,3D,4D...)을 로드하는 함수 
	function fn_loadDimension(movie_id){
		$('#dimensionSelect').html('');
		$.ajax({
			url : "${pageContext.request.contextPath}/reservation/getDimension",
			method : 'post',
			data : "movie_id="+movie_id,
			dataType : 'json',
			success : function(data){
				var dimensionList = data.DimensionList
				for (i in dimensionList) {  
					$('<option>').attr('value',dimensionList[i].DIMENSION_CODE).html(dimensionList[i].DIMENSION_NAME).appendTo('#dimensionSelect');
				} 
			},
			error : function(){
				alert("차원정보 부르는중 에러");
			}
		})
	}
	
	
	function fn_submitInfo(){
		var movie_id = $('#movieSelect').val();
		var ci_id = $('#cinemaSelect').val();
		var screen_id = $('#screenSelect').val();
		var show_date = $('#show_date').val();
		var start_time = $('#start_time').val();
		var end_time = $('#end_time').val();
		var dimension_code = $('#dimensionSelect').val();
		
		if(movie_id==0){
			alert("영화를 선택하세요");
			return false;
		}
		else if(ci_id==0){
			alert("영화관을 선택하세요");
			return false;
		}
		else if(screen_id==0){
			alert("상영관을 선택하세요");
			return false;
		}
		else if(show_date==''){
			alert("상영일을 선택하세요");
			return false;
		}
		else if(start_time==''){
			alert("시작 시간을 선택하세요");
			return false;
		}
	
		else if(end_time==''){
			alert("종료 시간을 선택하세요");
			return false;
		}
		else if(dimensionSelect==0){
			alert("상영 차원을 선택하세요");
			return false;
		}
		else{
			
			$.ajax({
				url: '${pageContext.request.contextPath}/reservation/insertShowInfo',
				method : 'post',
				data : {
					'movie_id' : movie_id,
					'ci_id' : ci_id,
					'screen_id' : screen_id,
					'show_date' : show_date,
					'start_time' : start_time,
					'end_time' : end_time,
					'dimension_code' : dimension_code
				},
			dataType : 'json',
			success : function(data){
				if(data.i==1){
					alert("성공적으로 입력되었습니다.");
					$('#start_time').val('');
					$('#end_time').val('');
				}else{
					alert("입력에 실패하였습니다.");
				}
			},
			error : function(){
				
				
				
			}
			
			
			})
			
			
		}
	/* 	frm.method = 'post';
		frm.action = '${pageContext.request.contextPath}/reservation/insertShowInfo' ;
		frm.submit(); */
		
		
		
	
		
		
		
	};
	$(function() {
		fn_loadMovie();
		fn_loadCinema();
		$('#movieSelect').on('change',function(){
			var movie_id = $('#movieSelect').val();
			fn_loadDimension(movie_id);
		});
		
		
		
		
		$('#cinemaSelect').on('change',function(){
			
			var ci_id = $('#cinemaSelect').val();
			fn_loadScreen(ci_id);
		});
		$('#show_date').bootstrapMaterialDatePicker({format :'YYYY/MM/DD' , weekStart : 0, time: false });  
		$('#start_time').bootstrapMaterialDatePicker({ date: false, format :'HH:mm'});
		$('#end_time').bootstrapMaterialDatePicker({ date: false, format :'HH:mm'});
		
		
	})
</script>
<div class="slider">
		<form id="infoFrm" name="infoFrm">
			<div class="container">

				<h2>상영 정보 입력</h2>
				<table class="table">
					<tbody>
						<tr>
							<th>영화  :</th>
							<td><select  class="form-control" id ="movieSelect" name="movie_id">
								<option value="0">선택하세요</option>
							</select>
							</td>
						</tr>
						<tr>
							<th>상영 차원</th>
								<td><select  class="form-control" id ="dimensionSelect" name="dimension_code">
								<option value="0">영화를 먼저 선택하세요</option>
							</select></td>
						</tr>
						
						
						<tr>
							<th>영화관 :</th>
							<td><select  class="form-control" id ="cinemaSelect" name="ci_id">
								<option value="0">선택하세요</option>
							</select></td>
						</tr>

						<tr>
							<th>상영관 :</th>
								<td><select  class="form-control" id ="screenSelect" name="screen_id">
								<option value="0">영화관을 먼저 선택하세요</option>
							</select></td>
						</tr>

						<tr>
							<th>상영 일자 :</th>
							<td>
							<input type="text" name="show_date" id="show_date" placeholder ="클릭해서 선택" >
							</td>
						</tr>
						<tr>
							<th>시작 시간</th>
							<td>
							<input type="text" name="start_time" id="start_time" placeholder ="클릭해서 선택">
							</td>
						</tr>
						<tr>
							<th>종료 시간</th>
							<td>
							<input type="text" name="end_time" id="end_time" placeholder ="클릭해서 선택">
							</td>
						</tr>
						
						
					</tbody>
				</table>
			</div>


			<p align="right">
				<input style="color: white;" type="button" onclick="fn_submitInfo();" class="btn btn-warning" value="상영정보 등록하기" >
			</p>



		</form>
</div>


























</table>
</div>