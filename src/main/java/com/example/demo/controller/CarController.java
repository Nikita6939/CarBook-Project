package com.example.demo.controller;


import java.util.ArrayList;
import java.util.List;
import java.util.Optional;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.mail.MailSendException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


import com.example.demo.bean.Cars;
import com.example.demo.bean.Cart;
import com.example.demo.bean.Client;
import com.example.demo.bean.Contact;

import com.example.demo.bean.RentCar;
import com.example.demo.bean.Service;
import com.example.demo.bean.User;
import com.example.demo.dao.CarRepository;
import com.example.demo.dao.CartRepository;
import com.example.demo.dao.ClientRepository;
import com.example.demo.dao.ContactRepository;
import com.example.demo.dao.RentRepository;
import com.example.demo.dao.ServiceRepository;
import com.example.demo.dao.UserRepository;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.http.HttpServletRequest;

import jakarta.servlet.http.HttpSession;

@Controller
public class CarController {
	
	@Autowired
	
	CarRepository carR;
	
	@Autowired
	
	ClientRepository clientR;
	
	@Autowired
	
	ServiceRepository serviceR;
   
	 @RequestMapping("/index")
		
	   	public List<Cars> getcar(HttpSession session,Cart c){
	   		
	   		
	   		
	   	    List<Cars> car=new ArrayList<>();
	   	    for(Cars cars:carR.findAll()) {
	   	    	
	   	    	car.add(cars);
	   	    }
	   		
	   	    List<Client> client=new ArrayList<>();
	   	    for(Client clients:clientR.findAll()) {
	   	    	client.add(clients);
	   	    }
	   	    
	   	    List<com.example.demo.bean.Service> service=new ArrayList<>();
	   	    for(com.example.demo.bean.Service services:serviceR.findAll()) {
	   	    	service.add(services);
	   	    	
	   	    }
	   	    session.setAttribute("Service", service);
	   	    session.setAttribute("Client", client);
	   		session.setAttribute("Car", car);
	   		

           
	   		session.setAttribute("Cart",c);
//	   		session.setAttribute("image", c.getImage());
//	   		session.setAttribute("price", c.getPrice());
	   		return car;
	   	}
	 
	 @RequestMapping("/about")
		
	   	public List<Client> getclient(HttpSession session){
		 List<Client> client=new ArrayList<>();
	   	    for(Client clients:clientR.findAll()) {
	   	    	client.add(clients);
	   	    }
	   	 session.setAttribute("Client", client);
	     	
	   	 return client;
	 }
	 
	 @RequestMapping("/car")
		
	   	public List<Cars> getcars(HttpSession request){
	   		
	   		
	   		
	   	    List<Cars> car=new ArrayList<>();
	   	    for(Cars cars:carR.findAll()) {
	   	    	
	   	    	car.add(cars);
	   	    }
	   	    request.setAttribute("Car", car);
	   	   
	   		return car;
	 }
	 
	 @RequestMapping("/services")
		
	   	public List<com.example.demo.bean.Service> getservices(HttpSession session){
		  
	   	    List<com.example.demo.bean.Service> service=new ArrayList<>();
	   	    for(com.example.demo.bean.Service services:serviceR.findAll()) {
	   	    	service.add(services);
	   	    	
	   	    }
	   	    session.setAttribute("Service", service);
	   	    return service;
	 }
	 
	 @Autowired
		
	 CartRepository cartRe;
	
	 
	 @RequestMapping("/showcart")
	 public String cart(HttpSession session) {
		 List<Cart> cart=new ArrayList<>();
	        
		    
		  
	    	for(Cart c1:cartRe.findAll()) {
	    	 
	    			
	    			 
	    			 cart.add(c1);
	    			
	    	}
	    		
	    	 
	    	
		     
	    	 session.setAttribute("Cart",cart);
		     return "cart";
	 }
		
	 @RequestMapping("/cart")
	    public List<Cart> getcart(Cart c,HttpSession session){
	    	
		 		
		 
		   
		    
	        cartRe.save(c);
	        
	       
	        List<Cart> cart=new ArrayList<>();
	        
	          int sum=0;
		      
	    	for(Cart c1:cartRe.findAll()) {
	    	       
	    		
	    		
	    			
	    			 
	    			 cart.add(c1);
	    			 
	    		
	    			 
	    			 
	    			
	    			 
	    			 
	    			
	    	}
	    	session.setAttribute("Cart",cart);
	    		
	    	 for(Cart c2:cartRe.findAll()) {
	    		 System.out.println(c2.getU_id());
	    		
	    		
	    		 sum=sum+Integer.parseInt(c2.getPrice());
	    		 System.out.println(sum);
	    	 }
	    	
	    	 
	    	 
//	    	 session.setAttribute("sum", sum);
	    	 return cart;
	      
		  
	    }
	 @RequestMapping("/contact")
	 
