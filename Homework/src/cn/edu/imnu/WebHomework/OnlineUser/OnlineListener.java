package cn.edu.imnu.WebHomework.OnlineUser;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;


public class OnlineListener{
	private String user;
	private HttpServletRequest request;
	private static OnlineUserSet UserSet = OnlineUserSet.GetSet();
	
	public OnlineListener(){
		user = "";
	}
	
	//设置监听对象
	public void SetUser(String user){
		this.user = user;
	}
	
	//获取在线监听对象
	public String GetUser(){
		return this.user;
	}
	
	//会话创建时的处理
	public void sessionCreated(HttpSessionEvent arg0) {
		user = request.getParameter("txt");
		UserSet.AddUser(user);
	}

	//会话撤销时的处理
	public void sessionDestroyed(HttpSessionEvent arg0) {
		UserSet.RemUser(user);
	}
	
	//获得用户数量的计数
	public long GetCount(){
		return UserSet.GetCounter();
	}
}