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
	String shop;
	ResultSet rs;
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(url,user,pass);
	// select name,shop_stock from product where shop_num=1110000000 AND shop_stock<=10;
	
	if(request.getParameter("shop").equals("all"))
		shop="p.stock";
	else
		shop="p.shop_num LIKE "+request.getParameter("shop")+" AND p.shop_stock";
	
	String query = "select p.name,s.name,p.shop_stock,p.stock as 'total stock' "
			+ "from product p,shop s where p.shop_num=s.shop_num AND "
			+ shop +request.getParameter("stock"); 
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
		out.println("<td>"+rs.getString(2)+"</td>");
		out.println("<td>"+rs.getInt(3)+"</td>");
		out.println("<td>"+rs.getInt(4)+"</td>");
		out.println("</tr>");
	}
	out.println("<table/>");

	%>
	

<h6>Do you want to check another stock?</h6>
<button type="button" onclick="location.href='admin_stock_check.html' ">Other stock?</button>
</br>
<h6>Do you want to order some products?</h6>
<button type="button" onclick="location.href='admin_stock_order.html' ">Order stock?</button>
</br>
<h6>Do you want to check monthly sum?</h6>
<button type="button" onclick="location.href='administrator.html' ">Monthly sum</button>
</br>
<h6>Do you want to check total sum??</h6>
<button type="button" onclick="location.href='admin_total.jsp' ">Total sum</button>
</br>
<h6>Do you want to check daily sum??</h6>
<button type="button" onclick="location.href='admin_date.html' ">daily sum</button>
</br>
</body>
</html>