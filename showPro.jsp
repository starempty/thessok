<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.text.*,java.sql.*" %>
 <%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TheSSOK::The Best Shopping_mall</title>
</head>

<body>
<form method="get" action = "shoppingcart.jsp">
<h2>thessok:product</h2>
	<h3>We don't show you the products that doesn't have stock.</h3>
	<h3>Just Click check_box if you would like to buy ️</h3>
	<%
	String url = "jdbc:mysql://localhost:3306/thessok?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false";
	String user="thessok";
	String pass="comp322";
	String n = "";
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(url,user,pass);
	%>

	<%
	String query = "Select name, price from product where d_category_num="
	+request.getParameter("classification") +" and shop_num="
	+request.getParameter("shop") + " and shop_stock > 0";
	
	pstmt = conn.prepareStatement(query);
	rs=pstmt.executeQuery();
	
	out.println("<table border=\"1\">");
	ResultSetMetaData rsmd = rs.getMetaData();
	int cnt = rsmd.getColumnCount();
	for(int j=1;j<=cnt;j++){
		out.println("<th>"+rsmd.getColumnName(j)+"</th>");
	}
	while(rs.next()){
		out.println("<tr>");
		out.println("<td>"+rs.getString(1)+"</td>");
		out.println("<td>"+rs.getInt(2)+"</td>");
		n = rs.getString(1);
		out.println("<td><input type=\"button\" onclick = \"moveURL('"+n+"')\" value = \"detail\"> </td>");
		out.println("</tr>");
	}
	
	out.println("<table/>");
	
	
	%> 
    <br/>
 	<br/>
	</form>
	<script>
function moveURL(para1){
	var str = '';
	str+="para1="+para1;
	document.location.href="NewFile.jsp?"+str;
}</script>
	
 
    <form action="find.jsp" name="search" method="get">
                 <input type="text" size="16" name="keyword" >
                 <input type = "submit" value = "Search"/>
    
    </form>    

</body>


</html>