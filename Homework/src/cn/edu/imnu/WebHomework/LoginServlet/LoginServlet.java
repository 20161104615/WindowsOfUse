package cn.edu.imnu.WebHomework.LoginServlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String name = request.getParameter("UserName");// 获取当前登陆页输入的用户名
		String password = request.getParameter("Password");// 获取当前登陆页面输入的 密码
		
		UserDao dao = new UserDao();
		boolean flag = dao.isExistName(name);
		
		if (flag){
			out.print("<script type='text/javascript'>");
			out.print("alert('账号已经被注册，请重新输入！');");
			out.print("windows.location='register.jsp';");
			out.print("</script>");
		}else {
			dao.save(name,password);
			response.sendRedirect("/mainpage/index.html");
		}
		/*
		response.setContentType("text/html;charset=UTF-8");
		
		HttpSession session = request.getSession();
		//获取请求数据
		String username = request.getParameter("UserName");
		String password = request.getParameter("Password");

		if (username.equals("root") && password.equals("290013")) {
			response.sendRedirect("/Homework/mainpage/index.html");
		} else {
			response.sendRedirect("login.jsp");
		}*/
	}
}
