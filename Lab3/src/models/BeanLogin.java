package models;

import java.sql.ResultSet;
import java.sql.SQLException;

import mysql.DAO;

public class BeanLogin {

	public BeanLogin(){
		
	}
	
	private static DAO dao;
	static{
		try {
			dao = new DAO();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
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
	
	
	
	public boolean isComplete(){
		boolean success = false;
		try{
			dao.connecToDB();
			ResultSet rs = dao.getUserAndPass(this.username);
			if (rs.next()) {//get first result
				String pass = rs.getString("password");
				if(pass.compareTo(password) == 0){
					success = true;
				}
	        }
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			dao.disconnectBD();
			return success;
		}
		//return(hasValue(getUsername()));
	}
	
	
	
}