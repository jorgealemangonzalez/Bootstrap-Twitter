
package defaultPackage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class myServlet
 */
@WebServlet("/myServlet")
public class myServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static DAO dao;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public myServlet() {
        super();
        try {
			dao = new DAO();	//Our interface to retrieve data fron DB
		} catch (Exception e) {
			e.printStackTrace();
		}
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("GET on URL: /myServlet");
		//Get the database info
		String dataTable = "";
		try {
			ResultSet resultDB = dao.executeSQL("SELECT * FROM ts1.taula;");	//Select all rows from our table
			
			while (resultDB.next()) {
				dataTable += "<tr>";
				
				//Retrieve all columns
		        String nom = (String) resultDB.getObject("nom");
		        String descripcio = (String) resultDB.getObject("descripcio");
		        String id = ((Integer) resultDB.getObject("id")).toString();
		        String telefon = ((Integer) resultDB.getObject("telefon")).toString();
		        
		        dataTable += "<td>" + nom + "</td>"+ "<td>" + descripcio + "</td>" + "<td>" 
		        					+ id + "</td>" + "<td>" + telefon + "</td>";
			    dataTable += "</tr>";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		

		//Print the HTML page
		PrintWriter out = response.getWriter();
		String title = "Our SQL Database";
		out.println
			("<body>\n" +
			"<h1>" + title + "</h1>\n" +
			"<table style=\"width:80%\">" +
			"<tr> <th>Nom</th> <th>Descripcio</th> <th>Id</th> <th>Telefon</th> </tr>" +
			 dataTable + 
			"</table>"+
			"<table style='border: 1px solid black;'>" );
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
