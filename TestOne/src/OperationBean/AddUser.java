package OperationBean;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import JavaBean.DB_Conn;
import cn.edu.imnu.TestOne.JavaBean.User;

public class AddUser{
	DB_Conn db_conn = new DB_Conn();
	public int add(User user){
		db_conn.ConnectDB();
		try{
			String sql = "insert into userinfo(UserName,Pwd,Email,Selfintro) values('"+user.getUsername()
			+"','"+
					
		}
	}
}