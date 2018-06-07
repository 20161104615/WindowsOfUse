package UserJavaBean;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

public class User{
	//构造函数
	public User(){};
	
	//成员变量
	private String userID;
	private String userName;
	private String userPassword;
	
	//成员函数
	public String getuserID(){
		return userID;
	}
	public void setuserID(String userID){
		this.userID = userID;
	}
	public String getuserName(){
		return userName;
	}
	public void setuserName(String userName) {
		this.userName = userName;
	}
	public String getuserPassword(){
		return userPassword;
	}
	public void setuserPassword(String userPassword){
		this.userPassword = userPassword;
	}
}