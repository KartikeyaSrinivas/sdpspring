<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	 Weight : <input type="number" class="form-control" id="t1" aria-describedby="emailHelp" placeholder="Enter weight" required>
	 Height : <input type="number" class="form-control" id="t2" placeholder="height" required>
	  <button  onClick="saveBMI()" class="btn btn-primary">Save</button>
	  
	   
	   
	    <button  onClick="log()" class="btn btn-primary">LogOut</button>
	  
</body>
<script>
function saveBMI()
{
	{
      var user=sessionStorage.getItem("username");
      alert(user);
	  var xhtml = new XMLHttpRequest();
	  var url = "http://localhost:8080/api/insert-bmi";
	  xhtml.open("POST", url, true);
	  xhtml.setRequestHeader('Content-Type','application/json');
	  var t1 = document.getElementById("t1");
	  var t2 = document.getElementById("t2");
	  var lbl = document.getElementById("lbl");
	  var weight = document.getElementById("t1").value;
	  var height = document.getElementById("t2").value;
  	  var ans = Math.ceil((100*100*weight)/(Math.pow(height,2)));
  	   alert(ans);
       
		  xhtml.send(JSON.stringify({
			    username : user,
	    		height : t1.value,
	    		weight : t2.value,
	   			result : ans
	  	  }));
	      
		  xhtml.onreadystatechange = function()
		  {
		    if(this.readyState == 4 && this.status == 200)
		    	lbl.innerText = this.responseText;
		    	redirectPage(ans);
		  };
       
     }
}
function redirectPage(ans)
{
	if(ans<18.5)
	{
	   setTimeout(function()
	   {
		  window.location="http://localhost:8080/underweight.jsp";
	   },2000);
		
	}
	else if(ans>18.5 && ans<24.9)
	{
		 setTimeout(function()
		 {
			window.location="http://localhost:8080/healthyweight.jsp";
		 },2000);
	}
	else if(ans>25.0 && ans<29.9)
	{
		 setTimeout(function()
		 {
			window.location="http://localhost:8080/overweight.jsp";
		 },2000);
	}
	else
	{
		 setTimeout(function()
		 {
			window.location="http://localhost:8080/obese.jsp";	
		 },2000);
	}
}
function log()
{
  	sessionStorage.removeItem("username");
  	window.location="http://localhost:8080/login2.jsp";
}
</script>
</html>
