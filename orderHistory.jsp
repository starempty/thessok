<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page language="java" import="java.text.*,java.sql.*" %>
 <%@ page session="true" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TheSSOK::The Best Shopping mall</title>
</head>
<body>
	<h2>It's your history of orders!</h2>
	
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
	
	String query = "SELECT distinct date,name,price FROM product,shopping_cart,orders WHERE cus_num = "
			+custNum + " and cus_num = customer_num and purchase_num=r_purchase_num and shop_num=s_shop_num and s_product_num = product_num and date != '' order by date asc";
	
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
		out.println("</tr>");
	}
	out.println("</table>");
	pstmt.close();
	%>
	
	<button type="button" onclick="location.href='category.html'">CATEGORY</button>
	<br/>
		<button type="button" onclick="location.href='shoppingcart.jsp'">My shopping cart</button>

</body>
</html>