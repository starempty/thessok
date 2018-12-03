<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.text.*,java.sql.*" %>
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
	String user="thessok";
	String pass="comp322";
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	String s; Integer custNum=1000;
	Statement stmt=null;
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection(url,user,pass);
	
	String sql = "SELECT COUNT(*) FROM CUSTOMER";
	
	pstmt = conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	
	if(rs.next()){
		custNum=rs.getInt("COUNT(*)");
	}
		
	String query = "INSERT INTO CUSTOMER VALUE("
			+ custNum +",'"
	        + request.getParameter("password")+"', '"
	        + request.getParameter("ID")+"','"
	        + request.getParameter("name")+"',"
	        + request.getParameter("age")+",'" 
	        + request.getParameter("SEX")+"','"
	        + request.getParameter("job")+"','"
	        + request.getParameter("address")+"','"
	        + request.getParameter("pnum")+"','"
	        + request.getParameter("destinaion")+"')";
	
	pstmt = conn.prepareStatement(query);
	int res =pstmt.executeUpdate();
	
	
	%>
	<button type="button" onclick="location.href='login.html' ">LogIn</button>

</body>
</html>