<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SignUp Page</title>
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
		
		<main class="primary-background banner-background" style="padding-bottom: 80px;">
				<div class="container">
				<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-header text-center primary-background text-white">
					<span class="fa fa-user-circle fa-3x"></span>
					<p> SignUp Here</p>
					</div>
					<div class="card-body">
					<form id="reg-form" name="reg-form"	action="registerServlet" method="post">
					  <div class="form-group">
					    <label for="user_name">User Name</label>
					    <input name="user_name" type="text" class="form-control" id="user_name" required  placeholder="Enter your name">
					  </div>
					  <div class="form-group">
					    <label for="user_email">Email address</label>
					    <input type="email" name="user_email" class="form-control" id="user_email" required aria-describedby="emailHelp" placeholder="Enter email">
					    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
					  </div>
					  <div class="form-group">
					    <label for="user_password">Password</label>
					    <input name="user_password" type="password" class="form-control" id="user_password" required placeholder="Password">
					  </div>
					  
					  	<div>
					  	<label for="gender">Select Gender</label>
					  	<div class="form-check form-check-inline">
						  <input class="form-check-input" type="radio" name="gender" id="gender" checked value="male">
						  <label class="form-check-label" for="gender" >Male</label>
						</div>
						<div class="form-check form-check-inline">
						  <input class="form-check-input" type="radio" name="gender" id="gender" value="female">
						  <label class="form-check-label" for="gender">Female</label>
						</div>
						<div class="form-check form-check-inline">
						  <input class="form-check-input" type="radio" name="gender" id="gender" value="others" >
						  <label class="form-check-label" for="gender">Others </label>
						</div>
						</div>
						
						
						<div class="form-group">
							<textarea  name="about" class="form-control" id="about" required rows="7"placeholder="Enter something about yourself"></textarea>						
						</div>
						
						
					  <div class="form-check">
					    <input type="checkbox" name="check" class="form-check-input" id="check">
					    <label class="form-check-label" for="check">I agree to the terms and conditions.</label>
					  </div><br>
					 <div class="container text-center " style="display:none;" id="loader">
					 	 <span class="fa fa-refresh fa-4x fa-spin"></span>
					 	 <h4>Please wait...</h4>
					 </div>
					  <button  id="submit-btn" type="submit" class="btn btn-primary">Submit</button>
					</form>
					
					</div>
				
				</div>
				</div>				
				</div>		
		
		
		</main>
	
	
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>

<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>

<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
$(document).ready(function(){
	console.log("loaded...")

	$("#reg-form").on("submit", function(event){
		event.preventDefault()	
			//creating a variable to store whole form data
		let form=new FormData(this);
		
		$("#submit-btn").hide();
		$("#loader").show();
		//send to register servlet
		$.ajax({
			url: 'registerServlet',
			type: 'POST',
			data: form,
			success:function(data,textStatus,jqXHR){
				console.log(data)
				$("#submit-btn").show();
				$("#loader").hide();
				 console.log("Before done")
				if(data.trim()==="done"){	
					swal("Succesfully Registered !! We are redirecting you to Login Page.")
					.then((value) => {
						window.location="login.jsp"
					});
				}
				else
				{	
					swal(data)
				}
			},
			error: function(jqXHR,textStatus,errorThrown){
				console.log(jqXHR)
				$("#submit-btn").show();
				$("#loader").hide();
				
				swal("Eroor !! Try Again...");
				
			},
			processData: false,
			contentType: false
			
		});
			
		
			
			
			
		});
	});


</script>	
</body>
</html>