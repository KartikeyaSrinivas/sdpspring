<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
  font-family: "Lato", sans-serif;
  transition: background-color;
}

.sidenav {
  height: 100%;
  width: 0;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0;
  background-color: #111;
  overflow-x: hidden;
  padding-top: 60px;
}

.sidenav a {
  padding: 8px 8px 8px 32px;
  text-decoration: none;
  font-size: 25px;
  color: #818181;
  display: block;
}

.sidenav a:hover {
  color: #f1f1f1;
}

.sidenav .closebtn {
  position: absolute;
  top: 0;
  right: 25px;
  font-size: 36px;
  margin-left: 50px;
}

#main {
  transition: margin-left;
  padding: 16px;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}
#profile,#bmi
{
	display:none;
}
</style>
</head>
<body onload="read();bmi();openNav(); ">

<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <a onclick="dash1()" href="#">Profile</a>
  <a onclick="dash2()" href="#">BMI</a>
  <a href="#">Contact</a>
  <a href="#">Update Password</a>
  <a href="#">LogOut</a>
</div>

<div id="main"> 
  <span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776; open</span>
  
<div id="profile">
	<div style="width:100%" id="display" ></div>
</div>

<div id="bmi">
	<div style="width:100%" id="bmi" ></div>
</div>

</div>

<script>
function dash1()
{
	document.getElementById('bmi').style.display='none';
	document.getElementById('profile').style.display='block';
}
function dash2()
{
	document.getElementById('bmi').style.display='block';
	document.getElementById('profile').style.display='none';
}
function openNav() 
{
  document.getElementById("mySidenav").style.width = "250px";
  document.getElementById("main").style.marginLeft = "250px";
  document.body.style.backgroundColor = "rgba(0,0,0,0.4)";
}

function closeNav() {
  document.getElementById("mySidenav").style.width = "0";
  document.getElementById("main").style.marginLeft= "0";
  document.body.style.backgroundColor = "white";
}
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
   
</body>
</html>