<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<style>   
Body {  
  font-family: Calibri, Helvetica, sans-serif;  
  background-color: white;  
}  
button {   
       background-color: white;   
       width: 100%;  
        color: orange;   
        padding: 15px;   
        margin: 10px 0px;   
        border: none;   
        cursor: pointer;   
         }   
 form {   
        border: 3px solid #f1f1f1;   
    }   
 input[type=text], input[type=password] {   
        margin: 8px 0;  
        padding: 12px 20px;   
        display: inline-block;   
        border: 2px solid green;   
        box-sizing: border-box;   
    }  
 button:hover {   
        opacity: 0.7;   
    }   
  .cancelbtn {   
        width: auto;   
        padding: 10px 18px;  
        margin: 10px 5px;  
    }   
        
     
 .container {   
        padding: 25px;   
        background-color: lightgreen;  
    }   
</style>   
</head>    
<body onload="kartkeya_hero()">    
    <center> <h1> Profile page </h1> </center>   
        <div class="container">   
            <label>username : </label> 
            <input type="text" id="t1" required/>
            <br> 
            <label>Name : </label> 
            <input type="text" id="t2" required/>
            <br> 
            <label>Gender : </label> 
            <input type="text" id="t3" required/>
            <br> 
            <label>dob : </label> 
            <input type="date" id="t4" required/>
            <br> 
            <label>phno : </label>
            <input type="text" id="t5" required/>
            <br>
            <label>address : </label> 
            <input type="text" id="t6" required/>
            <br> 
            <label>state : </label> 
            <input type="text" id="t7" required/>
            <br>
            <label>pincode : </label> 
            <input type="text" id="t8" required/>
            <br>   
			<button onclick="insert()">Profile</button>
			<label id="lbl"></label>
        </div>   
</body>
<script>
function kartkeya_hero()
{
	document.getElementById("t1").value=sessionStorage.getItem("kartikeya");
}
function insert()
{
	var t1 = document.getElementById("t1");
	var xhtml = new XMLHttpRequest();
	var url = "http://localhost:8080/api/profile/" +sessionStorage.getItem("kartikeya");
	xhtml.open("PUT", url, true);
	xhtml.setRequestHeader('Content-Type','application/json');
	alert(url);
	var t2 = document.getElementById("t2");
	var t3 = document.getElementById("t3");
	var t4 = document.getElementById("t4");
	var t5 = document.getElementById("t5");
	var t6 = document.getElementById("t6");
	var t7 = document.getElementById("t7");
	var t8 = document.getElementById("t8");
	var lbl = document.getElementById("lbl");
	
	xhtml.send(JSON.stringify({
		username : t1.value,
		name : t2.value,
		gender : t3.value,
		dob : t4.value,
		phno : t5.value,
		address : t6.value,
		state : t7.value,
		pincode : t8.value
	}));
	
	xhtml.onreadystatechange = function()
	{
		if(this.readyState == 4 && this.status == 200)
			lbl.innerText = this.responseText;
			setTimeout(function(){
				window.location="http://localhost:8080/login2.jsp";
			},4000);
	};
}
 </script>
</html>