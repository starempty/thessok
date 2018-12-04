<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.text.*,java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>  </h2>
	<br>
<%
	String url = "jdbc:mysql://localhost:3306/thessok?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false";
	String user="thessok";
	String pass="comp322";
	Integer p_num = 0;
	String p_name ="";
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(url,user,pass);
	
 	out.println("<h2> ::" + request.getParameter("para1") + " 상세 정보:: </h2>");
	p_name = request.getParameter("para1");
	String query = "select * from product where name = '" + request.getParameter("para1") + "';";
	
	System.out.println(query);
	pstmt = conn.prepareStatement(query);
	rs = pstmt.executeQuery();
	
	ResultSetMetaData rsmd = rs.getMetaData();
	int cnt = rsmd.getColumnCount();
	
	int i = 2;
	
	rs.next();
	out.println("<h3>" +  "이름" +" : " + rs.getString(i++)+ "<h3/>");
	out.println("<h3>" +  "가격"+" : " + rs.getString(i++) + "원" + "<h3/>");
	out.println("<h3>" +  "수입자"+" : " + rs.getString(i++)  + "<h3/>");
	i++;
	out.println("<h3>" +  "유통기한"+" : " + rs.getString(i++) + "<h3/>");
	out.println("<h3>" +  "제조일자"+" : " + rs.getString(i++)+"<h3/>");
	
	query = "select distinct product_num from product where name = '" + request.getParameter("para1") + "';";
	System.out.println(query);
	pstmt = conn.prepareStatement(query);
	rs = pstmt.executeQuery();
	if(rs.next()){
		p_num = rs.getInt("product_num");
	}
	out.println("<h3> ::" + request.getParameter("para1") + " 장바구니에 담기:: </h3>");
	
	%>
	<form action = "inShoppingcart.jsp" method = "POST">
		<select name="shop">
	    <optgroup label="SHOP"> 
                <option value="1110000000">X1/대전 강남구 신림동</option>
                <option value="1110000001">X2/대구 중구 농소동</option>
                <option value="1110000002">X3/서울 강북구 무거동</option>
                <option value="1110000003">X4/부산 남구 대흥동</option>
                <option value="1110000004">X5/서울 중구 중동</option>
                <option value="1110000005">X6/제주 북구 역삼동</option>
                <option value="1110000006">X7/울산 강남구 지산동</option>
                <option value="1110000007">X8/대전 남구 논현동</option>
                <option value="1110000008">X9/울산 북구 망미동</option>
                <option value="1110000009">X10/서울 강남구 연산동</option>
                <option value="1110000010">X11/대전 강북구 역삼동</option>
                <option value="1110000011">X12/대전 중구 자양동</option>
                <option value="1110000012">X13/대전 중구 재송동</option>
                <option value="1110000013">X14/부산 중구 황금동</option>
                <option value="1110000014">X15/대전 강남구 대흥동</option>
                <option value="1110000015">X16/제주 서구 역삼동</option>
                <option value="1110000016">X17/서울 남구 망미동</option>
                <option value="1110000017">X18/제주 중구 신림동</option>
                <option value="1110000018">X19/울산 중구 대흥동</option>
                <option value="1110000019">X20/대구 강북구 논현동</option>
            </optgroup>
		</select>
		<select name="product">
		<option value="<%=p_num%>"><%=request.getParameter("para1")%></option>
		</select>
		
		<input type = "submit" value = "submit">
		</form>
		
		<% 
	
	//out.println("<td><input type=\"button\" onclick = \"moveURL('"+p_num+"')\" value = \"Add to shopping cart\"> </td>");
	conn.close();
	
%>



	<script>
function moveURL(para1){
	var str = '';
	str+="para1="+para1;
	document.location.href="inShoppingcart.jsp?"+str;
}</script>
</body>
</html>