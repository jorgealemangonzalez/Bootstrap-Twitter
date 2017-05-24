package controllers;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import models.BeanUser;
import mysql.DAO;

/**
 * Servlet implementation class FormController
 */
@WebServlet("/RegisterController")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private static DAO dao;
    /**
     * @throws Exception 
     * @see HttpServlet#HttpServlet()
     */
    public RegisterController() throws Exception {
        super();
        dao = new DAO();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	   System.out.println("RegisterController.");
		
	   try {
	
		   BeanUser user = new BeanUser();
		   BeanUtils.populate(user, request.getParameterMap());
		
		   if (user.isComplete()) {
			   String query = "INSERT INTO login.taula VALUES ('"+user.getName()+"','"+user.getSurname()+"','"+user.getUsername()+"','"+user.getGender()+"','"+user.getEmail()+"','"+user.getPassword()+"','"+user.getNickname()+"','"+user.getDateofbirth() +"','"+user.getAddress()+"','"+user.getPhonenumber()+"')";
			   System.out.println("Inserting into DB");
			   dao.insertSQL(query);
			   RequestDispatcher dispatcher = request.getRequestDispatcher("ViewLoginForm.jsp");
			   dispatcher.forward(request, response);
		   
		   } 
		   else {
		
			   request.setAttribute("user",user);
			   RequestDispatcher dispatcher = request.getRequestDispatcher("ViewRegisterForm.jsp");
			   dispatcher.forward(request, response);
		   
		   }
	   
	   } catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
	   } catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
