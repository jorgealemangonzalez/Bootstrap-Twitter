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
import mysql.DAO;

/**
 * Servlet implementation class UserInformationController
 */
@WebServlet("/TweetsController")

public class TweetsController extends HttpServlet{
	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TweetsController(){
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			HttpSession session = request.getSession();
			System.out.println("All Tweets of ");
			RequestDispatcher dispatcher = null;
			
			BeanTweet bTweet = new BeanTweet();
			if(session.getAttribute("username") != null && (!bTweet.loadAllTweetsFromDB().isEmpty()) ){
				
				dispatcher = request.getRequestDispatcher("AllTweetsFile.jsp");
			}else{
				dispatcher = request.getRequestDispatcher("LoginController");
			}
			
			dispatcher.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}