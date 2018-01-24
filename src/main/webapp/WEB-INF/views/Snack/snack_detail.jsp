<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Piccolo Theme</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- CSS
================================================== -->
<link href='http://fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/bootstrap-responsive.css">
<link rel="stylesheet" href="css/prettyPhoto.css" />
<link rel="stylesheet" href="css/custom-styles.css">

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
<script src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/jquery.prettyPhoto.js"></script>
<script src="js/jquery.quicksand.js"></script>
<script src="js/jquery.custom.js"></script>

</head>

<body>
	<div class="color-bar-1"></div>
    <div class="color-bar-2 color-bg"></div>
    
    <div class="container main-container">
    
      <div class="row header"><!-- Begin Header -->
      
        <!-- Logo
        ================================================== -->
        <div class="span5 logo">
        	<a href="index.jsp"><img src="img/piccolo-logo.png" alt="" /></a>
            <h4>영화 그 이상의 감동</h4>
        </div>
        
       <!-- Main Navigation
        ================================================== -->
        <div class="span7 navigation">
            <div class="navbar hidden-phone">
            
                <ul class="nav">
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">예매 <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">예매 depth1</a></li>
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
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">커뮤니티<b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">커뮤니티 depth1</a></li>
                            <li><a href="#">커뮤니티 depth2</a></li>
                            
                           
                        </ul>
                     </li>
                     
                     <li><a href="snack.jsp">스낵관</a></li>
                    </ul>
           
            </div>

            <!-- Mobile Nav
            ================================================== -->
            <form action="#" id="mobile-nav" class="visible-phone">
                <div class="mobile-nav-select">
                <select onchange="window.open(this.options[this.selectedIndex].value,'_top')">
                    
                    <option value="index.jsp">예매</option>
                        <option value="index.jsp">- Full Page</option>
                        <option value="index-gallery.jsp">- Gallery Only</option>
                       
                    <option value="features.jsp">영화</option>
                    <option value="page-full-width.jsp">Pages</option>
                        <option value="page-full-width.jsp">- Full Width</option>
                        <option value="page-right-sidebar.jsp">- Right Sidebar</option>
                        
                    <option value="gallery-4col.jsp">커뮤니티</option>
                        <option value="gallery-3col.jsp">- 3 Column</option>
                        <option value="gallery-4col.jsp">- 4 Column</option>               
                       
                    <option value="blog-style1.jsp">스낵관</option>
                        
                </select>
                </div>
                </form>

        </div>


      </div><!-- End Header -->
     
    <!-- Page Content
    ================================================== --> 
    <div class="row">

        <!-- Gallery Items
        ================================================== --> 
        <div class="span12 gallery-single">

            <div class="row">
                <div class="span6">
                    <img src="img/gallery/gallery-img-1-full.jpg" class="align-left thumbnail" alt="image">
                </div>
                <div class="span6">
                    <h2>Custom Illustration</h2>
                    <p class="lead">For an international ad campaign. Nulla iaculis mattis lorem, quis gravida nunc iaculis ac. Proin tristique tellus in est vulputate luctus</p>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla iaculis mattis lorem, quis gravida nunc iaculis ac. Proin tristique tellus in est vulputate luctus fermentum ipsum molestie. Vivamus tincidunt sem eu magna varius elementum. Maecenas felis tellus, fermentum vitae laoreet vitae, volutpat et urna. Nulla faucibus ligula eget ante varius ac euismod odio placerat. Nam sit amet felis non lorem faucibus rhoncus vitae id dui.</p>

                    <ul class="project-info">
                        <li><h6>Date:</h6> 09/12/15</li>
                        <li><h6>Client:</h6> John Doe, Inc.</li>
                        <li><h6>Services:</h6> Design, Illustration</li>
                        <li><h6>Art Director:</h6> Jane Doe</li>
                        <li><h6>Designer:</h6> Jimmy Doe</li>
                    </ul>

                    <button class="btn btn-inverse pull-left" type="button">장바구니</button>
                    <button class="btn btn-inverse pull-left" type="button">구매하기</button>
                    <a href="snack.jsp" class="pull-right"><i class="icon-arrow-left"></i>스낵메뉴로</a>
                </div>
            </div>

        </div><!-- End gallery-single-->

    </div><!-- End container row -->
    
    </div> <!-- End Container -->

    <!-- Footer Area
        ================================================== -->
        <div class="footer-container"><!-- Begin Footer -->
            <div class="container">
                <div class="row footer-row">
                </div>
    
                <div class="row"><!-- Begin Sub Footer -->
                    <div class="span12 footer-col footer-sub">
                        <div class="row no-margin">
                            <div class="span6"><span class="left">Copyright 2012 Piccolo Theme. All rights reserved.</span></div>
                            <div class="span6">
                                <span class="right">
                                <a href="#">Home</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="#">Features</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="#">Gallery</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="#">Blog</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="#">Contact</a>
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
