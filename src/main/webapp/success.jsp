<%@page import="java.text.*"%>
    <%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1>Session Login</h1>
  <div id="demo"></div>
  <h3>Session ID:  <%= session.getId()%></h3>
  <h3>Login Time:  <%= new Date(session.getCreationTime())%></h3>
  <h3>Last Accessed Time: <%= new Date(session.getLastAccessedTime())%></h3>
</body>
</html>