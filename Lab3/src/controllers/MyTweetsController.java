package controllers;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import models.BeanUser;
import mysql.DAO;

/**
 * Servlet implementation class UserInformationController
 */
@WebServlet("/MyTweetsController")

public class MyTweetsController extends HttpServlet{
	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyTweetsController(){
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			HttpSession session = request.getSession();
			System.out.println("My Tweets of "+ session.getAttribute("username"));
			RequestDispatcher dispatcher = null;
			
			BeanUser user = new BeanUser();
			if(session.getAttribute("username") != null && user.loadUserTweetsFromDB((String) session.getAttribute("username"))){
				
				request.setAttribute("user",user);
				dispatcher = request.getRequestDispatcher("TweetFile.jsp");
			}else{
				dispatcher = request.getRequestDispatcher("LoginController");
			}
			
			dispatcher.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = (String)request.getParameter("action");
		int status = 200;
		String printResponse = "";
		if(action.equals("likeTweet")){
			HttpSession session = request.getSession();
			String username = (String) session.getAttribute("username");
			//TODO sacar parametros de la request y mandar a DB
			if(username != null){
				BeanUser user = new BeanUser();
				user.loadFromDatabase(username);
				
			}else{
				printResponse = "You must be logged in to publish tweet";
				status = 401;
			}
		}else if(action.equals("publishTweet")){
			
		}else{
			printResponse = "You must specify the action (likeTweet,publishTweet)";
			status = 400;
		}
		if(printResponse != "")
			response.getWriter().print(printResponse);
		response.setStatus(status);
	}

}