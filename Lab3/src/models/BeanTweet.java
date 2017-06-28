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
		this.likes = new ArrayList<String>();
		this.commentarys = new ArrayList<BeanCommentary>();
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
	private List<String> likes;	//Name of the users that likes that tweet
	private List<BeanCommentary> commentarys;
	
	
	public List<BeanCommentary> getCommentarys() {
		return commentarys;
	}
	public void setCommentarys(List<BeanCommentary> commentarys) {
		this.commentarys = commentarys;
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
			System.out.println("getting tweets of db");
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
		
		for(BeanTweet t: tmp){
			t.loadLikes();
			t.loadComments();
		}
			
		return tmp;
	}
	
	public boolean editTweet(){
		boolean success = true;
		try{
			dao.connecToDB();
			if(dao.editTweet(this.tweet_text,this.id) != 0){
				System.out.println("tweet changed");
				success = true;
			}else{
				success = false;
			}
		}catch(SQLException e){
			success = false;
			e.printStackTrace();
		}finally{
			dao.disconnectBD();
		}
		return success;
	}
	public boolean removeTweet(){
		boolean success = true;
		try{
			dao.connecToDB();
			if(dao.removeTweet(this.id) != 0){
				success = true;
			}else{
				success = false;
			}
		}catch(SQLException e){
			e.printStackTrace();
			success = false;
		}finally{
			dao.disconnectBD();
		}
		return success;
	}
	public boolean publish(){
		//TODO Returns true if publish successful
		boolean success = true;
		try{
			dao.connecToDB();
			if(dao.publishTweet(this) != 0){
				success = true;
			}else{
				success = false;
			}
		}catch(SQLException e){
			e.printStackTrace();
			success = false;
		}finally{
			dao.disconnectBD();
		}
		return success;
	}
	
	public void loadLikes(){
		try{
			dao.connecToDB();
			ResultSet rs = dao.loadLikesFromTweet(this.id);
			while(rs.next()){
				likes.add(rs.getString("user_username"));
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			dao.disconnectBD();
		}
	}
	
	public void loadComments(){
		try{
			dao.connecToDB();
			ResultSet rs = dao.getTweetComments(this.id);
			while(rs.next()){
				BeanCommentary bc = new BeanCommentary();
				bc.setCommentary(rs.getString("commentary"));
				bc.setUser_username(rs.getString("user_username"));
				bc.setDate(rs.getString("date"));
				this.commentarys.add(bc);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			dao.disconnectBD();
		}
	}
}
