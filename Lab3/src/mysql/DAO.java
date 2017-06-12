package mysql;

import java.sql.*;

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
		String query = "SELECT * FROM tweets WHERE username='"+username+"' ORDER BY date DESC;"; 
		return statement.executeQuery(query);
	}
	public ResultSet getTweets() throws SQLException{
		String query = "SELECT * FROM tweets ORDER BY date DESC;"; 
		return statement.executeQuery(query);
	}
	
	public ResultSet publishTweet(BeanTweet bt) throws SQLException{
		String query = "INSERT INTO tweets(tweet_text, date,username) VALUES ("+bt.getTweet_text()+","+bt.getDate()+","+bt.getUsername()+");";
		return statement.executeQuery(query);
		
	}
	
	// TODO: code for updates for Assignments 2, 3 and 4.
	public void disconnectBD() throws SQLException {
		statement.close();
		connection.close();
	}
}