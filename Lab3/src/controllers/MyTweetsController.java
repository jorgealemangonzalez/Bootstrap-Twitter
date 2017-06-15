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

import models.BeanTweet;
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
			
			RequestDispatcher dispatcher = null;
	
			
			String action = (String)request.getParameter("action");
			int status = 200;
			String printResponse = "";
			HttpSession session = request.getSession();
			String username = (String) session.getAttribute("username");
			if(action.equals("getUserTweets")){
				System.out.println("doGet of mytweets");
				if(username == null){
					printResponse = "You must be logged in to view your tweets";
					status = 401;
					dispatcher = request.getRequestDispatcher("LoginController");
					return;
				}
				BeanUser user = new BeanUser();
				user.loadFromDatabase(username);
				if(user.loadUserTweetsFromDB()){
					printResponse = "user loaded";
					request.setAttribute("user",user);
				}
				dispatcher = request.getRequestDispatcher("TweetFile.jsp");
			}else if(action.equals("getAllTweets")){
				System.out.println("getting all tweets");
				printResponse = "tweets loaded";
				dispatcher = request.getRequestDispatcher("AllTweetsFile.jsp");
			}
			if(printResponse != "")
				response.getWriter().print(printResponse);
			response.setStatus(status);
			dispatcher.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = (String)request.getParameter("action");
		System.out.println("doPost of mytweets");
		RequestDispatcher dispatcher = null;
		int status = 200;
		String printResponse = "";
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");

		if(action.equals("likeTweet")){
			//TODO sacar parametros de la request y mandar a DB
			if(username != null){
				BeanUser user = new BeanUser();
				user.loadFromDatabase(username);
				dispatcher = request.getRequestDispatcher("AllTweetsFile.jsp");
				dispatcher.forward(request, response);
			}else{
				printResponse = "You must be logged in to like a tweet";
				status = 401;
			}
		}else if(action.equals("publishTweet")){
			System.out.println("publish twe");
			if(username == null){
				printResponse = "You must be logged in to publish tweet";
				status = 401;
				return;
			}
			BeanTweet tweet = new BeanTweet();
			//TODO correct date!
			tweet.setDate("1999-9-9");
			tweet.setTweet_text(request.getParameter("tweet_text"));
			tweet.setUsername(username);
			if(tweet.publish())
				printResponse = "Tweet published";
		}else{
			printResponse = "You must specify the action (likeTweet,publishTweet)";
			status = 400;
		}
		if(printResponse != "")
			response.getWriter().print(printResponse);
		response.setStatus(status);
		
		
	}

}