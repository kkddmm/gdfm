<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<script type="text/javascript">
$(function(){
	$.ajax({
		type: 'post',
		url : '${pageContext.request.contextPath}/main/mainMovieDay',
		dataType: 'json',
		success : function(data, status){
 //			console.log(status);
 //			console.log(data);
//  			console.log(data.dailyBoxOfficeList);
 //			console.log(JSON.stringify(data));
 			for(var i = 0; i < data.dailyBoxOfficeList.length; i++){
 				var dboList = data.dailyBoxOfficeList[i];
				$('<tr>').html('<td>'+dboList.rank+'</td><td align="left">'+dboList.movieNm+' ('+dboList.rankInten+') ('+dboList.salesShare+'%)</td><td align="right">'+dboList.audiAcc+'명</td>').appendTo('#movieTr');					
			}
				
		},
		error : function(){
			console.log(error);
		}
	});
	
	$.ajax({
		type: 'post',
		url : '${pageContext.request.contextPath}/main/mainMovieWeek',
		dataType: 'json',
		success : function(data, status){
//  			console.log(data.weeklyBoxOfficeList);
 			for(var i = 0; i < data.weeklyBoxOfficeList.length; i++){
 				var wboList = data.weeklyBoxOfficeList[i];
				$('<tr>').html('<td>'+wboList.rank+'</td><td align="left">'+wboList.movieNm+' ('+wboList.rankInten+') ('+wboList.salesShare+'%)</td><td align="right">'+wboList.audiAcc+'명</td>').appendTo('#movieweekTr');					
			}
				
		},
		error : function(){
			console.log(error);
		}
	});
	
	
	
});

/* main 화면 로딩시 자동실행 */
$(function(){	
	fn_movieOpenList();	
})
/* main 화면 최신개봉작 */
function fn_movieOpenList(){
		
	$.ajax({
		type: 'post',
		url : '${pageContext.request.contextPath}/main/mainOpenMovieChart',
// 		data : "movie_release_date="+movie_release_date,
		dataType: 'json',
		success : function(data, status){
			console.log(data.openMovieList);
			
 		 var openMovieList=data.openMovieList;			
 		 	$('#mList').empty();
			 for(var i in openMovieList){  				
				
				$('<div>').addClass('col-md-3').html(
					'<img alt="" style="width:230px;height:336px;" src="${pageContext.request.contextPath}/movieposter/'+openMovieList[i].movie_name+'_poster.jpg"><br>'+
       			'<div style="padding-top: 10px;">'+
       				'<button class="btn btn-default">상세정보</button>'+
       				'<button class="btn btn-default" >예매하기</button>'+
       			'</div>'	 				
					).appendTo('#mList');			
				}   
			
			
		},
		error : function(error){
			console.log(error);
		}
	});
}


 
/* main 화면 개봉예정작 */ 
 function fn_moviePreList(){
	
	 $.ajax({
			type: 'post',
			url : '${pageContext.request.contextPath}/main/mainPreMovieChart',
			success : function(data, status){	
				
				var preMovieList=data.preMovieList;
				$('#mList').empty();
				 for(var i in preMovieList){  				
						
						$('<div>').addClass('col-md-3').html(
							'<img alt="" style="width:230px;height:336px;" src="${pageContext.request.contextPath}/movieposter/'+preMovieList[i].movie_name+'_poster.jpg"><br>'+
		       			'<div style="padding-top: 10px;">'+
		       				'<button class="btn btn-default">상세정보</button>'+
		       				'<button class="btn btn-default" >예매하기</button>'+
		       			'</div>'	 				
							).appendTo('#mList');			
						} 
					
			},
			error : function(error){
				console.log(error);
				}
			});	
	
}


 /* main 로그인 여부 영화추천 */

 function fn_reservation(){	 

	 $.ajax({
			type: 'post',
			url : '${pageContext.request.contextPath}/main/recommendMovieChart',
			success : function(data, status){	
				
				var recommendList=data.movieList;
				$('#mList').empty();
				 for(var i in recommendList){						
						$('<div>').addClass('col-md-3').html(
							'<img alt="" style="width:230px;height:336px;" src="${pageContext.request.contextPath}/movieposter/'+recommendList[i].movie_name+'_poster.jpg"><br>'+
		       			'<div style="padding-top: 10px;">'+
		       				'<button class="btn btn-default">상세정보</button>'+
		       				'<button class="btn btn-default">예매하기</button>'+
		       			'</div>'	 				
							).appendTo('#mList');			
						} 
					
			},
			error : function(error){
				console.log(error);
				}
			});	
	
 } 
  
 


