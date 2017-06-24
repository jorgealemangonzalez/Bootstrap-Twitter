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

import models.BeanUser;
/**
 * Servlet implementation class UserInformationController
 */
@WebServlet("/UserListController")

public class UserListController extends HttpServlet{
	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserListController(){
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = (String) request.getParameter("action");
		if(action == null || action.length() == 0)
			action = "allUsers";
		int status = 200;
		String lastAction = action;
		System.out.println("User list... "+action);
		HttpSession session = request.getSession();
		BeanUser user = (BeanUser) session.getAttribute("user");
		RequestDispatcher dispatcher = request.getRequestDispatcher("ViewUserList.jsp");
		List<BeanUser> users = new ArrayList<BeanUser>();
		
		if(action.equals("allUsers")){
			System.out.println("Get all users");
			users = BeanUser.loadAllUsersFromDatabase();
			if(user != null)
				users.removeIf(user.isSameUser());
		}else if(action.equals("getMyFollowers") && user != null){
			System.out.println("get my followers users");
			for(String username : user.getFollowers()){
				BeanUser follower = new BeanUser();
				follower.loadFromDatabase(username);
				users.add(follower);
			}
		}else if(action.equals("getMyFollowing") && user != null){
			System.out.println("get my following users");
			for(String username : user.getFollowing()){
				BeanUser following = new BeanUser();
				following.loadFromDatabase(username);
				users.add(following);
			}
		}else{
			System.out.println("La accion no coincide" + action);
			status = 401;
		}

		request.setAttribute("users", users);
		request.setAttribute("lastAction", lastAction);
		request.setAttribute("user",user);
		response.setStatus(200);
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}