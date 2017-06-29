package models;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import mysql.DAO;

public class BeanCommentary  implements Serializable{
	private static final long serialVersionUID = 1L;
	
	int id;

	private String user_username;
	private String commentary;
	private String date;
	private List<String> likes;


	private static DAO dao;
	static{
		try {
			dao = new DAO();	//Our interface to retrieve data fron DB
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	BeanCommentary(){
		likes = new ArrayList<String>();
	}
	
	public List<String> getLikes() {
		return likes;
	}

	public void setLikes(List<String> likes) {
		this.likes = likes;
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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
	
	public void loadLikesFromComment(){
		try{
			dao.connecToDB();
			ResultSet rs = dao.loadLikesFromComment(this.id);
			while(rs.next()){
				System.out.println(rs.getString("user_username"));
				this.likes.add(rs.getString("user_username"));
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			dao.disconnectBD();
		}
	}
}
