<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	Current password : <input type="password" id="t1"/>
	New password : <input type="password" id="t2"/>
	<label id="lbl"></label>
	
	<button onclick="updateNewPassword()">Change</button>
</body>
<script>
function updateNewPassword()
{
  var xhtml = new XMLHttpRequest();
  var user=sessionStorage.getItem("username");
  var t1 = document.getElementById("t1");
  alert(user.value);
  var t2 = document.getElementById("t2");
  var lbl = document.getElementById("lbl");
  var pass=sessionStorage.getItem("password");
  var url = "http://localhost:8080/api/update/password/"+user;
  xhtml.open("PUT", url, true);
  xhtml.setRequestHeader('Content-Type','application/json');
  if(pass==t1.value)
  {
	    xhtml.send(JSON.stringify({
	      password : t2.value
	    }));
	    localStorage.setItem("password",t2.value);
	    setTimeout(function()
	    {
	            window.location="http://localhost:8080/pages.jsp";
	    },1000);
  }
  else
  {
     lbl.innerText = "Wrong password Entered";
  }
  xhtml.onreadystatechange = function()
  {
    if(this.readyState == 4 && this.status == 200)
          lbl.innerText = this.responseText;
  };
}


</script>
</html>
