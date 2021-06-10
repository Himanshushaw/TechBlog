<%@page import="com.tech.blog.dao.Userdao"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.Postdao"%>
<%@page import="com.tech.blog.entities.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
	<%@page errorPage="error_page.jsp" %>
	
	
	<%
	User user = (User) session.getAttribute("currentUser");
if (user == null) {
	response.sendRedirect("login.jsp");
}
%>



<!-- fetching pid -->
	
<%
	int pid = Integer.parseInt(request.getParameter("Pid"));
%>

	<%
		Postdao pdao=new Postdao(ConnectionProvider.getConnection());
		Post p=pdao.getSinglePostByPid(pid);
		
		
		%>
		


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title><%=p.getpTitle() %></title>
<!-- CSS -->
<link rel="stylesheet" type="text/css" href="css/Mystyle.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.banner-background {
	clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 90%, 75% 99%, 23% 95%, 0 91%, 0 0);
	
	
}

.post-title{
		
		font-size:25px;

	}
	
	.post-content{
		font-size:20px;
		font-weight:bold;
		
	}
	
	.post-user-info{
		font-size:18px;
		
		}
		.post-date{
		font-weight:bold;
		font-style:italic;
		
		}
		
		.post-usd{
		border:1px solid #e2e2e2;
		Padding-top:15px;
		
		}
		body{
		background:url(Img/img2.jpg);
		background-repeat:no-repeat;
		background-attachment: fixed;
		background-size:cover;
		
				}
	
