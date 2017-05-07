package models;

import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import mysql.DAO;

public class BeanUser implements Serializable  {

	public BeanUser(){
		try {
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
	private String nickName = "";
	private Date dateOfBirth = null;
	private String address = "";
	private Long phoneNumber = null;
	
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
		String query = "SELECT name FROM login.table where username='"+username+"'";
		ResultSet rs = dao.executeSQL(query);
		//TODO check the content if it's empty or not
		this.username = username;
	}

	public String getgender() {
		return gender;
	}

	public void setgender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) throws SQLException {
		String query = "SELECT email FROM login.table where username='"+getUsername()+"'";
		ResultSet rs = dao.executeSQL(query);
		//TODO check the content if it's empty or not
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public Date getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Long getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(Long phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	
	/*  Control which parameters have been correctly filled */
	private int[] error = {0,0}; 
	
	/* Logic Functions */
	
	/*Check if all the fields are filled correctly */
	public boolean isComplete() {
	    return(hasValue(getName()) &&
	           hasValue(getEmail()));
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
}
