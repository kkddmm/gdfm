<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Good Day For Movie! main page</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- CSS
================================================== -->
<link href='http://fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-responsive.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/prettyPhoto.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/flexslider.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/custom-styles.css">

<!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <link rel="stylesheet" href="css/style-ie.css"/>
<![endif]--> 

<!-- Favicons
================================================== -->
<link rel="shortcut icon" href="img/favicon.ico">
<link rel="apple-touch-icon" href="img/apple-touch-icon.png">
<link rel="apple-touch-icon" sizes="72x72" href="img/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="114x114" href="img/apple-touch-icon-114x114.png">

<!-- JS
================================================== -->
<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.prettyPhoto.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.flexslider.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.custom.js"></script>
<script type="text/javascript">

$(document).ready(function () {

    $("#btn-blog-next").click(function () {
      $('#blogCarousel').carousel('next')
    });
     $("#btn-blog-prev").click(function () {
      $('#blogCarousel').carousel('prev')
    });

     $("#btn-client-next").click(function () {
      $('#clientCarousel').carousel('next')
    });
     $("#btn-client-prev").click(function () {
      $('#clientCarousel').carousel('prev')
    });
    
});

 $(window).load(function(){

    $('.flexslider').flexslider({
        animation: "slide",
        slideshow: true,
        start: function(slider){
          $('body').removeClass('loading');
        }
    });  
});

</script>

</head>

