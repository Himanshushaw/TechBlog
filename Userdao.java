package com.tech.blog.dao;

import java.sql.*;


import com.tech.blog.entities.User;

//this class is for interacting with database and putting data into database
public class Userdao {
	//creating a Connection type variable object con
	private Connection con;
	
	//now creating Constructor to pass value to the con and getting the connection of database in con
		public Userdao(Connection con) {
			this.con=con;
		}
		
		//method to save data into database
		
		public boolean saveUser(com.tech.blog.entities.User user) {
			boolean f=false;
			try {
				// user-->>can go to database
				//query to insert data into database
				//Query
				String query="insert into user(name,email,password,gender,about) values(?,?,?,?,?) ";
				PreparedStatement pstmt= this.con.prepareStatement(query);
				pstmt.setString(1, user.getName());
				pstmt.setString(2, user.getEmail());
				pstmt.setString(3, user.getPassword());
				pstmt.setString(4, user.getGender());
				pstmt.setString(5, user.getAbout());
				
				
				pstmt.executeUpdate();
				f=true;
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			return f;
		}



		
		
		//getting details of user by get useremail and userpassword
		
		public User getUserByEmailAndPassword(String email,String password){
			User user=null;
			try {
				String query="select * from user where email=? and password=? ";
				PreparedStatement pstmt=con.prepareStatement(query);
				pstmt.setString(1, email);
				pstmt.setString(2, password);
				ResultSet set= pstmt.executeQuery();
				
				if(set.next()) {
					//creating a new user object User and sending the data to this user
					user=new User();
					
					//fetching data from db  eg..String name=set.getString("name as in the column of db");
					String name=set.getString("name");
					//set to user object 
					user.setName(name);
					//same as above,like user.setId(12)
					user.setId(set.getInt("id"));
					user.setEmail(set.getString("email"));
					user.setPassword(set.getString("password"));
					user.setGender(set.getString("gender"));
					user.setAbout(set.getString("about"));
					user.setDate(set.getTimestamp("reg_date"));
					//user.setDate(set.getTimestamp("reg-date"));
					user.setProfile(set.getString("profile"));
										
				}
				
			}
			catch (Exception e) {
				e.printStackTrace();
			}
			return user;
		}
		
		public boolean updateUser(User user){
			//start coding with try catch in db 
			boolean f=false;
			try {
				String query="update user set name=? ,email=? ,password=? ,about=? ,gender=? ,"
						+ "profile=? where id=?";
				PreparedStatement p=con.prepareStatement(query);
				p.setString(1, user.getName());
				p.setString(2, user.getEmail());
				p.setString(3, user.getPassword());
				p.setString(4, user.getAbout());
				p.setString(5,user.getGender());
				p.setString(6, user.getProfile());
				p.setInt(7, user.getId());
				
				p.executeUpdate();
					f=true;
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			return f;
		}
		
		
		public User getUserByUserId(int userId) {
			User user=null;
			
			try {
					String sql="select * from user where id=? ";
					PreparedStatement pstmt=this.con.prepareStatement(sql);
					pstmt.setInt(1, userId);
					ResultSet set=pstmt.executeQuery();
					
					if(set.next()) {
						user=new User();
						
						//fetching data from db  eg..String name=set.getString("name as in the column of db");
						String name=set.getString("name");
						//set to user object 
						user.setName(name);
						//same as above,like user.setId(12)
						user.setId(set.getInt("id"));
						user.setEmail(set.getString("email"));
						user.setPassword(set.getString("password"));
						user.setGender(set.getString("gender"));
						user.setAbout(set.getString("about"));
						user.setDate(set.getTimestamp("reg_date"));
						//user.setDate(set.getTimestamp("reg-date"));
						user.setProfile(set.getString("profile"));
											
					
					}
					
					
					
					
					
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
			
			return user;
		}
	

}
