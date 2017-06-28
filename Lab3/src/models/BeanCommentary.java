package models;

import java.io.Serializable;
import java.util.Date;

import mysql.DAO;

public class BeanCommentary  implements Serializable{
	private static final long serialVersionUID = 1L;
	
    private String user_username;
	private String commentary;
	private String date;

	private static DAO dao;
	static{
		try {
			dao = new DAO();	//Our interface to retrieve data fron DB
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	BeanCommentary(){
		
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
	
	public String getUser_username() {
		return user_username;
	}

	public void setUser_username(String user_username) {
		this.user_username = user_username;
	}

	public String getCommentary() {
		return commentary;
	}

	public void setCommentary(String commentary) {
		this.commentary = commentary;
	}
}
