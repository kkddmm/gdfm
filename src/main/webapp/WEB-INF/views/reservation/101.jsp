<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="${pageContext.request.contextPath}/js/moment.min.js"></script>
<script type="text/javascript">


$(document).ready(function(){
$('#loading').show();   
	
})

	var movieSelect = false;
	var cinemaSelect = false;
	var dateSelect = false;
	
	
	//나이 구하는 함수(이용가에 따른 선택 불가능을 위함.)
	 function getAgeFromBirthDay(birth_day) {
		var birthday = moment(birth_day).toDate();
		var today = new Date();
		var years = today.getFullYear() - birthday.getFullYear();
		birthday.setFullYear(today.getFullYear());
		if (today < birthday) years--;
		return years;
		}
	 
	 //클래스(선택 스타일) 제어 함수 
	 function fn_classCon(){
		 var selectedMovie = $('#selectedMovie').val();
		 var selectedCinema = $('#selectedCinema').val();
		 var selectedShow = $('#selectedShow').val();
		 var selectedAddr1= $('#selectedAddr1').val();
		  if(selectedMovie!=''){
		 $('#movieView>li').removeClass('active');
		 $('#movieView>#'+selectedMovie).addClass('active');
		  }
		 if(selectedCinema!=''){
		 $('#addr2View>li').removeClass('active');
		 $('#addr2View>li#'+selectedCinema).addClass('active');
	 }
		 if(selectedShow!=''){
		 $('#infoView button').removeClass('active');
		 $('#infoView button#'+selectedShow).addClass('active');
	 }
		 if(selectedAddr1!=''){
			 $('#addr1View>li').removeClass('active'); 
			 $('#addr1View>[data-addr1="'+selectedAddr1+'"]').addClass('active');
		 }
	 }
	function fn_changeCinemaByMovie(movie_id, movie_name, movie_ko_name,movie_grade) {
		$('#loading').show();
		//영화를 눌렀을때 영화관 목록이 바뀌는 메소드
		$('#selectedMovie').val(movie_id);
		$('#selectedMovieGrade').val(movie_grade);
		$("#imgView").children().remove();
		$('<img>').attr("src","${pageContext.request.contextPath}/loadImg/?movie_id="+movie_id).appendTo('#imgView');
		$('#selectMovieName').html(movie_ko_name);

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
 				$('<li>').html(data[i].ci_addr1).attr('data-addr1',data[i].ci_addr1).addClass("list-group-item").click(function(){
 				 var addr1 = $(this).html();
 				var movie_id = $('#selectedMovie').val();
 				 fn_loadAddr2(addr1,movie_id);
 				}).appendTo('#addr1View');
 				}
			fn_classCon(); 
			// 영화,상영관, 날짜가 전부 선택되었을때 상영정보를 출력하는 함수를 실행.
			if(movieSelect == true&&cinemaSelect==true&&dateSelect==true){
				fn_show_info ();
				}
			},
			complete : function(){
				$('#loading').hide();
			},
			error : function(){
				alert("에러!");} 
			
			} )
			
		}
	
	function fn_loadAddr2(addr1, movie_id) {
		$('#loading').show();
		$('#selectedAddr1').val(addr1);
		
		$.ajax({ type : 'post', 
			url : '${pageContext.request.contextPath}/reservation/get/addr2',
					data : "ci_addr1=" + addr1+"&movie_id="+movie_id,
					dataType : "json",
					success : function(data, status) {
						//기존 데이터 제거 
						$('#addr2View').html('');
						for (var i in data) {
							$('<li>').html(data[i].CI_ADDR2).attr("id",data[i].CI_ID).attr("name",data[i].CI_NAME).addClass("list-group-item").on('click',function() {
								$('#loading').show();
								var cineid = $(this).attr("id"); 
								var cineName=$(this).attr("name");
								$('#selectedCinema').val(cineid);
								fn_classCon();
								$('#selectCinemaName').html('영화보기 좋은날&nbsp;'+cineName);
								var addr2 = $(this).html();
								cinemaSelect = true;
							$.ajax({type : 'post',
							url : '${pageContext.request.contextPath}/reservation/get/movieName',
							data : "ci_addr1="+ addr1+ "&ci_addr2="+ addr2,
							dataType : "json",
						success : function(data,status) {
						$('#movieView').html('');
					for (k in data) {
					$('<li>').addClass("list-group-item movieC").attr("id",data[k].MOVIE_ID).attr("name",data[k].MOVIE_NAME)
					.attr("movie_ko_name",data[k].MOVIE_KO_NAME).attr("data-grade",data[k].MOVIE_GRADE).html('<img src="${pageContext.request.contextPath}/img/'+data[k].MOVIE_GRADE+'.png" />'
				   + data[k].MOVIE_KO_NAME).click(function(){
				  $movie = $(this);
					var movie_id =$movie.attr("id");
					var movie_name=$movie.attr("name");
					var movie_ko_name=$movie.attr("movie_ko_name");
					var movie_grade = $movie.attr("data-grade");
						fn_changeCinemaByMovie(movie_id, movie_name, movie_ko_name,movie_grade);
					}).appendTo('#movieView')
					}
			fn_classCon(); 
				if(movieSelect == true&&cinemaSelect==true&&dateSelect==true){
				fn_show_info ();
									}
										},
						complete : function(){
						$('#loading').hide();
								},
						error : function() {
						}})}).appendTo('#addr2View');
						}
						fn_classCon();
					},
					complete : function(){
						$('#loading').hide();
					},
				error : function() {
	          alert("에러났어요!");}
			     })
			fn_classCon();														
	}
	
	function fn_selectedDate(date,year,month,day,weekday){
		$('#dateView button').removeClass('active');
		$('#'+date).addClass('active');
		dateSelect = true;
		$('#selectedDate').val(date);
		$('#selectDateName').html(year+'년&nbsp;'+month+'월&nbsp;'+day+'일&nbsp;'+weekday+'요일');
		if(movieSelect == true&&cinemaSelect==true&&dateSelect==true){
			fn_show_info();
			}
	}
	function fn_show_info (){
		$('#loading').show();
	var movie_id = $('#selectedMovie').val();
	var ci_id = $('#selectedCinema').val();
	var show_date = $('#selectedDate').val();
		$.ajax({
			type : 'post',
			url : '${pageContext.request.contextPath}/reservation/get/showInfo',
			data : 'movie_id='+movie_id+'&ci_id='+ci_id+'&show_date='+show_date,
			dataType : "json",
			success : function(data, status){
				$('#infoView').html('');
if(data[0]!=null){
				$('<h4>').html(data[0].screen_name+'('+data[0].dimension_name+')').appendTo('#infoView');
				for(var j in data){
					if(j!=0&&data[j].screen_name!=data[j-1].screen_name){
						$('<h4>').html('<hr/>'+data[j].screen_name+'('+data[j].dimension_name+')').appendTo('#infoView');
					} 
					if(j!=0&&j%4==0){
						$('<br>').appendTo('#infoView');
						$('<br>').appendTo('#infoView');
					}
					
					$('<span>').html('<button type="button" class="btn btn-outline-primary" id="'+data[j].show_id+'"  onclick="fn_selectShowInfo('+data[j].show_id+',\''+data[j].dimension_name+'\',\''+data[j].start_time+'\',\''+data[j].end_time+'\',\''+data[j].screen_name+'\');" class="btn" > '+data[j].start_time+'</button>&nbsp;'+data[j].sit +'석&nbsp;' )
					.appendTo('#infoView');
				}
				
}	else{
	$('#infoView').html('상영 정보가 없습니다');
}
$('#goSitDiv').html(''); 
			},
			complete : function(){
				$('#loading').hide();
			},
			error : function(){
				alert("에러가 발생했습니다.");
			}
		})
	} 
	
	
	function fn_selectShowInfo(show_id, dimension_name,start_time,end_time,screen_name){
		$('#selectedShow').val(show_id);
		fn_classCon();
		console.log("상영정보 가져오는 함수 실행됨...");
		$('#selectShowView').html(screen_name+'('+dimension_name+')&nbsp;'+start_time+'&nbsp;~&nbsp;'+end_time);
		$('#goSitDiv').html(''); 	
$('<img>').attr('src',"${pageContext.request.contextPath}/img/goSitBtn.png").on('click',function(){
	
	if(${empty LOGIN_USER}){
		 alert("로그인이 필요합니다.");
		 location.href ="${pageContext.request.contextPath}/login/loginForm";
	}
	
	
	//작업중
	else{ 
		//선택한 영화의 등급과 나이 대조 
		if($('#selectedMovieGrade').val()=='rate12'){
		if( getAgeFromBirthDay('${LOGIN_USER.mem_birth}')<12){
			alert("해당 영화는 12세 미만 관람불가입니다.")
			return false;
		}} 
		if($('#selectedMovieGrade').val()=='rate15'){
		if( getAgeFromBirthDay('${LOGIN_USER.mem_birth}')<15){
			alert("해당 영화는 15세 미만 관람불가입니다.")
			return false;
		}}
		if($('#selectedMovieGrade').val()=='rate19'){
		if( getAgeFromBirthDay('${LOGIN_USER.mem_birth}')<19){
			alert("해당 영화는 19세 미만 관람불가입니다.")
			return false;
		}  
		}
	var sel = confirm("선택하신 정보로 예매하시겠습니까?")
	if(sel ==true){
		$.ajax({ 
			method : 'post',
			url : "${pageContext.request.contextPath}/reservation/put/movieReservation",
			data : "show_id="+show_id+"&mem_id=${LOGIN_USER.mem_id}",
			dataType : "json",
			success: function(data, status){
				$('#reservation_id').val(data);
				var frm = document.selectForm;
				frm.method = "post";
				frm.action = "102";
				frm.submit();
			},
			error : function(){
				alert("예약정보 insert 에러")
}})}}
}).appendTo('#goSitDiv');
	}
	$(function(){
		   $('#loading').hide();   
	})
	