	 public String contact() {
		
		 return "contact";
	 }
	 
	 @Autowired 
	 
	 ContactRepository contactR;
	
	 @RequestMapping("/showcontact")
	 public String showcontact(Contact c,HttpServletRequest request) {
		 
		 contactR.save(c);
		 request.setAttribute("meet", "Meet you soon!....");
		 return "contact";
	 }
	 
	 @RequestMapping("/usernotfound")
		 
	 public String Usernotfound(HttpSession session ) {
		 session.setAttribute("usernotfound","Please Login!...");
		 
		 return "redirect:/login";
	 }
	
	 
	 @GetMapping("/login")
	 public String login() {
		 return "login";
	 }
	 
	 @Autowired
	 
	 UserRepository userR;
	 
	 @PostMapping("/register")
		public String showregister(User u,HttpSession session) {
			
			System.out.println(u.getEmail());
			
			
			
			try {
				User u1=userR.save(u);
		
				if(u1!=null) {
				
			    session.setAttribute("msg", "Register Successfully!...");
			
	           return "login";
			}
			
			
			}
			catch(DataIntegrityViolationException e) {
	           
				session.setAttribute("failed","Email Id already exists");
				
				return "login";
				
			}
			
			return "login";
			
		}
	 
	 @PostMapping("/login")
		public String login(User u,HttpSession session) {
			System.out.println(u.getEmail());
		    System.out.println(u.getPassword());
			
	        Iterable<User> itr=userR.findAll();
			
	          
	         
			
			int count=0;
			for(User u1:itr) {
				System.out.println(u1.getEmail());
				if(u1.getEmail().equals(u.getEmail()) &&(u1.getPassword().equals(u.getPassword()))) {
					Optional<User> optional=userR.findById(u1.getId());
					User user=optional.get();
					System.out.println(user);
					System.out.println("login");
					
					session.setAttribute("user",u1);
					System.out.println(u1.getName());
				    if(u.getEmail().equals("nikita@gmail.com")) {
				    	return "adminindex";
				    }
				    else {
					return "redirect:/index";
					
					
				}}else {
					
					count++;
					
				}
			}
			
			if(count>0) {
				System.out.print("failed");
				session.setAttribute("failedlogin", "Invalid email or password");
				return "login";
			}
			
			return "login";
			
			
			
		}
	 
	 @RequestMapping("/delete")
	 public String delete(Cart cart,HttpServletRequest request,HttpSession session) {
		 
		 cartRe.deleteById(cart.getName());
		 
		  List<Cart> carts=new ArrayList<>();
		  for(Cart remove:cartRe.findAll()) {
			  carts.add(remove);
		  }
			 
		  
		  request.setAttribute("delete", "Deleted Successfully!...");
		 
		   session.setAttribute("Cart", carts);
		  
		  
		  
		  return "cart";
	 }
	 
	 @RequestMapping("/logout")
	 public String logout(HttpSession session) {
		 
		 session.removeAttribute("user");
		 return "login";
	 }
	 
	@Autowired
	
	RentRepository rentR;
	
	@Autowired
	JavaMailSender  javamailSender;
	
	@RequestMapping("/rent")
	
	public String rent(RentCar r,HttpSession session) throws MessagingException {
		System.out.println(r.getName());
		System.out.println(r.getImage());
		System.out.println(r.getPrice());
		
		cartRe.deleteById(r.getName());
		
		if(r.getEmail()!=null) {
			 System.out.println(r.getName());
			rentR.save(r);
			System.out.println("if");
			session.setAttribute("rent", r);
			return "checkout";
		}
		
		else if(r.getEmail()==null ) {
			session.setAttribute("msglogin","Please login!...");
			return "redirect:/login";
		
	  }
	
		
		
	   if(r.getName()==null) {
		 session.setAttribute("msgselect", "Please Select Car.. ");
		
		 return "redirect:/showcart";
	
		
	}
	   else{
		   return "checkout";
	   }
		
	}	
		
			
		@RequestMapping("/email")	
		public String email(String email,String User) throws MessagingException {
      
	
		 try {
			  MimeMessage messege=javamailSender.createMimeMessage();
			  MimeMessageHelper helper=new MimeMessageHelper(messege);
			  helper.setFrom("carrentalmanagementcompany@gmail.com");
			  helper.setTo(email);
			  helper.setSubject("Your Car Booking Confirmed!");
			  helper.setText("Dear,"+User
			  		+ "\r\n"
			  		+ "Exciting news! Your car booking has been successfully confirmed. We're thrilled to have you on board. Get ready for a fantastic journey ahead! If you have any queries, feel free to reach out.\r\n"
			  		+ "\r\n"
			  		+ "Best regards,\r\n"
			  		+"CarBook Company");
			 
			  System.out.println("email");
			  javamailSender.send(messege);
			  
		  }catch(MailSendException e) {
			  System.out.println(e);
			  e.printStackTrace();
		  }
		 return "checkout";
	}
	
