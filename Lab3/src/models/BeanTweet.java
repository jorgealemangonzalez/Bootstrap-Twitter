package models;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mysql.DAO;

public class BeanTweet implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public BeanTweet(){
		
	}
	private static DAO dao;
	static{
		try {
			dao = new DAO();	//Our interface to retrieve data fron DB
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private int id;
	private String tweet_text="";
	private String date="";
	private String username ="";
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTweet_text() {
		return tweet_text;
	}
	public void setTweet_text(String tweet_text) {
		this.tweet_text = tweet_text;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	

	static public List<BeanTweet> loadAllTweetsFromDB(){
		List<BeanTweet> tmp = new ArrayList<BeanTweet>();
		try {
			dao.connecToDB();
			ResultSet rs = dao.getTweets();
			while(rs.next()){
				BeanTweet tmpT = new BeanTweet();
				tmpT.setDate(rs.getString("date"));
				tmpT.setId(rs.getInt("id"));
				tmpT.setTweet_text(rs.getString("tweet_text"));
				tmpT.setUsername(rs.getString("username"));
				tmp.add(tmpT);
			}
		} catch (SQLException e) {
			System.out.println("Error retrieving tweet");
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			dao.disconnectBD();
		}
		return tmp;
	}
	
	public boolean editTweet(){
		try{
			dao.connecToDB();
			if(dao.editTweet(this.tweet_text,this.id) != 0){
				System.out.println("tweet changed");
				return true;
			}else{
				return false;
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			dao.disconnectBD();
		}
		return false;
	}
	
	public boolean publish(){
		//TODO Returns true if publish successful
		try{
			dao.connecToDB();
			if(dao.publishTweet(this) != 0){
				return true;
			}else{
				return false;
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			dao.disconnectBD();
			return false;
		}
	}
}
