package models;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.converters.DateConverter;

import mysql.DAO;

public class BeanUser implements Serializable  {

	public BeanUser(){
		try {
			dao = new DAO();	//Our interface to retrieve data fron DB
			System.out.println("Mysql connected");
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
	private Date dateofbirth = new Date(0);
	private String address = "";
	private Long phonenumber = (long) 0000000;
	
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
		String query = "SELECT name FROM login.taula where username='"+username+"'";
		System.out.println(query);
		ResultSet rs = dao.executeSQL(query);
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
		String query = "SELECT email FROM login.taula where email='"+email+"'";
		ResultSet rs = dao.executeSQL(query);
		System.out.println(query);
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

	public Date getDateofbirth() {
		return dateofbirth;
	}

	public void setDateofbirth(String dateofbirth) throws IllegalAccessException, InvocationTargetException {
		DateConverter converter = new DateConverter();
		converter.setPattern("dd/mm/yyyy");
		ConvertUtils.register(converter,Date.class);
		BeanUtils.setProperty(this.getClass(), "dateofbirth", dateofbirth);
		System.out.println("date - " + this.getDateofbirth());
		//this.dateofbirth = dateofbirth; TODO: solve this problem
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Long getPhonenumber() {
		return phonenumber;
	}

	public void setPhonenumber(Long phoneNumber) {
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
