package com.tech.blog.helper;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;

public class Helper {
	public static boolean deleteFile(String path) {
		boolean f=false;
		try {
			//creating file object
			File file=new File(path);
			f=file.delete();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
		
	}
	
	public static boolean saveFile(InputStream is,String path) {
		boolean f=false;
		try {
			//creating byte type array 
			//size is checked by is.available() function
			//jitna bytes available hoga usko b[] me dal denge
			byte b[]=new byte[is.available()];
			//is se data ko read krke b[] me rakh de
			is.read(b);
			//for writing   data into pics file
			FileOutputStream fos=new FileOutputStream(path);
			fos.write(b);
			fos.flush();
			fos.close();
			f=true;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return f;
		
	}
	
}
