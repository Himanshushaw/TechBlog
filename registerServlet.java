package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.Out;

import com.tech.blog.dao.Userdao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

@MultipartConfig
@WebServlet("/registerServlet")
public class registerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public registerServlet() {
        super();
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		//fetch data
		
		String check=request.getParameter("check");
		if(check==null) {
			out.println();
			out.println("Please accept the terms and conditions.");
		}else {
			String name=request.getParameter("user_name");
			String email=request.getParameter("user_email");
			String password=request.getParameter("user_password");
			String gender=request.getParameter("gender");
			String about=request.getParameter("about");
			
			
			
			
			
			//create User object and save all the above data to that User's object(user)
			User user=new User(name,email,password,gender,about);
			
			//Now creating Userdao object.... to insert data into database table 
			Userdao dao=new Userdao(ConnectionProvider.getConnection());
			//the below code is using dao object to insert data using saveUser method...no need to write insert method again...
			//passing User object 
			if(dao.saveUser(user)) {
				//saved successfully
				out.println("done");
			}else
			{
				//for error in saving data
				out.println("We are soory for the inconvinience happened,please try again later !!");
				//out.println(<p><a href="signup.jsp">Go to Signup</a></p>);
			}
			
			
			
			
		}
		
		
		
	}

}
