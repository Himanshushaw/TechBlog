package com.tech.blog.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tech.blog.entities.Message;

/**
 * Servlet implementation class logout_servlet
 */
@WebServlet("/logout_servlet")
public class logout_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public logout_servlet() {
        super();
        
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws
	ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
		//response.sendRedirect("login.jsp");
		HttpSession s=request.getSession();
		s.removeAttribute("currentUser");
		
		Message m=new Message("Logout Succesfully!", "success", "alert-success");
		s.setAttribute("msg", m);
		response.sendRedirect("login.jsp");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws 
	ServletException, IOException {
		
		doGet(request, response);
		
	}

}
