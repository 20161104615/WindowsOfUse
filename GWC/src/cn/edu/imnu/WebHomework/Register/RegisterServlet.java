package cn.edu.imnu.WebHomework.Register;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import UserJavaBean.DB_User;
import UserJavaBean.User;
import cn.edu.imnu.WebHomework.UserDao.dao.UserDao;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RegisterServlet() {
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

		// 获取请求数据
		String username = request.getParameter("UserName");
		String password_Fir = request.getParameter("Password_Fir");
		String userID = request.getParameter("UserID");
		
		User user = new User();
		DB_User db_user = new DB_User();
		
		user.setuserName(username);
		user.setuserPassword(password_Fir);
		user.setuserID(userID);
		
		boolean applicant1 = db_user.checkname(user);
		boolean applicant2 = db_user.checkid(user);
		if (applicant1 == true || applicant2 == true){
			out.print("<script type='text/javascript'>");
			out.print("alert('用户名、ID已被注册或不合法');");
			out.print("window.location='register.jsp';");
			out.print("</script>");
		} else {
			db_user.add(user);
			out.print("<script type='text/javascript'>");
			out.print("alert('注册成功');");
			out.print("window.location.href ='http://localhost:8080/GWC/mainpage/index.jsp';");
			out.print("</script>");
		}
		/*UserDao dao = new UserDao();
		boolean applicant1 = dao.checkname(username);
		boolean applicant2 = dao.checkuserID(userID);
		try {
			if (applicant1 == true || applicant2 == true) {
				out.print("<script type='text/javascript'>");
				out.print("alert('用户名、ID已被注册或不合法');");
				out.print("window.location='register.jsp';");
				out.print("</script>");

			} else {
				dao.add(username, password_Fir,userID);
				out.print("<script type='text/javascript'>");
				out.print("alert('注册成功');");
				out.print("window.location.href ='http://localhost:8080/GWC/mainpage/index.jsp';");
				out.print("</script>");
			}
		} catch (Exception e) {
			out.println("Error.");
		}
		*/

	}

}
