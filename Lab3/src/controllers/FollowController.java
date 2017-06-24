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
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FollowController(){

    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		String action = (String)request.getParameter("action");
		String target_user = (String)request.getParameter("username");
		int status = 200; 
		
		BeanUser user = new BeanUser();
		user = (BeanUser) session.getAttribute("user");
		if(user != null && target_user != null){

			if(action.equals("followUser")){
				System.out.println("posting follow to " + target_user);
				if(!user.followUser(target_user)){
					status = 500;
					System.out.println("ERROR FOLLOWING USER "+target_user);
				}
				
			}else if(action.compareTo("unFollow") == 0){
				System.out.println("posting follow to " + target_user);
				if(!user.unFollowUser(target_user)){
					status = 500;
					System.out.println("ERROR FOLLOWING USER "+target_user);
				}
			}else{
				System.out.println("invalid action " + action);
			}
		}else{
			status = 401;
		}

	}

}
