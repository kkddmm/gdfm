<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<style type="text/css">
		#movieBorder {
				border-bottom: thick solid red;
			}
		.moive_poster img {width: 186px}
	.devrimcss{
  width: 320px;
  height:30px;
  margin:5px;
  border-radius:5px;
  transition-property: box-shadow;
  transition-duration:0.5s;
  border-bottom: 4px solid #35404f;
  border-top: solid 4px #35404f;
  border-left: solid 4px #35404f;
 border-right: solid 4px #35404f;
     Transition: 500ms;
}
.devrimcssyazi{
  text-align:center;
  color:#fff;
  margin-left: 5px;
  padding-top: 0px;
  font-size : 20px;
  font-family: 'Courgette', cursive;
  text-shadow: 0 0 5px #fff;
  

}
	</style>
<script>

	
	 var sortValue=1;
	
	
	
	
		 function fn_searchBtn() {
			 
			 
			
			 currentCnt = 0;
			 $('#moviePoster').html('');
			 fn_posterMore();
			}
			 
			 
			 
			 
			 
			 
			 
			 
			 
/* 			
				$.ajax({
						type:'post',
						url: '${pageContext.request.contextPath}/movie/',
						data: 
						success : function(data) {
							
							
						},
						error : function (error){
							 alert("fn_searchBtn 버튼  Error!!");
						}
					
					
				})
			
			 */
		 
	
	
	var currentCnt = 0;
	
	//function fn_posterMore(startRow,endRow) {
	//파라미터 없을때만 실행 
	
	function fn_posterMore() {
		currentCnt=currentCnt+1;
		sortValue = $('#order-type').val();;		
		console.log('sortValue='+sortValue);
		
		
		
		$.ajax({
			type:'post',
			url: '${pageContext.request.contextPath}/movie/selectMovieList',
			data:"currentPage="+currentCnt+"&sortValue="+sortValue,
			success : function(data) {
				
				for(var i in data){
					console.log(data[i].movie_name);
					
					$('<div>').addClass('col-md-4').html(
						
							 '<div class="col-md-4">'
							 +'<div class="devrimcss" style="background-color:#f44336"><div class="devrimcssyazi">No.'+data[i].rnum+'</div></div>'
							+ '<div class="hovereffect">'
							+'<div style="height: 450px; border: 1px solid #bdbdbd; border-color: 3f3f3f;margin: 5px; border-radius: 10px;">' 
							
					    +'<div class="moive_poster">'
							+'<a href="${pageContext.request.contextPath}/movie/movie_detail/'+data[i].movie_id+'">'
							+	'<img src="${pageContext.request.contextPath}/uploadMovieImg/movie/'+data[i].movie_id+'" alt="movie_poster">'
							
							+'</a> <br><span style="font-size:14px;font-weight: bold;">'+data[i].movie_name+'</span><br>'
							+'<a href="${pageContext.request.contextPath}/movie/movie_detail/'+data[i].movie_id+'"><button class="btn btn-default" >상세 정보</button></a>'
							+'<a href="${pageContext.request.contextPath}/reservation/101'+data[i].movie_id+'"><button class="btn btn-default" >영화 예매</button></a>'
							//+'<a href="${pageContext.request.contextPath}/reservation/101><button class="btn btn-default">영화 예매</button></a>'
							+'</div> </div> </div> </div>'

							
						).appendTo('#moviePoster');
					}
					
					
				},
				error : function(error){
					alert("moviePosterMore Error!");
				}
			
		});
	}

		
	$( function() {
		fn_posterMore();
// 	$('[name="posterMoreList"]').click();
		});
	
</script>
	  

 <style>

	
	.moive_poster img{
		width: 320px;
		height: 350px;
	}

 


ul, li {
	list-style: none;	
	}
	
	
	
	
					.hovereffect {
							
							float:left;
							overflow:hidden;
							position:relative;
							text-align:center;
							cursor:default;
					}
					
					.hovereffect .overlay {
						
							position:absolute;
							overflow:hidden;
							top:0;
							left:0;
							opacity:0;
							background-color:rgba(0,0,0,0.5);
							-webkit-transition:all .4s ease-in-out;
							transition:all .4s ease-in-out
					}
					
					.hovereffect img {
							display:block;
							position:relative;
							-webkit-transition:all .4s linear;
							transition:all .4s linear;
					}
					
					.hovereffect h2 {
							text-transform:uppercase;
							color:#fff;
							text-align:center;
							position:relative;
							font-size:17px;
							background:rgba(0,0,0,0.6);
							-webkit-transform:translatey(-100px);
							-ms-transform:translatey(-100px);
							transform:translatey(-100px);
							-webkit-transition:all .2s ease-in-out;
							transition:all .2s ease-in-out;
							padding:10px;
					}
					
					.hovereffect a.info {
							text-decoration:none;
							display:inline-block;
							text-transform:uppercase;
							color:#fff;
							border:1px solid #fff;
							background-color:transparent;
							opacity:0;
							filter:alpha(opacity=0);
							-webkit-transition:all .2s ease-in-out;
							transition:all .2s ease-in-out;
							margin:50px 0 0;
							padding:7px 14px;
					}
					
					.hovereffect a.info:hover {
							box-shadow:0 0 5px #fff;
					}
					
					.hovereffect:hover img {
							-ms-transform:scale(1.2);
							-webkit-transform:scale(1.2);
							transform:scale(1.2);
					}
					
					.hovereffect:hover .overlay {
							opacity:1;
							filter:alpha(opacity=100);
					}
					
					.hovereffect:hover h2,.hovereffect:hover a.info {
							opacity:1;
							filter:alpha(opacity=100);
							-ms-transform:translatey(0);
							-webkit-transform:translatey(0);
							transform:translatey(0);
					}
					
					.hovereffect:hover a.info {
							-webkit-transition-delay:.2s;
							transition-delay:.2s;
					}
			
	  
	




</style> 


 

		<section id="portfolio">
		
 			
			<%-- <div class="center">
				<h2 align="right" style="color: BLACK;"><a href="#">무비차트</a>
				<a href="${pageContext.request.contextPath}/movie/movie_preview">상영예정작</a></h2>

			</div> --%>
	
	
			<div class="col-md-12">
					<div style="float:right;">
					<input type="button" name="searchBtn"  value="검색"  class="btn btn btn-warning" onclick="fn_searchBtn();" style="width:60px0">
					
					</div>
				 <div class="col-xs-2" style="float:right;">
			
			
			
					<select id="order-type" name="order-type" class="form-control" >
						<option title="현재 선택됨" selected value="1">최신개봉일순</option>
						<option value="2">평점순 </option>	
						<option value="3">예매순 </option>	
					</select>
					</div>
					<br>
					<br>
					<br>
					<br>
					
					
					
				
			</div>



			<!--/#portfolio-filter-->


<div id="moviePoster">




			
			</div>
		<input type="button" name="posterMoreList"  value="더보기" class="btn btn-primary" onclick="fn_posterMore();" style="width: 100%">
		
		
				<br>
				<br>
				<br>
		
	


	
	



<!-- End gallery list-->







 		
		
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





