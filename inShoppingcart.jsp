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
	<h2>Successfully Add! THANK YOU!</h2>
	<%
	String url = "jdbc:mysql://localhost:3306/thessok?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false";
	String user="thessok";
	String pass="comp322";
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	String s; 
	Integer custNum=1000;
	Integer p_num = 1100000000;
	Statement stmt=null;
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection(url,user,pass);
	custNum=(Integer)session.getAttribute("customer_num");
	
	//insert into shopping_cart value (1,1000000004 , 1100000228, 1110000001);
	
	String sql = "SELECT purchase_num FROM orders where date='' and cus_num="
			+custNum;
	
	pstmt = conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	
	if(rs.next()){
		p_num = rs.getInt("purchase_num");
	}
	String que = "INSERT INTO SHOPPING_CART VALUE ("
			+ custNum +","
			+ request.getParameter("product") +", "
			+ p_num +", "
			+ request.getParameter("shop")+")";
	
	
	pstmt = conn.prepareStatement(que);
	int res = pstmt.executeUpdate();
	
	
	%>
	<button type="button" onclick="location.href='shoppingcart.jsp' ">shopping cart</button>
	<button type="button" onclick="location.href='category.html'' ">category</button>
</body>
</html>