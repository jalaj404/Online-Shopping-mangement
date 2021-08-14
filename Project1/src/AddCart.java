

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddCart
 */
@WebServlet("/AddCart")
public class AddCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		String name=request.getParameter("name");
		String price=request.getParameter("price");
		String cat=request.getParameter("cat");
		String cmp=request.getParameter("cmp");
		String email=request.getParameter("email");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/pp","root","root");
			String qr="insert into cart values(?,?,?,?,?)";
			PreparedStatement ps=con.prepareStatement(qr);
			ps.setString(1, name);
			ps.setString(2, price);
			ps.setString(3, cat);
			ps.setString(4, cmp);
			ps.setString(5, email);
			int i=ps.executeUpdate();
			RequestDispatcher rd=request.getRequestDispatcher("Uhome.jsp");
			if(i>0)
			{
				rd.include(request, response);
				out.println("<script>window.alert('successfully added to cart');</script>");
			}
			else
			{
				rd.include(request, response);
				out.println("<script>window.alert('not added to cart');</script>");
			}
		} catch (Exception e) {
			out.println(e);
		}

	}

}
