<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<a href="bm.jsp"><button>BMI</button></a>
<a href="krishna.jsp"><button>Diet Plan</button></a>
<button onclick="update()">Update</button>
<a href="update_password.jsp"><button>Change Password</button></a>
<a href="login2.jsp"><button>Logout</button></a>
</body>
<script>
function update()
{
	window.location="http://localhost:8080/update.jsp?username="+sessionStorage.getItem("username");
}
</script>
</html>