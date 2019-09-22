<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h4>My Lifelines</h4>
<%
try {

String connectionURL = "jdbc:mysql://localhost:3306/users";

Class.forName("com.mysql.jdbc.Driver").newInstance();

Connection connection = DriverManager.getConnection(connectionURL, "root", "root");

Statement statement = connection.createStatement();

String QueryString = "SELECT * from users";

ResultSet rs = statement.executeQuery(QueryString);

%>
<TABLE cellpadding="20" border="1">
<TR>
<TD>Id</TD>
<TD>Name</TD>
<TD>Age</TD>
<TD>Country</TD>
</TR>
<%
while (rs.next()) {
%>
<TR>
<TD><%=rs.getString("id")%></TD>
<TD><%=rs.getString("name")%></TD>
<TD><%=rs.getString("age")%></TD>
<TD><%=rs.getString("country")%></TD>
</TR>
<% } %>
<%

rs.close();
statement.close();
connection.close();
} catch (Exception ex) {
%>
</font>
<font size="+3" color="red"></b>
<%
out.println("cannot connect to database.");
}
%>

</font>
</body>
</html>