	@GetMapping("/admincar")
	public String admincar(HttpSession session,Cars c) {
		 
		List<Cars> car=new ArrayList<>();
	   	    for(Cars cars:carR.findAll()) {
	   	    	
	   	    	car.add(cars);
	   	    }
	   	    session.setAttribute("Car", car);
	   	   
	   	 
	   	
	   	 
		return "admincar";
		
		
	}
	
	@PostMapping("/admincar")
	public String addcar(HttpSession session ,Cars c) {
		 
	   	 carR.save(c);
	   	
	   
	   	 List<Cars> car=new ArrayList<>();
   	    for(Cars cars:carR.findAll()) {
   	    	
   	    	car.add(cars);
   	    }
   	    session.setAttribute("Car", car);
   	    
     	 return "admincar";
	}
	
	@GetMapping("/carupdate")
	public String cardata() {
		return "carupdate";
	}
	
	@PostMapping("/carupdate")
	public String updatecar(HttpSession session ,Cars c) {
		 Optional<Cars> op=carR.findById(c.getName());
	   	 Cars c1=op.get();
	   	 c1.setName(c.getName());
	   	 c1.setImage(c.getImage());
	   	 c1.setCat(c.getCat());
	   	 c1.setPrice(c.getPrice());
	   	 c1.setDay(c.getDay());
	   	 carR.save(c1);
	   	
	   
	   	 List<Cars> car=new ArrayList<>();
   	    for(Cars cars:carR.findAll()) {
   	    	
   	    	car.add(cars);
   	    }
   	    session.setAttribute("Car", car);
   	    
     	 return "admincar";
	}
	
	@RequestMapping("/cardelete")
	public String cardelete(Cars c,HttpSession session) {
		
		carR.deleteById(c.getName());

	   	 List<Cars> car=new ArrayList<>();
  	    for(Cars cars:carR.findAll()) {
  	    	
  	    	car.add(cars);
  	    }
  	    session.setAttribute("Car", car);
  	    
		return "admincar";
	}
	
	@GetMapping("/adminabout")
	public String adminabout(HttpSession session) {
		 
		List<Client> client=new ArrayList<>();
	   	    for(Client clients:clientR.findAll()) {
	   	    	client.add(clients);
	   	    }
	   	 session.setAttribute("Client", client);
	     	
	   	
		return "adminabout";
		
		
	}
	
	@PostMapping("/adminabout")
	public String addabout(HttpSession session ,Client c) {
		 
	   	 clientR.save(c);
	   	 System.out.println(c.getReview());
	   	 System.out.println(c.getImage());
	   	 System.out.println(c.getName());
	   	 System.out.println(c.getProfession());
	   	List<Client> client=new ArrayList<>();
   	    for(Client clients:clientR.findAll()) {
   	    	client.add(clients);
   	    }
     	 session.setAttribute("Client", client);
     	
   	
	   return "adminabout";
	   	 
	}
	@GetMapping("/adminservices")
	public String adminservices(HttpSession session) {
		 List<com.example.demo.bean.Service> service=new ArrayList<>();
	   	    for(com.example.demo.bean.Service services:serviceR.findAll()) {
	   	    	service.add(services);
	   	    	
	   	    }
	   	    session.setAttribute("Service", service);
	   	    
		return "adminservices";
		
		
	}
	
	@PostMapping("/adminservices")
	public String addservices(HttpSession session,Service s) {
		  serviceR.save(s);
		 List<com.example.demo.bean.Service> service=new ArrayList<>();
	   	    for(com.example.demo.bean.Service services:serviceR.findAll()) {
	   	    	service.add(services);
	   	    	
	   	    }
	   	    session.setAttribute("Service", service);
	   	    
		return "adminservices";
		
		
	}
	@RequestMapping("/admincontact")
	public String admincntact(HttpSession session) {
		
		List<Contact> client=new ArrayList<>();
   	    for(Contact clients:contactR.findAll()) {
   	    	client.add(clients);
   	    }
     	 session.setAttribute("Contact", client);
     	
   	
		
		return "admincontact";
		
		
	}
	
	@RequestMapping("/rentdetails")
	public String rentdetail(HttpSession session) {
		
		List<RentCar> client=new ArrayList<>();
   	    for(RentCar clients:rentR.findAll()) {
   	    	client.add(clients);
   	    }
     	 session.setAttribute("Rent", client);
     	
   	
		
		return "rentdetails";
		
		
	}
	
	
	
	
}
   
