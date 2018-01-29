<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	var movieSelect = false;
	var cinemaSelect = false;

	function fn_changeCinemaByMovie(movie_id) {
		$.ajax({
			type : 'post',
			url : '${pageContext.request.contextPath}/reservation/get/cinemaList',
			data : "movie_id="+movie_id,
			dataType :"json",
			success : function(data,status){
			$('#addr1View').html('');
			for(i in data){
 				$('<li>').html(data[i].ci_addr1).addClass("list-group-item").click(function(){
 					fn_loadAddr2(data[i].ci_addr1)
 				}).appendTo('#addr1View');}},error : function(){
				alert("에러!");}})}
	
	
	function fn_loadAddr2(addr1) {
		$.ajax({  type : 'post',
					url : '${pageContext.request.contextPath}/reservation/get/addr2',
					data : "ci_addr1=" + addr1,
					dataType : "json",
					success : function(data, status) {
						//기존 데이터 제거 
						$('#addr2View').html('');
						//
						for (i in data) {
							$('<li>').html(data[i].CI_ADDR2).addClass("list-group-item").on('click',function() {var addr2 = $(this).html();
												$.ajax({type : 'post',
															url : '${pageContext.request.contextPath}/reservation/get/movieName',
															data : "ci_addr1="
																	+ addr1
																	+ "&ci_addr2="
																	+ addr2,
															dataType : "json",
															success : function(
																	data,
																	status) {
																$('#movieView').html('');
																for (k in data) {
																	$('<li>').addClass("list-group-item").html('<img src="${pageContext.request.contextPath}/img/'+data[k].MOVIE_GRADE+'.png" />'
																		+ data[k].MOVIE_KO_NAME).click(function(){
																			fn_changeCinemaByMovie(data[k].MOVIE_ID);
																		}).appendTo('#movieView')
																		}
																},
															error : function() {
																
															}})}).appendTo('#addr2View');}},
															error : function() {
																alert("에러!");}
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
			<div align="left" class="col-md-2 list-group">
				<h4>영화</h4>
				<hr />
				<ul class="nav nav-tabs">
					<li id="all" role="presentation" class="active"><a href="#">전체</a></li>
					<li id="2D" role="presentation"><a href="#">2D</a></li>
					<li id="3D" role="presentation"><a href="#">3D</a></li>
				</ul><br/>
				<ul id="movieView">
					<c:if test="${not empty movieList}">
						<c:forEach items="${movieList}" var="movie">
							<li id="${movie.movie_id}" class="list-group-item" onclick="fn_changeCinemaByMovie(${movie.movie_id});"><img
								src="${pageContext.request.contextPath}/img/${movie.movie_grade}.png">${movie.movie_ko_name}</li>
						</c:forEach>
					</c:if>

				</ul>

			</div>
			<div class="col-md-5 row list-group">
				<h4>영화관</h4>
				<hr />
				<ul class="col-md-4" id="addr1View">
					<c:if test="${not empty addr1List}">
						<c:forEach items="${addr1List}" var="cinema">
							<li class="list-group-item" onclick="fn_loadAddr2('${cinema.ci_addr1}');">${cinema.ci_addr1}</li>
						</c:forEach>
						<%-- 				<li id="${cinema.ci_id}" onclick="fn_changeMovieByCinema(${cinema.ci_id});">${cinema.ci_addr1}</li> --%>
					</c:if>

				</ul>

				<ul class="col-md-5" id="addr2View">

				</ul>
			</div>
			<div class="col-md-1">
				<h4>날짜</h4>
				<hr />
				<ul id="dateView">
				<c:forEach items="${dateList}" var="date">
           <li><a>${date.DAY}&nbsp;${date.WEEKDAY}</a></li>




				
				</c:forEach>
				
				
				
				</ul>
			
			</div>
			<div class="col-md-3">
				<h4>상영정보</h4>
				<hr />
				<p>Donec sed odio dui. Cras justo odio, dapibus ac facilisis in,
					egestas eget quam. Vestibulum id ligula porta felis euismod semper.
					Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum
					nibh, ut fermentum massa justo sit amet risus.</p>
				<p>
					<a class="btn btn-default" href="#" role="button">View details
					</a>
				</p>
			</div>
		</div>
		
		<br/>
		<br/>
		<br/>
		<br/>
		<input class="hidden" id ="selectedMovie" />







	</div>



</div>

















