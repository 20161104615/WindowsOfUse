<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mysql.jdbc.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TEST</title>
</head>
<body>
<%
	String driverName = "com.mysql.jdbc.Driver";
	String userName = "root";
	String userPwd = "290013";
	String dbName = "test";
	String tableName = "UserName";
	
	String url = "jdbc:mysql://localhost/"+dbName+"?user="+userName+"&password="+userPwd;
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	java.sql.Connection conn = DriverManager.getConnection(url);
	out.print("连接数据库成功");
%>

<% 
	String sql = "select * from UserName";
	java.sql.Statement statement = conn.createStatement();
	java.sql.ResultSet result = statement.executeQuery(sql);
	
	while(result.next()) {
		System.out.print(result.getString(1)+"   ");
		System.out.print(result.getString(2)+"   ");
	}
%>
</body>
</html>