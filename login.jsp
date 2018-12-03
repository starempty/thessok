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
	String user="thessok";
	String pass="comp322";
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	String s;
	Statement stmt=null;
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection(url,user,pass);
	String ID=request.getParameter("ID");
	String password=request.getParameter("password");
	Integer custNum;
	String msg="",list="";
	
	String query = "SELECT id,password,customer_num FROM customer WHERE ID='"
			+request.getParameter("ID")+"' AND password='"
			+request.getParameter("password")+"'";
	
	pstmt = conn.prepareStatement(query);
	rs=pstmt.executeQuery();
	
	if(rs.next()){
		String id = rs.getString("id");
		String pwd = rs.getString("password");
		custNum=rs.getInt("customer_num");
		
		if(ID.equals(id)&&password.equals(pwd)){
			msg=id+", Logined successfully! Welcome!";
			if(custNum==0) list = request.getContextPath()+"/administrator.html";
			else list = request.getContextPath()+"/shoppingcart.jsp";
			
			
			session.setAttribute("ID", id);
			session.setAttribute("customer_num",custNum);
		}
		else{
			msg="You have wrong password! check it again";
			list = request.getContextPath()+"/login.html";
		}
		
	}
	else{
		msg = "login failed! Check your Account Again! ";
		list = request.getContextPath()+"/login.html";
		out.println(msg);
	}
	
	
	%>
	
	   <script type = "text/javascript">
     <!--
      alert("<%=msg%>");
     location.href="<%=list%>";
     //-->>
     </script>
     
  <%
  Object id=session.getAttribute("ID");

  Object customer_num=session.getAttribute("customer_num");
     %>

</body>
</html>