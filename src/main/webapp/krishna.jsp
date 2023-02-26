<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {
  box-sizing: border-box;
}

body 
{
  font-family: Arial, Helvetica, sans-serif;
  background-color: black;
}

/* Float four columns side by side */
.column {
  float: left;
  width: 25%;
  padding: 0 10px;
}

/* Remove extra left and right margins, due to padding */
.row {margin: 0 -5px;}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Responsive columns */
@media screen and (max-width: 600px) {
  .column {
    width: 100%;
    display: block;
    margin-bottom: 20px;
  }
}

/* Style the counter cards */
.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  padding: 16px;
  text-align: center;
  background-color: #f1f1f1;
}
/* Center the loader */
#loader {
  position: absolute;
  left: 50%;
  top: 50%;
  z-index: 1;
  width: 120px;
  height: 120px;
  margin: -76px 0 0 -76px;
  border: 16px solid #f3f3f3;
  border-radius: 50%;
  border-top: 16px solid #3498db;
  -webkit-animation: spin 2s linear infinite;
  animation: spin 2s linear infinite;
}

@-webkit-keyframes spin {
  0% { -webkit-transform: rotate(0deg); }
  100% { -webkit-transform: rotate(360deg); }
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}

/* Add animation to "page content" */
.animate-bottom {
  position: relative;
  -webkit-animation-name: animatebottom;
  -webkit-animation-duration: 1s;
  animation-name: animatebottom;
  animation-duration: 1s
}

@-webkit-keyframes animatebottom {
  from { bottom:-100px; opacity:0 } 
  to { bottom:0px; opacity:1 }
}

@keyframes animatebottom { 
  from{ bottom:-100px; opacity:0 } 
  to{ bottom:0; opacity:1 }
}

#myDiv {
  display: none;
  text-align: center;
}
</style>
</head>
<body onload="myFunction()" style="margin:0;">
<div id="loader"></div>
<div style="display:none;" id="myDiv" >
	<h2>Diet Plan</h2>
	
	<div class="row">
	  <div class="column">
	    <div class="card">
	      <img src="overweight.jpg" width="100%" height="1000%"/>
	      <h1>Over Weight</h1>
	      <a href="overweight.jsp"><button>OverWeight</button></a>
	      
	    </div>
	  </div>
	
	  <div class="column">
	    <div class="card">
	      <img src="2.jpg" width="45%" height="45%"/>
	      <h1>UnderWeight</h1>
	    	<a href="underweight.jsp"><button>UnderWeight</button></a>
	      
	    </div>
	  </div>
	  
	  <div class="column">
	    <div class="card">
	      <img src="1.PNG" width="70%" height="70%"/>
	      <h1>Obesity</h1>
	     	<a href="obese.jsp"><button>Obesity</button></a>
	      
	    </div>
	  </div>
	  
	  <div class="column">
	    <div class="card">
	   	<img src="healthy.jpg" width="100%" height="150%"/>
	   	<h1>Healthy </h1>
	   	<a href="healthyweight.jsp"><button>Healthy Weight</button></a>
	   	
	    </div>
	  </div>
	</div>
</div>

</body>
<script>
var myVar;

function myFunction() {
  myVar = setTimeout(showPage, 1000);
}

function showPage() {
  document.getElementById("loader").style.display = "none";
  document.getElementById("myDiv").style.display = "block";
}
</script>
</html>
