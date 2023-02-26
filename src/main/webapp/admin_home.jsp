<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body onload="read();bmi()">
	<label id="lbl"></label>
	<div style="width:100%" id="display" ></div>
	<div style="width:100%" id="bmi" ></div>
</body>
<script>
function read()
{  
  {
    var xhtml = new XMLHttpRequest();
    var url="http://localhost:8080/api/display";
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
        table += "<tr> <th>S.No</th> <th>Username</th> <th>Name</th> <th>Email</th>  <th>DOB</th> <th>Address</th> <th>gender</th> <th>Phone Number</th> <th>State</th> <th>Pincode</th> <th>Edit</th> <th>remove</th> </tr>";
        var data = JSON.parse(this.responseText);
        for(var x in data)
        {
          table=table+"<tr>"+"<td>"+ (i+1) +"</td>"+"<td>"+ data[x].username +"</td>"+"<td>"+ data[x].name+"</td>"+"<td>"+ data[x].email +"</td>"+"</td>"+"<td>"+ data[x].dob +"</td>"+"<td>"+ data[x].address +"</td>"+"<td>"+ data[x].gender +"</td>"+"<td>"+ data[x].phno +"</td>"+"<td>"+ data[x].state +"</td>"+"<td>"+ data[x].pincode +"</td>"+"<td>"+"<a href=update.jsp?username="+data[x].username+">edit</a>"+"</td>"+"<td>"+"<a href=remove.jsp?username="+data[x].username+">remove</a>"+"</td>"+
"</tr>";
          i++;
        }
        table=table+"</table>";
        display.innerHTML = table;
      }
    };
  }
}
function bmi()
{
  var xhtml = new XMLHttpRequest();
  var url="http://localhost:8080/api/get";
  xhtml.open("GET", url, true);
  xhtml.setRequestHeader('Content-Type','application/json');
  
  xhtml.send();
  
  var display = document.getElementById("bmi");
  
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


</script>
</html>