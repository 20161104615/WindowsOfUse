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
	private String userSex;
	private String userMailbox;
	private String userContantInformation;
	private String userAddress;
	
	//成员函数
	//ID
	public String getuserID(){
		return userID;
	}
	public void setuserID(String userID){
		this.userID = userID;
	}
	//Name
	public String getuserName(){
		return userName;
	}
	public void setuserName(String userName) {
		this.userName = userName;
	}
	//Password
	public String getuserPassword(){
		return userPassword;
	}
	public void setuserPassword(String userPassword){
		this.userPassword = userPassword;
	}
	//Sex
	public String getuserSex(){
		return userSex;
	}
	public void setuserSex(String userSex){
		this.userSex = userSex;
	}
	//Mailbox
	public String getuserMailbox(){
		return userMailbox;
	}
	public void setuserMailbox(String userMailbox){
		this.userMailbox = userMailbox;
	}
	//ContantInformation
	public String getuserContantInformation(){
		return userContantInformation;
	}
	public void setuserContantInformation(String userContantInformation){
		this.userContantInformation = userContantInformation;
	}
	//Address
	public String getuserAddress(){
		return userAddress;
	}
	public void setuserAddress(String userAddress){
		this.userAddress = userAddress;
	}
}