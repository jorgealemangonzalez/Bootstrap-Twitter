
package defaultPackage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
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
			dao = new DAO();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Get the database info
		ResultSet resultDB = null;
		try {
			resultDB = dao.executeSQL("SELECT * FROM ts1.taula;");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.print(resultDB);
	
		ResultSetMetaData rsmd = null ;
		try {
			rsmd = resultDB.getMetaData();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int columnsNumber = 0;
		try {
			columnsNumber = rsmd.getColumnCount();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		String resultToPrint = "";
		try {
			while (resultDB.next()) {
				resultToPrint += "<tr>";
			    for (int i = 1; i <= columnsNumber; i++) {
			        String columnValue = resultDB.getString(i);
			        resultToPrint += "<td>" + columnValue + "</td>";
			    }
			    resultToPrint += "</tr>";//\n";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		PrintWriter out = response.getWriter();
		String title = "Our SQL Database";
		out.println
			("<body>\n" +
			"<h1>" + title + "</h1>\n" +
			"<table style=\"width:80%\">" +
			"<tr> <th>Nom</th> <th>Descripcio</th> <th>Id</th> <th>Telefon</th> </tr>" +
			 resultToPrint + 
			"</table>"+
			"<table style='border: 1px solid black;'>" );
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
