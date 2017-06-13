package mysql;

import java.sql.*;
import java.text.SimpleDateFormat;

import models.BeanTweet;

public class DAO {
	private Connection connection;
	private Statement statement;

	public DAO() throws Exception {
		String user = "mysql";
		String password="prac";
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		connection=DriverManager.getConnection("jdbc:mysql://localhost/login?user="+user+"&password="+password);
		statement=connection.createStatement();
	}

	// execute queries
	/*public ResultSet executeSQL(String query) throws SQLException {
		return statement.executeQuery(query);
	}*/
	public int insertSQL(String query) throws SQLException{
		return statement.executeUpdate(query);
		
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
		String query = "SELECT * FROM tweets WHERE username='"+username+"' ORDER BY id DESC;"; 
		return statement.executeQuery(query);
	}
	public ResultSet getTweets() throws SQLException{
		String query = "SELECT * FROM tweets ORDER BY id DESC;"; 
		return statement.executeQuery(query);
	}
	
	public int publishTweet(BeanTweet bt) throws SQLException{
		PreparedStatement ps = connection.prepareStatement("INSERT INTO tweets(tweet_text, date,username) VALUES (?,?,?)");
		ps.setString(1, bt.getTweet_text());
		ps.setString(3, bt.getUsername());
		ps.setDate(2, new java.sql.Date(System.currentTimeMillis()));
		return ps.executeUpdate();
		
	}
	
	// TODO: code for updates for Assignments 2, 3 and 4.
	public void disconnectBD() throws SQLException {
		statement.close();
		connection.close();
	}
}