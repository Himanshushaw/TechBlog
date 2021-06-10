package com.tech.blog.entities;





//this Message class has been created for generating messages
public class Message {
	private String Content;
	private String type;
	private String cssClass;
	
		//constructor
	public Message(String content, String type, String cssClass) {
		super();
		this.Content = content;
		this.type = type;
		this.cssClass = cssClass;
	}

	//getter and setter
	
	public String getContent() {
		return Content;
	}


	public void setContent(String content) {
		Content = content;
	}


	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}


	public String getCssClass() {
		return cssClass;
	}


	public void setCssClass(String cssClass) {
		this.cssClass = cssClass;
	}
	
	
	
	
	

}
