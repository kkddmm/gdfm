<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
$(function(){
	$.ajax({
		type: 'post',
		url : '${pageContext.request.contextPath}/main/mainMovieApi',
		dataType: 'json',
		success : function(data, status){
 //			console.log(status);
 //			console.log(data);
 			console.log(data.dailyBoxOfficeList);
 //			console.log(JSON.stringify(data));
 			for(var i = 0; i < data.dailyBoxOfficeList.length; i++){
 				var dboList = data.dailyBoxOfficeList[i];
				$('<tr>').html('<td>'+dboList.rank+'</td><td>'+dboList.movieNm+'</td><td>'+dboList.audiAcc+'</td>').appendTo('#movieTr');					
			}
				
		},
		error : function(){
			console.log(error);
		}
	});
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
        			<input class="btn" href="#" type="button" value="박스오피스">
        		</dt>        		
        	</dl>
        	
        	
        	
        	<dl>
        		<dt>
        			<input class="btn" href="#" type="button" value="최신개봉작">
        		</dt>        		
        	</dl>
        	


			<dl>
        		<dt>
        			<input class="btn" href="#" type="button" value="개봉예정">
        		</dt>
        		
        	</dl>    
        	
        	
        	
        	<dl>
        		<dt>
        			<input class="btn" href="#" type="button" value="맞춤영화추천">
        		</dt>        		
        	</dl>   
        	</div>
        	
        	
        	
        	<div id="secondMovie">
        		<ul class="list">
        		
        			<li >
        				<div class="col-md-3">
        					
        					<img alt="" style="width:230px;height:336px;" src="${pageContext.request.contextPath}/img/snack/콜라(L).jpg"><br>
        				<div style="padding-top: 10px;">
        					<button class="btn btn-default" >상세정보</button>
        					<button class="btn btn-default" >예매하기</button>
        				</div>
        				</div>
        			</li>
        			
        			
        			
        			<li>
        				<div class="col-md-3">
        					<img alt="" style="width:230px;height:336px;" src="${pageContext.request.contextPath}/img/snack/콜라(L).jpg"><br>
        				<div style="padding-top: 10px;">
        					<button class="btn btn-default" >상세정보</button>
        					<button class="btn btn-default" >예매하기</button>
        				</div>
        				</div>
        			</li>
        			
        			
        			
        			<li>
        				<div class="col-md-3">
        					<img alt="" style="width:230px;height:336px;" src="${pageContext.request.contextPath}/img/snack/콜라(L).jpg"><br>
	        				<div style="padding-top: 10px;">
	        					<button class="btn btn-default" >상세정보</button>
        						<button class="btn btn-default" >예매하기</button>
	        				</div>
        				</div>
        			</li>
        			
        			
        			
        			<li>
        				<div class="col-md-3">
        					<img alt="" style="width:230px;height:336px;" src="${pageContext.request.contextPath}/img/snack/콜라(L).jpg"><br>
        					<div style="padding-top: 10px;">
	        					<button class="btn btn-default" >상세정보</button>
        						<button class="btn btn-default" >예매하기</button>
        					</div>
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
          <h3>공지사항 들어갈 부분</h3>
        </div>
        <!--/.col-md-12-->
      </div>
      
    </div>
  </section>
  <!--/#bottom-->
    <table border="0" class="table table-bordered table-striped table-hover text-center" id="movieTr">
		<tr>
			<th class="col-xs-1 text-center">순위</th>
			<th class="text-center">영화명</td>
			<th class="col-xs-2 text-center">누적관객수</th>
		</tr>
	</table>  
      
      
      
    </div>
  </div>
  
  
  
  
  

  
<script src="${pageContext.request.contextPath}/js/main1.js"></script>