jQuery(function($)
		{
		    var ticker = function()
		    {
		        timer = setTimeout(function(){
		            $('#ticker li:first').animate( {marginTop: '-20px'}, 2000, function()
		            {
		                $(this).detach().appendTo('ul#ticker').removeAttr('style');
		            });
		            ticker();
		        }, 2000);         
		      };
		// 0번 이전 기능
		      $(document).on('click','.prev',function(){
		        $('#ticker li:last').hide().prependTo($('#ticker')).slideDown();
		        clearTimeout(timer);
		        ticker();
		        if($('#pause').text() == 'Unpause'){
		          $('#pause').text('Pause');
		        };
		      }); // 0번 기능 끝
		  
		// 1. 클릭하면 다음 요소 보여주기... 클릭할 경우 setTimeout 을 clearTimeout 해줘야 하는데 어떻게 하지..
		      $(document).on('click','.next',function(){
		            $('#ticker li:first').animate( {marginTop: '-20px'}, 2000, function()
		                    {
		                        $(this).detach().appendTo('ul#ticker').removeAttr('style');
		                    });
		            clearTimeout(timer);
		            ticker();
		            //3 함수와 연계 시작
		            if($('#pause').text() == 'Unpause'){
		              $('#pause').text('Pause');
		            }; //3 함수와 연계
		          }); // next 끝. timer 를 전연변수보다 지역변수 사용하는게 나을 것 같은데 방법을 모르겠네요.

		  //2. 재생정지기능 시작, 아직 다음 기능과 연동은 안됨...그래서 3을 만듦
		  var autoplay = true;
		      $(document).on('click','.pause',function(){
		            if(autoplay==true){
		              clearTimeout(timer);
		              $(this).text('재생');
		              autoplay=false;
		            }else{
		              autoplay=true;
		              $(this).text('정지');
		              ticker();
		            }
		          }); // 재생정지기능 끝  
		  // 3. 재생정지 함수 시작. 2와 기능 동일함.
		    var tickerpause = function()
		  {
		    $('#pause').click(function(){
		      $this = $(this);
		      if($this.text() == 'Pause'){
		        $this.text('Unpause');
		        clearTimeout(timer);
		      }
		      else {
		        ticker();
		        $this.text('Pause');
		      }
		    });
		   
		  };
		  tickerpause();
		  //3 재생정지 함수 끝
		  //4 마우스를 올렸을 때 기능 정지
		  var tickerover = function()
		  {
		    $('#ticker').mouseover(function(){
		      clearTimeout(timer);
		    });
		    $('#ticker').mouseout(function(){
		      ticker();
		    });  
		  };
		  tickerover();
		  // 4 끝
		    ticker();
		    
		});
</script>
<style>
dl, dt { margin:0; display:inline; }
li{
	display:inline; 	
}
#con{
	height: 510px;
}
.list{
 	float:left; text-align:center; 
}

