<%@page import="com.example.demo.bean.RentCar"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
<link rel="stylesheet" href="css/check.css">
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
		
		.popup-content {
			background-color: white;
			margin: 10% auto;
			padding: 20px;
			border: 1px solid #888888;
			width: 30%;
			font-weight: bolder;
		}
		
		
		.popup-content input {
			display: block;
			margin: 0 auto;
		}
		
		.show {
			display: block;
		}
		
		h1 {
			color:black;
		}
	
	</style>
  </head>
</head>
<body>

<%RentCar c=(RentCar)session.getAttribute("rent");

if(c.getName().equals(null)){
	RequestDispatcher rd=request.getRequestDispatcher("showcart");
	rd.forward(request, response);
} %>
<div id="page">
    <div id="main">
      <div class="product-container">
      <%if(c!=null){ %>
        <h2><%=c.getName() %></h2>
        <img src="<%=c.getImage()%>" alt="">
        <%} %>
      </div>
      <div class="card">
        <div class="chip">
          <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 230 384.4 300.4" width="38" height="70">
                <path d="M377.2 266.8c0 27.2-22.4 49.6-49.6 49.6H56.4c-27.2 0-49.6-22.4-49.6-49.6V107.6C6.8 80.4 29.2 58 56.4 58H328c27.2 0 49.6 22.4 49.6 49.6v159.2h-.4z" data-original="#FFD66E" data-old_color="#00FF0C" fill="rgb(237,237,237)"/>
                <path d="M327.6 51.2H56.4C25.2 51.2 0 76.8 0 107.6v158.8c0 31.2 25.2 56.8 56.4 56.8H328c31.2 0 56.4-25.2 56.4-56.4V107.6c-.4-30.8-25.6-56.4-56.8-56.4zm-104 86.8c.4 1.2.4 2 .8 2.4 0 0 0 .4.4.4.4.8.8 1.2 1.6 1.6 14 10.8 22.4 27.2 22.4 44.8s-8 34-22.4 44.8l-.4.4-1.2 1.2c0 .4-.4.4-.4.8-.4.4-.4.8-.8 1.6v74h-62.8v-73.2-.8c0-.8-.4-1.2-.4-1.6 0 0 0-.4-.4-.4-.4-.8-.8-1.2-1.6-1.6-14-10.8-22.4-27.2-22.4-44.8s8-34 22.4-44.8l1.6-1.6s0-.4.4-.4c.4-.4.4-1.2.4-1.6V64.8h62.8v72.4c-.4 0 0 .4 0 .8zm147.2 77.6H255.6c4-8.8 6-18.4 6-28.4 0-9.6-2-18.8-5.6-27.2h114.4v55.6h.4zM13.2 160H128c-3.6 8.4-5.6 17.6-5.6 27.2 0 10 2 19.6 6 28.4H13.2V160zm43.2-95.2h90.8V134c-4.4 4-8.4 8-12 12.8h-122V108c0-24 19.2-43.2 43.2-43.2zm-43.2 202v-37.6H136c3.2 4 6.8 8 10.8 11.6V310H56.4c-24-.4-43.2-19.6-43.2-43.2zm314.4 42.8h-90.8v-69.2c4-3.6 7.6-7.2 10.8-11.6h122.8v37.6c.4 24-18.8 43.2-42.8 43.2zm43.2-162.8h-122c-3.2-4.8-7.2-8.8-12-12.8V64.8h90.8c23.6 0 42.8 19.2 42.8 42.8v39.2h.4z" data-original="#005F75" class="active-path" data-old_color="#005F75" fill="rgba(0,0,0,.4)"/>
              </svg>
        </div>
        
        <form action="#">
          <label for="number">Card Number
            <input type="text" id="number" placeholder="0000 - 0000 - 0000 - 0000">
          </label>
          <label for="name">Name
            <input type="text" id="name" placeholder="Jhon Doe">
          </label>
          <label for="date">Valid Thru
            <input type="text" id="date" placeholder="00/00">
          </label>
          <label for="cvc">cvc
            <input type="text" id="cvc" placeholder="000">
          </label>
          <%if(c!=null){ %>
          <input type="hidden" name="email" value=<%=c.getEmail() %>>
         <%} %>
          <button id="myButton"><a href="email?email=<%=c.getEmail() %>&user=<%=c.getUser() %>" style="text-decoration:none;color:black" >Rent NOW</a>
            <i class="fa fa-angle-right"></i>
          </button>
          <label for="remember">Save my information for later
            <input type="checkbox" checked="checked" id="remember">
          </label>
          
      </form>
      </div>
      <div class="price-container">
       <%if(c!=null){ %>
        <strong>$<span><%=c.getPrice()%></span></strong>
        <%} %>
        <small>Inc. shipping & tax</small>
      </div>
    </div>
  </div>
  <div id="myPopup" class="popup">
  <div class="popup-content">
   <svg style="margin-left: 119px;" id='icon-paid' xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" viewBox="0 0 310.277 310.277" style="enable-background:new 0 0 310.277 310.277;" xml:space="preserve" width="180px" height="180px">
  <g>	<path d="M155.139,0C69.598,0,0,69.598,0,155.139c0,85.547,69.598,155.139,155.139,155.139   c85.547,0,155.139-69.592,155.139-155.139C310.277,69.598,240.686,0,155.139,0z M144.177,196.567L90.571,142.96l8.437-8.437   l45.169,45.169l81.34-81.34l8.437,8.437L144.177,196.567z" fill="#3ac569"/>
  </g></svg>
    <h2 style="color:green;margin-left: 24px">
      Hello, <%=c.getUser()%> Your Car Has been Booked
    </h2>
    <p style="margin-left: 15px">Please Check your email for details Thank you!</p>
    <button id="closePopup">
      Close
    </button>
  </div>
</div>
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
</body>
</html>