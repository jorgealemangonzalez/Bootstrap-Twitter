package models;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mysql.DAO;

public class beanTweet {
	public beanTweet(){
		try {
			dao = new DAO();	//Our interface to retrieve data fron DB
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private int tweet_id;
	private String tweet_text="";
	private String date="";
	private String username ="";
	private String prof_image ="";
	private static DAO dao;
	
	public int getTweet_id() {
		return tweet_id;
	}
	public void setTweet_id(int tweet_id) {
		this.tweet_id = tweet_id;
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
	public String getProf_image() {
		return prof_image;
	}
	public void setProf_image(String prof_image) {
		this.prof_image = prof_image;
	}
	

	public List<beanTweet> loadAllTweetsFromDB(){
		List<beanTweet> tmp = new ArrayList<beanTweet>();
		try {
			ResultSet rs = dao.getTweets();
			while(rs.next()){
				beanTweet tmpT = new beanTweet();
				tmpT.setDate(rs.getString("date"));
				tmpT.setProf_image(rs.getString("profile_image"));
				tmpT.setTweet_id(rs.getInt("tweet_id"));
				tmpT.setTweet_text(rs.getString("tweet_text"));
				tmpT.setUsername(rs.getString("username"));
				tmp.add(tmpT);
			}
		} catch (SQLException e) {
			System.out.println("Error retrieving tweet");
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return tmp;
	}
	
}
