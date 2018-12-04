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
	<h2> THESSOK :: Search Result </h2>
	<%
	String url = "jdbc:mysql://localhost:3306/thessok?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false";
	String user="thessok";
	String pass="comp322";
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(url,user,pass);
	// select p.name,p.price,p.importer,p.expiration_date,p.date_of_man,s.name from product p,shop s where p.shop_num=s.shop_num and p.shop_stock>0 and p.name like '%쌀%';
	
	String query = "select p.name,p.price,p.importer,p.expiration_date,p.date_of_man,s.name from product p,shop s where p.shop_num=s.shop_num and p.shop_stock>0 and p.name like '%"
			+request.getParameter("keyword")
			+"%'";
	
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
		out.println("<td>"+rs.getString(1)+"</td>");
		out.println("<td>"+rs.getInt(2)+"</td>");
		out.println("<td>"+rs.getString(3)+"</td>");
		out.println("<td>"+rs.getString(4)+"</td>");
		out.println("<td>"+rs.getString(5)+"</td>");
		out.println("<td>"+rs.getString(6)+"</td>");
		out.println("</tr>");
	}
	out.println("<table/>");
	%>

<h6>Do you want to look around more?</h6>
<button type="button" onclick="location.href='category.html' ">I want to see more</button>
</body>
</html>