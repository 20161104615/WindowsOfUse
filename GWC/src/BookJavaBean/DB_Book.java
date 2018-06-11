package BookJavaBean;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.imnu.WebHomework.util.DBUtil;

public class DB_Book{
	// 创建公共数据库连接对象
	Connection db_conn = DBUtil.getConnection();
	
}