</script>
<style>


.btn-outline-primary {
  color: #0275d8;
  background-image: none;
  background-color: transparent;
  border-color: #0275d8;
}

.btn-outline-primary:hover {
  color: #fff;
  background-color: #0275d8;
  border-color: #0275d8;
}

.btn-outline-primary:focus, .btn-outline-primary.focus {
  -webkit-box-shadow: 0 0 0 2px rgba(2, 117, 216, 0.5);
          box-shadow: 0 0 0 2px rgba(2, 117, 216, 0.5);
}

.btn-outline-primary.disabled, .btn-outline-primary:disabled {
  color: #0275d8;
  background-color: transparent;
}

.btn-outline-primary:active, .btn-outline-primary.active,
.show > .btn-outline-primary.dropdown-toggle {
  color: #fff;
  background-color: #0275d8;
  border-color: #0275d8;
}

.btn-outline-secondary {
  color: #ccc;
  background-image: none;
  background-color: transparent;
  border-color: #ccc;
}

.btn-outline-secondary:hover {
  color: #fff;
  background-color: #ccc;
  border-color: #ccc;
}

.btn-outline-secondary:focus, .btn-outline-secondary.focus {
  -webkit-box-shadow: 0 0 0 2px rgba(204, 204, 204, 0.5);
          box-shadow: 0 0 0 2px rgba(204, 204, 204, 0.5);
}

