<%@page import="com.tech.blog.entities.Post"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.Postdao"%>


<div class="row">


<%
Thread.sleep(1000);
	Postdao pd=new Postdao(ConnectionProvider.getConnection());

int cid= Integer.parseInt(request.getParameter("cid"));
ArrayList<Post> post=null;
if(cid==0){
	 post=pd.getAllPost();	
}else{
	post=pd.getPostBycatID(cid);
}
	if(post.size()==0){
		out.println("<h6 class='text-center display-2'>Opps ! Nothing to show for this category...</h6>");
		return;
	}
	
					
	
	for(Post pp: post){
		
		%>
		
		
		
		<div class="col-md-6 mt-2">
		<div class="card">
		<img src="blog_pics/<%=pp.getpPic() %>" class="img-fluid" alt="Responsive image">
		<div class="card-body">
		
		<b><%=pp.getpTitle() %></b>
		<p><%=pp.getpContent() %></p>
		
		</div>
		
		<div class="card-footer text-center bg-dark">
			<a href="show_blog_post.jsp?Pid=<%=pp.getPid() %>" class="btn btn-outline-primary btn-sm">Read more...</a>
			<a href="#!" class="btn btn-outline-primary btn-sm"> <i class="fa fa-thumbs-o-up "></i> <span>10</span> </a>
			<a href="#!" class="btn btn-outline-primary btn-sm"> <i class="fa fa-commenting-o "></i> <span>5</span> </a>

		
		</div>
		
		</div>
		
		
		</div>
		
		
		
		
		<% 
	}


%>

</div>