<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>当前订单</title>
</head>
<%
	String logname = (String) session.getAttribute("logname");
	if (logname != null) {
		//int m = logname.undexOf(",");
		//logname = logname.substring(0, m);
%> 
<previewOrderForm:PreviewOrderForm logname="<%=logname%>" />
<HTML>

</HTML>
<body>
	<center>
		<h3>单击提交订单</h3>
		<form action="makeBookForm.jsp">
			<input type=hidden name="confirm" value="buy"> <input
				type=hidden name="orderContent" value="giveResuit"> <input
				type=hidden name="totalPrice" value="totalPrice">
			<center>
				<input type=submit name="g" value="提交订单 ">
			</center>
		</form>
		订单信息:<br>
		<table border=2>
			<tr>
				<th>订购信息</th>
				<th>总价格</th>
			</tr>
			<tr>
				<td>totalPrice</td>
				<td>totalPrice</td>
			</tr>
		</table>
	</center>
</body>
</html>
<%
	} else {

		response.sendRedirect("login.jsp");
	}
%>


