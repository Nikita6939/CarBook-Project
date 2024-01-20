<%@page import="com.example.demo.bean.User"%>
<%@page import="com.example.demo.bean.Cars"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Carbook - AdminCar</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="css/animate.css">
    
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">

    <link rel="stylesheet" href="css/aos.css">

    <link rel="stylesheet" href="css/ionicons.min.css">

    <link rel="stylesheet" href="css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/icomoon.css">
    <link rel="stylesheet" href="css/style.css">
    <style>
		
		.popup {
			position: fixed;
			z-index: 1;
			left: 0;
			top: 0;
			width: 100%;
			height: 100%;
			overflow: auto;
			background-color: rgba(0, 0, 0, 0.4);
			display: none;
		}
		.popup1 {
			position: fixed;
			z-index: 1;
			left: 0;
			top: 0;
			width: 100%;
			height: 100%;
			overflow: auto;
			background-color: rgba(0, 0, 0, 0.4);
			display: none;
		}
		
		.popup-content {
			background-color: white;
			margin: 10% auto;
			padding: 20px;
			border: 1px solid #888888;
			width: 30%;
			font-weight: bolder;
		}
		.popup1-content {
			background-color: white;
			margin: 10% auto;
			padding: 20px;
			border: 1px solid #888888;
			width: 30%;
			font-weight: bolder;
		}
		
		.popup-content button {
			display: block;
			margin: 0 auto;
		}
		.popup1-content a {
			display: block;
			margin: 0 auto;
		}
		.show {
			display: block;
		}
		.show1 {
			display: block;
		}
		
		h1 {
			color:black;
		}
	
	</style>
  </head>
  <body>
    
	  <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container">
	      <a class="navbar-brand" href="index">Car<span>Book</span></a>
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
	      </button>

	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav ml-auto">
	          <li class="nav-item"><a href="adminindex" class="nav-link">Home</a></li>
	          <li class="nav-item"><a href="adminabout" class="nav-link">About</a></li>
	          <li class="nav-item"><a href="adminservices" class="nav-link">Services</a></li>
	          
	          <li class="nav-item active"><a href="admincar" class="nav-link">Cars</a></li>
	          
	          <li class="nav-item"><a href="admincontact" class="nav-link">Contact</a></li>
	          
	          <li class="nav-item"><a href="#" class="nav-link">Hello Admin Nikita</a></li>
	           <li class="nav-item"><a href="rentdetails" class="nav-link">Rent Car</a></li>
	          <li class="nav-item"><a href="logout" class="nav-link">Logout</a></li>
	          
	          
	        </ul>
	      </div>
	    </div>
	  </nav>
    <!-- END nav -->
    
    <section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('images/bg_3.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
          <div class="col-md-9 ftco-animate pb-5">
          	<p class="breadcrumbs"><span class="mr-2"><a href="index">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>Cars <i class="ion-ios-arrow-forward"></i></span></p>
            <h1 class="mb-3 bread" id="myButton" style="cursor:pointer">Add New Car</h1>
          </div>
        </div>
      </div>
    </section>
		<div id="myPopup" class="popup" >
		<div class="popup-content" style="width: 500px;">
		  <h2 style="text-align: center;">Add Car Details</h2>
			<form action="admincar" method="post" class="bg-light p-5 contact-form" style="height: 500px;">
				<div class="form-group">
				  <input type="text" class="form-control" placeholder="Car Image" name="image">
				</div>
				<div class="form-group">
				  <input type="text" class="form-control" placeholder="Car Name" name="name">
				</div>
				<div class="form-group">
				  <input type="text" class="form-control" placeholder="Car Company" name="cat">
				</div>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="Car Price" name="price">
				</div>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="Per Day" name="day">
				</div>
				<div class="form-group" style="margin-left: 100px;">
				  <input type="submit" value="Add Car" class="btn btn-primary py-3 px-5">
				</div>
			  
				
		  </form>
		  <button id="closePopup" class="btn btn-primary py-3 px-5" style="margin-top:10px">
			Close
		  </button>
		</div>
	  </div>

		<section class="ftco-section bg-light">
    	<div class="container">
    		<div class="row">
    		<%List<Cars> list=(List)session.getAttribute("Car"); 
    				for(Cars car:list){
    				%>
    			<div class="col-md-4">
    				<div class="car-wrap rounded ftco-animate">
    					<div class="img rounded d-flex align-items-end" style="background-image: url(<%= car.getImage()%>);">
    					</div>
    					<div class="text">
    						<h2 class="mb-0"><a href="car-single"><%=car.getName() %></a></h2>
    						<div class="d-flex mb-3">
	    						<span class="cat"><%=car.getCat() %></span>
	    						<p class="price ml-auto">$<%=car.getPrice() %> <span>/<%=car.getDay() %></span></p>
    						</div>
    						<p class="d-flex mb-0 d-block">
    						
    						
    						<a  href="carupdate" class="btn btn-secondary py-2 ml-1" >Update</a> <a href="cardelete?name=<%=car.getName()%>" class="btn btn-secondary py-2 ml-1">Delete</a></p>
    					</div>
    				</div>
    			</div>
    			<%} %>
    			
    		</div>
    		
    	</div>
    </section>
    
	  <div id="myPopup1" class="popup1" >
		<div class="popup1-content" style="width: 500px;">
		  <h2 style="text-align: center;">Update Details</h2>
			<form action="admincar" method="post" class="bg-light p-5 contact-form" style="height: 500px;">
				<div class="form-group">
				  <input type="text" class="form-control" placeholder="Car Image" name="image">
				</div>
				<div class="form-group">
				  <input type="text" class="form-control" placeholder="Car Name" name="name">
				</div>
				<div class="form-group">
				  <input type="text" class="form-control" placeholder="Car Company" name="cat">
				</div>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="Car Price" name="price">
				</div>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="Per Day" name="day">
				</div>
				<div class="form-group" style="margin-left: 100px;">
				  <input type="submit" value="Update" class="btn btn-primary py-3 px-5">
				</div>
			  
				
		  </form>
		  <button id="closePopup1" class="btn btn-primary py-3 px-5" style="margin-top:10px">
			Close
		  </button>
		</div>
	  </div>
	   
	  
    

    <footer class="ftco-footer ftco-bg-dark ftco-section">
      <div class="container">
        <div class="row mb-5">
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2"><a href="#" class="logo">Car<span>book</span></a></h2>
              <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
              <ul class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
                <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
                <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
                <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4 ml-md-5">
              <h2 class="ftco-heading-2">Information</h2>
              <ul class="list-unstyled">
                <li><a href="#" class="py-2 d-block">About</a></li>
                <li><a href="#" class="py-2 d-block">Services</a></li>
                <li><a href="#" class="py-2 d-block">Term and Conditions</a></li>
                <li><a href="#" class="py-2 d-block">Best Price Guarantee</a></li>
                <li><a href="#" class="py-2 d-block">Privacy &amp; Cookies Policy</a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
             <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">Customer Support</h2>
              <ul class="list-unstyled">
                <li><a href="#" class="py-2 d-block">FAQ</a></li>
                <li><a href="#" class="py-2 d-block">Payment Option</a></li>
                <li><a href="#" class="py-2 d-block">Booking Tips</a></li>
                <li><a href="#" class="py-2 d-block">How it works</a></li>
                <li><a href="#" class="py-2 d-block">Contact Us</a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
            	<h2 class="ftco-heading-2">Have a Questions?</h2>
            	<div class="block-23 mb-3">
	              <ul>
	                <li><span class="icon icon-map-marker"></span><span class="text">203 Fake St. Mountain View, San Francisco, California, USA</span></li>
	                <li><a href="#"><span class="icon icon-phone"></span><span class="text">+2 392 3929 210</span></a></li>
	                <li><a href="#"><span class="icon icon-envelope"></span><span class="text">info@yourdomain.com</span></a></li>
	              </ul>
	            </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12 text-center">

            <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart color-danger" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
          </div>
        </div>
      </div>
    </footer>
    
  

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>
   <script>
	
		myButton.addEventListener("click", function () {
			myPopup.classList.add("show");
		});
		closePopup.addEventListener("click", function () {
			myPopup.classList.remove("show");
		});
		window.addEventListener("click", function (event) {
			if (event.target == myPopup) {
				myPopup.classList.remove("show");
			}
		});
	
</script>
 <script>
	
	myButton1.addEventListener("click", function () {
		myPopup1.classList.add("show1");
	});
	closePop1.addEventListener("click", function () {
		myPopup1.classList.remove("show1");
	});
	window.addEventListener("click", function (event) {
		if (event.target == myPopup1) {
			myPopup1.classList.remove("show1");
		}
	});

</script>

  <script src="js/jquery.min.js"></script>
  <script src="js/jquery-migrate-3.0.1.min.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/jquery.easing.1.3.js"></script>
  <script src="js/jquery.waypoints.min.js"></script>
  <script src="js/jquery.stellar.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/jquery.magnific-popup.min.js"></script>
  <script src="js/aos.js"></script>
  <script src="js/jquery.animateNumber.min.js"></script>
  <script src="js/bootstrap-datepicker.js"></script>
  <script src="js/jquery.timepicker.min.js"></script>
  <script src="js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="js/google-map.js"></script>
  <script src="js/main.js"></script>
    
  </body>
</html>