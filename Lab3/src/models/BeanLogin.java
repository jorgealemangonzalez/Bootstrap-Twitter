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
	
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}


	private int[] error = {0};
	
	public String getUsername(){
		return username;
	}
	
	public void setUsername(String username){
		this.username = username;
	}
	
	
	public int[] getError() {
		return error;
	}
	
	public boolean isComplete() throws SQLException {
		String query = "SELECT name FROM login.taula where username='"+username+"'";
		ResultSet rs = dao.executeSQL(query);
		if (rs.next()) {//get first result
			return true;
        }else{
        	return false;
        }
		//return(hasValue(getUsername()));
	}
	
	
	/*private boolean hasValue(String val) {
		return((val != null) && (!val.equals("")));
	}*/
	
}