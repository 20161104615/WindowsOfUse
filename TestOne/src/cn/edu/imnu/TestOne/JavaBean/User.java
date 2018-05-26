package cn.edu.imnu.TestOne.JavaBean;
import java.util.StringTokenizer;

public class User{
	//构造函数
	public User(){}
	//成员变量
	private int id;
	private String username;
	private String password;
	private String selfintro;
	//成员函数
	public int getID(){
		return id;
	}
	public void setID(){
		this.id = id;
	}
	public String getUsername(){
		return username;
	}
	public void setUsername(){
		this.username = username;
	}
	public String getPW(){
		return password;
	}
	public void setPW(){
		this.password = password;
	}
	public String getHobby(){
		StringTokenizer st = new StringTokenizer(getHobby(),"@");
		StringBuffer sb = new StringBuffer();
		while (st.hasMoreElements()){
			switch ((Integer.parseInt(st.nextElement().toString()))){
			case 1:
				sb.append("计算机编程");
				break;
			case 2:
				sb.append("阅读书籍");
				break;
			case 3:
				sb.append("网上冲浪");
				break;
			case 4:
				sb.append("电脑游戏");
				break;
			}
		}
		return sb.toString();
	}
	public String getSelfintro(){
		return selfintro;
	}
	public void setSelfintro(){
		this.selfintro = selfintro;
	}
}