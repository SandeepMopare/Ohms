<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
    <%@ include file="common-css-js.jsp"%>


<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>Register</title>
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>

 <link href="<c:url value="/css/newlogin.css" />" rel="stylesheet">
</head>
<body>

<div class="container-fluid">
<jsp:include page="common-header.jsp"></jsp:include>
</div>
<br>
<br>
<div class="container" id="container">
	<div class="form-container sign-up-container">
		 <form action="AuthPtlogin" method="post"> 
		 <!-- <form action="#" method="post"> -->
		<c:if test="${ptLogFail==0 }">
						<div class="alert alert-warning"> Invalid Login</div>
					</c:if>
					
					<c:if test="${patReg==1 }">
						<div class="alert alert-success" style="color:green">Registration Success</div>
					</c:if>

					<c:if test="${patReg==0 }">
						<div class="alert alert-warning" style="color:orange">Registration Fail  <br>
						                               <small>Username/password already exist.</small></div>
					</c:if>
					
					 <c:if test="${deletallyy==1 }">
						<div class="alert alert-success" style="color:green">Registration Success</div>
					</c:if>
					
			<h1>Sign in</h1>		
			<span>use your account</span>
			<input type="text" name="ptUsername" placeholder="Username" required="required"/>
			<input type="password" name="ptPassword" placeholder="Password" required="required"/>			 
			  	  
			<button>Sign In</button>
			 <a href="/home">Go to home</a>
		</form>
		
	</div>
	
	  
	<div class="form-container sign-in-container">
		
		<form action="registered" method="post">
		            <c:if test="${deletallyy==1 }">
						<div class="alert alert-success" style="color:green">Registration Success</div>
					</c:if>

					   <c:if test="${deletallyy==0 }">
						<div class="alert alert-warning" style="color:orange">Registration Main  <br>
						                               <small>Username/password already exist.</small></div>
					</c:if> 
					
					<c:if test="${patReg==1 }">
						<div class="alert alert-success" style="color:green">Registration Success</div>
					</c:if>

					<c:if test="${patReg==0 }">
						<div class="alert alert-warning" style="color:orange">Registration Fail  <br>
						                               <small>Username/password already exist.</small></div>
					</c:if>
		
			<h3><b>Create Account</b></h3>               
			
			<input class="form-control form-control-sm" type="text" name="ptName" placeholder="Name" pattern="^[a-zA-z]+([\s][a-zA-Z]+)*$"  required autocomplete="off" title="Only characters are allowed.."/>
			<input class="form-control form-control-sm" type="text" name="age" placeholder="Age" Pattern= "^(0?[1-9]|[1-9][0-9]|[1][1-9][1-9]|200)$" required autocomplete="off" title="Not valid age.."/>
			<input class="form-control form-control-sm" type="email" name="ptGmail" placeholder="Email"  pattern="^([a-zA-Z0-9_\-\.]+)@([a-zA-Z]{5})\.([a-zA-Z]{3})$" required autocomplete="off" title="Enter valid email.."/>
			<input class="form-control form-control-sm" type="text" name="ptMobile" placeholder="Phone No" Pattern= "[789][0-9]{9}" required autocomplete="off" title="Mobile number should be 10 digit.."/>
			<input class="form-control form-control-sm" type="text" name="ptUsername" placeholder="UserName"  pattern="[A-Za-z0-9]{1,15}" required autocomplete="off" title="Username only contains characters & numbers.."/>
			<input class="form-control form-control-sm" type="password" name="ptPassword" placeholder="Password"  pattern="[A-Za-z0-9]{1,10}" required autocomplete="off" title="Password only contains characters & numbers.."/>
			
			<button>Register</button>
			<a href="/home">Go to home</a>
			
		</form>
	</div>
	
	<div class="overlay-container">
		<div class="overlay">
			<div class="overlay-panel overlay-right">
			<h1>Hello, Friend !</h1>
				<p>Enter your personal details and start journey with us</p>
				<button class="ghost" id="signUp">Sign In</button>			
			</div>
			<div class="overlay-panel overlay-left">
				<h1>Welcome Back !</h1>
				<p>To keep connected with us please login with your personal info</p>
				<button class="ghost" id="signIn">Sign Up</button>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
const signUpButton = document.getElementById('signUp');
const signInButton = document.getElementById('signIn');
const container = document.getElementById('container');

signUpButton.addEventListener('click', () => {
	container.classList.add("right-panel-active");
});

signInButton.addEventListener('click', () => {
	container.classList.remove("right-panel-active");
});

</script>
</body>
</html>