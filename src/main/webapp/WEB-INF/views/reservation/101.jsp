<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
	var movieSelect = false;
	var cinemaSelect = false;
	var dateSelect = false;

	function fn_changeCinemaByMovie(movie_id) {
		//영화를 눌렀을때 영화관 목록이 바뀌는 메소드
		
		
		
		
		$('#selectedMovie').val(movie_id);
		$.ajax({
			type : 'post',
			url : '${pageContext.request.contextPath}/reservation/get/cinemaList',
			data : "movie_id="+movie_id,
			dataType :"json",
			success : function(data,status){
				movieSelect = true;
			$('#addr1View').html('');
				if(cinemaSelect==false){
				//영화관이 선택되어 있지 않을 때,
			$('#addr2View').html('');
		}
			for(var i in data){
				console.log(data[i].ci_addr1);
 				$('<li>').html(data[i].ci_addr1).addClass("list-group-item").click(function(){
 					
 					
 				 var addr1 = $(this).html();
 				var movie_id = $('#selectedMovie').val();
 				console.log('movie_id'+movie_id);
 				 fn_loadAddr2(addr1,movie_id);
 				}).appendTo('#addr1View');
 				}
			if(movieSelect == true&&cinemaSelect==true&&dateSelect==true){
				fn_show_info ()
				}
			},error : function(){
				alert("에러!");} 
			} )
		}
	function fn_loadAddr2(addr1, movie_id) {
		console.log(movie_id);	
		$.ajax({ type : 'post',
					url : '${pageContext.request.contextPath}/reservation/get/addr2',
					data : "ci_addr1=" + addr1+"&movie_id="+movie_id,
					dataType : "json",
					success : function(data, status) {
						//기존 데이터 제거 
						$('#addr2View').html('');
						for (var i in data) {
							$('<li>').html(data[i].CI_ADDR2).attr("id",data[i].CI_ID).addClass("list-group-item").on('click',function() {
								
							console.log($(this).attr("id"));
								var cineid = $(this).attr("id"); 
								
								$('#selectedCinema').val(cineid);
								var addr2 = $(this).html();
								cinemaSelect = true;
												$.ajax({type : 'post',
															url : '${pageContext.request.contextPath}/reservation/get/movieName',
															data : "ci_addr1="+ addr1+ "&ci_addr2="+ addr2,
															dataType : "json",
															success : function(data,status) {
																$('#movieView').html('');
																for (k in data) {
																	$('<li>').addClass("list-group-item").attr("id",data[k].MOVIE_ID).html('<img src="${pageContext.request.contextPath}/img/'+data[k].MOVIE_GRADE+'.png" />'
																		+ data[k].MOVIE_KO_NAME).click(function(){
																		var movie_id =$(this).attr("id");
																			fn_changeCinemaByMovie(movie_id);
																		}).appendTo('#movieView')
																		}
																if(movieSelect == true&&cinemaSelect==true&&dateSelect==true){
																	fn_show_info ()
																	}
																},
															error : function() {
																
															}})}).appendTo('#addr2View');}},
															error : function() {
																alert("에러났어요!");}
															})
														
															
																}
	
	function fn_selectedDate(date){
		
		
		
		dateSelect = true;
		console.log(cinemaSelect);
		console.log(movieSelect);
		console.log(dateSelect);
		$('#selectedDate').val(date);
		
		if(movieSelect == true&&cinemaSelect==true&&dateSelect==true){
			fn_show_info();
			}
		
	}
	function fn_show_info (){
		console.log("상영정보 가져오는 함수 실행......");
	var movie_id = $('#selectedMovie').val();
	var ci_id = $('#selectedCinema').val();
	var show_date = $('#selectedDate').val();
		$.ajax({
			type : 'post',
			url : '${pageContext.request.contextPath}/reservation/get/showInfo',
			data : 'movie_id='+movie_id+'&ci_id='+ci_id+'&show_date='+show_date,
			dataType : "json",
			success : function(data, status){
			
			
			
			
			
			
			
			
			
			},
			error : function(){
				alert("에러났어");
			}
		})
	}
	
</script>

<style>
.row.main {
	border: 1px solid black;
}
ul {
	list-style: none;
}
</style>
<div class="slider">
	<div class="container">
		<div align="center" class="col-md-12 main row">
			<div style="height:500px; overflow:scroll;"  align="center" class="col-md-3 list-group">
				<h4>영화</h4>
				<hr />
			<!-- 	<ul class="nav nav-tabs">
					<li id="all" role="presentation" class="active"><a href="#">전체</a></li>
					<li id="2D" role="presentation"><a href="#">2D</a></li>
					<li id="3D" role="presentation"><a href="#">3D</a></li>
				</ul><br/> -->
				<ul id="movieView">
					<c:if test="${not empty movieList}">
						<c:forEach items="${movieList}" var="movie">
							<li id="${movie.movie_id}" class="list-group-item" onclick="fn_changeCinemaByMovie(${movie.movie_id});"><img
								src="${pageContext.request.contextPath}/img/${movie.movie_grade}.png">${movie.movie_ko_name}</li>
						</c:forEach>
					</c:if>

				</ul>

			</div>
			<div style="height:500px; overflow:scroll;"  class="col-md-4 row list-group">
				<h4>영화관</h4>
				<hr />
				<ul class="col-md-5" id="addr1View">
					<c:if test="${not empty addr1List}">
						<c:forEach items="${addr1List}" var="cinema">
							<li class="list-group-item" onclick="fn_loadAddr2('${cinema.ci_addr1}');">${cinema.ci_addr1}</li>
						</c:forEach>
					</c:if>

				</ul>

				<ul class="col-md-5" id="addr2View">

				</ul>
			</div>
			<div style="height:500px; overflow:scroll;"  class="col-md-2">
				<h4>날짜</h4>
				<hr />
				<ul id="dateView">
				<c:forEach items="${dateList}" varStatus="status" var="date">
<!-- 			status.index!=0 &&  -->
				<c:if test="${date.MONTH!=dateList[status.index-1].MONTH}">
				<h3>${date.MONTH}월</h5>
				</c:if>
           <li onclick="fn_selectedDate(${date.USEDAY})"><a>${date.DAY}&nbsp;${date.WEEKDAY}</a></li><br/>

				</c:forEach>
				
				
				
				</ul>
			
			</div>
			<div style="height:500px; overflow:scroll;"  class="col-md-3">
				<h4>상영정보</h4>
			<ul class="col-md-4" id="infoView">
			
			
			
			</ul>
			
			
			
			
			
			
			
					</a>
				</p>
			</div>
		</div>
		
		<br/>
		<br/>
		<br/>
		<br/>
		<input name="selectedMovie" type="text" id="selectedMovie" />
		<input name="selectedCinema" type="text" id="selectedCinema" />
		<input name="selectedDate" type="text" id="selectedDate" />







	</div>



</div>

















