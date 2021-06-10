<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home page</title>
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
		<!-- including Navbar -->
		<%@include file="Normal_navbar.jsp" %>
		<!-- banner -->
		<div class="container-fluid p-0 m-0 banner-background" >
			<div class="jumbotron primary-background text-white">
			<div class="container">
			<h3 class="display-3">Welcome Friends to Tech Blog</h3>
			<p>We welcome you in Tech Blog the place where you can learn more and more technologies.</p>
			<p>Best platform for Developers.Designers are responsible artists. Whether it is web designing 
			or development it requires a sense of imagination for looking at the output even before it is
			 published. Both the process includes small and big tasks. You have to work for minor 
			 color adjustments and also for setting up decent space for a particular section</p>
				<button class="btn btn-outline-light btn-lg" ><span class="fa fa-file-code-o"></span> Start Learning</button>
				<a href="login.jsp" class="btn btn-outline-light btn-lg" ><span class="fa fa-user-circle fa-spin"></span> Login</a>
				</div>
				</div>
		
		</div>
	
	<!-- cards -->
	<div class="container ">
	
	<div class="row">
		<div class="col-md-4">
		<div class="card">
  <div class="card-body">
    <h5 class="card-title">Java Programming</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn primary-background text-white">Read more</a>
  </div>
	</div>
	</div>
	 <div class="col-md-4">
		<div class="card">
  <div class="card-body">
    <h5 class="card-title">Java Programming</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn primary-background text-white">Read more</a>
  </div>
	</div>
	</div>
	<div class="col-md-4">
		<div class="card">
  <div class="card-body">
    <h5 class="card-title">Java Programming</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn primary-background text-white">Read more</a>
  </div>
	</div>
	</div>
		</div>
	
	<div class="row">
		<div class="col-md-4">
		<div class="card">
  <div class="card-body">
    <h5 class="card-title">Java Programming</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn primary-background text-white">Read more</a>
  </div>
	</div>
	</div>
	 <div class="col-md-4">
		<div class="card">
  <div class="card-body">
    <h5 class="card-title">Java Programming</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn primary-background text-white">Read more</a>
  </div>
	</div>
	</div>
	<div class="col-md-4">
		<div class="card">
  <div class="card-body">
    <h5 class="card-title">Java Programming</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn primary-background text-white">Read more</a>
  </div>
	</div>
	</div>
		</div>
	
	<div class="row">
		<div class="col-md-4">
		<div class="card">
  <div class="card-body">
    <h5 class="card-title">Java Programming</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn primary-background text-white">Read more</a>
  </div>
	</div>
	</div>
	 <div class="col-md-4">
		<div class="card">
  <div class="card-body">
    <h5 class="card-title">Java Programming</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn primary-background text-white">Read more</a>
  </div>
	</div>
	</div>
	<div class="col-md-4">
		<div class="card">
  <div class="card-body">
    <h5 class="card-title">Java Programming</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn primary-background text-white">Read more</a>
  </div>
	</div>
	</div>
		</div>
	
	
	
	</div>
	

<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
	
</body>
</html>