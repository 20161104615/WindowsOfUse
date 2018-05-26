package JavaBean;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.PrintWriter;
import java.sql.*;

public class DB_Conn{
	private String driverName = "com.mysql.jdbc.Driver";
	private String userName = "root";
	private String userPwd = "290013";
	private String dbName = "test";
	private String tableName = "UserName";
	
	private String url = "jdbc:mysql://localhost/"+dbName+"?user="+userName+"&password="+userPwd;
	
	private Statement sm = null;
	private PrintWriter out = null;
	
	public void ConnectDB(){
		try{
			Class.forName("com.mysql.jdbc.Driver").newInstance();//实例化
			java.sql.Connection conn = DriverManager.getConnection(url);//连接数据库
			sm = conn.createStatement();
		}
		catch(Exception e){
			e.printStackTrace();
			out.println("连接数据库失败");
		}
	}
	
	public void CloseDB(){
		try{
			if (sm != null){
				sm.close();
			}
			java.sql.Connection conn = null;
			conn.close();
		}
		catch (SQLException SqlE){
			SqlE.printStackTrace();
			out.println("数据库关闭");
		}
	}
}