.btn-outline-secondary.disabled, .btn-outline-secondary:disabled {
  color: #ccc;
  background-color: transparent;
}

.btn-outline-secondary:active, .btn-outline-secondary.active,
.show > .btn-outline-secondary.dropdown-toggle {
  color: #fff;
  background-color: #ccc;
  border-color: #ccc;
}

.btn-outline-info {
  color: #5bc0de;
  background-image: none;
  background-color: transparent;
  border-color: #5bc0de;
}

.btn-outline-info:hover {
  color: #fff;
  background-color: #5bc0de;
  border-color: #5bc0de;
}

.btn-outline-info:focus, .btn-outline-info.focus {
  -webkit-box-shadow: 0 0 0 2px rgba(91, 192, 222, 0.5);
          box-shadow: 0 0 0 2px rgba(91, 192, 222, 0.5);
}

.btn-outline-info.disabled, .btn-outline-info:disabled {
  color: #5bc0de;
  background-color: transparent;
}

.btn-outline-info:active, .btn-outline-info.active,
.show > .btn-outline-info.dropdown-toggle {
  color: #fff;
  background-color: #5bc0de;
  border-color: #5bc0de;
}

.btn-outline-success {
  color: #5cb85c;
  background-image: none;
  background-color: transparent;
  border-color: #5cb85c;
}

