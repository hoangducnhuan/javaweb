<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : info
    Created on : Mar 22, 2015, 10:16:46 AM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!DOCTYPE HTML>
<html>
<head>
<title>The Love & Fight Website Template | Home :: w3layouts</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Alegreya+SC:400,700' rel='stylesheet' type='text/css'>
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!--  jquery plguin -->
<script type="text/javascript" src="js/jquery.min.js"></script>
<!--start manu -->
<link href="css/flexy-menu.css" rel="stylesheet">
<script type="text/javascript" src="js/flexy-menu.js"></script>
<script type="text/javascript">$(document).ready(function(){$(".flexy-menu").flexymenu({speed: 400,type: "horizontal",align: "right"});});</script>
<!--start slider -->
	<script src="js/responsiveslides.min.js"></script>
	  <script>
	    // You can also use "$(window).load(function() {"
		    $(function () {
			      // Slideshow 1
			      $("#slider1").responsiveSlides({
			        maxwidth: 1600,
			        speed: 600
			      });
			});
	  </script>
</head>
<body>
<!-- start sb-search -->
<div id="sb-search" class="sb-search">
	<form>
		<input class="sb-search-input" placeholder="Enter your search term..." type="text" value="" name="search" id="search">
		<input class="sb-search-submit" type="submit" value="">
		<span class="sb-icon-search"></span>
	</form>
</div>
<script src="js/classie.js"></script>
<script src="js/uisearch.js"></script>
<script>
		new UISearch( document.getElementById( 'sb-search' ) );
</script>
<!-- start header -->

<div class="header">
<div class="wrap">
	<div class="logo">
		<a href="index.html"><img src="images/logo.jpg" alt="" /></a>
	</div>
	<div class="h_right">
				<h4>customer support 24/7: <span>+44 123 456 7891</span></h4>
		<!-- start nav-->
			<ul class="flexy-menu thick orange">
			<li class="active">
				<a  href="index.html">
					 <span class="color">Home</span>	
					 <i class="icon3"></i>
				</a>
			</li>
			<li>
				<a href="pages.html">
					 <span>Pages</span>	
					 <i class="icon2"></i>
				</a>
				<ul>
					<li><a href="index.html">Lorem Ipsum</a></li>
					<li><a href="service.html">services</a>
						<ul>
							<li><a href="portfolio.html">Lorem Ipsum</a></li>
							<li><a href="blog.html">news</a>
								<ul>
									<li><a href="blog.html">Lorem Ipsum</a></li>
									<li><a href="blog.html">Lorem Ipsum</a></li>
									<li><a href="blog.html">Lorem Ipsum</a></li>
								</ul>
							</li>
							<li><a href="portfolio.html">portfolio</a></li>
						</ul>
					</li>
					<li><a href="blog.html">news</a></li>
					<li><a href="portfolio.html">portfolio</a></li>
				</ul>
			</li>
			<li>
				<a href="portfolio.html">
					 <span>Portfolio</span>	
					 <i class="icon2"></i>
				</a>
				<ul>
				<li><a href="portfolio.html">Portfolio 01</a></li>
				<li><a href="portfolio.html">Portfolio 02</a></li>
				<li><a href="portfolio.html">Portfolio 03</a>
					<ul>
						<li><a href="portfolio.html">Portfolio</a>
							<ul>
								<li><a href="portfolio.html">Portfolio 01</a></li>
								<li><a href="portfolio.html">Portfolio 02</a></li>
								<li><a href="portfolio.html">Portfolio 03</a></li>
								<li><a href="portfolio.html">Portfolio 04</a></li>
							</ul>
						</li>
						<li><a href="portfolio.html">portfolio</a></li>
					</ul>
				</li>
				<li><a href="portfolio.html">Portfolio 04</a></li>
			</ul>
			</li>
			<li>
				<a href="blog.html">
					 <span>Blog</span>	
					 <i class="icon3"></i>
				</a>
				
			</li>
			<li class="last">
				<a href="contact.html">
					 <span>Contact</span>	
					 <i class="icon3"></i>
				</a>
			</li>
		</ul>
	</div>
	<div class="clear"></div>
