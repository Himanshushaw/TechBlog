<%@page import="com.tech.blog.entities.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <% User user=(User)session.getAttribute("currentUser");
   
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark primary-background">
  <a class="navbar-brand" href="Index.jsp"><span class="fa fa-book "> </span> Tech Blog</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="Index.jsp"><span class="fa fa-code "> </span> Code with Himanshu <span class="sr-only">(current)</span></a>
      </li>
     
      <li class="nav-item dropdown active">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <span class="fa fa-code-fork "> </span> Categories
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Programming Language</a>
          <a class="dropdown-item" href="#">DataStructure and Algorithm</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Database and others</a>
        </div>
      </li>
       <li class="nav-item active">
        <a class="nav-link" href="#"><span class="fa fa-envelope-o"></span> Contact</a>
      </li>
      <%
      if(user==null){
      	
    	  %>
      <li class="nav-item active">
        <a class="nav-link" href="login.jsp"><span class="fa fa-user-circle fa-spin"></span> Login</a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="signup.jsp"><span class="fa fa-user-plus"></span> SignUp</a>
      </li>
      <%
      }
      else{

      %>
      <li class="nav-item active">
        <a class="nav-link" href="profile.jsp"><span class="fa fa-user"></span> <%=user.getName() %></a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="profile.jsp"><span class="fa fa-address-card-o "></span> View Account</a>
      </li>
      <%
      }
      %>

      
      
      
      
    </ul>
    
    	
    
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>
</body>
</html>