.btn-outline-success:hover {
  color: #fff;
  background-color: #5cb85c;
  border-color: #5cb85c;
}

.btn-outline-success:focus, .btn-outline-success.focus {
  -webkit-box-shadow: 0 0 0 2px rgba(92, 184, 92, 0.5);
          box-shadow: 0 0 0 2px rgba(92, 184, 92, 0.5);
}

.btn-outline-success.disabled, .btn-outline-success:disabled {
  color: #5cb85c;
  background-color: transparent;
}

.btn-outline-success:active, .btn-outline-success.active,
.show > .btn-outline-success.dropdown-toggle {
  color: #fff;
  background-color: #5cb85c;
  border-color: #5cb85c;
}

.btn-outline-warning {
  color: #f0ad4e;
  background-image: none;
  background-color: transparent;
  border-color: #f0ad4e;
}

.btn-outline-warning:hover {
  color: #fff;
  background-color: #f0ad4e;
  border-color: #f0ad4e;
}

.btn-outline-warning:focus, .btn-outline-warning.focus {
  -webkit-box-shadow: 0 0 0 2px rgba(240, 173, 78, 0.5);
          box-shadow: 0 0 0 2px rgba(240, 173, 78, 0.5);
}

.btn-outline-warning.disabled, .btn-outline-warning:disabled {
  color: #f0ad4e;
  background-color: transparent;
}

.btn-outline-warning:active, .btn-outline-warning.active,
.show > .btn-outline-warning.dropdown-toggle {
  color: #fff;
  background-color: #f0ad4e;
  border-color: #f0ad4e;
}

.btn-outline-danger {
  color: #d9534f;
  background-image: none;
  background-color: transparent;
  border-color: #d9534f;
}

.btn-outline-danger:hover {
  color: #fff;
  background-color: #d9534f;
  border-color: #d9534f;
}

.btn-outline-danger:focus, .btn-outline-danger.focus {
  -webkit-box-shadow: 0 0 0 2px rgba(217, 83, 79, 0.5);
          box-shadow: 0 0 0 2px rgba(217, 83, 79, 0.5);
}

.btn-outline-danger.disabled, .btn-outline-danger:disabled {
  color: #d9534f;
  background-color: transparent;
}

.btn-outline-danger:active, .btn-outline-danger.active,
.show > .btn-outline-danger.dropdown-toggle {
  color: #fff;
  background-color: #d9534f;
  border-color: #d9534f;
}







#loading {
 width: 100%;  
 height: 100%;  
 top: 0px;
 left: 0px;
 position: fixed;  
 display: block;  
 opacity: 0.7;  
 background-color: #fff;  
 z-index: 99;  
 text-align: center; } 
  
#loading-image {  
 position: absolute;  
 top: 50%;  
 left: 50%; 
 z-index: 100; }


hr{
border : 1px solid black;
}

.row.main {
	border: 1px solid black;
}
ul {
	list-style: none;
	padding : 0px;
}
#imgView img{
width : 150px;
height: 150px;
}

#movieView img{
width : 20px;
height : 20px;
}
 
#dateView .btn{
margin-left : 5px; 
} 
#addr1View {
margin-left : 10px;

}

#movieView li:hover{
background-color : cornflowerblue;
cursor : pointer;
}
#addr1View li:hover{
background-color : cornflowerblue;
}
#addr2View li:hover{
background-color : cornflowerblue;
}
#dateView .btn:hover{
background-color : cornflowerblue;
}



</style>

<div id="loading"><img id="loading-image" src="${pageContext.request.contextPath}/img/loading.gif" alt="Loading..." /></div>
<div class="slider">
	<div class="container">
	<a type="button" href="101" class="btn btn-default"><span class="glyphicon glyphicon-repeat"></span>다시예매하기</a>
