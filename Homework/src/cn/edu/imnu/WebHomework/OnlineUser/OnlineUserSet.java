package cn.edu.imnu.WebHomework.OnlineUser;


import java.util.Vector;


public class OnlineUserSet{
	private Vector Container;
	private static OnlineUserSet UserSet = new OnlineUserSet();
	
	private OnlineUserSet(){
		Container = new Vector();
	}
	
	public static OnlineUserSet GetSet(){
		return UserSet;
	}
	
	//有用户登陆时，在容器中增加用户信息
	public void AddUser(String user){
		if (user != null){
			Container.addElement(user);
		}
	}
	
	//有用户下线时，在容器中删除该用户信息
	public void RemUser(String user){
		if (user != null){
			Container.removeElement(user);
		}
	}
	
	//返回在线用户的数量
	public long GetCounter(){
		return Container.size();
	}
	
	//获得容器
	public Vector GetVector(){
		return Container;
	}
}