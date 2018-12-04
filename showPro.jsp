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
	<h2>thessok:product</h2>
	<h3>We don't show you the products that doesn't have stock.</h3>
	<h3>Just Click check_box if you would like to buy ️</h3>
	<%
	String url = "jdbc:mysql://localhost:3306/thessok?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false";
	String user="knu";
	String pass="comp322";
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
	for(int i=1;i<=cnt;i++){
		out.println("<th>"+rsmd.getColumnName(i)+"</th>");
	}
	while(rs.next()){
		out.println("<tr>");
		out.println("<td>"+rs.getString(1)+"</td>");
		String id = rs.getString(1);
		out.println("<td>"+rs.getInt(2)+"</td>");
		out.println("<td><input type=\"button\" onclick = \"location.href='NewFile.jsp'\" value = \"detail\"> </td>");
		out.println("<td><input type=\"checkbox\" name=\"get.String(1)\" value = \"detail\"></td>");
		out.println("</tr>");
	}
	
	out.println("<table/>");
	%> 
   
    <button type="button" onclick="location.href='login.html' ">I'd like to buy them</button>
    <br/>
 	<br/>
 	
    <form action="boardList.action" name="search" method="post">
            </select>
                 <input type="text" size="16" name="keyWord" value="${keyWord }">
                 <input type="button" value="검색" onClick="go_such();">
    
    </form>    
  <script>// 검색시 
 function go_such() {
                                                                                           
  
  var f = document.oper;
  
  if (f.writee.value == "") {
   alert("검색어를 입력해주세요.");
   return;
  }
  f.method = "post";                                                         
  f.action="server_operation_list.jsp";                                
  f.submit();

 }

</script>
</body>


</html>