<!-- style="background-color : antiquewhite;" -->

		<div   align="center" class="col-md-12 main row" >   
			<div style="min-height : 640px; border-right : 1px solid black;" align="center" class="col-md-2 list-group">
				<h4 class="sessionTitle">영화</h4>
				<hr />
				<div align="left">
				<ul style="height:500px; overflow:auto;" id="movieView">
					<c:if test="${not empty movieList}">
						<c:forEach items="${movieList}" var="movie">
							<li id="${movie.movie_id}" class="list-group-item" onclick="fn_changeCinemaByMovie(${movie.movie_id},'${movie.movie_name}','${movie.movie_ko_name}','${movie.movie_grade}');"><img
								src="${pageContext.request.contextPath}/img/${movie.movie_grade}.png">${movie.movie_ko_name}</li>
						</c:forEach>
					</c:if>

				</ul>
				</div>

			</div>
			
			<div style="min-height : 640px; border-right : 1px solid black;" class="col-md-3 row list-group">
				<h4>영화관</h4>
				<hr />
				<ul  style="height:500px; " class="col-md-6" id="addr1View">
				
				 
					<c:if test="${not empty addr1List}">
						<c:forEach items="${addr1List}" var="cinema">
							<li class="list-group-item" data-addr1="${cinema.ci_addr1}" onclick="fn_loadAddr2('${cinema.ci_addr1}');">${cinema.ci_addr1}</li>
						</c:forEach>
					</c:if>
				</ul>
				<ul class="col-md-5" id="addr2View">
				</ul> 
			</div>
			<div style="min-height : 640px; padding :0px;"  class="col-md-1">
				<h4>날짜</h4>
				<hr />
				<div>
				<ul style="overflow : auto;" class="col-md-12" id="dateView">
				<c:forEach items="${dateList}" varStatus="status" var="date">
				<c:if test="${date.MONTH!=dateList[status.index-1].MONTH}">
				<h2>${date.MONTH}월</h5>
				</c:if>
           <button onclick="fn_selectedDate(${date.USEDAY},${date.YEAR},${date.MONTH},${date.DAY},'${date.WEEKDAY}')" id="${date.USEDAY}" type="button" class="btn btn-default list-group-item">${date.WEEKDAY}&nbsp;${date.DAY}</button><br/>
				</c:forEach>
				</ul>
				</div>
			</div>
			<div  style="min-height : 640px; padding :0px; border-left : 1px solid black;"  class="col-md-6"> 
				<h4>상영정보</h4><hr/>
				<div align="left" class="row">
				<div class="col-md-1">
				
			
				</div>
			<ul style="  height:500px; overflow:auto;" class="col-md-11" id="infoView"> 
			<p>예매할 사항을 선택해주세요</p>
			</ul>
			
				</div>
			</div>
		</div> 
		
		<br/>
		<br/>
		<br/>
		<br/>
		
		<div class="col-md-12 row" style="height :200px; background-color : black;">
		<br/>
		<div id="imgView" class = col-md-2>
		</div>
<div class="col-md-2">
<br/>
<br/>
		<h2 id="selectMovieName" style="color: white;"></h2>
</div>		
<div class="col-md-1">
<br/>
<br/>
<h1>
<span class="glyphicon glyphicon-chevron-right"></span>
</h1>
</div>
<div id="selectCinemaView" class="col-md-3">
<h2 id="selectCinemaName" style="color: white;"></h2>
<h2 id="selectDateName" style="color: white;"></h2>
<h2 id="selectShowView" style="color: white;"></h2>
</div>

<div class="col-md-1">
<br/>
<br/>
<h1>
<span class="glyphicon glyphicon-chevron-right"></span>
</h1>
</div>

<div style="background-color : black; " id="goSitDiv" class="col-md-3">
</div>		
		</div>
		<input type="hidden" name="selectedMovie" type="text" id="selectedMovie" />
		<input type="hidden" name="selectedMovieGrade" type="text" id="selectedMovieGrade" /> 
		<input type="hidden" name="selectedAddr1" type="text" id="selectedAddr1" /> 
		<input type="hidden" name="selectedCinema" type="text" id="selectedCinema" />
		<input type="hidden" name="selectedDate" type="text" id="selectedDate" />
		
		
		
		
		 
		<form name ="selectForm">
		<input type="hidden" name="show_id" type="text" id="selectedShow" />
		<input type="hidden" name="reservation_id" type="text" id="reservation_id" />
		
		
		</form>







	</div>



</div>

















