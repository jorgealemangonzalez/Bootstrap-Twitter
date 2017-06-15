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
 * Servlet implementation class EditProfileController
 */
@WebServlet("/EditProfileController")
public class EditProfileController extends HttpServlet{
	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditProfileController(){
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher dispatcher = null;
		HttpSession session = request.getSession();
		BeanUser user = (BeanUser) session.getAttribute("user");
		if(user != null){
			request.setAttribute("user",user);

		}
		dispatcher = request.getRequestDispatcher("ViewEditProfile.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("EDIT PROFILE__");
		BeanUser user = new BeanUser();
	    try {
			BeanUtils.populate(user, request.getParameterMap());
			user.update();
			HttpSession session = request.getSession();
			session.setAttribute("user",user);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
