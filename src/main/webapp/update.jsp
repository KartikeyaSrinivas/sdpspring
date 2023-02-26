<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body onload="display()">
	username:
	<input type="text" id="t1"/>
	<br/>
	Name:
	<input type="email" id="t2"/>
	<br/>
	Email:
	<input type="email" id="t3"/>
	<br/>
	DOB:
	<input type="date" id="t4"/>
	<br/>
	Gender:
	<input type="text" id="t5"/>
	<br/>
	Phone Number:
	<input type="text" id="t6"/>
	<br/>
	Address:
	<input type="text" id="t7"/>
	<br/>
	State:
	<input type="text" id="ti8"/>
	<br/>
	Pincode :
	<input type="text" id="ti9"/>
	
	<button onclick="updateFunction()">Update</button>
	<label id="lbl123"></label>
</body>
<script>
function display()
{
	disp();
	var xhtml = new XMLHttpRequest();
	var t1 = document.getElementById("t1");
	var t2 = document.getElementById("t2");
	var t3 = document.getElementById("t3");
	var t4 = document.getElementById("t4");
	var t5 = document.getElementById("t5");
	var t6 = document.getElementById("t6");
	var t7 = document.getElementById("t7");
	var t8 = document.getElementById("ti8");
	var t9 = document.getElementById("ti9");
	var url = "http://localhost:8080/api/karthik/dis/" + t1.value;
	xhtml.open("GET", url, true);
	xhtml.setRequestHeader('Content-Type','application/json');
	var lbl = document.getElementById("lbl123");
	xhtml.send();
	xhtml.onreadystatechange = function()
	{
		if(this.readyState == 4 && this.status == 200)
			var data=JSON.parse(this.responseText);
			for(var x in data)
			{
				t2.value=data[x].name;
				t3.value=data[x].email;
				t4.value=data[x].dob;
				t5.value=data[x].gender;
				t6.value=data[x].phno;
				t7.value=data[x].address;
				t8.value=data[x].state;
				t9.value=data[x].pincode;
			}
	};
	alert(t8.value);
}
function disp()
{
	let urlString=window.location.href;
	let paramString = urlString.split('?')[1];
	let queryString = new URLSearchParams(paramString);
	var url;
	var t1 = document.getElementById("t1");
	for(let pair of queryString.entries()) 
	{
		url=pair[1];
		t1.value=pair[1];
		sessionStorage.setItem("user",pair[1]);
	}
	alert(url);
}
function updateFunction()
{
	var xhtml = new XMLHttpRequest();
	var t1 = document.getElementById("t1");
	var t2 = document.getElementById("t2");
	var t3 = document.getElementById("t3");
	var t4 = document.getElementById("t4");
	var t5 = document.getElementById("t5");
	var t6 = document.getElementById("t6");
	var t7 = document.getElementById("t7");
	var t8 = document.getElementById("ti8");
	var t9 = document.getElementById("ti9");
	var url = "http://localhost:8080/api/karthik/up/" + t1.value;
	xhtml.open("PUT", url, true);
	alert("Pincode : "+t9.value);
	alert("State : "+t8.value);
	alert("Address: "+t7.value);
	alert("gender : "+t5.value);
	xhtml.setRequestHeader('Content-Type','application/json');
	var lbl = document.getElementById("lbl");
	xhtml.send(JSON.stringify({
		username : t1.value,
		name : t2.value,
		email : t3.value,
		dob : t4.value,
		gender : t5.value,
		phno: t6.value,
		address : t7.value,
		state : t8.value,
		pincode : t9.value,
		//
		//t5.value=data[x].gender;
		//t6.value=data[x].phno;
		//t7.value=data[x].address;
		//t8.value=data[x].state;
		//t9.value=data[x].pincode;
	}));
	alert(url);
	xhtml.onreadystatechange = function()
	{
		if(this.readyState == 4 && this.status == 200)
			alert(this.responseText);
			lbl.innerText = this.responseText;
	};
}
</script>
</html>