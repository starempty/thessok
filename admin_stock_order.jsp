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
	<h2>Order Stock!</h2>
	<%
	String url = "jdbc:mysql://localhost:3306/thessok?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false";
	String user="thessok";
	String pass="comp322";
	String list;
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	String s; String stock; String msg;
	Statement stmt=null;
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection(url,user,pass);
	stock=request.getParameter("quantity");
	
	String sql = "select name from product where name like '%"+request.getParameter("product")+"%'";
	pstmt = conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	
	if(!rs.next()){
		list = request.getContextPath()+"/admin_stock_order.html";
		msg="Failed to update! Write right name!";
	}
	else{
		list = request.getContextPath()+"/admin_stock_check.html";
		msg="Succeed to update! Check it";
	}
	
	//update product set stock = stock+10,shop_stock=shop_stock+10 where shop_num=1110000000 and name LIKE '%국산 정이품쌀%';
	
	String query = "update product set stock = stock+"
			+ stock
			+", shop_stock=shop_stock+"
			+ stock
			+" where shop_num="
			+request.getParameter("shop")
			+" and name LIKE '%"
			+request.getParameter("product")
			+"%'";
	
	pstmt = conn.prepareStatement(query);
	int res =pstmt.executeUpdate();
	
	%>
	
	   <script type = "text/javascript">
     <!--
     alert("<%=msg%>");
		location.href="<%=list%>";
     
     //-->>
     </script>


</body>
</html>
