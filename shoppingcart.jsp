<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page language="java" import="java.text.*,java.sql.*" %>
 <%@ page session="true" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TheSSOK::The Best Shoppingmall</title>
</head>
<body>
	<h2>It's your shopping cart!</h2>
	<h3>Do you want to order more?</h3>
	<h3>!!OR now order it!!</h3>
	
     
	<%
	String url = "jdbc:mysql://localhost:3306/thessok?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false";
	String user="thessok";
	String pass="comp322";
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	String s;
	Statement stmt=null;
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection(url,user,pass);
	String ID,list; 
	Integer custNum;
	ID=(String)session.getAttribute("ID");
	custNum=(Integer)session.getAttribute("customer_num");
	
	if(ID == null);
	
	String query = "SELECT distinct product_num,name,price FROM product,shopping_cart,orders WHERE purchase_num=r_purchase_num and date='' and s_product_num=product_num AND customer_num="
			+custNum;
	
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
		out.println("<td>"+rs.getString(2)+"</td>");
		out.println("<td>"+rs.getInt(3)+"</td>");
		
		out.println("</tr>");
	}
	out.println("</table>");
	pstmt.close();
	%>
	
	<button type="button" onclick="location.href='category.html' ">I want to buy more</button>
	<br/>
	<button type="button" onclick="location.href='order.html' ">Order</button>
	<br/>
	<button type="button" onclick="location.href='logout.jsp' ">LogOut</button>
	<br/>
	<button type="button" onclick="location.href='change_info.html' ">Change information</button>
	<br/>
</body>
</html>