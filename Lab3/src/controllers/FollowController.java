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
			List<BeanUser> tmp = new ArrayList<BeanUser>();
			if(user.getUsername() != " "){	
				user.loadFromDatabase(user.getUsername()); //load user info
				if(action.compareTo("getAllUsers") == 0){
					System.out.println("get all Users");
					tmp.clear();
					try {
						tmp = user.getAllUsers();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}else if(action.compareTo("getMyFollowers") == 0){
					System.out.println("get my followers users");
					tmp.clear();
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
				}else{
					System.out.println("nada de action" + action);
				}
				request.setAttribute("listUsers", tmp);
				dispatcher = request.getRequestDispatcher("ViewUsers.jsp");
			}else{
				status = 401;
				dispatcher = request.getRequestDispatcher("LoginController");
			}
			request.setAttribute("action", action);
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

		//TODO important
		/*
		cuando hacemos follow o unfollow, no he sabido como coger el username del bucle en el html, he intentado en cada id
		añadirle el numero de iteracion que lleva, pero esto me obliga a crear en el javascript tanto listeners al click de ese id como usuarios haya
		tal como esta ahora, solo coge al primer usuario y luego te deja coger el segundo,....
		*/
		HttpSession session = request.getSession();
		RequestDispatcher dispatcher = null;
		String action = (String)request.getParameter("action");
		String followed = (String)request.getParameter("username");
		int status = 200; 
		String printResponse = "";
		BeanUser user = new BeanUser();
		user = (BeanUser) session.getAttribute("user");
		if(user.getUsername() != null){
			user.loadFromDatabase(user.getUsername()); //load user info
			if(action.equals("followUser")){
				System.out.println("posting follow to " + followed);
				try {
					dao.postFollower(user.getUsername(), followed);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					status = 401;
				}
			}else if(action.compareTo("unFollow") == 0){
				System.out.println("deleting from db");
				try {
					if(dao.deleteFollow(user.getUsername(), followed) == 0){
						System.out.println("problem deleting mysql");
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}else{
				System.out.println("invalid action " + action);
			}
		}else{
			status = 401;
			dispatcher = request.getRequestDispatcher("LoginController");
		}
		List<BeanUser> tmp = new ArrayList<BeanUser>();
		try {
			tmp = user.getAllUsers();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		dispatcher = request.getRequestDispatcher("ViewUsers.jsp");
		request.setAttribute("action", action);
		request.setAttribute("user", user);
		request.setAttribute("listUsers", tmp);
		if(printResponse != "")
			response.getWriter().print(printResponse);
		response.setStatus(status);
		dispatcher.forward(request, response);

	}

}
