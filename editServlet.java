package com.tech.blog.servlets;

import java.io.File;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.tech.blog.dao.Userdao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;

/**
 * Servlet implementation class editServlet
 */
@WebServlet("/editServlet")
@MultipartConfig
public class editServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public editServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
			response.setContentType("text/html");
			PrintWriter out= response.getWriter();
		
		//fetching all data from profile.jsp
			String userEmail=request.getParameter("user_email");
			String userName=request.getParameter("user_name");
			String userPassword=request.getParameter("user_password");
			String userAbout=request.getParameter("user_about");
			Part part=request.getPart("image"); 
			String imageName=part.getSubmittedFileName();
			
			//now fetching old or existing user session
			HttpSession s=request.getSession();
			User user=(User)s.getAttribute("currentUser");
			//now set or save the  new data to user 
			user.setEmail(userEmail);
			user.setName(userName);
			user.setPassword(userPassword);
			user.setAbout(userAbout);
			String olfProfile=user.getProfile();
			user.setProfile(imageName);
			
			
			//updating database...
			//as updateUser function is non -static we have to create a object of userdao
			Userdao userdao=new Userdao(ConnectionProvider.getConnection());
		    boolean ans=userdao.updateUser(user);
		    //if updated
		    if(ans) {
		    	
		    	
		    	String path=request.getRealPath("/")+"pics"+File.separator+user.getProfile();
		    	
		    	//delete code	
		   /*String patholdFile=request.getRealPath("/")+"pics"+File.separator+ olfProfile;
		    	if(!olfProfile.equals("default.png")){
		    		Helper.deleteFile(patholdFile);
		    	}*/
		    	
		    		
		    		if(Helper.saveFile(part.getInputStream(), path)) {
		    			//out.println("Profile updated successfully !");
		    			Message msg=new Message("Profile updated successfully !", "success", "alert-success");
		    			s.setAttribute("msg", msg);
		    		}else {
		    			//out.println("Profile not save");
		    			Message msg=new Message("Profile not save...Error !", "error", "alert-danger");
		    			s.setAttribute("msg", msg);
		    		}
		   
		    }
		    else{
		    	//out.println("Record not updated");
		    	Message msg=new Message("Something went wrong...", "error", "alert-danger");
    			s.setAttribute("msg", msg);
		    }
		    
		    response.sendRedirect("profile.jsp");
			
			
			
			
		
	}

}
