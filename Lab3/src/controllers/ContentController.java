package controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.BeanUser;

/**
 * Servlet implementation class ContentController
 */
@WebServlet("/ContentController")
public class ContentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContentController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		RequestDispatcher dispatcher = null;
		
		BeanUser user = (BeanUser) session.getAttribute("user");
		
		if(user != null ){
			System.out.println("Session user: "+user.getUsername());
			request.setAttribute("user",user);
			String params = "?userProfileUsername="+user.getUsername();
			System.out.println(params);
			dispatcher = request.getRequestDispatcher("/ProfileController"+params);
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
