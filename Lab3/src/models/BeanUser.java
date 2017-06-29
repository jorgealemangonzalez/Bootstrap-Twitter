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
import java.util.function.Predicate;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;

import mysql.DAO;

public class BeanUser implements Serializable  {

	public BeanUser(){
		name = "";
		surname = "";
		username = "";
		gender = "";
		email = "";
		password = "";
		address = "";
		phonenumber = "";
		userTweets = new ArrayList<BeanTweet>();
		following = new ArrayList<String>();
		followers = new ArrayList<String>();
	}
	private static final long serialVersionUID = 1L;

	private static DAO dao;
	static {
		try {
			dao = new DAO();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	private	String name = "";
	private String surname = "";
	private String username = "";
	private String gender = "";
	private String email = "";
	private String password = "";
	private String address = "";
	private String phonenumber = "";
	private boolean isAdmin;
	private List<BeanTweet> userTweets = new ArrayList<BeanTweet>();
	private List<String> following = new ArrayList<String>();
	
	public boolean isAdmin(){
		return this.isAdmin;
	}
	
	public boolean isSameUser(BeanUser u){
		return u.getUsername().equals(username);
	}
	
	public Predicate<BeanUser> isSameUser() {
		
	    return u -> this.isSameUser(u);
	}
	
	public int getFollowingSize(){
		return this.following.size();
	}
	
	public List<String> getFollowing() {
		this.loadUserFollowing();//Consistency
		return this.following;
	}


	public void setFollowing(List<String> following) {
		this.following = following;
	}
	
	public int getUserTweetsSize(){
		return this.userTweets.size();
	}
	
	public List<BeanTweet> getUserTweets() {
		this.loadUserTweetsFromDB();
		return userTweets;
	}


	public void setUserTweets(List<BeanTweet> userTweets) {
		this.userTweets = userTweets;
	}
	
	public int getFollowersSize(){
		return this.followers.size();
	}
	
	public List<String> getFollowers() {
		this.loadUserFollowers();
		return followers;
	}


	public void setFollowers(List<String> followers) {
		this.followers = followers;
	}
	private List<String> followers = new ArrayList<String>();
	
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

	public void setUsername(String username) throws SQLException{
		try{
			dao.connecToDB();
			ResultSet rs = dao.getUserInfo(username);
			if(rs.next()){
				this.error[1]=1;
			}else{
				this.error[1]=0;
			}
			this.username = username;
		} catch (SQLException e) {
			System.out.println("Error retrieving user "+username);
			//e.printStackTrace();
		} finally {
			dao.disconnectBD();
		}
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
		try{
			dao.connecToDB();
			ResultSet rs = dao.getEmail(email);
			if(rs.next()){
				this.error[0]=1;
			}else{
				this.error[0]=0;
			}
			this.email = email;
		} catch (SQLException e) {
			System.out.println("Error retrieving user "+username);
			//e.printStackTrace();
		} finally {
			dao.disconnectBD();
		}
		
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
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
		boolean success = true;
		try {
			
			dao.connecToDB();
			ResultSet rs = dao.getUserInfo(username);
			if(rs.next()){
				rs.getString("name");
				this.name = rs.getString("name");
				this.surname = rs.getString("surname");
				this.username = rs.getString("username");
				this.gender = rs.getString("gender");
				this.email = rs.getString("email");
				this.password = rs.getString("password");
				this.address = rs.getString("address");
				this.phonenumber = rs.getString("phonenumber");
				this.isAdmin = rs.getBoolean("isAdmin");
				//System.out.println("User"+username+" loaded succesfully");
				this.loadUserFollowers();
				this.loadUserFollowing();
				this.loadUserTweetsFromDB();
			}
			//System.out.println("User "+username+" doesn't exists");
		} catch (SQLException e) {
			System.out.println("Error retrieving user "+username);
			success=false;
			e.printStackTrace();
		} finally {
			dao.disconnectBD();
		}
		return success;
	}
	
	public List<BeanTweet> loadFollowersTweets(){
		List<BeanTweet> tmp = new ArrayList<BeanTweet>();
		try {
			dao.connecToDB();
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
		} finally{
			dao.disconnectBD();
		}
		
		for(BeanTweet t: tmp){
			t.loadLikes();
			t.loadComments();
		}
		
		return tmp;
		
	}
	
	
	public List<BeanTweet> loadUserTweetsFromDB(){
		this.userTweets.clear();
		try {
			dao.connecToDB();
			ResultSet rs = dao.getTweetsFromUser(this.username);
			while(rs.next()){
				BeanTweet tmpB = new BeanTweet();
				tmpB.setDate(rs.getString("date"));
				tmpB.setId(rs.getInt("id"));
				tmpB.setTweet_text(rs.getString("tweet_text"));
				tmpB.setUsername(rs.getString("username"));
				this.userTweets.add(tmpB);
			}
		} catch (SQLException e) {
			System.out.println("Error retrieving tweet");
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			dao.disconnectBD();
		}
		
		for(BeanTweet t: this.userTweets){
			t.loadLikes();
			t.loadComments();
		}
		
		return this.userTweets;
		
	}
	
	public void loadUserFollowers(){
		followers.clear();
		try {
			dao.connecToDB();
			ResultSet rs = dao.getFollowersFromUser(this.username);
			while(rs.next()){
				String follower = rs.getString("follower");
				//System.out.println("follower "+follower);
				followers.add(follower);
			}
		} catch (SQLException e) {
			System.out.println("Error retrieving followers");
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			dao.disconnectBD();
		}
	}
	
	public void loadUserFollowing(){
		following.clear();
		try {
			dao.connecToDB();
			ResultSet rs = dao.getFollowingFromUser(this.username);
			while(rs.next()){
				String followin = rs.getString("followed");
				//System.out.println("followin "+followin);
				following.add(followin);
			}
		} catch (SQLException e) {
			System.out.println("Error retrieving following");
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			dao.disconnectBD();
		}
	}
	public List<BeanUser> getAllUsers(){
		List<BeanUser> tmp = new ArrayList<BeanUser>();
		
		try {
			dao.connecToDB();
			ResultSet rs = dao.getAllUsersUsername();
			while(rs.next()){
				BeanUser b = new BeanUser();
				b.loadFromDatabase(rs.getString("username"));
				tmp.add(b);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			dao.disconnectBD();
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
	
	public boolean publishTweet(String text){
		BeanTweet tweet = new BeanTweet();
		tweet.setTweet_text(text);
		tweet.setUsername(username);
		//tweet.setDate((new java.sql.Timestamp(new java.util.Date().getTime())).toString());
		if(tweet.publish()){
			//System.out.println("Date"+tweet.getDate());
			this.userTweets.add(0,tweet);
			return true;
		}else{
			System.out.println("Not published");
			return false;
		}
		
	}
	
	public void create(){
		//Creates the user in the database
		try {
			dao.connecToDB();
			dao.createUser(this);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			dao.disconnectBD();
		}
	}
	
	public void update(){
		try {
			System.out.println("Update "+username);
			dao.connecToDB();
			dao.updateUser(this);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			dao.disconnectBD();
		}
	}
	
	static public List<BeanUser> loadAllUsersFromDatabase(){
		List<BeanUser> tmp = new ArrayList<BeanUser>();
		try {
			dao.connecToDB();
			ResultSet rs = dao.getUsers();
			while(rs.next()){
				try{
					BeanUser tmpU = new BeanUser();
					String name = rs.getString("name");
					String surname = rs.getString("surname");
					String username = rs.getString("username");
					String gender = rs.getString("gender");
					String email = rs.getString("email");
					String password = rs.getString("password");
					String address = rs.getString("address");
					String phoneNumber = rs.getString("phonenumber");
					
					tmpU.setName(name);
					tmpU.setSurname(surname);
					tmpU.setUsername(username);
					tmpU.setGender(gender);
					tmpU.setEmail(email);
					tmpU.setPassword(password);
					tmpU.setAddress(address);
					tmpU.setPhonenumber(phoneNumber);
					tmpU.loadUserFollowers();
					tmpU.loadUserFollowing();
					tmpU.loadUserTweetsFromDB();
					tmp.add(tmpU);
				}catch(NullPointerException e){
					//TODO ver porque pasa esto
					e.printStackTrace();
				}
			}
		} catch (SQLException e) {
			System.out.println("Error retrieving users");
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			dao.disconnectBD();
		}
		return tmp;
	}
	
	public String getLastTweetText(){
		if(userTweets.size()>0){
			return userTweets.get(0).getTweet_text();
		}else{
			return "User has no tweets";
		}
	}
	
	public boolean followUser(String username){
		try {
			dao.connecToDB();
			dao.postFollower(this.getUsername(), username);
			this.following.add(username);
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		} finally{
			dao.disconnectBD();
		}
	}
	
	public boolean unFollowUser(String username){
		boolean success = true;
		try {
			dao.connecToDB();
			dao.deleteFollow(this.getUsername(), username);
			this.following.remove(username);
			success= true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			success= false;
		} finally{
			dao.disconnectBD();
			
		}
		return success;
	}
	
	public void deleteUser(String username){
		try {
			dao.connecToDB();
			dao.deleteUser(username);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			dao.disconnectBD();
		}
	}
	
	public void likeTweet(int id){
		try{
			System.out.println("Like tweet "+id);
			dao.connecToDB();
			dao.likeTweet(this.username,id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			dao.disconnectBD();
		}
	}
	
	public void likeComment(int id){
		try{
			System.out.println("Like comment "+id);
			dao.connecToDB();
			dao.likeComment(this.username,id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			dao.disconnectBD();
		}
	}
	
	public void unlikeComment(int id){
		try{
			System.out.println("Unlike comment "+id);
			dao.connecToDB();
			dao.unlikeComment(this.username,id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			dao.disconnectBD();
		}
	}
	
	public void retweetTweet(int id){
		BeanTweet t = new BeanTweet();
		t.loadFromDatabase(id);
		t.setUsername(this.username);
		t.publish();
	}
	
	public void unlikeTweet(int id){
		try{
			System.out.println("Unlike tweet "+id);
			dao.connecToDB();
			dao.unlikeTweet(this.username,id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			dao.disconnectBD();
		}
	}
	
	public void commentTweet(int id, String commentary){
		try{
			System.out.println("Comment tweet "+id);
			System.out.println(commentary);
			dao.connecToDB();
			dao.commentTweet(this.username, id, commentary);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			dao.disconnectBD();
		}
	}
	
}