.none{display:none}
#ticker{float:left;width:100px;}
.navi{float:right;}
.block {border:0px solid #ffffff; padding:0 5px; height:30px; overflow:hidden; width:400px; font-family:Gulim; font-size:14px;float:left;}
.block ul,
.block li {margin:0; padding:0; list-style:none;}
.block li a {display:block; height:20px; line-height:20px; color:#555; text-decoration:none;}
</style>


<div class="slider">
    <div  >
      <div id="about-slider">
        <div id="carousel-slider" class="carousel slide" data-ride="carousel">
          <!-- Indicators -->
          <ol class="carousel-indicators visible-xs">
            <li data-target="#carousel-slider" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-slider" data-slide-to="1"></li>
            <li data-target="#carousel-slider" data-slide-to="2"></li>
          </ol>

          <div class="carousel-inner">
            <div class="item active">
             <img src="${pageContext.request.contextPath}/img/인터스텔라.jpg" class="img-responsive" alt=""> 
            </div>
            <div class="item">
              <img src="${pageContext.request.contextPath}/img/인터스텔라.jpg" class="img-responsive" alt=""> 
            </div>
            <div class="item">
             <img src="${pageContext.request.contextPath}/img/인터스텔라.jpg" class="img-responsive" alt=""> 
            </div>
          </div>

          <a class="left carousel-control hidden-xs" href="#carousel-slider" data-slide="prev">
						<i class="fa fa-angle-left"></i>
					</a>
          <a class=" right carousel-control hidden-xs" href="#carousel-slider" data-slide="next">
						<i class="fa fa-angle-right"></i>
					</a>
        </div>
        <!--/#carousel-slider-->
      </div>
      <!--/#about-slider-->
      
      
      <section id="feature">
    <div id="con" class="container">
      <div class="center wow fadeInDown">
			<p>
        <div>
        	<div style="padding-bottom: 10px;">
        	
        	
        	<dl>
        		<dt>
        			<input class="btn"  type="button" onclick="fn_movieOpenList();" value="최신개봉작"/>
        		</dt>        		
        	</dl>
        	


			<dl>
        		<dt>
        			<input class="btn"  type="button" onclick="fn_moviePreList();" value="개봉예정"/>
        		</dt>
        		
        	</dl>    
        	
        	
        		<c:if test="${empty sessionScope.LOGIN_USER}">
        		<dl>
        			<dt>
        				<input class="btn" type="button" onclick="fn_reservation();"  value="영화추천"/>
        			</dt> 
        		</dl>
        		</c:if>
        		
        		
        		<c:if test="${not empty sessionScope.LOGIN_USER }">
        		<dl>
        			<dt>
        				<input class="btn" type="button" onclick="fn_reservation();" value="맞춤영화추천"/>
        			</dt> 
        		</dl>
        		</c:if>        
        	
        	</div>
        	
        	
        	
        	<div id="secondMovie">
        		<ul class="list">
        			<li id="mList">
        				
        				
        				</div>
        			</li>
        		</ul>
        		
        			
        	</div>
        	 	
        	
        </div>
      </div>

      <div class="row">
        <div class="features">
         
          
        </div>
        <!--/.services-->
      </div>
      <!--/.row-->
    </div>
    <!--/.container-->
    
    
  </section>
  <!--/#feature-->

  <section id="recent-works">
    <div class="container">
      <!-- <div class="center wow fadeInDown">
      </div> -->

      <div class="row">
        
        
      </div>
      <!--/.row-->
    </div>
    <!--/.container-->
  </section>
  <!--/#recent-works-->

  <section id="middle">
    <div class="container">
      <div class="row">
        <div class="col-sm-6 wow fadeInDown">
          <div class="skill">
            <h2>기사 보여줄 부분</h2>
            

            
          </div>

        </div>
        <!--/.col-sm-6-->

        <div class="col-sm-6 wow fadeInDown">
          <div class="accordion">
            <h2>뭐 들어갈지 아직 미정</h2>
            <div class="panel-group" id="accordion1">
             
            </div>
            <!--/#accordion1-->
          </div>
        </div>

      </div>
      <!--/.row-->
    </div>
    <!--/.container-->
  </section>
  <!--/#middle-->
  
  
  

  <section id="bottom">
    <div class="container wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
      <div class="row">
        <div class="col-md-12">
	        <div class="block">
			    <ul id="ticker">
						<c:if test="${not empty mainList}" >
							<c:forEach var="main" items="${mainList}" begin="0" end="4">
								 <li><a href="${pageContext.request.contextPath}/board/3030102/${main.bo_id}/1">${main.bo_title}</a></li>
							</c:forEach>			
						</c:if>
						<c:if test="${empty mainList}" >
							게시글이 존재하지 않습니다.
						</c:if>
				 </ul>
			</div>
        </div>
        <!--/.col-md-12-->
      </div>
      
    </div>
  </section>
  <!--/#bottom-->
  <div style="border:1px solid #FFFF00;">
	  <div style="float: left;">
		일별박스오피스
	    <table border="0" class="table table-bordered table-striped table-hover text-center" id="movieTr">
			<tr>
				<th class="col-xs-1 text-center">순위</th>
				<th class="text-center">영화명</td>
				<th class="col-xs-2 text-center">누적관객수</th>
			</tr>
		</table>
	  </div>
	  <div style="float: right;">  
		주간/주말박스오피스
	    <table border="0" class="table table-bordered table-striped table-hover text-center" id="movieweekTr">
			<tr>
				<th class="col-xs-1 text-center">순위</th>
				<th class="text-center">영화명</td>
				<th class="col-xs-2 text-center">누적관객수</th>
			</tr>
		</table>  
	  </div>
	</div>   
      
    </div>
  </div>
  
  
  
  
  

  
<script src="${pageContext.request.contextPath}/js/main1.js"></script>