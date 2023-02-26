<style>
    body{
	margin:0;
	color:#6a6f8c;
	background:#c8c8c8;
	font:600 16px/18px 'Open Sans',sans-serif;
}
*,:after,:before{box-sizing:border-box}
.clearfix:after,.clearfix:before{content:'';display:table}
.clearfix:after{clear:both;display:block}
a{color:inherit;text-decoration:none}

.login-wrap{
	width:100%;
	margin:auto;
	max-width:525px;
	min-height:670px;
	position:relative;
	background:url(https://media.istockphoto.com/id/1280587810/photo/healthy-eating-exercising-weight-and-blood-pressure-control.jpg?s=612x612&w=0&k=20&c=iCQnBHXhRf6HIzPGMUMwjnBDtIZDuE5UzrPG6AeKMZE=) no-repeat center;
	box-shadow:0 12px 15px 0 rgba(0,0,0,.24),0 17px 50px 0 rgba(0,0,0,.19);
}
.login-html{
	width:100%;
	height:100%;
	position:absolute;
	padding:90px 70px 50px 70px;
	background:rgba(40,57,101,.9);
}
.login-html .sign-in-htm,
.login-html .sign-up-htm{
	top:0;
	left:0;
	right:0;
	bottom:0;
	position:absolute;
	transform:rotateY(180deg);
	backface-visibility:hidden;
	transition:all .4s linear;
}
.login-html .sign-in,
.login-html .sign-up,
.login-form .group .check{
	display:none;
}
.login-html .tab,
.login-form .group .label,
.login-form .group .button{
	text-transform:uppercase;
}
.login-html .tab{
	font-size:22px;
	margin-right:15px;
	padding-bottom:5px;
	margin:0 15px 10px 0;
	display:inline-block;
	border-bottom:2px solid transparent;
}
.login-html .sign-in:checked + .tab,
.login-html .sign-up:checked + .tab{
	color:#fff;
	border-color:#1161ee;
}
.login-form{
	min-height:345px;
	position:relative;
	perspective:1000px;
	transform-style:preserve-3d;
}
.login-form .group{
	margin-bottom:15px;
}
.login-form .group .label,
.login-form .group .input,
.login-form .group .button{
	width:100%;
	color:#fff;
	display:block;
}
.login-form .group .input,
.login-form .group .button{
	border:none;
	padding:15px 20px;
	border-radius:25px;
	background:rgba(255,255,255,.1);
}
.login-form .group input[data-type="password"]{
	text-security:circle;
	-webkit-text-security:circle;
}
.login-form .group .label{
	color:#aaa;
	font-size:12px;
}
.login-form .group .button{
	background:#1161ee;
}
.login-form .group label .icon{
	width:15px;
	height:15px;
	border-radius:2px;
	position:relative;
	display:inline-block;
	background:rgba(255,255,255,.1);
}
.login-form .group label .icon:before,
.login-form .group label .icon:after{
	content:'';
	width:10px;
	height:2px;
	background:#fff;
	position:absolute;
	transition:all .2s ease-in-out 0s;
}
.login-form .group label .icon:before{
	left:3px;
	width:5px;
	bottom:6px;
	transform:scale(0) rotate(0);
}
.login-form .group label .icon:after{
	top:6px;
	right:0;
	transform:scale(0) rotate(0);
}
.login-form .group .check:checked + label{
	color:#fff;
}
.login-form .group .check:checked + label .icon{
	background:#1161ee;
}
.login-form .group .check:checked + label .icon:before{
	transform:scale(1) rotate(45deg);
}
.login-form .group .check:checked + label .icon:after{
	transform:scale(1) rotate(-45deg);
}
.login-html .sign-in:checked + .tab + .sign-up + .tab + .login-form .sign-in-htm{
	transform:rotate(0);
}
.login-html .sign-up:checked + .tab + .login-form .sign-up-htm{
	transform:rotate(0);
}

.hr{
	height:2px;
	margin:60px 0 50px 0;
	background:rgba(255,255,255,.2);
}
.foot-lnk{
	text-align:center;
}
</style>
<body onload="generate()">
<div class="login-wrap">
	<div class="login-html">
		<input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">Sign In</label>
		<input id="tab-2" type="hidden" name="tab" class="sign-up"><label for="tab-2" class="tab"></label>
		<div class="login-form">
			<div class="sign-in-htm">
			<form>
				<div class="group">
					<label for="user" class="label">Username</label>
					<input type="text"  id ="t1" class="input" required>
				</div>
				<div class="group">
					<label for="pass" class="label">Password</label>
					<input  type="password" id ="t2" class="input" data-type="password" required>
				</div>
				
				<div id="user-input" class="inline">
        <input type="text" id="submit"
            placeholder="Captcha code" />
    </div>
				 <div class="inline" onclick="generate()">
        <i class="fas fa-sync"></i>
    </div>
 
    <div id="image" class="inline" selectable="False">
    </div>
 
    <p id="key"></p>
				
				
				<div class="group">
					<input id="check" type="checkbox" class="check" checked>
					<label for="check"><span class="icon"></span> Keep me Signed in</label>
				</div>
				<div class="group">
					<input onClick="login();printmsg()"  type="button" class="button"  value="Sign In">
				</div>
				<label id="niku"></label>
			</form>
				<div class="hr"></div>
				<div class="foot-lnk">
					<a href="#forgot">Forgot Password?</a>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
var captcha;
function generate() {

	// Clear old input
	document.getElementById("submit").value = "";

	// Access the element to store
	// the generated captcha
	captcha = document.getElementById("image");
	var uniquechar = "";

	const randomchar =
"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

	// Generate captcha for length of
	// 5 with random character
	for (let i = 1; i < 5; i++) {
		uniquechar += randomchar.charAt(
			Math.random() * randomchar.length)
	}

	// Store generated input
	captcha.innerHTML = uniquechar;
}

function printmsg() {
	const usr_input = document
		.getElementById("submit").value;
	
	// Check whether the input is equal
	// to generated captcha or not
	if (usr_input == captcha.innerHTML) {
		var s = document.getElementById("key")
			.innerHTML = "Matched";
		generate();
	}
	else {
		var s = document.getElementById("key")
			.innerHTML = "not Matched";
		generate();
		window.location.reload();
	}
}

	function save()
	{
		var xhtml = new XMLHttpRequest();
		var url = "http://localhost:8080/api/insert";
		xhtml.open("POST", url, true);
		xhtml.setRequestHeader('Content-Type','application/json');
		
		var t1 = document.getElementById("t1");
		var t2 = document.getElementById("t2");
		var t3 = document.getElementById("t3");
        var lbl = document.getElementById("lbl");
        
		xhtml.send(JSON.stringify({
			username : t1.value,
			password : t2.value,
			email : t3.value
		}));
		
		xhtml.onreadystatechange = function()
		{
			if(this.readyState == 4 && this.status == 200)
				lbl.innerText = this.responseText;
		};
	}
	function insert()
	{
		var xhtml = new XMLHttpRequest();
		var url = "http://localhost:8080/api/insert";
		xhtml.open("POST", url, true);
		xhtml.setRequestHeader('Content-Type','application/json');
		
		var t1 = document.getElementById("t1");
		var t2 = document.getElementById("t2");
		var t3 = document.getElementById("t3");
		

		xhtml.send(JSON.stringify({
			username : t1.value,
			password : t2.value,
			email : t3.value,
			
		}));
		
		xhtml.onreadystatechange = function()
		{
			if(this.readyState == 4 && this.status == 200)
				lbl.innerText = this.responseText;
		};
	}
	function login()
	{
		var xhtml = new XMLHttpRequest();
		var user = document.getElementById("t1");
		var password = document.getElementById("t2");

		var url = "http://localhost:8080/api/login/" + user.value + "/" + password.value + "/";
		xhtml.open("POST", url, true);
		xhtml.setRequestHeader('Content-Type','application/json');
		xhtml.send();

		var display = document.getElementById("niku");

		xhtml.onreadystatechange = function()
		{
			if(this.readyState == 4 && this.status == 200)
				display.innerText = this.responseText;
				if(this.responseText == "Login success")
				{
					sessionStorage.setItem("username", user.value);
					sessionStorage.setItem("password", password.value);
					rolesUser();
				}
				
		};
	}
	function rolesUser()
	{
		 var xhtml = new XMLHttpRequest();
	      var person=sessionStorage.getItem("username")
	      var url ="http://localhost:8080/api/karthik/display/"+person;
	      xhtml.open("GET", url, true);
	      xhtml.setRequestHeader('Content-Type','application/json');
	      xhtml.send();
	     	
	      xhtml.onreadystatechange = function()
	      {
	        if(this.readyState == 4 && this.status == 200)
	        {
	          	  var data=JSON.parse(this.responseText);
	          	  for(var x in data) 
	          	  {
	          			 sessionStorage.setItem("roller",data[x].role);		
	          	  }
			      var roller=sessionStorage.getItem("roller");
			      if(roller=="USER")
			      {
			    	  setTimeout(function(){
		                    window.location="http://localhost:8080/pages.jsp";
		              		},1000);
			      }
			      else
			    	  {
			    	  setTimeout(function(){
		                    window.location="http://localhost:8080/admin_home.jsp";
		              		},1000);
			    	  }
		     }
	       };
		}
</script>