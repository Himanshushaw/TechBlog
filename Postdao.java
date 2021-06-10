package com.tech.blog.dao;

import java.awt.List;
import java.sql.*;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;

public class Postdao {
	
	Connection con;

	public Postdao(Connection con) {
		super();
		this.con = con;
	}
	
	public ArrayList<Category> getAllCategories(){

		//each category data will be stored in list object which will contain cid,description,name of each row
		ArrayList<Category> list =new ArrayList<Category>();
		try {
			String q="select * from categories";
			//establishiing connection 
			Statement st=this.con.createStatement();
			ResultSet set=st.executeQuery(q);
			while(set.next()) {
				int cid=set.getInt("cid");
				String name=set.getString("name");
				String description=set.getString("description");
				//passing all fetched data to the parameter
				Category c=new Category(cid,name,description);
				list.add(c);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
	}

	
	
	public ArrayList<Post> getAllPost(){
		ArrayList<Post> list=new ArrayList<>();
		
		try {
			String sql="select * from posts";
			PreparedStatement pstmt=con.prepareStatement(sql);
			ResultSet set=pstmt.executeQuery();
			while(set.next()) {
			int pid=set.getInt("pid");
			String pTitle=set.getString("pTitle");
			String pContent=set.getString("pContent");
			String pCode=set.getString("pCode");
			String pPic=set.getString("pPic");
			Timestamp pDate=set.getTimestamp("pDate");
			int catID=set.getInt("catID");
			int  userId=set.getInt("userId");
			
			Post p=new Post(pid, pTitle, pContent, pCode, pPic, pDate, catID, userId);
			list.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return list;
	}
	
	
	public ArrayList<Post> getPostBycatID(int catID){
		
		ArrayList<Post> list=new ArrayList<>();
		
		//fetch all post by catId or id
		try {
			String sql="select * from posts where catID=?";
			PreparedStatement pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, catID);
			ResultSet set=pstmt.executeQuery();
			while(set.next()) {
			int pid=set.getInt("pid");
			String pTitle=set.getString("pTitle");
			String pContent=set.getString("pContent");
			String pCode=set.getString("pCode");
			String pPic=set.getString("pPic");
			Timestamp pDate=set.getTimestamp("pDate");
			
			int  userId=set.getInt("userId");
			
			Post p=new Post(pid, pTitle, pContent, pCode, pPic, pDate, catID, userId);
			list.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return list;
		
		
		
	}
		
	public Post getSinglePostByPid(int PostId) {
		Post post=null;
		
		try {
			String sql="Select * from posts where pid=?";
			PreparedStatement ps=this.con.prepareStatement(sql);
			ps.setInt(1, PostId);
			ResultSet set=ps.executeQuery();
			if(set.next()) {
				int pid=set.getInt("pid");
				String pTitle=set.getString("pTitle");
				String pContent=set.getString("pContent");
				String pCode=set.getString("pCode");
				String pPic=set.getString("pPic");
				Timestamp pDate=set.getTimestamp("pDate");
				int catID=set.getInt("catID");
				int  userId=set.getInt("userId");
				Post single_post=new Post(pTitle, pContent, pCode, pPic, pDate, catID, userId);
				return single_post; 
				
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		return post;
		
		
	}
	
	
	
	
	
	
	
	//insert post data to db
	public boolean savePost(Post p) {
		boolean f=false;
		
		try {
			String query="insert into posts(pTitle,pContent,pCode,pPic,catID,userId)values(?,?,?,?,?,?)";
			PreparedStatement pstmt=this.con.prepareStatement(query);
			pstmt.setString(1, p.getpTitle());
			pstmt.setString(2, p.getpContent());
			pstmt.setString(3, p.getpCode());
			pstmt.setString(4, p.getpPic());
			pstmt.setInt(5, p.getCatID());
			pstmt.setInt(6, p.getUserId());
			
			pstmt.executeUpdate();
			f=true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}




}
