package models;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;

import mysql.DAO;

public class BeanUser implements Serializable  {

	public BeanUser(){
		try {
			System.out.println("new BEAN");
			dao = new DAO();	//Our interface to retrieve data fron DB
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	private static final long serialVersionUID = 1L;

	private static DAO dao;
	private	String name = "";
	private String surname = "";
	private String username = "";
	private String gender = "";
	private String email = "";
	private String password = "";
	private String nickname = "";
	private String dateofbirth = "";
	private String address = "";
	private String phonenumber = "";
	
	/*getters and setters*/
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSurname() {
		return surname;
	}

	public void setSurname(String surname) {
		this.surname = surname;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) throws SQLException {
		ResultSet rs = dao.getUserAndPass(this.username);
		if (rs.next()) {//get first result
			System.out.println("el username existe");
			this.error[1]=1;
        }else{
        	this.error[1]=0;
        }
		this.username = username;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) throws SQLException {
		ResultSet rs = dao.getUserAndPass(this.username);
		if (rs.next()) {//get first result
			System.out.println("el email existe");
			this.error[0]=1;
        }else{
        	this.error[0]=0;
        }
		this.email = email;
		//TODO check the content if it's empty or not
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickName) {
		this.nickname = nickName;
	}

	public String getDateofbirth() {
		return dateofbirth;
	}

	public void setDateofbirth(String dateofbirth) {
		this.dateofbirth = dateofbirth; 
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhonenumber() {
		return phonenumber;
	}

	public void setPhonenumber(String phoneNumber) {
		this.phonenumber = phoneNumber;
	}

	
	/*  Control which parameters have been correctly filled */
	private int[] error = {0,0}; 
	
	/* Logic Functions */
	
	/*Check if all the fields are filled correctly */
	public boolean isComplete() {
		
	    return(hasValue(getName()) &&
	           hasValue(getEmail()) && this.error[0]==0 && this.error[1]==0);
	}
	
	
	
	public boolean loadFromDatabase(String username){
		try {		
			ResultSet rs = dao.getUserInfo(username);
			if(rs.next()){
				this.name = rs.getString("name");
				this.surname = rs.getString("surname");
				this.username = rs.getString("username");
				this.gender = rs.getString("gender");
				this.email = rs.getString("email");
				this.password = rs.getString("password");
				this.nickname = rs.getString("nickname");
				this.dateofbirth = rs.getString("dateofbirth");
				this.address = rs.getString("address");
				this.phonenumber = rs.getString("phonenumber");
				System.out.println("User"+username+" loaded succesfully");
				return true;
			}
			System.out.println("User "+username+" doesn't exists");
			return false;
		} catch (SQLException e) {
			System.out.println("Error retrieving user "+username);
			return false;
			//e.printStackTrace();
		}
	}
	
	public List<BeanTweet> loadFollowersTweets(){
		List<BeanTweet> tmp = new ArrayList<BeanTweet>();
		try {
			ResultSet rs = dao.getTweetsFromFollowers(this.username);
			while(rs.next()){
				BeanTweet tmpB = new BeanTweet();
				tmpB.setDate(rs.getString("date"));
				tmpB.setId(rs.getInt("id"));
				tmpB.setTweet_text(rs.getString("tweet_text"));
				tmpB.setUsername(rs.getString("username"));
				tmp.add(tmpB);
			}
		} catch (SQLException e) {
			System.out.println("Error retrieving tweet");
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return tmp;
		
	}
	
	
	public List<BeanTweet> loadUserTweetsFromDB(){
		List<BeanTweet> tmp = new ArrayList<BeanTweet>();
		try {
			ResultSet rs = dao.getTweetsFromUser(this.username);
			while(rs.next()){
				BeanTweet tmpB = new BeanTweet();
				tmpB.setDate(rs.getString("date"));
				tmpB.setId(rs.getInt("id"));
				tmpB.setTweet_text(rs.getString("tweet_text"));
				tmpB.setUsername(rs.getString("username"));
				tmp.add(tmpB);
			}
		} catch (SQLException e) {
			System.out.println("Error retrieving tweet");
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return tmp;
		
	}
	
	private boolean hasValue(String val) {
		return((val != null) && (!val.equals("")));
	}

	public int[] getError() {
		return error;
	}

	public void setError(int[] error) {
		this.error = error;
	}
	
	public void publishTweet(String text){
		BeanTweet bt = new BeanTweet();
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date date = new Date();
		bt.setDate(dateFormat.format(date));
		bt.setTweet_text(text);
		bt.setUsername(this.username);
		if(bt.publish())
			System.out.println("Publish tweet successfull");
		else
			System.out.println("Publish tweet UNSUCCESSFULL");
		
	}
	
	public void create(){
		//Creates the user in the database
		try {
			dao.createUser(this);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void update(){
		try {
			System.out.println("Update "+username);
			dao.updateUser(this);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
