package cn.edu.imnu.WebHomework.UserDao.dao;

import cn.edu.imnu.WebHomework.util.DBUtil;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.Date;

import org.omg.CORBA.Request;

public class UserDao {
	ResultSet rs = null;

	public boolean isExistid(String id) {
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM user WHERE userID=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next())
				return true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeJDBC(rs, pstmt, conn);
		}
		return false;
	}

	public boolean login(String name, String password) {
		boolean userExist = false;
		try {
			Connection conn = DBUtil.getConnection();
			Statement stmt = conn.createStatement();
			String sql = "select * from user where userName='" + name + "' and userPassword='" + password + "'";
			// 建立查找用户名和密码的SQL语句
			rs = stmt.executeQuery(sql);
			// 执行该SQL语句，运回ResultSet对象
			if (rs.next())// 分析ResultSet对象，确定用户是否存在
			{
				userExist = true;
				conn.close();
			}
			return userExist;

		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean checkname(String name) {
		boolean userExist = false;
		if (name == null) {
			return false;
		} else {
			try {
				Connection conn = DBUtil.getConnection();
				Statement stmt = conn.createStatement();
				String sql = "select * from user where userName='" + name + "'";
				// 建立查找用户名和ID的SQL语句
				rs = stmt.executeQuery(sql);
				// 执行该SQL语句，运回ResultSet对象
				if (rs.next())// 分析ResultSet对象，确定用户是否存在
				{
					userExist = true;
					conn.close();
				}
				return userExist;

			} catch (SQLException e) {
				e.printStackTrace();
				return false;
			}
		}

	}
	public boolean checkuserID(String userID) {
		boolean userExist = false;
		if (userID == null) {
			return false;
		} else {
			try {
				Connection conn = DBUtil.getConnection();
				Statement stmt = conn.createStatement();
				String sql = "select * from user where userID='" + userID + "'";
				// 建立查找用户名和ID的SQL语句
				rs = stmt.executeQuery(sql);
				// 执行该SQL语句，运回ResultSet对象
				if (rs.next())// 分析ResultSet对象，确定用户是否存在
				{
					userExist = true;
					conn.close();
				}
				return userExist;

			} catch (SQLException e) {
				e.printStackTrace();
				return false;
			}
		}

	}

	public void add(String name, String password,String userID) {// 添加用户
		try {
			Connection conn = DBUtil.getConnection();
			String sql = "insert into user(userName,userPassword,userID) values(?,?,?)";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, name);
			stmt.setString(2, password);
			stmt.setString(3, userID);
			stmt.executeUpdate();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error.");
		}

	}

	public boolean isExistResume(int applicantID) {
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM user WHERE userID=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, applicantID);
			rs = pstmt.executeQuery();
			if (rs.next())
				return true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeJDBC(rs, pstmt, conn);
		}
		return false;
	}

	// 处理中文转码
	public static String change(String str) {
		try {
			byte[] byteStr = str.getBytes("ISO-8859-1");
			return new String(byteStr, "GBK");
		} catch (Exception e) {
			return str;
		}
	}

}
