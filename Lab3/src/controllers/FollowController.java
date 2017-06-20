package controllers;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import models.BeanTweet;
import models.BeanUser;
import mysql.DAO;

/**
 * Servlet implementation class UserInformationController
 */
@WebServlet("/FollowController")

public class FollowController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	private static DAO dao;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FollowController(){
        super();
        try {
			dao = new DAO();	//Our interface to retrieve data fron DB
		} catch (Exception e) {
			e.printStackTrace();
		}
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			HttpSession session = request.getSession();
			RequestDispatcher dispatcher = null;
			String action = (String)request.getParameter("action");
			int status = 200; 
			String printResponse = "";
			BeanUser user = new BeanUser();
			user = (BeanUser) session.getAttribute("user");
			if(user.getUsername() != null ){	
				//user.loadFromDatabase(user.getUsername()); //load user info
				if(action.equals("getAllUsers")){
					System.out.println("get all Users");
					List<BeanUser> tmp = new ArrayList<BeanUser>();
					try {
						ResultSet rs = dao.getAllUsersUsername();
						while(rs.next()){
							BeanUser b = new BeanUser();
							b.loadFromDatabase(rs.getString("username"));
							tmp.add(b);
						}
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						System.out.println("Error gettin all users");
						e.printStackTrace();
					}
					request.setAttribute("listUsers", tmp);
				}else if(action.equals("getMyFollowers")){
					System.out.println("get my followers users");
					List<BeanUser> tmp = new ArrayList<BeanUser>();
					try {
						ResultSet rs = dao.getMyFollowersUsername(user.getUsername());
						while(rs.next()){
							BeanUser b = new BeanUser();
							b.loadFromDatabase(rs.getString("followed"));
							tmp.add(b);
						}
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						System.out.println("Error gettin all users");
						e.printStackTrace();
					}
					request.setAttribute("listUsers", tmp);
				}
				dispatcher = request.getRequestDispatcher("ViewUsers.jsp");
			}else{
				status = 401;
				dispatcher = request.getRequestDispatcher("LoginController");
			}
			request.setAttribute("user", user);
			if(printResponse != "")
				response.getWriter().print(printResponse);
			response.setStatus(status);
			dispatcher.forward(request, response);
			

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//doGet(request, response);

	}

}
