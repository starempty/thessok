<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.text.*,java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TheSSOK::The Best Shopping_mall</title>
</head>
<body>
	<h2> THESSOK :: REVENUE </h2>
	<%
	String url = "jdbc:mysql://localhost:3306/thessok?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false";
	String user="thessok";
	String pass="comp322";
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(url,user,pass);
	// select sum(price) from orders,shopping_cart,product 
	// where r_purchase_num=purchase_num and s_product_num=product_num and customer_num=cus_num;
	
	String query = "select sum(price) as '"
			+request.getParameter("date")
			+" sum' from orders,shopping_cart,product where r_purchase_num=purchase_num and s_product_num=product_num and customer_num=cus_num and date like '"
			+request.getParameter("date")+"'";
	
	pstmt = conn.prepareStatement(query);
	rs=pstmt.executeQuery();
	
	out.println("<table border=\"1\">");
	ResultSetMetaData rsmd = rs.getMetaData();
	int cnt = rsmd.getColumnCount();
	for(int i=1;i<=cnt;i++){
		out.println("<th>"+rsmd.getColumnName(i)+"</th>");
	}
	while(rs.next()){
		out.println("<tr>");
		out.println("<td>"+rs.getInt(1)+"</td>");
		out.println("</tr>");
	}
	out.println("<table/>");
	%>

<h6>Do you want to check another month too?</h6>
<button type="button" onclick="location.href='administrator.html' ">Other month?</button>
</br>
<h6>Do you want to check total sum??</h6>
<button type="button" onclick="location.href='admin_total.jsp' ">Total sum</button>
</br>
<h6>Do you want to check daily sum??</h6>
<button type="button" onclick="location.href='admin_date.html' ">daily sum</button>
</br>
</body>
</html>