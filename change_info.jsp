<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.text.*,java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> TheSSOK::The Best Shoppingmall </title>
</head>
<body>
	<h2>Successfully Changed!</h2>
	<%
	String url = "jdbc:mysql://localhost:3306/thessok?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false";
	String user="thessok";
	String pass="comp322";
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	String id,p;
	int res;
	Statement stmt=null;
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection(url,user,pass);
	id= request.getParameter("ID");
	p= request.getParameter("password");
	if(request.getParameter("newpassword")!= ""){
		String query = "UPDATE CUSTOMER SET password='"
				+request.getParameter("newpassword")
				+"' WHERE ID='"+id+"'";
		pstmt = conn.prepareStatement(query);
		res =pstmt.executeUpdate();
	}
	if(request.getParameter("name")!= ""){
		String query = "UPDATE CUSTOMER SET name='"
				+request.getParameter("name")
				+"' WHERE ID='"+id+"'";
		pstmt = conn.prepareStatement(query);
		res =pstmt.executeUpdate();
	}
	if(request.getParameter("age")!= ""){
		String query = "UPDATE CUSTOMER SET age="
				+request.getParameter("age")
				+" WHERE ID='"+id+"'";
		pstmt = conn.prepareStatement(query);
		res =pstmt.executeUpdate();
	}
	if(request.getParameter("SEX")!= ""){
		String query = "UPDATE CUSTOMER SET sex='"
				+request.getParameter("sex")
				+"' WHERE ID='"+id+"'";
		pstmt = conn.prepareStatement(query);
		res =pstmt.executeUpdate();
	}
	if(request.getParameter("job")!= ""){
		String query = "UPDATE CUSTOMER SET job='"
				+request.getParameter("job")
				+"' WHERE ID='"+id+"'";
		pstmt = conn.prepareStatement(query);
		res =pstmt.executeUpdate();
	}
	if(request.getParameter("address")!= ""){
		String query = "UPDATE CUSTOMER SET address='"
				+request.getParameter("address")
				+"' WHERE ID='"+id+"'";
		pstmt = conn.prepareStatement(query);
		res =pstmt.executeUpdate();
	}
	if(request.getParameter("pnum")!= ""){
		String query = "UPDATE CUSTOMER SET pnum='"
				+request.getParameter("pnum")
				+"' WHERE ID='"+id+"'";
		pstmt = conn.prepareStatement(query);
		res =pstmt.executeUpdate();
	}
	if(request.getParameter("destination")!= ""){
		String query = "UPDATE CUSTOMER SET destination='"
				+request.getParameter("destination")
				+"' WHERE ID='"+id+"'";
		pstmt = conn.prepareStatement(query);
		res =pstmt.executeUpdate();
	}


	
	
	%>

</body>
</html>