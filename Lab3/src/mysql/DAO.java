package mysql;

import java.sql.*;
import java.text.SimpleDateFormat;

import models.BeanTweet;
import models.BeanUser;

public class DAO {
	private Connection connection;
	private Statement statement;

	public DAO() throws Exception {
		
	}

	// execute queries
	/*public ResultSet executeSQL(String query) throws SQLException {
		return statement.executeQuery(query);
	}*/
	public int insertSQL(String query) throws SQLException{
		return statement.executeUpdate(query);
		
	}
	
	public int createUser(BeanUser user) throws SQLException{
		String query = "INSERT INTO twitter.users VALUES ('"+user.getName()+"','"+user.getSurname()+"','"+user.getUsername()+"','"+user.getGender()+"','"+user.getEmail()+"','"+user.getPassword()+"', 0,'"+user.getNickname()+"','"+user.getDateofbirth() +"','"+user.getAddress()+"','"+user.getPhonenumber()+"')";
		System.out.println("Inserting into DB");
		System.out.println(query);
		return this.insertSQL(query);
	}
	
	public int updateUser(BeanUser user) throws SQLException{	//TODO date of birth update
	    PreparedStatement ps = connection.prepareStatement(
	    	      "UPDATE twitter.users SET name = ?, surname = ?,  gender = ?, "
	    	      + "password = ?, nickName = ?, address = ?, phoneNumber = ?  WHERE username = ?");
	    ps.setString(1,user.getName());
	    ps.setString(2, user.getSurname());
	    ps.setString(3, user.getGender());
	    ps.setString(4, user.getPassword());
	    ps.setString(5, user.getNickname());
	    ps.setString(6, user.getAddress());
	    ps.setString(7, user.getPhonenumber());
	    ps.setString(8, user.getUsername());
	    
		System.out.println("Updating user");
		return ps.executeUpdate();
	}
	
	
	public ResultSet getFollowers(String username) throws SQLException {
		String query = "SELECT followed FROM follow WHERE follower='"+username+"';";
		return statement.executeQuery(query);
	} 
	public ResultSet getUserAndPass(String username) throws SQLException {
		String query = "SELECT name,password FROM users where username='"+username+"'";
		return statement.executeQuery(query);
	} 
	
	public ResultSet getUserInfo(String username) throws SQLException {
		String query = "SELECT * FROM users where username='"+username+"'";
		return statement.executeQuery(query);
	} 
	public ResultSet getTweetsFromUser(String username) throws SQLException{
		String query = "SELECT * FROM tweets WHERE username='"+username+"' ORDER BY date DESC;"; 
		return statement.executeQuery(query);
	}
	
	public ResultSet getFollowersFromUser(String username) throws SQLException{
		String query = "SELECT * FROM follow WHERE followed = '"+username+"';";
		return statement.executeQuery(query);
	}
	
	public ResultSet getFollowingFromUser(String username) throws SQLException{
		String query = "SELECT * FROM follow WHERE follower = '"+username+"';";
		return statement.executeQuery(query);
	}
	
	public ResultSet getTweets() throws SQLException{
		String query = "SELECT * FROM tweets ORDER BY date DESC;"; 
		return statement.executeQuery(query);
	}
	
	public ResultSet getUsers() throws SQLException{
		String query = "SELECT * FROM twitter.users;"; 
		return statement.executeQuery(query);
	}
	
	public ResultSet getTweetsFromFollowers(String username) throws SQLException{
		String query = "SELECT * FROM tweets JOIN follow ON username=followed WHERE follower='" + username + "' ORDER BY date DESC";
		return statement.executeQuery(query);
	}
	
	public ResultSet getAllUsersUsername() throws SQLException{
		String query = "select username from users;";
		return statement.executeQuery(query);
	}
	
	public ResultSet getMyFollowersUsername(String username) throws SQLException{
		String query ="select followed from follow where follower='"+username+"';";
		return statement.executeQuery(query);
	}
	
	public int publishTweet(BeanTweet bt) throws SQLException{
		PreparedStatement ps = connection.prepareStatement("INSERT INTO tweets(tweet_text, date,username) VALUES (?,?,?)");
		ps.setString(1, bt.getTweet_text());
		ps.setString(3, bt.getUsername());
		java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
		ps.setTimestamp(2, date);
		return ps.executeUpdate();
		
	}
	public int editTweet(String text, int id) throws SQLException{
		PreparedStatement ps = connection.prepareStatement("UPDATE tweets SET tweet_text=? where id=? ;");
		ps.setString(1, text);
		ps.setInt(2, id);
		return ps.executeUpdate();
	}
	
	public int postFollower(String follower, String followed) throws SQLException{
		PreparedStatement ps = connection.prepareStatement("INSERT INTO follow VALUES (?,?)");
		ps.setString(1, follower);
		ps.setString(2, followed);
		return ps.executeUpdate();
		
	}
	
	public int deleteFollow(String follower, String followed) throws SQLException{
		PreparedStatement ps = connection.prepareStatement("DELETE from follow WHERE follower = ? AND followed = ? ;");
		ps.setString(1, follower);
		ps.setString(2, followed);
		return ps.executeUpdate();
		
	}
	
	public int deleteUser(String username) throws SQLException{
		PreparedStatement ps = connection.prepareStatement("DELETE FROM twitter.users WHERE username=? ;");
		ps.setString(1, username);
		return ps.executeUpdate();
	}
	
	public int removeTweet(int id)throws SQLException{
		PreparedStatement ps = connection.prepareStatement("DELETE FROM tweets WHERE id=? ;");
		ps.setInt(1, id);
		return ps.executeUpdate();
	}
	
	public void connecToDB(){
		try{
			String user = "root";
			String password="";
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			connection=DriverManager.getConnection("jdbc:mysql://localhost/twitter?user="+user+"&password="+password);
			statement=connection.createStatement();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public ResultSet loadLikesFromTweet(int id) throws SQLException{
		String query = "SELECT * FROM likeTweet WHERE tweet_id='"+id+"'";
		return statement.executeQuery(query);
	}
	
	public void likeTweet(String username , int tweetId) throws SQLException{
		
		PreparedStatement ps = connection.prepareStatement("INSERT INTO likeTweet (tweet_id, user_username) VALUES (?, ?);");
		ps.setInt(1, tweetId);
		ps.setString(2, username);
		ps.executeUpdate();
	}
	
	public void unlikeTweet(String username , int tweetId) throws SQLException{
		PreparedStatement ps = connection.prepareStatement("DELETE FROM likeTweet WHERE tweet_id=? and user_username=?");
		ps.setInt(1, tweetId);
		ps.setString(2, username);
		ps.executeUpdate();
	}
	
	public void commentTweet(String username, int tweetId, String comment) throws SQLException{
		PreparedStatement ps = connection.prepareStatement("INSERT INTO commentTweet (tweet_id, user_username, commentary, date) VALUES (?, ?, ?, ?);");
		ps.setInt(1, tweetId);
		ps.setString(2, username);
		ps.setString(3, comment);
		java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
		ps.setTimestamp(4, date);
		ps.executeUpdate();
	}
	
	public ResultSet getTweetComments(int tweetId) throws SQLException{
		String query = "SELECT * FROM commentTweet WHERE tweet_id='"+tweetId+"' ORDER BY date DESC;"; 
		return statement.executeQuery(query);
	}
	
	public void disconnectBD() {
		try{
			statement.close();
			connection.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
}