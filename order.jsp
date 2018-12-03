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
	<h2>Successfully joined! WELCOME!</h2>
	<%
	String url = "jdbc:mysql://localhost:3306/thessok?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false";
	String user="knu";
	String pass="comp322";
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	String s; 
	Integer p_num=1000;
	Statement stmt=null;
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection(url,user,pass);
	String ID=(String)session.getAttribute("ID");
	Integer custNum=(Integer)session.getAttribute("customer_num");
	
	String sql = "SELECT COUNT(*) FROM ORDERS";
	
	pstmt = conn.prepareStatement(sql);
	rs=pstmt.executeQuery();

	if(rs.next()){
		p_num=rs.getInt("COUNT(*)");
	}
		
	String query = "INSERT INTO ORDERS VALUE('"
	        + request.getParameter("date")+"', '"
	        + p_num++ +"', "
	        + custNum +")";
	
	pstmt = conn.prepareStatement(query);
	int res =pstmt.executeUpdate();
	
	String msg = "Order successfully! Thank you! ";
	String list = request.getContextPath()+"/orderHistory.jsp";
	
	%>
	<script type = "text/javascript">
     <!--
      alert("<%=msg%>");
     location.href="<%=list%>";
     //-->>
     </script>

</body>
</html>