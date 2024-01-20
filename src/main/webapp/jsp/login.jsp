<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/login.css">
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
<body style="background-image: url('images/bg_1.jpg');"  >

 <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container">
	      <a class="navbar-brand" href="index">Car<span>Book</span></a>
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
	      </button>

	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav ml-auto">
	          <li class="nav-item active"><a href="index" class="nav-link">Home</a></li>
	          <li class="nav-item"><a href="about" class="nav-link">About</a></li>
	          <li class="nav-item"><a href="services" class="nav-link">Services</a></li>
	          
	          <li class="nav-item"><a href="car" class="nav-link">Cars</a></li>
	          <li class="nav-item"><a href="blog" class="nav-link">Blog</a></li>
	          <li class="nav-item"><a href="contact" class="nav-link">Contact</a></li>
	          
	          
	        </ul>
	      </div>
	    </div>
	  </nav>
	 
<section class="forms-section" style="margin-top:70px">
  
  <div class="forms">
    <div class="form-wrapper is-active">
      <button type="button" class="switcher switcher-login">
        Login
        <span class="underline"></span>
      </button>
      <form action="login" method="post" class="form form-login">
        <fieldset>
          <legend>Please, enter your email and password for login.</legend>
          <% String usernot=(String)session.getAttribute("usernotfound");
        	if(usernot!=null){	  %>
          <%=usernot %>
          <%}session.removeAttribute("usernotfound"); %>
          <% String msg=(String)session.getAttribute("msglogin");
        	if(msg!=null){	  %>
          <%=msg %>
          <%}session.removeAttribute("msglogin"); %>
          <div class="input-block">
            <label for="login-email">E-mail</label>
            <input id="login-email" type="email" name="email" required>
          </div>
          <div class="input-block">
            <label for="login-password">Password</label>
            <input id="login-password" type="password" name="password" required>
          </div>
        </fieldset>
        <button type="submit" class="btn-login" >Login</button>
         <%String s=(String)session.getAttribute("msg");
         if(s!=null){%>
         <%=s%> 
         <%session.removeAttribute("msg");
         } %>
         <%String s1=(String)session.getAttribute("failed");
         if(s1!=null){%>
         <%=s1%> 
         <%session.removeAttribute("failed");
         } %>
         
         <%String s2=(String)session.getAttribute("failedlogin");
         if(s2!=null){%>
         <%=s2%> 
         <%session.removeAttribute("failedlogin");
         } %>
      </form>
     
    </div>
    <div class="form-wrapper">
      <button type="button" class="switcher switcher-signup">
        Sign Up
        <span class="underline"></span>
      </button>
      <form action="/register" method="post" class="form form-signup" >
        <fieldset>
          <legend>Please, enter your email, password and password confirmation for sign up.</legend>
          <div class="input-block">
            <label for="signup-email">Name</label>
            <input id="signup-email" type="name"name="name" required>
          </div>
          <div class="input-block">
            <label for="signup-password">Email</label>
            <input id="signup-password" type="email" name="email" required>
          </div>
          <div class="input-block">
            <label for="signup-password-confirm">Password</label>
            <input id="signup-password-confirm" type="password" name="password" required>
          </div>
        </fieldset>
        <button type="submit" class="btn-signup">Continue</button>
      </form>
    </div>
  </div>
</section>
</section>
<script>

const switchers = [...document.querySelectorAll('.switcher')]

switchers.forEach(item => {
	item.addEventListener('click', function() {
		switchers.forEach(item => item.parentElement.classList.remove('is-active'))
		this.parentElement.classList.add('is-active')
	})
})
</script>
</body>
</html>