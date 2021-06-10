<%@page import="com.tech.blog.entities.Message"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
<!-- CSS -->
<link rel="stylesheet" type="text/css" href="css/Mystyle.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
		.banner-background{
		clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 90%, 75% 99%, 23% 95%, 0 91%, 0 0);

		}
	</style>
</head>
<body>
	<!-- navbar -->
	
	<%@ include file="Normal_navbar.jsp" %>
	<main class="d-flex align-items-center primary-background banner-background" style="height:70vh">
		<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
			
			<div class="card">
				<div class="card-header primary-background text-white text-center">
				<span class="fa fa-user-plus fa-3x"></span>
				
					<p>Login here</p>
				</div>
				<!-- printing error messages -->
				<%
					Message m=(Message)session.getAttribute("msg");
					if(m!=null){
						
						%>
						
						<div class="alert <%= m.getCssClass() %> text-center"  role="alert">
		 				<%= m.getContent() %>
						</div>
						
						
						
						<% 
						session.removeAttribute("msg");

					}
				
				
				
				
				
				%>				
				<div class="card-body">
					<form action="login_servlet" method="post">
  <div class="mb-3">
    <label for="email" class="form-label">Email</label>
    <input name="email" required type="email" class="form-control" id="email" aria-describedby="emailHelp">
    
  </div>
  <div class="mb-3">
    <label for="password" class="form-label">Password</label>
    <input type="password" name="password" required class="form-control" id="password">
    <input  type="checkbox" onclick="myFunction()" > Show Password
  </div>
  
 <div class="conatiner text-center" >
 		 <button type="submit" class="btn btn-primary">Submit</button>
 </div>
</form>
				</div>
			</div>
			
			
			
			</div>
		</div>
		</div>
	</main>





	<!-- JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
<script type="text/javascript">
	function myFunction(){
		var x=document.getElementById("password");
		if(x.type ==="password"){
			x.type="text";
			}
		else{
			x.type="password";
		}
		
		}
</script>

</body>
</html>