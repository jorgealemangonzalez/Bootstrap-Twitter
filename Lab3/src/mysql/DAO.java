package mysql;

import java.sql.*;
import java.text.SimpleDateFormat;

import models.BeanTweet;
import models.BeanUser;

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
	
	public int createUser(BeanUser user) throws SQLException{
		String query = "INSERT INTO login.users VALUES ('"+user.getName()+"','"+user.getSurname()+"','"+user.getUsername()+"','"+user.getGender()+"','"+user.getEmail()+"','"+user.getPassword()+"','"+user.getNickname()+"','"+user.getDateofbirth() +"','"+user.getAddress()+"','"+user.getPhonenumber()+"')";
		System.out.println("Inserting into DB");
		return this.insertSQL(query);
	}
	
	public int updateUser(BeanUser user) throws SQLException{	//NOTE username and mail can not be changed , is primary key
		/*String query = "UPDATE login.users SET"
				+ " name='"+user.getName()+"'"
				+ " surname='"+user.getSurname()+"'"
				+ " gender='"+user.getGender()+"'"
				+ " password='"+user.getPassword()+"'"
				+ " nickName='"+user.getNickname()+"'"
				+ " dateOfBirth='"+user.getDateofbirth()+"'"
				+ " address='"+user.getAddress()+"'"
				+ " phoneNumber='"+user.getPhonenumber()+"' "
						+ " WHERE username='"+user.getUsername()+"'";*/
	    PreparedStatement ps = connection.prepareStatement(
	    	      "UPDATE login.users SET name = ?, surname = ?,  gender = ?, "
	    	      + "password = ?, nickName = ?, dateOfBirth = ?, address = ?, phoneNumber = ?  WHERE username = ?");
	    ps.setString(1,user.getName());//TODO continue http://alvinalexander.com/blog/post/jdbc/sample-jdbc-preparedstatement-sql-update
	    
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
	public ResultSet getTweets() throws SQLException{
		String query = "SELECT * FROM tweets ORDER BY date DESC;"; 
		return statement.executeQuery(query);
	}
	
	public ResultSet getTweetsFromFollowers(String username) throws SQLException{
		String query = "";
		return statement.executeQuery(query);
	}
	
	public int publishTweet(BeanTweet bt) throws SQLException{
		PreparedStatement ps = connection.prepareStatement("INSERT INTO tweets(tweet_text, date,username) VALUES (?,?,?)");
		ps.setString(1, bt.getTweet_text());
		ps.setString(3, bt.getUsername());
		java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
		ps.setTimestamp(2, date);
		System.out.println(date);
		return ps.executeUpdate();
		
	}
	
	// TODO: code for updates for Assignments 2, 3 and 4.
	public void disconnectBD() throws SQLException {
		statement.close();
		connection.close();
	}
}