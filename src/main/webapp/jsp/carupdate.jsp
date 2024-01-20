<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
  
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
</head>
<body>
  <div class="col-md-8 block-9 mb-md-5" style="margin-left:200px">
            <h2 style="text-align: center;">Update Car Details</h2>
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
				<div class="form-group" style="margin-left: 320px;">
				  <input type="submit" value="Update" class="btn btn-primary py-3 px-5">
				</div>
			    
				
		  </form>
              <button id="closePop" class="btn btn-primary py-3 px-5">
			<a href="admincar">Back</a>
		  </button>
          </div>
       
	   
</body>
</html>