package UserJavaBean;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.sql.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.*;
import com.mysql.jdbc.*;
import com.mysql.jdbc.Statement;

import cn.edu.imnu.WebHomework.util.DBUtil;

public class DB_User {
	// 创建公共数据库连接对象
	Connection db_conn = DBUtil.getConnection();

	// 用户登陆
	public boolean login(String name, String password) {
		boolean y = false;
		try {
			String sql = "select * from user where userName='" + name + "' and userPassword='" + password + "'";
			java.sql.Statement stmt = db_conn.createStatement();
			java.sql.ResultSet rs = stmt.executeQuery(sql);
			if (rs.next()){
				y = true;
				db_conn.close();
			}
			return y;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return y;
		}
	}
	
	//检测用户是否存在
	public boolean checkname(User user){
		boolean y = false;
		String sql = "select * from user where userName='" +user.getuserName()+ "'";
		java.sql.Statement stmt;
		try {
			stmt = db_conn.createStatement();
			java.sql.ResultSet rs = stmt.executeQuery(sql);
			if (rs.next()){
				y = true;
				db_conn.close();
			}
			return y;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return y;
		}
	}
	public boolean checkid(User user){
		boolean y = false;
		String sql = "select * from user where userID='" +user.getuserID()+ "'";
		java.sql.Statement stmt;
		try {
			stmt = db_conn.createStatement();
			java.sql.ResultSet rs = stmt.executeQuery(sql);
			if (rs.next()){
				y = true;
				db_conn.close();
			}
			return y;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return y;
		}
	}
	
	// 添加注册用户
	public boolean add(User user) {
		try {
			String sql = "insert into user(userName,userPassword,userID) values(?,?,?)";
			PreparedStatement stmt = db_conn.prepareStatement(sql);
			stmt.setString(1, user.getuserName());
			stmt.setString(2, user.getuserPassword());
			stmt.setString(3, user.getuserID());
			stmt.executeUpdate();
			db_conn.close();
			return true;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error.");
			return false;
		}
	}

	// 修改用户信息
	public boolean update(User user) {
		try {
			String sql = "update user set userName=?,userPassword=? where userID='" + user.getuserID() + "'";
			PreparedStatement stmt = db_conn.prepareStatement(sql);
			stmt.setString(1, user.getuserName());
			stmt.setString(2, user.getuserPassword());
			stmt.executeUpdate();
			db_conn.close();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Error.");
			return false;
		}
	}

	// 删除用户信息
	public boolean deleteUser(User user) throws SQLException {
		boolean y = false;
		String sql = "delete from user where userName='" + user.getuserName() + "'";
		java.sql.Statement stmt = db_conn.createStatement();
		java.sql.ResultSet rs = stmt.executeQuery(sql);
		if (rs != null) {
			stmt.executeUpdate(sql);
			y = true;
			db_conn.close();
			return y;
		} else {
			stmt.executeUpdate(sql);
			db_conn.close();
			return y;
		}
	}

	// 查询用户
	public User get(String username) {
		String sql = "select userName from user where userName='" + username + "'";
		java.sql.Statement stmt;
		try {
			stmt = db_conn.createStatement();
			java.sql.ResultSet rs = stmt.executeQuery(sql);
			User user = null;
			if (rs.next()) {
				user = new User();
				user.setuserName(rs.getString("userName"));
				user.setuserPassword(rs.getString("userPassword"));
				user.setuserID(rs.getString("userID"));
			}
			stmt.executeUpdate(sql);
			db_conn.close();
			return user;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	//打印个人信息
	public void outputName(User user){
		System.out.println(user.getuserName());
	}
	public void outputPassword(User user){
		System.out.println(user.getuserPassword());
	}
	public void outputID(User user){
		System.out.println(user.getuserID());
	}
	
}