</style>
</head>
<body>
	<!-- start of navbar -->

	<nav class="navbar navbar-expand-lg navbar-dark primary-background">
		<a class="navbar-brand" href="Index.jsp"><span class="fa fa-book ">
		</span> Tech Blog</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="#"><span
						class="fa fa-code "> </span> Code with Himanshu <span
						class="sr-only">(current)</span></a></li>

				<li class="nav-item dropdown active"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <span class="fa fa-code-fork "> </span>
						Categories
				</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">Programming Language</a> <a
							class="dropdown-item" href="#">DataStructure and Algorithm</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Database and others</a>
					</div></li>
				<li class="nav-item active"><a class="nav-link" href="#"><span
						class="fa fa-envelope-o"></span> Contact</a></li>
				<li class="nav-item active"><a class="nav-link" href="#!"
					data-toggle="modal" data-target="#add-post-modal"><span
						class="fa  fa-info-circle"></span> Add post</a></li>
						
						<li class="nav-item active"><a class="nav-link" href="profile.jsp"><span
						class="fa  fa-info-circle"></span> Profile</a></li>
			</ul>
			<ul class="navbar-nav m-right ">
				<img alt="profile pic" src="pics/<%=user.getProfile()%>"
					class="img-fluid" style="border-radius: 50%; max-width: 40px;" />

				<li class="nav-item active"><a class="nav-link" href="#!"
					data-toggle="modal" data-target="#profile-modal"><span
						class="fa fa-user"></span> <%=user.getName()%></a></li>


				<li class="nav-item active"><a class="nav-link"
					href="logout_servlet"><span class="fa fa fa-user-circle"></span>
						Logout</a></li>
			</ul>

		</div>
	</nav>



	<!-- end of navbar -->


	
	
	<div class="container">
	<div class="row my-4">
	<div class="col-md-8 offset-md-2">
	<div class="card">
	<div class="card-header bg-primary text-white">
		<h4 class="post-title"><%=p.getpTitle() %></h4>

	</div>
	 
	
	 
	 
	 
	
	 
	 
	<div class="card-body">
	 <img class="card-img-top my-2"  src="blog_pics/<%=p.getpPic() %>" alt="Card image cap">
	 
	 
	  <!-- displaying User name and date of post -->
	 	<%	
	 			Userdao userd=new Userdao(ConnectionProvider.getConnection());
	 			
	 	
	 	
	 	%>
	 
	 <div class="row my-3 post-usd">
	 <div class="col-md-8">
	 	<p class="post-user-info"><a href="#"><%=userd.getUserByUserId(p.getUserId()).getName() %> </a>  posted an update :</p>
	 </div>
	 
	 <div class="col-md-4">
	 <p class="post-date">Date <%=p.getpDate() %></p>
	 </div>
	 
	 
	 </div>
	 
	 
	 
	<p class="post-content"><%=p.getpContent() %></p>
	<br>
	<div class="post-code">
		<pre><%=p.getpCode() %></pre>
	
	</div>
	
	</div>
	
	<!-- card footer -->
		<div class="card-footer text-center bg-dark">
			<a href="profile.jsp" class="btn btn-outline-primary btn-sm"> <i class="fa fa-arrow-circle-o-left"></i> <span>Back</span> </a>
			<a href="#!" class="btn btn-outline-primary btn-sm"> <i class="fa fa-thumbs-o-up "></i> <span>10</span> </a>
			<a href="#!" class="btn btn-outline-primary btn-sm"> <i class="fa fa-commenting-o "></i> <span>5</span> </a>

		
		</div>
	</div>
	 
	
	</div>
	
	</div>
	
	</div>

	


	<!-- Start of Profile Modal -->



	<!-- Button trigger modal -->

	<!-- Modal -->
	<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header primary-background text-white text-center">
					<h5 class="modal-title" id="exampleModalLabel">Tech Blog</h5>
					<button type="button" class="close text-white" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container text-center">
						<img alt="profile pic" src="pics/<%=user.getProfile()%>"
							class="img-fluid" style="border-radius: 50%; max-width: 90px;" />
						<h5 class="modal-title mt-3" id="exampleModalLabel"><%=user.getName()%></h5>

						<!--details of profile-->
						<div id="profile-details">
							<table class="table">
								<tbody>
									<tr>
										<th scope="row">ID :</th>
										<td><%=user.getId()%></td>

									</tr>
									<tr>
										<th scope="row">Email :</th>
										<td><%=user.getEmail()%></td>
									</tr>
									<tr>
										<th scope="row">Gender :</th>
										<td><%=user.getGender()%></td>
									</tr>
									<tr>
										<th scope="row">Status :</th>
										<td><%=user.getAbout()%></td>
									</tr>
									<tr>
										<th scope="row">Date of Joining :</th>
										<td><%=user.getDate()%></td>
									</tr>
								</tbody>
							</table>
						</div>

						<!-- profile edit starts here -->
						<div id="profile-edit" style="display: none";>
							<h3 class="mt-2">Please Edit Carefully!</h3>
							<form action="editServlet" method="post"
								enctype="multipart/form-data">
								<table class="table">
									<tr>
										<td>Id:</td>
										<td><%=user.getId()%></td>
									</tr>
									<tr>
										<td>Email:</td>
										<td><input type="email" class="form-control"
											autocomplete="off" name="user_email"
											value="<%=user.getEmail()%>"></td>
									</tr>
									<tr>
										<td>Name:</td>
										<td><input type="text" class="form-control"
											autocomplete="off" name="user_name"
											value="<%=user.getName()%>"></td>
									</tr>
									<tr>
										<td>Password:</td>
										<td><input type="password" class="form-control"
											autocomplete="off" name="user_password"
											value="<%=user.getPassword()%>"></td>
									</tr>
									<tr>
										<td>Gender:</td>
										<td><%=user.getGender()%></td>
									</tr>
									<tr>
										<td>About:</td>
										<td><textarea rows="5" class="form-control"
												name="user_about"><%=user.getAbout()%>
									</textarea></td>
									</tr>
									<tr>
										<td>Profile pic:</td>
										<td><input type="file" name="image"
											class="form-control-file"></td>
									</tr>
								</table>
								<div class="container">
									<button type="submit" class="btn btn-outline-success">Save</button>
								</div>
							</form>
						</div>

					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-outline-primary"
						data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-outline-danger"
						id="edit-profile-button">Edit</button>
				</div>
			</div>
		</div>
	</div>

	<!-- end of Profile Modal -->

	





	<!-- JavaScript -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
		crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"
		integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
		integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"
		integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s"
		crossorigin="anonymous"></script>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
	
	<script type="text/javascript">
		$(document).ready(function() {
			let editStatus = false;
			$('#edit-profile-button').click(function() {
				if (editStatus == false) {
					$('#profile-details').hide();
					$('#profile-edit').show();
					editStatus = true;
					$(this).text("Back")
				} else {
					$('#profile-details').show();
					$('#profile-edit').hide();
					editStatus = false;
					$(this).text("Edit")
				}
			})
		});
	</script>


	
</body>
</html>