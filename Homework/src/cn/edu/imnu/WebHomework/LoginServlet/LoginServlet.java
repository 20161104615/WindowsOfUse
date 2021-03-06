package cn.edu.imnu.WebHomework.LoginServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.imnu.WebHomework.UserDao.dao.UserDao;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		String Name = request.getParameter("UserName");// 获取当前登陆页输入的用户名
		String Password = request.getParameter("Password");// 获取当前登陆页面输入的 密码֤
		//访问登陆页面之前所访问的页面
		String returnUri = request.getParameter("return_Uri");
		UserDao dao = new UserDao();
		boolean applicantID = dao.login(Name, Password);

		try {
			if (applicantID == true) {
				out.print("<script type='text/javascript'>");
				out.print("alert('登陆成功');");
				out.print("</script>");
				response.sendRedirect("/Homework/mainpage/index.jsp");
			} else {
				out.print("<script type='text/javascript'>");
				out.print("alert('用户名或密码错误，请重新输入');");
				out.print("window.location='login.jsp';");
				out.print("</script>");
			}
		} catch (Exception e) {
			out.println("Error.");
		}

	}
}
