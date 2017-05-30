package models;

import java.sql.ResultSet;
import java.sql.SQLException;

import mysql.DAO;

public class BeanLogin {

	public BeanLogin(){
		try {
			dao = new DAO();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	private static DAO dao;
	private String username = "";
	private String password = "";
	public String error = "";
	
	public String getError() {
		return error;
	}

	public void setError(String error) {
		this.error = error;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getUsername(){
		return username;
	}
	
	public void setUsername(String username){
		this.username = username;
	}
	
	
	
	public boolean isComplete() throws SQLException {
		String query = "SELECT name,password FROM login.taula where username='"+username+"'";
		ResultSet rs = dao.executeSQL(query);
		if (rs.next()) {//get first result
			String pass = rs.getString("password");
			if(pass.compareTo(password) == 0){
				return true;
			}
        }
    	return false;
     
		//return(hasValue(getUsername()));
	}
	
	
	/*private boolean hasValue(String val) {
		return((val != null) && (!val.equals("")));
	}*/
	
}