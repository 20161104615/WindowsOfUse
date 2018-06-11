package BookJavaBean;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Book{
	//构造函数
	public Book(){
		
	}
	//成员变量
	private String bookNamel;
	private String bookPress;
	private double bookPrive;
	private String bookAbstract;
	private String bookID;
	//成员函数
	public String getBookID() {
		return bookID;
	}
	public void setBookID(String bookID) {
		this.bookID = bookID;
	}
	public String getBookNamel() {
		return bookNamel;
	}
	public void setBookNamel(String bookNamel) {
		this.bookNamel = bookNamel;
	}
	public String getBookPress() {
		return bookPress;
	}
	public void setBookPress(String bookPress) {
		this.bookPress = bookPress;
	}
	public double getBookPrive() {
		return bookPrive;
	}
	public void setBookPrive(double bookPrive) {
		this.bookPrive = bookPrive;
	}
	public String getBookAbstract() {
		return bookAbstract;
	}
	public void setBookAbstract(String bookAbstract) {
		this.bookAbstract = bookAbstract;
	}
	
}