<body class="home">
    <!-- Color Bars (above header)-->
	<div class="color-bar-1"></div>
    <div class="color-bar-2 color-bg"></div>
    
    <div class="container">
    
      <div class="row header"><!-- Begin Header -->
      
        <!-- Logo
        ================================================== -->
        <div class="span5 logo">
        	<a href="index.htm"><img src="img/piccolo-logo.png" alt="" /></a>
            <h4>영화 그 이상의 감동.</h4>
        </div>
        
        <!-- Main Navigation
        ================================================== -->
        <div class="span7 navigation">
            <div class="navbar hidden-phone">
            
                <ul class="nav">
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="reservation/101">예매 <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="reservation/101">빠른예매</a></li>
                            <li><a href="#">예매 depth1</a></li>
                            
                        </ul>
                    </li>
                  
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">영화 <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">영화 depth1</a></li>
                            <li><a href="#">영화 depth2</a></li>
                           
                        </ul>
                    </li>
                     <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">커뮤니티 <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">커뮤니티 depth1</a></li>
                            <li><a href="#">커뮤니티 depth2</a></li>
                            
                           
                        </ul>
                     </li>
                     
                     <li><a href="gallery-3col.htm">스낵관</a></li>
                    </ul>
           
            </div>

            <!-- Mobile Nav
            ================================================== -->
            <form action="#" id="mobile-nav" class="visible-phone">
                <div class="mobile-nav-select">
                <select onchange="window.open(this.options[this.selectedIndex].value,'_top')">
                    
                    <option value="index.htm">예매</option>
                        <option value="index.htm">- Full Page</option>
                        <option value="index-gallery.htm">- Gallery Only</option>
                       
                    <option value="features.htm">영화</option>
                    <option value="page-full-width.htm">Pages</option>
                        <option value="page-full-width.htm">- Full Width</option>
                        <option value="page-right-sidebar.htm">- Right Sidebar</option>
                        
                    <option value="gallery-4col.htm">커뮤니티</option>
                        <option value="gallery-3col.htm">- 3 Column</option>
                        <option value="gallery-4col.htm">- 4 Column</option>               
                       
                    <option value="blog-style1.htm">스낵관</option>
                        
                </select>
                </div>
                </form>

        </div>
        
      </div><!-- End Header -->
     
    <div class="row headline"><!-- Begin Headline -->
    
     	<!-- Slider Carousel
        ================================================== -->
        <div class="span8">
            <div class="flexslider">
              <ul class="slides">
                <li><a href="gallery-single.htm"><img src="img/gallery/slider-img-1.jpg" alt="slider" /></a></li>
                <li><a href="gallery-single.htm"><img src="img/gallery/slider-img-1.jpg" alt="slider" /></a></li>
                <li><a href="gallery-single.htm"><img src="img/gallery/slider-img-1.jpg" alt="slider" /></a></li>
                <li><a href="gallery-single.htm"><img src="img/gallery/slider-img-1.jpg" alt="slider" /></a></li>
                <li><a href="gallery-single.htm"><img src="img/gallery/slider-img-1.jpg" alt="slider" /></a></li>
              </ul>
            </div>
        </div>
        
        <!-- Headline Text
        ================================================== -->
        <div class="span4">
        	<h3>메인 영화소개<br />
            영화 설명 헤드라인</h3>
            <p class="lead">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam pretium vulputate magna sit amet blandit.</p>
            <p>Cras rutrum, massa non blandit convallis, est lacus gravida enim, eu fermentum ligula orci et tortor. In sit amet nisl ac leo pulvinar molestie. Morbi blandit ultricies ultrices.</p>
             
        </div>
    </div><!-- End Headline -->
    
    <div class="row gallery-row"><!-- Begin Gallery Row --> 
      
    	<div class="span12">
            <h5 class="title-bg">Recent Work 
                <small>That we are most proud of</small>
                <button class="btn btn-mini btn-inverse hidden-phone" type="button">View Portfolio</button>
            </h5>
    	
        <!-- Gallery Thumbnails
        ================================================== -->

            <div class="row clearfix no-margin">
            <ul class="gallery-post-grid holder">

                    <!-- Gallery Item 1 -->
                    <li  class="span3 gallery-item" data-id="id-1" data-type="illustration">
                        <span class="gallery-hover-4col hidden-phone hidden-tablet">
                            <span class="gallery-icons">
                                <a href="img/gallery/gallery-img-1-full.jpg" class="item-zoom-link lightbox" title="Custom Illustration" data-rel="prettyPhoto"></a>
                                <a href="gallery-single.htm" class="item-details-link"></a>
                            </span>
                        </span>
                        <a href="gallery-single.htm"><img src="img/gallery/gallery-img-1-4col.jpg" alt="Gallery"></a>
                        <span class="project-details"><a href="gallery-single.htm">Custom Illustration</a>For an international ad campaign.</span>
                    </li>

                    <!-- Gallery Item 2 -->
                    <li class="span3 gallery-item" data-id="id-2" data-type="illustration">
                        <span class="gallery-hover-4col hidden-phone hidden-tablet">
                            <span class="gallery-icons">
                                <a href="img/gallery/gallery-img-1-full.jpg" class="item-zoom-link lightbox" title="Custom Illustration" data-rel="prettyPhoto"></a>
                                <a href="gallery-single.htm" class="item-details-link"></a>
                            </span>
                        </span>
                        <a href="gallery-single.htm"><img src="img/gallery/gallery-img-1-4col.jpg" alt="Gallery"></a>
                        <span class="project-details"><a href="gallery-single.htm">3 Color Poster Design</a>For a regional festival event.</span>
                    </li>

                    <!-- Gallery Item 3 -->
                    <li class="span3 gallery-item" data-id="id-3" data-type="web">
                        <span class="gallery-hover-4col hidden-phone hidden-tablet">
                            <span class="gallery-icons">
                                <a href="img/gallery/gallery-img-1-full.jpg" class="item-zoom-link lightbox" title="Custom Illustration" data-rel="prettyPhoto"></a>
                                <a href="#" class="item-details-link"></a>
                            </span>
                        </span>
                        <a href="gallery-single.htm"><img src="img/gallery/gallery-img-1-4col.jpg" alt="Gallery"></a>
                        <span class="project-details"><a href="gallery-single.htm">Ink Pen Illustration</a>Created for a best selling children's book.</span>
                    </li>

                    <!-- Gallery Item 4 -->
                    <li class="span3 gallery-item" data-id="id-4" data-type="video">
                        <span class="gallery-hover-4col hidden-phone hidden-tablet">
                            <span class="gallery-icons">
                                <a href="img/gallery/gallery-img-1-full.jpg" class="item-zoom-link lightbox" title="Custom Illustration" data-rel="prettyPhoto"></a>
                                <a href="gallery-single.htm" class="item-details-link"></a>
                            </span>
                        </span>
                        <a href="gallery-single.htm"><img src="img/gallery/gallery-img-1-4col.jpg" alt="Gallery"></a>
                        <span class="project-details"><a href="gallery-single.htm">Custom Illustration</a>For an international add campaign.</span>
                    </li>

                    <!-- Gallery Item 5 -->
                    <li class="span3 gallery-item" data-id="id-5" data-type="web illustration">
                        <span class="gallery-hover-4col hidden-phone hidden-tablet">
                            <span class="gallery-icons">
                                <a href="img/gallery/gallery-img-1-full.jpg" class="item-zoom-link lightbox" title="Custom Illustration" data-rel="prettyPhoto"></a>
                                <a href="gallery-single.htm" class="item-details-link"></a>
                            </span>
                        </span>
                        <a href="gallery-single.htm"><img src="img/gallery/gallery-img-1-4col.jpg" alt="Gallery"></a>
                        <span class="project-details"><a href="gallery-single.htm">Icon Design</a>Classic retro style illustration.</span>
                    </li>

                    <!-- Gallery Item 6 -->
                    <li class="span3 gallery-item" data-id="id-6" data-type="illustration design">
                        <span class="gallery-hover-4col hidden-phone hidden-tablet">
                            <span class="gallery-icons">
                                <a href="img/gallery/gallery-img-1-full.jpg" class="item-zoom-link lightbox" title="Custom Illustration" data-rel="prettyPhoto"></a>
                                <a href="gallery-single.htm" class="item-details-link"></a>
                            </span>
                        </span>
                        <a href="gallery-single.htm"><img src="img/gallery/gallery-img-1-4col.jpg" alt="Gallery"></a>
                        <span class="project-details"><a href="gallery-single.htm">Animation Cell</a>Creative storyboard illustration</span>
                    </li>

                    <!-- Gallery Item 7 -->
                    <li class="span3 gallery-item" data-id="id-7" data-type="design">
                        <span class="gallery-hover-4col hidden-phone hidden-tablet">
                            <span class="gallery-icons">
                                <a href="img/gallery/gallery-img-1-full.jpg" class="item-zoom-link lightbox" title="Custom Illustration" data-rel="prettyPhoto"></a>
                                <a href="gallery-single.htm" class="item-details-link"></a>
                            </span>
                        </span>
                        <a href="gallery-single.htm"><img src="img/gallery/gallery-img-1-4col.jpg" alt="Gallery"></a>
                        <span class="project-details"><a href="gallery-single.htm">Poster Ad Campaign</a>Regional ad for a local company.</span>
                    </li>

                    <!-- Gallery Item 8 -->
                    <li class="span3 gallery-item" data-id="id-8" data-type="web video">
                        <span class="gallery-hover-4col hidden-phone hidden-tablet">
                            <span class="gallery-icons">
                                <a href="img/gallery/gallery-img-1-full.jpg" class="item-zoom-link lightbox" title="Custom Illustration" data-rel="prettyPhoto"></a>
                                <a href="gallery-single.htm" class="item-details-link"></a>
                            </span>
                        </span>
                        <a href="gallery-single.htm"><img src="img/gallery/gallery-img-1-4col.jpg" alt="Gallery"></a>
                        <span class="project-details"><a href="gallery-single.htm">Magazine Ad</a>For an international add campaign.</span>
                    </li>

                    <!-- Gallery Item 9 -->
                    <li class="span3 gallery-item" data-id="id-9" data-type="design">
                        <span class="gallery-hover-4col hidden-phone hidden-tablet">
                            <span class="gallery-icons">
                                <a href="img/gallery/gallery-img-1-full.jpg" class="item-zoom-link lightbox" title="Custom Illustration" data-rel="prettyPhoto"></a>
                                <a href="gallery-single.htm" class="item-details-link"></a>
                            </span>
                        </span>
                        <a href="gallery-single.htm"><img src="img/gallery/gallery-img-1-4col.jpg" alt="Gallery"></a>
                        <span class="project-details"><a href="gallery-single.htm">Character Designs</a>For a feature film.</span>
                    </li>

                    <!-- Gallery Item 10 -->
                    <li class="span3 gallery-item" data-id="id-10" data-type="web design">
                        <span class="gallery-hover-4col hidden-phone hidden-tablet">
                            <span class="gallery-icons">
                                <a href="img/gallery/gallery-img-1-full.jpg" class="item-zoom-link lightbox" title="Custom Illustration" data-rel="prettyPhoto"></a>
                                <a href="gallery-single.htm" class="item-details-link"></a>
                            </span>
                        </span>
                        <a href="gallery-single.htm"><img src="img/gallery/gallery-img-1-4col.jpg" alt="Gallery"></a>
                        <span class="project-details"><a href="gallery-single.htm">Poster and Ad Design</a>For an international add campaign.</span>
                    </li>

                    <!-- Gallery Item 11 -->
                    <li class="span3 gallery-item" data-id="id-11" data-type="illustration">
                        <span class="gallery-hover-4col hidden-phone hidden-tablet">
                            <span class="gallery-icons">
                                <a href="img/gallery/gallery-img-1-full.jpg" class="item-zoom-link lightbox" title="Custom Illustration" data-rel="prettyPhoto"></a>
                                <a href="gallery-single.htm" class="item-details-link"></a>
                            </span>
                        </span>
                        <a href="gallery-single.htm"><img src="img/gallery/gallery-img-1-4col.jpg" alt="Gallery"></a>
                        <span class="project-details"><a href="gallery-single.htm">Website and Animation</a>For a local business.</span>
                    </li>

                    <!-- Gallery Item 12 -->
                    <li class="span3 gallery-item" data-id="id-12" data-type="illustration video">
                        <span class="gallery-hover-4col hidden-phone hidden-tablet">
                            <span class="gallery-icons">
                                <a href="img/gallery/gallery-img-1-full.jpg" class="item-zoom-link lightbox" title="Custom Illustration" data-rel="prettyPhoto"></a>
                                <a href="gallery-single.htm" class="item-details-link"></a>
                            </span>
                        </span>
                        <a href="gallery-single.htm"><img src="img/gallery/gallery-img-1-4col.jpg" alt="Gallery"></a>
                        <span class="project-details"><a href="gallery-single.htm">Branding Design</a>For an international add campaign.</span>
                    </li>
                </ul>
                </div>
            </div>
 
    </div><!-- End Gallery Row -->
    
    <div class="row"><!-- Begin Bottom Section -->
    
    	<!-- Blog Preview
        ================================================== -->
    	<div class="span6">

            <h5 class="title-bg">통계
                <small>대상별 인기영화</small>               
            </h5>

        <div id="blogCarousel" class="carousel slide ">

            <!-- Carousel items -->
            <div class="carousel-inner">

                 <!-- Blog Item 1 -->
                <div class="active item">
                   
						   <!--Progress Bars-->
					<h5 class="title-bg">Progress Bars</h5> 
					<h5>연령별</h5>
					<div class="progress progress-info progress-striped">
						<div class="bar" style="width: 20%"></div>
					</div>
					<h5>성별</h5>
					<div class="progress progress-success progress-striped">
						<div class="bar" style="width: 40%"></div>
					</div>
					<h5>지역별</h5>
					<div class="progress progress-warning progress-striped">
						<div class="bar" style="width: 60%"></div>
					</div>
					<h5>장르별</h5>
					<div class="progress progress-danger progress-striped">
						<div class="bar" style="width: 80%"></div>
					</div>
					
				   
				   
                    <div class="post-info clearfix">
                        <h4><a href="blog-single.htm">A subject that is beautiful in itself</a></h4>
                        <ul class="blog-details-preview">
                            <li><i class="icon-calendar"></i><strong>Posted on:</strong> Sept 4, 2015<li>
                            <li><i class="icon-user"></i><strong>Posted by:</strong> <a href="#" title="Link">Admin</a><li>
                            <li><i class="icon-comment"></i><strong>Comments:</strong> <a href="#" title="Link">12</a><li>
                            <li><i class="icon-tags"></i> <a href="#">photoshop</a>, <a href="#">tutorials</a>, <a href="#">illustration</a>
                        </ul>
                    </div>
                    <p class="blog-summary">Lorem ipsum dolor sit amet, consectetur adipiscing elit. In interdum felis fermentum ipsum molestie sed porttitor ligula rutrum. Vestibulum lectus tellus, aliquet et iaculis sed, volutpat vel erat. <a href="#">Read more</a><p>
                </div>

                <!-- Blog Item 2 -->
                 <div class="item">
                    <a href="blog-single.htm"><img src="img/gallery/blog-med-img-1.jpg" alt="" class="align-left blog-thumb-preview" /></a>
                    <div class="post-info clearfix">
                        <h4><a href="blog-single.htm">A great artist is always before his time</a></h4>
                        <ul class="blog-details-preview">
                            <li><i class="icon-calendar"></i><strong>Posted on:</strong> Sept 4, 2015<li>
                            <li><i class="icon-user"></i><strong>Posted by:</strong> <a href="#" title="Link">Admin</a><li>
                            <li><i class="icon-comment"></i><strong>Comments:</strong> <a href="#" title="Link">12</a><li>
                            <li><i class="icon-tags"></i> <a href="#">photoshop</a>, <a href="#">tutorials</a>, <a href="#">illustration</a>
                        </ul>
                    </div>
                    <p class="blog-summary">Lorem ipsum dolor sit amet, consectetur adipiscing elit. In interdum felis fermentum ipsum molestie sed porttitor ligula rutrum. Vestibulum lectus tellus, aliquet et iaculis sed, volutpat vel erat. <a href="#">Read more</a><p>
                </div>

                 <!-- Blog Item 3 -->
                 <div class="item">
                    <a href="blog-single.htm"><img src="img/gallery/blog-med-img-1.jpg" alt="" class="align-left blog-thumb-preview" /></a>
                    <div class="post-info clearfix">
                        <h4><a href="blog-single.htm">Is art everything to anybody?</a></h4>
                        <ul class="blog-details-preview">
                            <li><i class="icon-calendar"></i><strong>Posted on:</strong> Sept 4, 2015<li>
                            <li><i class="icon-user"></i><strong>Posted by:</strong> <a href="#" title="Link">Admin</a><li>
                            <li><i class="icon-comment"></i><strong>Comments:</strong> <a href="#" title="Link">12</a><li>
                            <li><i class="icon-tags"></i> <a href="#">photoshop</a>, <a href="#">tutorials</a>, <a href="#">illustration</a>
                        </ul>
                    </div>
                    <p class="blog-summary">Lorem ipsum dolor sit amet, consectetur adipiscing elit. In interdum felis fermentum ipsum molestie sed porttitor ligula rutrum. Vestibulum lectus tellus, aliquet et iaculis sed, volutpat vel erat. <a href="#">Read more</a><p>
                </div>
                
            </div>
            </div> 	
        </div>
        
        <!-- Client Area
        ================================================== -->
        <div class="span6">

            <h5 class="title-bg">Recent Clients
                <small>That love us</small>
                <button id="btn-client-next" class="btn btn-inverse btn-mini" type="button">&raquo;</button>
                <button id="btn-client-prev" class="btn btn-inverse btn-mini" type="button">&laquo;</button>
            </h5>

            <!-- Client Testimonial Slider-->
            <div id="clientCarousel" class="carousel slide no-margin">
            <!-- Carousel items -->
            <div class="carousel-inner">

                <div class="active item">
                    <p class="quote-text">"Lorem ipsum dolor sit amet, consectetur adipiscing elit. In interdum felis fermentum ipsum molestie sed porttitor ligula rutrum. Morbi blandit ultricies ultrices. Vivamus nec lectus sed orci molestie molestie."<cite>- Client Name, Big Company</cite></p>
                </div>

                <div class="item">
                    <p class="quote-text">"Adipiscing elit. In interdum felis fermentum ipsum molestie sed porttitor ligula rutrum. Morbi blandit ultricies ultrices. Vivamus nec lectus sed orci molestie molestie."<cite>- Another Client Name, Company Name</cite></p>
                </div>

                <div class="item">
                    <p class="quote-text">"Mauris eget tellus sem. Cras sollicitudin sem eu elit aliquam quis condimentum nulla suscipit. Nam sed magna ante. Ut eget suscipit mauris."<cite>- On More Client, The Company</cite></p>
                </div>
                
            </div>
            </div>

            <!-- Client Logo Thumbs-->
            <ul class="client-logos">
                <li><a href="#" class="client-link"><img src="img/gallery/client-img-1.png" alt="Client"></a></li>
                <li><a href="#" class="client-link"><img src="img/gallery/client-img-2.png" alt="Client"></a></li>
                <li><a href="#" class="client-link"><img src="img/gallery/client-img-3.png" alt="Client"></a></li>
                <li><a href="#" class="client-link"><img src="img/gallery/client-img-4.png" alt="Client"></a></li>
                <li><a href="#" class="client-link"><img src="img/gallery/client-img-5.png" alt="Client"></a></li>
            </ul>

        </div>
        
    </div><!-- End Bottom Section -->
    
    </div> <!-- End Container -->

    <!-- Footer Area
        ================================================== -->

	<div class="footer-container"><!-- Begin Footer -->
    	<div class="container">
        	<div class="row footer-row">
                <div class="span3 footer-col">
                    <h5>About Us</h5>
                   <img src="img/piccolo-footer-logo.png" alt="Piccolo" />  
                </div>
				
				<div>
					<address>
                        <strong>Design Team</strong>
                        123 Main St, Suite 500<br />
                        New York, NY 12345<br />
                    </address>
				</div>
				
				<div>
					<ul class="social-icons">                        
                        <li><a href="#" class="social-icon twitter"></a></li>
                        <li><a href="#" class="social-icon dribble"></a></li>
                        <li><a href="#" class="social-icon rss"></a></li>
                        <li><a href="#" class="social-icon forrst"></a></li>
                    </ul>
                </div>
                
            </div>

            <div class="row"><!-- Begin Sub Footer -->
                <div class="span12 footer-col footer-sub">
                    <div class="row no-margin">
                        <div class="span6"><span class="left">Copyright 2012 Piccolo Theme. All rights reserved.</span></div>
                        <div class="span6">
                            <span class="right">
                            <a href="#">Home</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="#">twiter</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="#">Contact</a>
                            </span>
                        </div>
                    </div>
                </div>
            </div><!-- End Sub Footer -->

        </div>
    </div><!-- End Footer --> 
    
    <!-- Scroll to Top -->  
    <div id="toTop" class="hidden-phone hidden-tablet">Back to Top</div>
    
</body>
</html>