</div>
</div>
<!-- start slider -->
<div class="slider">
		<div class="image-slider">
			<!-- Slideshow 1 -->
			<ul class="rslides" id="slider1">
				<li><img src="images/slider1.jpg" alt=""></li>
				<li><img src="images/slider2.jpg" alt=""></li>
				<li><img src="images/slider3.jpg" alt=""></li>
			</ul>
		<!-- Slideshow 2 -->
		</div>
</div>
<!-- start main -->
<div class="main_bg">
<div class="wrap">
 <div class="main">
 	<!-- start main_content -->
	<div class="content">
		
            
		</div>		
		<div class="clear"></div>	
	</div>
	<!-- start sidebar -->
	<div class="sidebar top">	
				<!---start-da-slider----->
				<div id="da-slider" class="da-slider">
				<div class="da-slide">
					<h2>Clean & Flat Design</h2>
					<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
					<a class="da-link" href="details.html">meet our works </a>
				</div>
				<div class="da-slide">
					<h2>recent projects</h2>
					<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
					<a class="da-link" href="details.html">meet our works </a>
				</div>
				<div class="da-slide">
					<h2>Clean & Flat Design</h2>
					<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
					<a class="da-link" href="details.html">meet our works </a>
				</div>
				<div class="da-slide">
					<h2>recent projects</h2>
					<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
					<a class="da-link" href="details.html">meet our works </a>
				</div>			
				<nav class="da-arrows">
					<span class="da-arrows-prev"></span>
					<span class="da-arrows-next"></span>
				</nav>
			</div>
 			<!---//End-da-slider----->
	 	<!---strat da-slider scipt---->
	    <link rel="stylesheet" type="text/css" href="css/da_slider.css" />
		<script type="text/javascript" src="js/modernizr.custom.28468.js"></script>
		<script type="text/javascript" src="js/jquery.cslider.js"></script>
			<script type="text/javascript">
				$(function() {
				
					$('#da-slider').cslider({
						autoplay	: true,
						bgincrement	: 450
					});
				
				});
			</script>
		<!---//end da-slider script---->
		<h3>catogories</h3>
		<ul class="s_nav">
			<li><a href="#"><span>deserts</span><label>10</label><div class="clear"></div></a></li> 
			<li><a href="#"><span>salad receipts</span><label>12</label><div class="clear"></div></a></li>
			<li><a href="#"><span>fruit shakes</span><label>20</label><div class="clear"></div></a></li>
			<li><a href="#"><span>wallness</span><label>11</label><div class="clear"></div></a></li>
			<li><a href="#"><span>deserts</span><label>10</label><div class="clear"></div></a></li> 
			<li><a href="#"><span>salad receipts</span><label>12</label><div class="clear"></div></a></li>
		</ul>
	</div>
	<div class="clear"></div>	
	<!-- end main_content -->
	<!-- start span_of_4 -->
	<div class="span_of_4">
		<div class="span1_of_4">
			<span class="icon_1"></span>
			<h4>made with love</h4>
			<p>Lorem Ipsum is simply dummy text of the Lorem Ipsum has been when an unknown printer took  make a type specimen book.</p>
			<a href="details.html" class="btn">learn more</a>
		</div>
		<div class="span1_of_4">
			<span class="icon_2"></span>
			<h4>trendy design</h4>
			<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form.</p>
			<a href="details.html" class="btn">learn more</a>
		</div>
		<div class="span1_of_4">
			<span class="icon_3"></span>
			<h4>user friendly</h4>
			<p>Lorem Ipsum is simply dummy text of the Lorem Ipsum has been when an unknown printer took  make a type specimen book.</p>
			<a href="details.html" class="btn">learn more</a>
		</div>
		<div class="span1_of_4">
			<span class="icon_4"></span>
			<h4>script effects</h4>
			<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form.</p>
			<a href="details.html" class="btn">learn more</a>
		</div>
		<div class="clear"></div>
	</div>
	
</body>
</html>
