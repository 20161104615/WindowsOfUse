package cn.edu.imnu.WebHomework.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;




public class DBUtil {

	static String user = "root";
	static String password = "root";
	static String dbName = "javaweb";
	static String url = "jdbc:mysql://localhost/"+dbName+"?user="+user+"&password="+password;
	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	static {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	public static Connection getConnection() {
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(url, user, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (conn != null){
			System.out.println("连接正常");
		} else {
			System.out.println("连接异常");
		}

		return conn;
	}

	public static void closeJDBC(ResultSet rs, Statement stmt, Connection conn) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (stmt != null) {
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
