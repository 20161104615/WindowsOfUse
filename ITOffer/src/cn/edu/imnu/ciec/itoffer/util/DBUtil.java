package cn.edu.imnu.ciec.itoffer.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBUtil {
	static String user = "root";
	static String password = "290013";
	static String dbName = "test";
	static String url = "jdbc:mysql://localhost:3306/orcl?characterEncoding=UTF-8;";
	
	static {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static Connection getConnection() {
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(url,user,password);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}
	public static void closeJDBC(ResultSet rs,Statement stmt,Connection conn) {
		if(rs!=null){
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(stmt!=null){
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(conn!=null){
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	public static void testRun() throws SQLException {
		String sql = "select * from tb_company";
		Connection conn = getConnection();
		Statement stmt = conn.createStatement();
		ResultSet result = stmt.executeQuery(sql);
		
		while(result.next()) {
			System.out.print(result.getString(2)+"   ");
			System.out.print(result.getString(3)+"   ");
			System.out.println(result.getString(4));
		}
	}
public static void main(String[] args) {
		try {
			testRun();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
