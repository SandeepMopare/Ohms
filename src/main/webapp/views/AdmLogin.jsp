<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
    <%@ include file="common-css-js.jsp"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>Admin Login</title>
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
	
	<div class="form-container sign-in-container">
		<form action="AuthentAdmlogin" method="post">
		<c:if test="${AdmLogFail==0 }">
						<div class="alert alert-warning"> Invalid Login</div>
					</c:if>
			<h1>Sign in</h1>			
			<span>use your account</span>
			 <input id="username" name="admUsername"  class='lf--input' placeholder='Username' type='text' required>
			<input name="admPassword" id="password" class='lf--input' placeholder='Password' type='password' required>
			
			<button>Sign In</button>
			<a href="/home">Go to home</a>
		</form>
	</div>
	<div class="overlay-container">
		<div class="overlay">
			<div class="overlay-panel overlay-left">
				<h1>Welcome Back!</h1>
				<p>To keep connected with us please login with your personal info</p>
				 <button class="ghost" id="signIn">Sign In</button> 
			</div>
			<div class="overlay-panel overlay-right">
				<h1>Hello, Admin !</h1>
				<p>Enter your username and password and start journey with us</p>
				<!-- <button class="ghost" id="signUp">Sign Up</button> -->
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