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
            <h5>Big Things... Small Packages</h5>
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
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">커뮤니티 <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">커뮤니티 depth1</a></li>
                            <li><a href="#">커뮤니티 depth2</a></li>
                            
                           
                        </ul>
                     </li>
                     
                     <li><a href="gallery-3col.jsp">스낵관</a></li>
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
        <div class="span12 gallery">

            

            <div class="row clearfix">
                <ul class="gallery-post-grid holder">

                    <!-- Gallery Item 1 -->
                    <li  class="span4 gallery-item" data-id="id-1" data-type="illustration">
                        <span class="gallery-hover-3col hidden-phone hidden-tablet">
                            <span class="gallery-icons">
                                
                                <a href="snack_detail.jsp" class="item-details-link"></a>
                            </span>
                        </span>
                        <a href="gallery-single.jsp"><img src="img/gallery/gallery-img-1-3col.jpg" alt="Gallery"></a>
                        <span class="project-details"><a href="snack_detail.jsp">Custom Illustration</a>For an international add campaign.</span>
                    </li>

                    <!-- Gallery Item 2 -->
                    <li class="span4 gallery-item" data-id="id-2" data-type="illustration">
                        <span class="gallery-hover-3col hidden-phone hidden-tablet">
                            <span class="gallery-icons">
                                
                                <a href="snack_detail.jsp" class="item-details-link"></a>
                            </span>
                        </span>
                        <a href="gallery-single.jsp"><img src="img/gallery/gallery-img-1-3col.jpg" alt="Gallery"></a>
                        <span class="project-details"><a href="snack_detail.jsp">3 Color Poster Design</a>For a regional festival event.</span>
                    </li>

                    <!-- Gallery Item 3 -->
                    <li class="span4 gallery-item" data-id="id-3" data-type="web">
                        <span class="gallery-hover-3col hidden-phone hidden-tablet">
                            <span class="gallery-icons">
                               
                                <a href="snack_detail.jsp" class="item-details-link"></a>
                            </span>
                        </span>
                        <a href="gallery-single.jsp"><img src="img/gallery/gallery-img-1-3col.jpg" alt="Gallery"></a>
                        <span class="project-details"><a href="snack_detail.jsp">Ink Pen Illustration</a>Created for a best selling children's book.</span>
                    </li>

                    <!-- Gallery Item 4 -->
                    <li class="span4 gallery-item" data-id="id-4" data-type="video">
                        <span class="gallery-hover-3col hidden-phone hidden-tablet">
                            <span class="gallery-icons">
                               
                                <a href="snack_detail.jsp" class="item-details-link"></a>
                            </span>
                        </span>
                       <a href="snack_detail.jsp"><img src="img/gallery/gallery-img-1-3col.jpg" alt="Gallery"></a>
                        <span class="project-details"><a href="snack_detail.jsp">Custom Illustration</a>For an international add campaign.</span>
                    </li>

                    <!-- Gallery Item 5 -->
                    <li class="span4 gallery-item" data-id="id-5" data-type="web illustration">
                        <span class="gallery-hover-3col hidden-phone hidden-tablet">
                            <span class="gallery-icons">
                                
                                <a href="snack_detail.jsp" class="item-details-link"></a>
                            </span>
                        </span>
                        <a href="snack_detail.jsp"><img src="img/gallery/gallery-img-1-3col.jpg" alt="Gallery"></a>
                        <span class="project-details"><a href="snack_detail.jsp">Icon Design</a>Classic retro style illustration.</span>
                    </li>

                    <!-- Gallery Item 6 -->
                    <li class="span4 gallery-item" data-id="id-6" data-type="illustration design">
                        <span class="gallery-hover-3col hidden-phone hidden-tablet">
                            <span class="gallery-icons">
                               
                                <a href="snack_detail.jsp" class="item-details-link"></a>
                            </span>
                        </span>
                        <a href="snack_detail.jsp"><img src="img/gallery/gallery-img-1-3col.jpg" alt="Gallery"></a>
                        <span class="project-details"><a href="snack_detail.jsp">Animation Cell</a>Creative storyboard illustration</span>
                    </li>

                    <!-- Gallery Item 7 -->
                    <li class="span4 gallery-item" data-id="id-7" data-type="design">
                        <span class="gallery-hover-3col hidden-phone hidden-tablet">
                            <span class="gallery-icons">
                               
                                <a href="snack_detail.jsp" class="item-details-link"></a>
                            </span>
                        </span>
                        <a href="snack_detail.jsp"><img src="img/gallery/gallery-img-1-3col.jpg" alt="Gallery"></a>
                        <span class="project-details"><a href="snack_detail.jsp">Poster Ad Campaign</a>Regional ad for a local company.</span>
                    </li>

                    <!-- Gallery Item 8 -->
                    <li class="span4 gallery-item" data-id="id-8" data-type="web video">
                        <span class="gallery-hover-3col hidden-phone hidden-tablet">
                            <span class="gallery-icons">
                               
                                <a href="snack_detail.jsp" class="item-details-link"></a>
                            </span>
                        </span>
                        <a href="snack_detail.jsp"><img src="img/gallery/gallery-img-1-3col.jpg" alt="Gallery"></a>
                        <span class="project-details"><a href="snack_detail.jsp">Magazine Ad</a>For an international add campaign.</span>
                    </li>

                    <!-- Gallery Item 9 -->
                    <li class="span4 gallery-item" data-id="id-9" data-type="design">
                        <span class="gallery-hover-3col hidden-phone hidden-tablet">
                            <span class="gallery-icons">
                                
                                <a href="snack_detail.jsp" class="item-details-link"></a>
                            </span>
                        </span>
                        <a href="snack_detail.jsp"><img src="img/gallery/gallery-img-1-3col.jpg" alt="Gallery"></a>
                        <span class="project-details"><a href="snack_detail.jsp">Character Designs</a>For a feature film.</span>
                    </li>

                    <!-- Gallery Item 10 -->
                    <li class="span4 gallery-item" data-id="id-10" data-type="web design">
                        <span class="gallery-hover-3col hidden-phone hidden-tablet">
                            <span class="gallery-icons">
                               
                                <a href="snack_detail.jsp" class="item-details-link"></a>
                            </span>
                        </span>
                        <a href="snack_detail.jsp"><img src="img/gallery/gallery-img-1-3col.jpg" alt="Gallery"></a>
                        <span class="project-details"><a href="snack_detail.jsp">Poster and Ad Design</a>For an international add campaign.</span>
                    </li>

                    <!-- Gallery Item 11 -->
                    <li class="span4 gallery-item" data-id="id-11" data-type="illustration">
                        <span class="gallery-hover-3col hidden-phone hidden-tablet">
                            <span class="gallery-icons">
                               
                                <a href="snack_detail.jsp" class="item-details-link"></a>
                            </span>
                        </span>
                        <a href="snack_detail.jsp"><img src="img/gallery/gallery-img-1-3col.jpg" alt="Gallery"></a>
                        <span class="project-details"><a href="snack_detail.jsp">Website and Animation</a>For a local business.</span>
                    </li>

                    <!-- Gallery Item 12 -->
                    <li class="span4 gallery-item" data-id="id-12" data-type="illustration video">
                        <span class="gallery-hover-3col hidden-phone hidden-tablet">
                            <span class="gallery-icons">
                                
                                <a href="snack_detail.jsp" class="item-details-link"></a>
                            </span>
                        </span>
                        <a href="snack_detail.jsp"><img src="img/gallery/gallery-img-1-3col.jpg" alt="Gallery"></a>
                        <span class="project-details"><a href="snack_detail.jsp">Branding Design</a>For an international add campaign.</span>
                    </li>

                </ul>
            </div>

           

        </div><!-- End gallery list-->

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