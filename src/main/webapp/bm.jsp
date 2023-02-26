<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body >

<div align="center">
	
	  <div class="form-group">
	    <label for="exampleInputEmail1">Weight</label>
	    <input type="number" class="form-control" id="t1" aria-describedby="emailHelp" placeholder="Enter weight" required>
	  </div>
	  <div class="form-group">
	    <label for="exampleInputPassword1">Height(CM)</label>
	    <input type="number" class="form-control" id="t2" placeholder="height" required>
	  </div>
	  
	  <button  onClick="saveBMI()" class="btn btn-primary">Save</button>
  
    <button onClick="log()" class="btn btn-primary">logout</button>
</div>
  
<label id="lbl"></label>
<div style="width:100%" id="display" ></div>
</body>
<script type="text/javascript" >
function log()
{
  	sessionStorage.removeItem("username");
  	window.location="http://localhost:8080/login2.jsp";
}
function saveBMI()
{
	let personName=sessionStorage.getItem("username")
	  if(personName==null)
	  {
	      window.location="http://localhost:8080/login2.jsp";  
	  }
	  else
	{
      var user=sessionStorage.getItem("username");
      
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
		  };
       
     }
	under();
}
function value(bmi)
{
	var val;
	if(bmi<18.5)
	{
		val="Underweight";
		
	}
	else if(bmi>18.5 && bmi<24.9)
	{
		val="Healthy Weight";
	}
	else if(bmi>25.0 && bmi<29.9)
	{
		val="Overweight";
	}
	else
	{
		val="Obesity";
	}
	return val;
}
function read()
{
  var xhtml = new XMLHttpRequest();
  var url="http://localhost:8080/api/get";
  xhtml.open("GET", url, true);
  xhtml.setRequestHeader('Content-Type','application/json');
  
  xhtml.send();
  
  var display = document.getElementById("display");
  
  xhtml.onreadystatechange = function()
  {
    if(this.readyState == 4 && this.status == 200)
    {
      var table = "<table border='1'>";
      var i=0;
      table += 
    	  "<tr>"+
    	  "<th>S.No</th>"	+
    	  "<th>Username</th>"+
    	  "<th>Height</th>" +
    	  "<th>Weight</th>" +
    	  "<th>BMI Value</th>" +
    	  "<th>Result</th>"+
    	  "</tr>";
      var data = JSON.parse(this.responseText);
      for(var x in data)
      {
        table=table+
        "<tr>"+
        	"<td>"+ (i+1) +"</td>"+
        	"<td>"+ data[x].username +"</td>"+
        	"<td>"+ data[x].weight+"</td>"+
        	"<td>"+ data[x].height+"</td>"+
        	"<td>"+ data[x].result+"</td>"+
        	"<td>"+ value(data[x].result)+"</td>"+
        "</tr>";
        i++;
      }
      table=table+"</table>";
      display.innerHTML = table;
    }
  };
}
function under()
{
	let personName=sessionStorage.getItem("username")
	if(personName==null)
	{
		window.location = "http://localhost:8080/login2.jsp";  
	}
	else
	{ 
		  var t1 = document.getElementById("t1");
		  var t2 = document.getElementById("t2");
		  var lbl = document.getElementById("lbl");
		  var weight = document.getElementById("t1").value;
		  var height = document.getElementById("t2").value;

		  var bmi = Math.ceil((100*100*weight)/(Math.pow(height,2)));
		  if(bmi<18.5)
			{
			   setTimeout(function()
			   {
				  window.location="http://localhost:8080/underweight.jsp";
			   },2000);
				
			}
			else if(bmi>18.5 && bmi<24.9)
			{
				 setTimeout(function()
				 {
					window.location="http://localhost:8080/healthyweight.jsp";
				 },2000);
			}
			else if(bmi>25.0 && bmi<29.9)
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
}

</script>
</html>